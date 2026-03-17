/// <summary>
/// PLC plus / INplc 5
/// 
/// Programmed by Kazumi.Machii 2023
/// 
/// PLC watchdog module
/// </summary>

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <intrin.h>
#include "common.h"

// ウォッチドック管理
DWORD	status_watchdog = STATUS_STOP;

// オーバーランカウント
DWORD		wOverRunCnt = 0;

// 測定系変数
static	BYTE	slowstart;
static double	curdelay;
static double	maxdelay;
static double	mindelay;


/// <summary>
/// CPUカウンタの取得
/// </summary>
/// <returns></returns>
__inline QWORD WatchDog_GetPentiumCounter(void)
{
	_asm	rdtscp;
}

/// <summary>
/// CPU速度の計測( MHz )
/// </summary>
/// <returns></returns>
__inline double WatchDog_GetCPUSpeed(void)
{
	SYSINFO			sSysInfo = { 0 };
	static double	PentiumTicksPerUsec;

	// システム情報からCPU速度を取得する
	if (!PentiumTicksPerUsec)
	{
		CopyRtSystemInfo(&sSysInfo);
		PentiumTicksPerUsec = sSysInfo.PentiumTicksPerUsec;
	}
	return PentiumTicksPerUsec;	 // 1usec間にカウントするCPU TICKカウント
}

/// <summary>
/// ウォッチドック統計のリセット
/// </summary>
void Watchdog_Reset(void)
{
	// 変数の初期化
	wOverRunCnt = 0;
	slowstart	= 0;
	curdelay	= 0;
	maxdelay	= 0;
	mindelay	= 0;
}

/// <summary>
/// ウォッチドック管理の初期化
/// </summary>
void Watchdog_Init(void)
{
	// 変数の初期化
	Watchdog_Reset();

	if (sqtbl)
	{
		// 速度計測値の初期値
		sqtbl->flMinSeq = (float)WATCHDOG_MIN_PROCTIME;			//	最小処理時間
		sqtbl->flMaxSeq = (float)WATCHDOG_MAX_PROCTIME;			//	最大処理時間
		sqtbl->flAveSeq = 0;									//	平均処理時間
		sqtbl->dwCPUSpd = (DWORD)WatchDog_GetCPUSpeed();		//  CPUスピード値	MHz	

		// 本機能の動作状態を更新
		status_watchdog = STATUS_READY;
	}
}

/// <summary>
/// QWORD start,endを与えてnano sec値を計算する
/// </summary>
/// <param name="uiBegin"></param>
/// <param name="uiEnd"></param>
/// <returns></returns>
double Watchdog_Calc(QWORD uiBegin, QWORD uiEnd)
{
	// CPUカウンタ差分で時間計算
	DWORD dwDif = (DWORD)(uiEnd - uiBegin);
	double flDifTime = (double)dwDif / WatchDog_GetCPUSpeed() * 1000.0;		// nano sec
	return flDifTime;
}

/// <summary>
/// ウォッチドック管理、サイクルの都度計算する
/// </summary>
/// <param name="uiBegin">サイクル開始時刻</param>
/// <param name="uiEnd">サイクル終了時刻</param>
void Watchdog_Process(QWORD uiBegin, QWORD uiEnd)
{
	if (Step_IsEnable())	// ステップ実行モードの場合はWatchDogの計算しない
		return;

	/* 処理前カウンタと処理後カウンタの値から所要時間nano secを得る */
	double flDifTime = Watchdog_Calc(uiBegin, uiEnd);

	/* エンジンが温まってから処理時間計測開始 */
	if (slowstart < 100) {
		
		slowstart++;

		/* 初期時は全項目同一値を格納 */
		curdelay = flDifTime;
		maxdelay = flDifTime;
		mindelay = flDifTime;
		if (sqtbl)
		{
			sqtbl->flCurSeq = (float)flDifTime;
			sqtbl->flAveSeq = (float)flDifTime;
			sqtbl->flMaxSeq = (float)flDifTime;
			sqtbl->flMinSeq = (float)flDifTime;
		}

		// 本機能の動作状態を更新
		status_watchdog = STATUS_RUN;
	}
	else {
		/* 計測時間の格納 */
		curdelay = (curdelay * 0.9) + (flDifTime * 0.1);
		maxdelay = (curdelay > sqtbl->flMaxSeq) ? curdelay : sqtbl->flMaxSeq;
		mindelay = (curdelay < sqtbl->flMinSeq) ? curdelay : sqtbl->flMinSeq;
		if (sqtbl)
		{
			sqtbl->flCurSeq = (float)flDifTime;
			sqtbl->flMaxSeq = (float)maxdelay;
			sqtbl->flAveSeq = (float)curdelay;
			sqtbl->flMinSeq = (float)mindelay;
		}
	}

	// インディケータを更新
	Indicate_TASK_CurDuration_ns((uint32_t)(curdelay));
	Indicate_TASK_MaxDuration_ns((uint32_t)(maxdelay));
	Indicate_TASK_MinDuration_ns((uint32_t)(mindelay));

	return;
}

/// <summary>
/// オーバーラン発生時のアクションが有効か？
/// </summary>
/// <returns></returns>
BOOL WatchDog_IsEnable(void)
{
	return (Config_Get_Overrun() != 0);
}

/// <summary>
/// オーバーランの発生
/// </summary>
void WatchDog_Action_OverRun(void)
{
	if (WatchDog_IsEnable()) {

		// 本機能の動作状態を更新
		status_watchdog = STATUS_HALT;

		Fail("<< SUSPEND >> Overrun was detected specified(%d) times ", wOverRunCnt);
	}
}