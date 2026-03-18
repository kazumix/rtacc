#ifdef __INTIME__
#include <rt.h>
#else
// 非 INtime 環境向けの簡易スタブ
static unsigned char RtSleepEx(int msec)
{
    (void)msec;
    return 0;
}
#endif

/* IL 側で生成される POU 関数（test.il -> test） */
extern int test(void);

int main(void)
{
    for (;;) {
        (void)test();
        RtSleepEx(1); // 1ms 周期で test を実行
    }
    return 0;
}
