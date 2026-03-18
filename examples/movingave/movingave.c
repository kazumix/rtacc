#include <stdlib.h>
#include <math.h>
#include <stdint.h>

#include "movingave.h"

// INtime環境のmath.hでは NAN / isnan が未定義な場合があるためフォールバックを用意
#ifndef NAN
static inline double rtacc_qnan_double(void) {
    union {
        uint64_t u;
        double d;
    } v;
    v.u = UINT64_C(0x7ff8000000000000); // IEEE754 quiet NaN
    return v.d;
}
#define NAN (rtacc_qnan_double())
#endif

#ifndef isnan
static inline int isnan(double x) { return x != x; }
#endif

int fast_moving_average_init(movingave_ctx* ctx, int n) {
    if (!ctx || n < 1) return -1;
    ctx->cumsum = (double*)malloc((n + 1) * sizeof(double));
    if (!ctx->cumsum) {
        ctx->capacity_n = 0;
        return -1;
    }
    ctx->capacity_n = n;
    return 0;
}

void fast_moving_average_free(movingave_ctx* ctx) {
    if (!ctx) return;
    free(ctx->cumsum);
    ctx->cumsum = NULL;
    ctx->capacity_n = 0;
}

int fast_moving_average_compute(movingave_ctx* ctx, const double* src, int n, int window, double* dst) {
    if (window < 1 || window > n || !ctx || !ctx->cumsum || ctx->capacity_n < n || !src || !dst) return -1;

    double* cumsum = ctx->cumsum;

    // 累積和計算
    cumsum[0] = 0.0;
    for (int i = 0; i < n; ++i) {
        cumsum[i + 1] = cumsum[i] + src[i];
    }

    // スライド窓平均
    for (int i = 0; i < n; ++i) {
        if (i < window - 1) {
            dst[i] = NAN;  // 初期不足分
        } else {
            dst[i] = (cumsum[i + 1] - cumsum[i + 1 - window]) / (double)window;
        }
    }
    return 0;
}

/**
 * 高速移動平均 (cumsum方式)
 * @param src 入力データ列 (double*)
 * @param n   データ数
 * @param window 窓サイズ (2以上推奨)
 * @param dst 出力先 (呼び出し側で確保、n要素)
 * @return 0:成功
 */
int fast_moving_average(const double* src, int n, int window, double* dst) {
    movingave_ctx ctx;
    if (fast_moving_average_init(&ctx, n) != 0) return -1;
    int ret = fast_moving_average_compute(&ctx, src, n, window, dst);
    fast_moving_average_free(&ctx);
    return ret;
}
