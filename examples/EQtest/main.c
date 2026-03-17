#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

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

// llil が生成する POU 関数（EQtest.IL → EQtest()）
extern int EQtest(void);

int main(void)
{
    for (;;) {
        (void)EQtest();
        RtSleepEx(1); // 1ms 間隔で呼び出し
    }
    return 0;
}

