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
/// （加算）入力 IN1 と IN2 の剰余算を行います。 
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPEN_API void MOD_EN(PVOID instance)
{
	struct MOD_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の剰余算値
	} *pin = (struct MOD_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		MOD(pin->IN1, pin->IN2, NULL, NULL);	// MOD呼出

		if (pin->ENO = GetModEno())	// MOD実行結果ENO設定
		{
			switch (pin->IN1->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN1->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN1->pLreal;	break;
			case D_SINT:	*pin->OUT->pSint = *pin->IN1->pSint;	break;
			case D_INT:		*pin->OUT->pInt = *pin->IN1->pInt;	break;
			case D_DINT:	*pin->OUT->pDint = *pin->IN1->pDint;	break;
			case D_LINT:	*pin->OUT->pLint = *pin->IN1->pLint;	break;
			case D_USINT:
			case D_BYTE:	*pin->OUT->pUsint = *pin->IN1->pUsint;	break;
			case D_UINT:
			case D_WORD:	*pin->OUT->pUint = *pin->IN1->pUint;	break;
			case D_UDINT:
			case D_DWORD:	*pin->OUT->pUdint = *pin->IN1->pUdint;	break;
			case D_ULINT:	*pin->OUT->pUlint = *pin->IN1->pUlint;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}