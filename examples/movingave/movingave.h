#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct movingave_ctx {
    double* cumsum;   // (n+1) 要素
    int capacity_n;   // 確保済みの n（cumsumは capacity_n+1）
} movingave_ctx;

int fast_moving_average_init(movingave_ctx* ctx, int n);
void fast_moving_average_free(movingave_ctx* ctx);
int fast_moving_average_compute(movingave_ctx* ctx, const double* src, int n, int window, double* dst);

// 互換API（内部で init/compute/free を実行）
int fast_moving_average(const double* src, int n, int window, double* dst);

#ifdef MOVINGAVE_USE_INLINE
#ifndef MOVINGAVE_NAN
static inline double movingave_qnan_double(void) {
    union {
        uint64_t u;
        double d;
    } v;
    v.u = UINT64_C(0x7ff8000000000000); // IEEE754 quiet NaN
    return v.d;
}
#define MOVINGAVE_NAN (movingave_qnan_double())
#endif

static inline int fast_moving_average_compute_inline(
    movingave_ctx* ctx, const double* src, int n, int window, double* dst) {
    if (window < 1 || window > n || !ctx || !ctx->cumsum || ctx->capacity_n < n || !src || !dst) return -1;

    double* cumsum = ctx->cumsum;
    cumsum[0] = 0.0;
    for (int i = 0; i < n; ++i) {
        cumsum[i + 1] = cumsum[i] + src[i];
    }

    for (int i = 0; i < n; ++i) {
        if (i < window - 1) dst[i] = MOVINGAVE_NAN;
        else dst[i] = (cumsum[i + 1] - cumsum[i + 1 - window]) / (double)window;
    }
    return 0;
}

// この翻訳単位では inline 実装に差し替え
#define fast_moving_average_compute fast_moving_average_compute_inline
#endif

#ifdef __cplusplus
}
#endif

