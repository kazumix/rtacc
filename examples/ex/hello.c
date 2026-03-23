#include <stdio.h>
#ifdef __INTIME__
#include <rt.h>
#else
#include <stdint.h>
typedef void *RTHANDLE;
#define BAD_RTHANDLE ((RTHANDLE)(intptr_t)-1)
unsigned char RtSleep(int);
RTHANDLE CreateRtThread(unsigned char prio, void (*entry)(void), unsigned long stack, void *param);
void SuspendRtThread(void *param);
#endif

#include "rtedge_tags.h"

void ScanThread(void);

int main(int argc, char *argv[])
{
	(void)argc;
	(void)argv;

	IlRtedgeTags_Init();

#ifdef __INTIME__
	{
		RTHANDLE h = CreateRtThread(170, ScanThread, 8192, 0);
		if (h == BAD_RTHANDLE) {
			printf("CreateRtThread(ScanThread) failed\n");
			return -1;
		}
	}
#endif

	for (int i = 0; i < 20; i++) {
		RtSleep(500);
		printf("Hello, World! %d\n", i);
	}

#ifdef __INTIME__
	SuspendRtThread(0);
#endif
	return 0;
}
