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
/// 入力 INの2 の補数算出を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPEN_API void NEG_EN(PVOID instance)
{
	struct NEG_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INの2の補数
	} *pin = (struct NEG_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		NEG(pin->IN, NULL, NULL, NULL);	// NEG呼出

		if (pin->ENO = GetNegEno())	// NEG実行結果ENO設定
		{
			switch (pin->IN->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN->pLreal;	break;
			case D_SINT:	*pin->OUT->pSint = *pin->IN->pSint;	break;
			case D_INT:		*pin->OUT->pInt = *pin->IN->pInt;	break;
			case D_DINT:	*pin->OUT->pDint = *pin->IN->pDint;	break;
			case D_LINT:	*pin->OUT->pLint = *pin->IN->pLint;	break;
			case D_USINT:
			case D_BYTE:	*pin->OUT->pUsint = *pin->IN->pUsint;	break;
			case D_UINT:
			case D_WORD:	*pin->OUT->pUint = *pin->IN->pUint;	break;
			case D_UDINT:
			case D_DWORD:	*pin->OUT->pUdint = *pin->IN->pUdint;	break;
			case D_ULINT:	*pin->OUT->pUlint = *pin->IN->pUlint;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}