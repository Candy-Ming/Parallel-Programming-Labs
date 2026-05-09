#pragma once
#include <queue>
#include <cstdint>
#include <arm_neon.h>

static inline float inner_product_neon_96(const float* a, const float* b) {
    float32x4_t sum0 = vdupq_n_f32(0.0f);
    float32x4_t sum1 = vdupq_n_f32(0.0f);
    float32x4_t sum2 = vdupq_n_f32(0.0f);
    float32x4_t sum3 = vdupq_n_f32(0.0f);

    // DEEP100K 的向量维度固定为 96。
    // 每轮处理 16 个 float，共 6 轮。
    for (int d = 0; d < 96; d += 16) {
        float32x4_t a0 = vld1q_f32(a + d);
        float32x4_t b0 = vld1q_f32(b + d);
        float32x4_t a1 = vld1q_f32(a + d + 4);
        float32x4_t b1 = vld1q_f32(b + d + 4);
        float32x4_t a2 = vld1q_f32(a + d + 8);
        float32x4_t b2 = vld1q_f32(b + d + 8);
        float32x4_t a3 = vld1q_f32(a + d + 12);
        float32x4_t b3 = vld1q_f32(b + d + 12);

        sum0 = vmlaq_f32(sum0, a0, b0);
        sum1 = vmlaq_f32(sum1, a1, b1);
        sum2 = vmlaq_f32(sum2, a2, b2);
        sum3 = vmlaq_f32(sum3, a3, b3);
    }

    float32x4_t sum01 = vaddq_f32(sum0, sum1);
    float32x4_t sum23 = vaddq_f32(sum2, sum3);
    float32x4_t sum = vaddq_f32(sum01, sum23);

    return vaddvq_f32(sum);
}

std::priority_queue<std::pair<float, uint32_t>>
my_flat_search(float* base, float* query, size_t base_number, size_t vecdim, size_t k) {
    std::priority_queue<std::pair<float, uint32_t>> q;

    for (int i = 0; i < static_cast<int>(base_number); ++i) {
        const float* base_vec = base + i * vecdim;

        float ip = inner_product_neon_96(base_vec, query);
        float dis = 1.0f - ip;

        if (q.size() < k) {
            q.push({dis, static_cast<uint32_t>(i)});
        } else if (dis < q.top().first) {
            q.push({dis, static_cast<uint32_t>(i)});
            q.pop();
        }
    }

    return q;
}