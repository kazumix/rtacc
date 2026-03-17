#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"
#include <rt.h>

// 内部クロック
DWORD	status_internalclock = STATUS_READY;

/// <summary>
/// 内部クロック Usec値の取得
/// </summary>
/// <returns></returns>
DWORD InternalClock_GetUsecs(void)
{
	return dwKtickInUsecs;
}

/// <summary>
/// 内部クロック発生を待ちます
/// </summary>
void InternalClock_Wait(void)
{
	// 内部クロック時間まで待ちます
	knRtSleep(1);
}

/// <summary>
/// 内部クロックカウンタを与えると、PLC動作ステップのタイミングを判定します
/// 動作タイミングの場合には0を返却します
/// </summary>
/// <param name="clockcounter"></param>
/// <returns></returns>
DWORD InternalClock_IsPlcFireTiming(DWORD clockcounter)
{
	if (clockcounter >= (Config_Get_ScanFreq() / InternalClock_GetUsecs()))
		return 0;
	else
		return clockcounter;
}
