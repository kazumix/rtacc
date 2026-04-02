#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPEN.h"
#include "PLCPIEC.h"

#pragma pack(push,1)

/// <summary>
/// （加算）入力 IN1 と IN2 のべき乗を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPEN_API void EXPT_EN(PVOID instance)
{
	struct EXPT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		    // 入力1
		P_ANY		IN2;		    // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// べき乗演算結果
	} *pin = (struct EXPT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		EXPT(pin->IN1, pin->IN2, NULL, NULL);	// EXPT呼出

		if (pin->ENO = GetExptEno())	// EXPT実行結果ENO設定
		{
			switch (pin->IN1->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN1->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN1->pLreal;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}