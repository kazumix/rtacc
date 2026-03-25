/*
 * 1ms 周期で scan(dt_ms=1) を実行。
 */
#include <stdint.h>

#ifdef __INTIME__
#include <rt.h>
#else
#ifdef _WIN32
#include <windows.h>
#else
#include <time.h>
#endif
static unsigned char RtSleepEx(int msec)
{
#ifdef _WIN32
	Sleep((DWORD)(unsigned)msec);
#else
	struct timespec ts;
	ts.tv_sec = msec / 1000;
	ts.tv_nsec = (long)(msec % 1000) * 1000000L;
	(void)nanosleep(&ts, NULL);
#endif
	return 0;
}
#endif

void scan(int32_t dt_ms);

void ScanThread(void)
{
	for (;;) {
		RtSleepEx(1);
		scan(1);
	}
}
