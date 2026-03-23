#ifdef __INTIME__
#include <rt.h>
#else
static unsigned char RtSleepEx(int msec)
{
	(void)msec;
	return 0;
}
#endif

/* GEtest.IL -> define i32 @GEtest()（stack 時は slots_init 不要） */
extern int GEtest(void);

int main(void)
{
	for (;;) {
		(void)GEtest();
		RtSleepEx(1);
	}
	return 0;
}
