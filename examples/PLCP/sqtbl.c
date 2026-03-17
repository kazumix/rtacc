#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"


SQTBL*		sqtbl = 0;
RTHANDLE	hSQTBLmem = 0;				// SQTBL memory handle


/// <summary>
/// SQTBLの生成
/// </summary>
/// <returns></returns>
int SQTBL_Create(void)
{
	// サイズ算出、メモリ確保
	DWORD		size;
	size = ALIGN_4KB(sizeof(SQTBL));
#ifdef __INTIME__
	sqtbl = (SQTBL*)AllocateRtMemory(size);
	if (!sqtbl)
	{
		// メモリ不足による継続不可能
		printf("INtimeカーネルメモリの増設が必要です");
		exit(0);
	}
	if (sqtbl)
		hSQTBLmem = CreateRtMemoryHandle(sqtbl, size);
	Catalog(NULL_RTHANDLE, hSQTBLmem, CATALOG_SQTBL);

#else
	sqtbl = (SQTBL*)malloc(size);		// ※ここは明確にmallocです
#endif

	// テーブルクリア
	if (sqtbl)
		memset(sqtbl, 0, size);

	return (sqtbl) ? 0 : -1;
}

/// <summary>
/// SQTBLの初期状態をセットします
/// </summary>
void SQTBL_Initialize(void)
{
	if (sqtbl)
	{
		// トレースモード
		sqtbl->byDoTrace = Config_Get_TraceMode();
		// ステップモード
		sqtbl->byStepExe = Config_Get_StepMode();
		// プリントモード
		sqtbl->byPrint = Config_Get_PrintMode();
		// リモートモード
		sqtbl->byRemote = Config_Get_RemoteMode();
		// 実行モード
		switch (Config_Get_RunMode())
		{
		case RUNMODE_EXE:
			strcpy_s(sqtbl->cExeRtTypeString, sizeof(sqtbl->cExeRtTypeString), "EXE");
			break;
		case RUNMODE_INTERPRIT:
			strcpy_s(sqtbl->cExeRtTypeString, sizeof(sqtbl->cExeRtTypeString), "SCRIPT");
			break;
		}
		// バージョン情報
		strcpy_s(sqtbl->cVersionInfo, sizeof(sqtbl->cVersionInfo), VERSION_INFO);
	}
}

