#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MOVINGAVE_USE_INLINE 1
#include "movingave.h"

static int my_isnan(double x) { return x != x; }

int main() {
    srand((unsigned)time(NULL));

    const int n = 1024;
    const int window = 2;
    double* src = (double*)malloc((size_t)n * sizeof(double));
    double* dst = (double*)malloc((size_t)n * sizeof(double));
    if (!src || !dst) {
        free(src);
        free(dst);
        return -1;
    }

    for (int i = 0; i < n; ++i) {
        // 0.0〜10.0 の範囲で乱数生成
        src[i] = ((double)rand() / (double)RAND_MAX) * 10.0;
    }

    const int repeats = 5000;
    movingave_ctx ctx;
    int ret = fast_moving_average_init(&ctx, n);
    if (ret != 0) {
        free(src);
        free(dst);
        return ret;
    }

    clock_t t0 = clock();
    volatile double sink = 0.0;
    for (int r = 0; r < repeats; ++r) {
        ret = fast_moving_average_compute(&ctx, src, n, window, dst);
        if (ret != 0) break;
        sink += dst[n - 1];
    }
    clock_t t1 = clock();
    fast_moving_average_free(&ctx);

    if (ret == 0) {
        double elapsed_sec = (double)(t1 - t0) / (double)CLOCKS_PER_SEC;
        printf("repeats=%d elapsed=%.6f sec sink=%.6f\n", repeats, elapsed_sec, (double)sink);

        printf("src(head8): ");
        for (int i = 0; i < 8; ++i) printf("%.3f ", src[i]);
        printf("... src(tail4): ");
        for (int i = n - 4; i < n; ++i) printf("%.3f ", src[i]);
        printf("\n");

        printf("mavg(head8): ");
        for (int i = 0; i < 8; ++i) {
            if (my_isnan(dst[i])) printf("NaN ");
            else printf("%.2f ", dst[i]);
        }
        printf("... mavg(tail4): ");
        for (int i = n - 4; i < n; ++i) {
            if (my_isnan(dst[i])) printf("NaN ");
            else printf("%.2f ", dst[i]);
        }
        printf("\n");
    }
    free(src);
    free(dst);
    return ret;
}

