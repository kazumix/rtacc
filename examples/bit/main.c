#include "il_rtedge_app.h"

#ifdef __INTIME__
#include <rt.h>
#else
#include <stdint.h>
typedef void *RTHANDLE;
#define BAD_RTHANDLE ((RTHANDLE)(intptr_t)-1)
RTHANDLE CreateRtThread(unsigned char prio, void (*entry)(void), unsigned long stack, void *param);
void SuspendRtThread(void *param);
#endif

void ScanThread(void);

int main(int argc, char *argv[])
{
	(void)argc;
	(void)argv;

	IlRtedgeTags_Init();

#ifdef __INTIME__
	{
		RTHANDLE h = CreateRtThread(170, ScanThread, 8192, 0);
		if (h == BAD_RTHANDLE)
			return -1;
	}
	SuspendRtThread(0);
#endif

	return 0;
}
