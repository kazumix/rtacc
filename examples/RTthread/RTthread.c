#include <stdio.h>
#include <rt.h>


void thread1(void)
{
    printf("thread1 start\n");
    while(1)
    {
        RtSleep(1000);
        printf("thread1 running\n");
    }
}

void thread2(void)
{
    printf("thread2 start\n");
    while(1)
    {
        RtSleep(1500);
        printf("thread2 running\n");
    }
}

int main()
{
    RTHANDLE hThread1, hThread2;
    printf("INtime RTthread test\n");

    hThread1 = CreateRtThread( 170 ,thread1 ,4096 ,0 );
    hThread2 = CreateRtThread( 172 ,thread2 ,4096 ,0 );
    if( hThread1 == BAD_RTHANDLE || hThread2 == BAD_RTHANDLE )
    {
        printf("CreateRtThread failed\n");
        return -1;
    }

    printf("CreateRtThread success\n");

    // このmainをサスペンドして、スレッドが動作するようにする
    SuspendRtThread(0);
    return 0;
}