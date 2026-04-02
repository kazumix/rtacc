/*
 * 100ms 周期で scan()（scan.il）を実行。ロジックは IL 側。
 */
#include "il_rtedge_app.h"

#ifdef __INTIME__
#include <rt.h>
#else
static unsigned char RtSleepEx(int msec)
{
	(void)msec;
	return 0;
}
#endif

int scan(void);

void ScanThread(void)
{
	for (;;) {
		RtSleepEx(100);
		(void)scan();
	}
}
