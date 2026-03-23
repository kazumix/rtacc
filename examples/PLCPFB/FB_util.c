#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPFB.h"


//-----------------------------------------
// CPUクロックカウンタの取得（SpeedStep機能のあるCPUでは利用できません）
//-----------------------------------------
_inline QWORD WatchDog_GetPentiumCounter(void)
{
	_asm    rdtsc
}

//-----------------------------------------
// CPU速度の計測( Hz )
//-----------------------------------------
DWORD fbWatchDog_GetCPUSpeed(void)
{
	SYSINFO         sSysInfo;
	DWORD           PentiumTicksPerUsec;
	DWORD           dwResult;

	CopyRtSystemInfo(&sSysInfo);
	PentiumTicksPerUsec = sSysInfo.PentiumTicksPerUsec;
	dwResult = PentiumTicksPerUsec * 1000000;
	return dwResult;
}

//-----------------------------------------
// 処理時間の算出( nano second )
//-----------------------------------------
double CalcTime(QWORD start, QWORD end)
{
	double  dblCPUspeed;
	dblCPUspeed = (double)1000000000 / (double)fbWatchDog_GetCPUSpeed();
	return ((double)(end - start) * dblCPUspeed);
}

/// <summary>
/// RSL main
/// </summary>
/// <param name="hModule"></param>
/// <param name="ul_reason_for_call"></param>
/// <param name="lpReserved"></param>
/// <returns></returns>
BOOLEAN __stdcall RslMain(RTHANDLE hModule,
	DWORD  ul_reason_for_call,
	LPVOID lpReserved
)
{
	switch (ul_reason_for_call) {
	case RSL_PROCESS_ATTACH:
		Initialize();
		break;
	case RSL_THREAD_ATTACH:
	case RSL_THREAD_DETACH:
	case RSL_PROCESS_DETACH:
		break;
	}

	return TRUE;
}


