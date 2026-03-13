#include <stdio.h>
#include <rt.h>

int main(int argc, char* argv[])
{
	int i;
	for (i = 0; i < 5; i++) {
		RtSleep(1000);
		printf("Hello rtacc! %d\n", i);
	}
	return 0;
}
