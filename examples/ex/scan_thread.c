/*
 * 1ms 周期で scan()（scan.il）を実行。ロジックは IL 側。
 */
#include "rtedge_tags.h"

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
		RtSleepEx(1);
		(void)scan();
	}
}
