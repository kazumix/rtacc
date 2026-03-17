#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include <math.h>

// エンジン管理
DWORD	status_engine = STATUS_STOP;


RTHANDLE	hSQengineThread = 0;
RTHANDLE	hPulseThread = 0;			// Engine pulser thread
RTHANDLE	hPulseSem = 0;
void		(*lpfnSeq_Ctrl)(void);

BOOL		Engine_PhaseStop;

static uint32_t	systickcount;
static double	curdelay;
static double	maxdelay;
static double	mindelay;
static uint64_t uiEnd;
static uint64_t uiBegin;


/// <summary>
/// PLCエンジンを生成します
/// </summary>
void Engine_Init(void)
{
	// 変数系の初期化
	Engine_Reset();

	// エンジンパルス用のセマフォを生成
	if (hPulseSem == 0)
	{
		hPulseSem = CreateRtSemaphore(0, 1, FIFO_QUEUING);
		Catalog(NULL_RTHANDLE, hPulseSem, CATALOG_PULSE);
	}

	// エンジンスレッドを開始
	uint32_t		prioengine = PRI_ENGINE + Config_Get_BasePriority();
	uint32_t		stackengine = STACK_ENGINE;
	if (hSQengineThread == 0)
	{
		hSQengineThread = CreateRtThread(prioengine, Engine_Thread, stackengine, 0);
		if (hSQengineThread == BAD_RTHANDLE)
		{
			hSQengineThread = NULL_RTHANDLE;
			Fail("Cannot create Engine_Thread");
		}
	}

	// インジケータ更新
	Indicate_TASK_Prio(prioengine);
	Indicate_TASK_Stack(stackengine);

	// パルススレッドを開始
	uint32_t		pripulse = PRI_PULSER + Config_Get_BasePriority();
	uint32_t		stackpulse = STACK_PULSER;
	if (hPulseThread == 0)
	{
		hPulseThread = CreateRtThread(pripulse, Engine_PulseThread, stackpulse, 0);
		if (hPulseThread == BAD_RTHANDLE)
		{
			hPulseThread = NULL_RTHANDLE;
			Fail("Cannot create Engine_PulseThread");
		}
	}

	// スレッド起動完了を待機
	LookupRtHandle(0, CATALOG_ENGINE, 10);
	LookupRtHandle(0, CATALOG_PULSER, 10);

	// 本機能の動作状態を更新
	status_engine = STATUS_READY;
}

/// <summary>
/// PLCエンジン制御計測変数を初期化します
/// </summary>
void Engine_Reset(void)
{
	// 変数初期化
	Engine_PhaseStop = FALSE;
	systickcount	= 0;
	curdelay		= 0;
	maxdelay		= 0;
	mindelay		= 0;
	uiEnd			= 0;
	uiBegin			= 0;
}

/// <summary>
/// PLCエンジンパルスを発行します
/// </summary>
BOOL Engine_Tigger(void)
{
	BOOL	error = 0;
	if (hPulseSem)
	{
		// ステップ実行有効なら
		if (Step_IsEnable())
		{
			// ステップトリガ待ち
			Step_WaitTrigger();
		}

		// パルスを発行します
		error = ReleaseRtSemaphore(hPulseSem, 1);
	}

	// オーバーラン(サイクルタイム内に処理完結しなかった)のときはFALSEになります
	return error;
}

/// <summary>
/// PLCエンジン制御周期のジッタ（基準値との差の絶対値を返す
/// </summary>
/// <param name="timespan"></param>
/// <returns></returns>
double Engine_AbsDelay(double timespan)
{
	timespan = fabs(timespan - Config_Get_ScanFreq() * 1000 );
	return timespan;
}

/// <summary>
/// PLCエンジンパルスを待ちます
/// </summary>
void Engine_WaitTrigger(void)
{
	if (hPulseSem)
	{
		// トリガパルス待機
		WaitForRtSemaphore(hPulseSem, 1, WAIT_FOREVER);

		// カーネルエントリタイムから、エンジンスレッドウエイクアップまでの時間差（ディレイ）を算出します
		uiEnd = WatchDog_GetPentiumCounter();
		if (uiBegin)
		{
			double flDifTime = Engine_AbsDelay( Watchdog_Calc(uiBegin, uiEnd) );

			if (maxdelay == 0)
			{
				// 初回だけ
				curdelay = flDifTime;
				maxdelay = flDifTime;
				mindelay = flDifTime;
			}
			else
			{
				// 計測値
				curdelay =(curdelay * 0.9) + (flDifTime * 0.1);
				maxdelay =(curdelay > maxdelay) ? curdelay : maxdelay;
				mindelay =(curdelay < mindelay) ? curdelay : mindelay;
			}
		}

		uiBegin = uiEnd;

		// インジケータ更新
		++systickcount;
		Indicate_SYSTICK_CNT(systickcount);

		// インディケータを更新
		Indicate_TASK_CurDelay_ns((uint32_t)(curdelay));
		Indicate_TASK_MaxDelay_ns((uint32_t)(maxdelay));
		Indicate_TASK_MinDelay_ns((uint32_t)(mindelay));
	}
}

/// <summary>
/// PLCエンジン停止の要求
/// </summary>
void Engine_Stop(void)
{
	if (sqtbl)
	{
		sqtbl->byExe = FALSE;
	}

	// 本機能の動作状態を更新
	status_engine = STATUS_HALT;
}

/// <summary>
/// PLCエンジンを運転にする
/// </summary>
void Engine_Start(void)
{
	// 統計情報をクリア
	Watchdog_Reset();
	Engine_Reset();

	if (sqtbl)
	{
		sqtbl->byExe = TRUE;
	}

	// 本機能の動作状態を更新
	status_engine = STATUS_RUN;
}

/// <summary>
/// PLCエンジンの有効状態を取得する
/// </summary>
/// <returns></returns>
BOOL Engine_IsStart(void)
{
	if (sqtbl)
	{
		return sqtbl->byExe;
	}
	return FALSE;
}

/// <summary>
/// PLCエンジンパルススレッド
/// </summary>
void Engine_PulseThread(void)
{
	DWORD	dwPlsCnt = 0;				// PLC実行周期カウンタ
	BOOL	overrunerror;

	// 準備完了なのでカタログします
	Catalog(NULL_RTHANDLE, GetRtThreadHandles(THIS_THREAD), CATALOG_PULSER);

	// インジケータ更新
	uint32_t	taskpriod = Config_Get_ScanFreq();
	Indicate_TASK_Period_us(taskpriod);

	// 最初のタイミング調整用
	knRtSleep(1);

	while (1)
	{
		// 内部クロック待ち (内部クロックはタイマの最小分解能に関与します
		InternalClock_Wait();

		// PLCエンジンにパルスを送るタイミングかどうかを判定(0のとき動作します)
		if ((dwPlsCnt = InternalClock_IsPlcFireTiming( ++dwPlsCnt )) == 0)
		{
			overrunerror = FALSE;

			// PLCエンジンにパルスを送ります
			if (Engine_IsStart())
				overrunerror = !Engine_Tigger();

			// オーバーランを検知した場合の処理
			if (overrunerror)
				WatchDog_Action_OverRun();
		}
	}
}

/// <summary>
/// PLCエンジンスレッド
/// </summary>
void Engine_Thread(void)
{
	QWORD				ui64LgBegin;
	QWORD				ui64LgEnd;

	// エンジンコントローラを選択します
	lpfnSeq_Ctrl = Logic_Scan;			// SCRIPTコントローラ登録

	// 準備完了なのでカタログします
	Catalog(NULL_RTHANDLE, GetRtThreadHandles(THIS_THREAD), CATALOG_ENGINE);

	while (1)
	{
		// サイクルトリガを待ちます
		Engine_PhaseStop = TRUE;
		{
			Engine_WaitTrigger();
		}
		Engine_PhaseStop = FALSE;


		// シーケンス制御本処理
		ui64LgBegin = WatchDog_GetPentiumCounter();
		{
			(lpfnSeq_Ctrl)();
		}
		ui64LgEnd = WatchDog_GetPentiumCounter();


		// シーケンス監視処理
		Watchdog_Process(ui64LgBegin, ui64LgEnd);

	}
}

/// <summary>
/// エンジンの動作停止まで待ちます
/// </summary>
void Engine_WaitStop(void)
{
	while (1)
	{
		if (Engine_PhaseStop)
			break;

		knRtSleep(1);
	}
}