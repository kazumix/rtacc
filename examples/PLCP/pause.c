#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"

// 実行ポーズ管理
DWORD	status_pause = STATUS_STOP;

/// <summary>
/// 実行ポーズ管理の初期化
/// </summary>
void Pause_Init(void)
{
	if (sqtbl)
	{
		if (sqtbl->hSuspSem == 0)
		{
			sqtbl->hSuspSem = CreateRtSemaphore(0, 1, FIFO_QUEUING);
			Catalog(NULL_RTHANDLE, sqtbl->hSuspSem, CATALOG_UNPAUSE);

			// 本機能の動作状態を更新
			status_pause = STATUS_READY;
		}
	}
}

/// <summary>
/// 実行ポーズの有効状態
/// </summary>
/// <returns></returns>
BOOL Pause_IsEnable(void)
{
	if (sqtbl)
	{
		return (sqtbl->bySusExe != 0);
	}
	return FALSE;
}

/// <summary>
/// 実行ポーズ解除のトリガ待ち
/// </summary>
void Pause_WaitTrigger(void)
{
	DWORD		prevstatus = status_pause;

	if (sqtbl)
	{
		if (GetRtHandleType(sqtbl->hSuspSem) == SEMAPHORE_TYPE) {

			// 本機能の動作状態を更新
			status_pause = STATUS_WAIT;

			// トリガ待ち
			WaitForRtSemaphore(sqtbl->hSuspSem, 1, WAIT_FOREVER);

			// 本機能の動作状態を更新
			status_pause = prevstatus;
		}
	}
}

/// <summary>
/// 実行ポーズの有効化
/// </summary>
void Pause_Enable(void)
{
	if (sqtbl)
	{
		sqtbl->bySusExe = TRUE;

		// 本機能の動作状態を更新
		status_pause = STATUS_RUN;
	}
}

/// <summary>
/// 実行ポーズの無効化
/// </summary>
void Pause_Disable(void)
{
	if (sqtbl)
	{
		sqtbl->bySusExe = FALSE;

		// 本機能の動作状態を更新
		status_pause = STATUS_READY;
	}
}