#include <rt.h>

void IlRtedgeTags_Init(void);
extern int inc(void);

int main(void)
{
	IlRtedgeTags_Init();
	for (;;) {
		RtSleepEx(1);
		(void)inc();
	}
}
