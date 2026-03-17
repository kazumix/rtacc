/// <summary>
/// PLC plus / INplc 5
/// 
/// Programmed by Kazumi.Machii 2023
/// 
/// step debug module
/// </summary>

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"

// ステップ実行管理
DWORD	status_step = STATUS_STOP;

RTHANDLE	hStepSem = 0;				// Engine pulse semaphore

/// <summary>
/// ステップ実行管理の初期化
/// </summary>
void Step_Init(void)
{
	if (sqtbl)
	{
		if (sqtbl->hStepSem == 0)
		{
			// ステップ実行用のセマフォを生成
			sqtbl->hStepSem = CreateRtSemaphore(0, 1, FIFO_QUEUING);
			Catalog(NULL_RTHANDLE, sqtbl->hStepSem, CATALOG_STEP);

			// 本機能の動作状態を更新
			status_step = STATUS_READY;
		}
	}
}

/// <summary>
/// ステップ実行の有効状態
/// </summary>
/// <returns></returns>
BOOL Step_IsEnable(void)
{
	if (sqtbl)
	{
		return (sqtbl->byStepExe != 0);
	}
	return FALSE;
}

/// <summary>
/// ステップ実行の有効化
/// </summary>
void Step_Enable(void)
{
	if (sqtbl)
	{
		sqtbl->byStepExe = TRUE;

		// 本機能の動作状態を更新
		status_step = STATUS_RUN;

		// タグにマーキング
		Indicate_STATE_STEP(TRUE);
	}
}

/// <summary>
/// ステップ実行の無効化
/// </summary>
void Step_Disable(void)
{
	if (sqtbl)
	{
		sqtbl->byStepExe = FALSE;

		// 本機能の動作状態を更新
		status_step = STATUS_READY;

		// ステップトリガ待ちから抜けるためにセマフォ発行
		Step_Trigger();

		// タグにマーキング
		Indicate_STATE_STEP(FALSE);
	}
}

/// <summary>
/// ステップ実行のトリガ待ち
/// </summary>
void Step_WaitTrigger(void)
{
	DWORD		prevstatus = status_step;

	if (sqtbl)
	{
		if (GetRtHandleType(sqtbl->hStepSem) == SEMAPHORE_TYPE)
		{
			// 本機能の動作状態を更新
			status_step = STATUS_WAIT;

			// トリガ待ち
			WaitForRtSemaphore(sqtbl->hStepSem, 1, WAIT_FOREVER);

			// 本機能の動作状態を更新
			status_step = STATUS_READY;

			// 本機能の動作状態を更新
			status_step = prevstatus;
		}
	}
}

/// <summary>
/// ステップ実行トリガを発行する
/// </summary>
void Step_Trigger(void)
{
	if (sqtbl)
	{
		if (GetRtHandleType(sqtbl->hStepSem) == SEMAPHORE_TYPE)
		{
			// トリガ発行
			ReleaseRtSemaphore(sqtbl->hStepSem, 1);
		}
	}
}