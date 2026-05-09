#pragma once

#include <queue>
#include <vector>
#include <cstdint>
#include <algorithm>
#include <limits>
#include <cmath>
#include <arm_neon.h>
#include "my_flat_simd.h"

// ================================
// PQ-SIMD V2: KMeans codebook version
// ================================
//
// DEEP100K: vecdim = 96
// M = 8 subspaces
// subdim = 12
// Ks = 256 centroids per subspace
//
// Offline:
// 1. Train KMeans codebook for each subspace
// 2. Encode all base vectors
//
// Online query:
// 1. Build LUT[M][Ks]
// 2. ADC coarse scan
// 3. Top-p candidate selection
// 4. Rerank with original float + Flat-SIMD

static constexpr int PQ_DIM = 96;
static constexpr int PQ_M = 12;
static constexpr int PQ_SUBDIM = 8;
static constexpr int PQ_KS = 256;

// 先用 1000，之后测试 100, 200, 500, 1000, 2000
static constexpr size_t PQ_TOP_P = 1000;

// KMeans 参数：先控制构建成本，跑通后再调大
static constexpr int PQ_TRAIN_N = 4096;
static constexpr int PQ_KMEANS_ITERS = 5;
// block-local Top-r 参数
static constexpr size_t PQ_BLOCK_SIZE = 2048;
static constexpr size_t PQ_LOCAL_R = 64;
struct PQIndex {
    // codebooks[m][c][d]
    std::vector<float> codebooks;

    // codes[i][m]
    std::vector<uint8_t> codes;

    size_t base_number = 0;
    size_t vecdim = 0;
    bool built = false;
};

struct PQAdcCandidate {
    float score;      // approx inner product, larger is better
    uint32_t idx;
};
static PQIndex global_pq_index;

static inline const float* pq_centroid_ptr(
    const std::vector<float>& codebooks,
    int m,
    int c
) {
    return codebooks.data() + (m * PQ_KS + c) * PQ_SUBDIM;
}

static inline float* pq_centroid_ptr_mut(
    std::vector<float>& codebooks,
    int m,
    int c
) {
    return codebooks.data() + (m * PQ_KS + c) * PQ_SUBDIM;
}

// 8 维 inner product，用于 PQ LUT 构建。
// subdim = 8，因此只加载 a[0..7], b[0..7]。
static inline float inner_product_8_neon(const float* a, const float* b) {
    float32x4_t sum0 = vdupq_n_f32(0.0f);
    float32x4_t sum1 = vdupq_n_f32(0.0f);

    float32x4_t a0 = vld1q_f32(a);
    float32x4_t b0 = vld1q_f32(b);
    float32x4_t a1 = vld1q_f32(a + 4);
    float32x4_t b1 = vld1q_f32(b + 4);

    sum0 = vmlaq_f32(sum0, a0, b0);
    sum1 = vmlaq_f32(sum1, a1, b1);

    float32x4_t sum = vaddq_f32(sum0, sum1);
    return vaddvq_f32(sum);
}

// 8 维 L2 distance，用于 KMeans 训练和 base 编码。
// subdim = 8，因此只加载 a[0..7], b[0..7]。
static inline float l2_distance_8_neon(const float* a, const float* b) {
    float32x4_t sum0 = vdupq_n_f32(0.0f);
    float32x4_t sum1 = vdupq_n_f32(0.0f);

    float32x4_t a0 = vld1q_f32(a);
    float32x4_t b0 = vld1q_f32(b);
    float32x4_t diff0 = vsubq_f32(a0, b0);
    sum0 = vmlaq_f32(sum0, diff0, diff0);

    float32x4_t a1 = vld1q_f32(a + 4);
    float32x4_t b1 = vld1q_f32(b + 4);
    float32x4_t diff1 = vsubq_f32(a1, b1);
    sum1 = vmlaq_f32(sum1, diff1, diff1);

    float32x4_t sum = vaddq_f32(sum0, sum1);
    return vaddvq_f32(sum);
}

// 取第 t 个训练样本对应的 base id。
// 使用均匀采样，避免额外随机数依赖。
static inline size_t pq_train_sample_id(size_t t, size_t train_n, size_t base_number) {
    size_t id = (t * base_number) / train_n;
    if (id >= base_number) id = base_number - 1;
    return id;
}
// Deterministic pseudo-random number in [0, 1).
// Used to make KMeans++ initialization reproducible.
static inline float pq_deterministic_rand01(int m, int c) {
    uint32_t x = static_cast<uint32_t>(m * 1000003 + c * 9176 + 12345);
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    return static_cast<float>(x % 1000000) / 1000000.0f;
}

// KMeans++ style initialization for one subspace.
// It chooses new centroids with probability proportional to squared distance
// from the nearest existing centroid.
// This tends to produce more diverse initial centroids than uniform sampling.
static inline void init_one_subspace_kmeanspp(
    float* base,
    size_t base_number,
    size_t vecdim,
    int m,
    size_t train_n,
    PQIndex& index
) {
    std::vector<float> min_dist(train_n, std::numeric_limits<float>::infinity());

    // First centroid: use the first training sample for determinism.
    size_t first_base_id = pq_train_sample_id(0, train_n, base_number);
    const float* first_src = base + first_base_id * vecdim + m * PQ_SUBDIM;
    float* first_dst = pq_centroid_ptr_mut(index.codebooks, m, 0);

    for (int d = 0; d < PQ_SUBDIM; ++d) {
        first_dst[d] = first_src[d];
    }

    // Update min distance to the first centroid.
    for (size_t t = 0; t < train_n; ++t) {
        size_t base_id = pq_train_sample_id(t, train_n, base_number);
        const float* x = base + base_id * vecdim + m * PQ_SUBDIM;
        min_dist[t] = l2_distance_8_neon(x, first_dst);
    }

    // Select the remaining centroids.
    for (int c = 1; c < PQ_KS; ++c) {
        double total = 0.0;

        for (size_t t = 0; t < train_n; ++t) {
            total += static_cast<double>(min_dist[t]);
        }

        size_t chosen_t = 0;

        if (total > 1e-20) {
            double r = static_cast<double>(pq_deterministic_rand01(m, c)) * total;
            double acc = 0.0;

            for (size_t t = 0; t < train_n; ++t) {
                acc += static_cast<double>(min_dist[t]);
                if (acc >= r) {
                    chosen_t = t;
                    break;
                }
            }
        } else {
            chosen_t = (static_cast<size_t>(c) * train_n) / PQ_KS;
            if (chosen_t >= train_n) chosen_t = train_n - 1;
        }

        size_t base_id = pq_train_sample_id(chosen_t, train_n, base_number);
        const float* src = base + base_id * vecdim + m * PQ_SUBDIM;
        float* dst = pq_centroid_ptr_mut(index.codebooks, m, c);

        for (int d = 0; d < PQ_SUBDIM; ++d) {
            dst[d] = src[d];
        }

        // Update distance to nearest selected centroid.
        for (size_t t = 0; t < train_n; ++t) {
            size_t tid = pq_train_sample_id(t, train_n, base_number);
            const float* x = base + tid * vecdim + m * PQ_SUBDIM;
            float dist = l2_distance_8_neon(x, dst);

            if (dist < min_dist[t]) {
                min_dist[t] = dist;
            }
        }
    }
}
// 对某一个子空间 m 训练 KMeans codebook。
// 这里使用 L2 KMeans，因为 PQ 的本质是降低子向量重构误差。
// 查询时再用 query 与 centroid 的 IP 构建 LUT。
static inline void train_one_subspace_kmeans(
    float* base,
    size_t base_number,
    size_t vecdim,
    int m,
    PQIndex& index
) {
    size_t train_n = std::min(static_cast<size_t>(PQ_TRAIN_N), base_number);

    // 1. KMeans++ style initialization.
    // Compared with uniform sampling, this initialization spreads centroids
    // more widely in the subspace and usually reduces codebook distortion.
    init_one_subspace_kmeanspp(base, base_number, vecdim, m, train_n, index);
        std::vector<float> sums(PQ_KS * PQ_SUBDIM);
        std::vector<int> counts(PQ_KS);

    // 2. KMeans 迭代
    for (int iter = 0; iter < PQ_KMEANS_ITERS; ++iter) {
        std::fill(sums.begin(), sums.end(), 0.0f);
        std::fill(counts.begin(), counts.end(), 0);

        // Assignment step
        for (size_t t = 0; t < train_n; ++t) {
            size_t base_id = pq_train_sample_id(t, train_n, base_number);
            const float* x = base + base_id * vecdim + m * PQ_SUBDIM;

            int best_c = 0;
            float best_dist = std::numeric_limits<float>::infinity();

            for (int c = 0; c < PQ_KS; ++c) {
                const float* centroid = pq_centroid_ptr(index.codebooks, m, c);
                float dist = l2_distance_8_neon(x, centroid);

                if (dist < best_dist) {
                    best_dist = dist;
                    best_c = c;
                }
            }

            counts[best_c]++;

            float* sum_ptr = sums.data() + best_c * PQ_SUBDIM;
            for (int d = 0; d < PQ_SUBDIM; ++d) {
                sum_ptr[d] += x[d];
            }
        }

        // Update step
        for (int c = 0; c < PQ_KS; ++c) {
            float* centroid = pq_centroid_ptr_mut(index.codebooks, m, c);

            if (counts[c] > 0) {
                float inv_count = 1.0f / static_cast<float>(counts[c]);
                float* sum_ptr = sums.data() + c * PQ_SUBDIM;

                for (int d = 0; d < PQ_SUBDIM; ++d) {
                    centroid[d] = sum_ptr[d] * inv_count;
                }
            }
            // 如果某个中心没有样本，保持原中心不变
        }
    }
}

// 训练所有子空间 codebook
static inline void build_pq_codebooks_kmeans(
    float* base,
    size_t base_number,
    size_t vecdim,
    PQIndex& index
) {
    index.codebooks.resize(PQ_M * PQ_KS * PQ_SUBDIM);

    for (int m = 0; m < PQ_M; ++m) {
        train_one_subspace_kmeans(base, base_number, vecdim, m, index);
    }
}

// 给一个 base 向量编码。
// 编码时选择 L2 最近的 centroid。
static inline void encode_one_vector_pq(
    const float* x,
    const PQIndex& index,
    uint8_t* code
) {
    for (int m = 0; m < PQ_M; ++m) {
        const float* sub_x = x + m * PQ_SUBDIM;

        int best_c = 0;
        float best_dist = std::numeric_limits<float>::infinity();

        for (int c = 0; c < PQ_KS; ++c) {
            const float* centroid = pq_centroid_ptr(index.codebooks, m, c);
            float dist = l2_distance_8_neon(sub_x, centroid);

            if (dist < best_dist) {
                best_dist = dist;
                best_c = c;
            }
        }

        code[m] = static_cast<uint8_t>(best_c);
    }
}

// 构建 PQ index：离线阶段
static inline void build_pq_index_if_needed(
    float* base,
    size_t base_number,
    size_t vecdim,
    PQIndex& index
) {
    if (index.built) return;

    index.base_number = base_number;
    index.vecdim = vecdim;

    build_pq_codebooks_kmeans(base, base_number, vecdim, index);

    // SoA layout: codes[m * base_number + i]
    // For each subspace m, all base vector codes are stored continuously.
    index.codes.resize(static_cast<size_t>(PQ_M) * base_number);

    uint8_t temp_code[PQ_M];

    for (size_t i = 0; i < base_number; ++i) {
        const float* x = base + i * vecdim;

        encode_one_vector_pq(x, index, temp_code);

        for (int m = 0; m < PQ_M; ++m) {
            index.codes[static_cast<size_t>(m) * base_number + i] = temp_code[m];
        }
    }

    index.built = true;
}

// 显式 prepare：放在 main.cc 查询计时循环前调用
static inline void my_pq_prepare(float* base, size_t base_number, size_t vecdim) {
    build_pq_index_if_needed(base, base_number, vecdim, global_pq_index);
}

// 查询阶段构建 LUT：
// LUT[m][c] = query_sub_m dot centroid[m][c]
static inline void build_pq_lut(
    const float* query,
    const PQIndex& index,
    float* lut
) {
    for (int m = 0; m < PQ_M; ++m) {
        const float* q_sub = query + m * PQ_SUBDIM;

        for (int c = 0; c < PQ_KS; ++c) {
            const float* centroid = pq_centroid_ptr(index.codebooks, m, c);
            lut[m * PQ_KS + c] = inner_product_8_neon(q_sub, centroid);
        }
    }
}

// ADC 粗排分数：
// approx_ip = sum_m LUT[m][code[m]]
static inline float pq_adc_score(
    const uint8_t* code,
    const float* lut
) {
    float score = 0.0f;

    for (int m = 0; m < PQ_M; ++m) {
        uint8_t c = code[m];
        score += lut[m * PQ_KS + c];
    }

    return score;
}

static constexpr int PQ_SCAN_BLOCK = 1024;

std::priority_queue<std::pair<float, uint32_t>>
my_pq_search(float* base, float* query, size_t base_number, size_t vecdim, size_t k) {
    PQIndex& index = global_pq_index;

    float lut[PQ_M * PQ_KS];
    build_pq_lut(query, index, lut);

    size_t p = PQ_TOP_P;
    if (p < k) p = k;
    if (p > base_number) p = base_number;

    // 全局 Top-p 候选堆。
    // key = -approx_ip，堆顶是当前 Top-p 中最差的候选。
    std::priority_queue<std::pair<float, uint32_t>> global_q;

    for (size_t block_start = 0; block_start < base_number; block_start += PQ_BLOCK_SIZE) {
        size_t block_size = base_number - block_start;
        if (block_size > PQ_BLOCK_SIZE) {
            block_size = PQ_BLOCK_SIZE;
        }

        size_t local_r = PQ_LOCAL_R;
        if (local_r > block_size) {
            local_r = block_size;
        }

        // 每个 block 内部维护局部 Top-r。
        std::priority_queue<std::pair<float, uint32_t>> local_q;

        for (size_t j = 0; j < block_size; ++j) {
            size_t idx_size_t = block_start + j;
            uint32_t idx = static_cast<uint32_t>(idx_size_t);

            // 完整 ADC 分数：仍然使用全部 PQ_M 个子空间。
            // 这点和二阶段 ADC 不同，不会因为只用部分子空间而额外损失粗排质量。
            float approx_ip = 0.0f;

            for (int m = 0; m < PQ_M; ++m) {
                uint8_t c = index.codes[static_cast<size_t>(m) * base_number + idx_size_t];
                approx_ip += lut[m * PQ_KS + c];
            }

            float key = -approx_ip;

            if (local_q.size() < local_r) {
                local_q.push({key, idx});
            } else if (key < local_q.top().first) {
                local_q.push({key, idx});
                local_q.pop();
            }
        }

        // 将当前 block 的局部 Top-r 合并到全局 Top-p。
        while (!local_q.empty()) {
            auto cand = local_q.top();
            local_q.pop();

            if (global_q.size() < p) {
                global_q.push(cand);
            } else if (cand.first < global_q.top().first) {
                global_q.push(cand);
                global_q.pop();
            }
        }
    }

    // 对全局 Top-p 候选使用原始 float + Flat-SIMD 精排。
    std::priority_queue<std::pair<float, uint32_t>> final_q;

    while (!global_q.empty()) {
        uint32_t idx = global_q.top().second;
        global_q.pop();

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