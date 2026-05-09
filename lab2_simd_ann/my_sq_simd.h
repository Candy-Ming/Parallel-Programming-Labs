#pragma once

#include <queue>
#include <vector>
#include <cstdint>
#include <limits>
#include <algorithm>
#include <cmath>
#include <arm_neon.h>
#include "my_flat_simd.h"

// DEEP100K 向量维度固定为 96。

static constexpr int SQ_DIM = 96;

// Top-p 候选数量
static constexpr size_t SQ_TOP_P = 50;

struct SQCandidate {
    int score;          // 近似 inner product，越大越好
    uint32_t idx;       // base 向量编号
};

struct SQSignedIndex {
    std::vector<int8_t> base_i8;
    float scale = 1.0f;
    float inv_scale = 1.0f;
    size_t base_number = 0;
    size_t vecdim = 0;
    bool built = false;
};

// float -> int8_t 对称量化。
// q = round(x * scale)，并裁剪到 [-127, 127]。
// 这里不用 -128，是为了保持正负范围对称。
static inline int8_t quantize_float_to_i8(float x, float scale) {
    float y = x * scale;

    if (y > 127.0f) y = 127.0f;
    if (y < -127.0f) y = -127.0f;

    return static_cast<int8_t>(y + (y >= 0.0f ? 0.5f : -0.5f));
}

// 构建 signed int8 SQ 索引，只在第一次调用时执行。
// 使用全局最大绝对值来确定 scale：
//     scale = 127 / max_abs
// 这样量化后 int8 点积和原始 float 点积之间近似只差一个全局比例因子，
// 对 inner product 排序更友好。
static inline void build_sq_signed_index_if_needed(
    float* base,
    size_t base_number,
    size_t vecdim,
    SQSignedIndex& index
) {
    if (index.built) return;

    index.base_number = base_number;
    index.vecdim = vecdim;

    float max_abs = 0.0f;

    for (size_t i = 0; i < base_number; ++i) {
        const float* x = base + i * vecdim;

        for (size_t d = 0; d < vecdim; ++d) {
            float ax = std::fabs(x[d]);
            if (ax > max_abs) max_abs = ax;
        }
    }

    if (max_abs > 1e-12f) {
        index.scale = 127.0f / max_abs;
        index.inv_scale = max_abs / 127.0f;
    } else {
        index.scale = 1.0f;
        index.inv_scale = 1.0f;
    }

    index.base_i8.resize(base_number * vecdim);

    for (size_t i = 0; i < base_number; ++i) {
        const float* src = base + i * vecdim;
        int8_t* dst = index.base_i8.data() + i * vecdim;

        for (size_t d = 0; d < vecdim; ++d) {
            dst[d] = quantize_float_to_i8(src[d], index.scale);
        }
    }

    index.built = true;
}

// query 使用和 base 相同的全局 scale 量化。
static inline void quantize_query_i8(
    const float* query,
    int8_t* query_i8,
    const SQSignedIndex& index
) {
    for (size_t d = 0; d < index.vecdim; ++d) {
        query_i8[d] = quantize_float_to_i8(query[d], index.scale);
    }
}

// int8 SIMD 近似 inner product。
// 每次处理 16 个 int8：
// 1. 加载 int8x16
// 2. 扩展为 int16
// 3. 用 vmlal_s16 累加到 int32
// 返回值越大，表示近似 IP 越大。
static inline int sq_inner_product_i8_96(const int8_t* a, const int8_t* b) {
    int32x4_t sum0 = vdupq_n_s32(0);
    int32x4_t sum1 = vdupq_n_s32(0);
    int32x4_t sum2 = vdupq_n_s32(0);
    int32x4_t sum3 = vdupq_n_s32(0);

    for (int d = 0; d < SQ_DIM; d += 16) {
        int8x16_t va = vld1q_s8(a + d);
        int8x16_t vb = vld1q_s8(b + d);

        int16x8_t a_low = vmovl_s8(vget_low_s8(va));
        int16x8_t a_high = vmovl_s8(vget_high_s8(va));
        int16x8_t b_low = vmovl_s8(vget_low_s8(vb));
        int16x8_t b_high = vmovl_s8(vget_high_s8(vb));

        sum0 = vmlal_s16(sum0, vget_low_s16(a_low), vget_low_s16(b_low));
        sum1 = vmlal_s16(sum1, vget_high_s16(a_low), vget_high_s16(b_low));
        sum2 = vmlal_s16(sum2, vget_low_s16(a_high), vget_low_s16(b_high));
        sum3 = vmlal_s16(sum3, vget_high_s16(a_high), vget_high_s16(b_high));
    }

    int32x4_t sum01 = vaddq_s32(sum0, sum1);
    int32x4_t sum23 = vaddq_s32(sum2, sum3);
    int32x4_t sum = vaddq_s32(sum01, sum23);

    return static_cast<int>(vaddvq_s32(sum));
}

std::priority_queue<std::pair<float, uint32_t>>

my_sq_search(float* base, float* query, size_t base_number, size_t vecdim, size_t k) {
    static SQSignedIndex index;

    build_sq_signed_index_if_needed(base, base_number, vecdim, index);

    int8_t query_i8[SQ_DIM];
    quantize_query_i8(query, query_i8, index);

    size_t p = SQ_TOP_P;
    if (p < k) p = k;
    if (p > base_number) p = base_number;

    // 粗排阶段：
    // approx_ip 越大越好。
    // std::priority_queue 是大根堆。
    // 使用 key = -approx_ip，使堆顶表示当前 Top-p 中最差的候选。
    std::priority_queue<std::pair<int, uint32_t>> coarse_q;

    for (size_t i = 0; i < base_number; ++i) {
        const int8_t* base_vec_i8 = index.base_i8.data() + i * vecdim;
        int approx_ip = sq_inner_product_i8_96(base_vec_i8, query_i8);
        int key = -approx_ip;

        if (coarse_q.size() < p) {
            coarse_q.push({key, static_cast<uint32_t>(i)});
        } else if (key < coarse_q.top().first) {
            coarse_q.push({key, static_cast<uint32_t>(i)});
            coarse_q.pop();
        }
    }

    // 精排阶段：
    // 只对 Top-p 候选使用原始 float + Flat-SIMD 重新计算精确距离。
    std::priority_queue<std::pair<float, uint32_t>> final_q;

    while (!coarse_q.empty()) {
        uint32_t idx = coarse_q.top().second;
        coarse_q.pop();

        const float* base_vec = base + static_cast<size_t>(idx) * vecdim;
        float ip = inner_product_neon_96(base_vec, query);
        float dis = 1.0f - ip;

        if (final_q.size() < k) {
            final_q.push({dis, idx});
        } else if (dis < final_q.top().first) {
            final_q.push({dis, idx});
            final_q.pop();
        }
    }

    return final_q;
}