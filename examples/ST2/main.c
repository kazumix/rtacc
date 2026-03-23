/*
 * IlRtedgeTags_Init: INT#MsTick / BOOL#LED1 を EgTagCreateEx で生成。
 * IlRtedgeSlots_BindEgEntry: il_slot_* を RTedge Entry に接続。
 * 単体ビルドは defines に "IL_EGAPI_STUB=1"。
 */
#include "rtedge_tags.h"

#include <stdint.h>

#ifdef __INTIME__
#include <rt.h>
#else
static unsigned char RtSleepEx(int msec)
{
	(void)msec;
	return 0;
}
#endif

extern void LED2Check(void);
extern void *il_slot_MsTick;

int main(void)
{
	IlRtedgeTags_Init();

	for (;;) {
		LED2Check();
		*(int32_t *)il_slot_MsTick += 1;
		RtSleepEx(1);
	}
	return 0;
}
