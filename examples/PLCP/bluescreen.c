#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// ブルースクリーン管理
DWORD	status_bluescreen = STATUS_READY;

/// <summary>
/// ブルースクリーン検知時の処理
/// </summary>
void BlueScreen_Process(void)
{
	if (sqtbl)
	{
		// ブルースクリーンを検出したときの処理
//		sqtbl->sAuxRelay.byBlueScreen = 1;
	}
}