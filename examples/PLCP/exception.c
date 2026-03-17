#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// 例外管理
DWORD	status_exception = STATUS_STOP;


static BOOL		exceptionNOW;



/// <summary>
/// 例外機能を初期化します
/// </summary>
void Exception_Init(void)
{
	exceptionNOW = FALSE;
}

/// <summary>
/// 例外を発報します
/// </summary>
void Exception_Set(uint32_t exceptioncode ,char* hint ,uint32_t line)
{
	unsigned long		numreqp = 0;
	unsigned long		numresp = 0;
	unsigned long		*reqp = 0;
	unsigned long		*resp = 0;
	unsigned long		ret;

	// 例外発報状態では解除されるまで再発行はしません
	if (!exceptionNOW)
	{
		// APIコール
		ret = Api_Request(0, API_PLC_HALT, reqp, numreqp, resp, numresp);

		exceptionNOW = TRUE;

		Errorlog_Add(line, exceptioncode, hint);
	}
}

/// <summary>
/// 例外を解除します
/// </summary>
void Exception_Clear(void)
{
	exceptionNOW = FALSE;
}