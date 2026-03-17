#include <stdio.h>
#include <rt.h>

int main(int argc, char* argv[])
{
	int i;
	for (i = 0; i < 50; i++) {
		RtSleep(100);
		printf("Hello rtacc! %d\n", i);
	}
	return 0;
}
