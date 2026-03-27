#include "rtedge_tags.h"

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

/* IL 側で生成される POU: measure36 */
extern int measure36(void);

int main(void)
{
	IlRtedgeTags_Init();

	for (;;) {
		(void)measure36();
		RtSleepEx(1); // 1ms 周期で measure36 を実行
	}

	return 0;
}

