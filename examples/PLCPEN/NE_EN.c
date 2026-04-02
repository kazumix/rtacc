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
/// （比較 : <= ）パラメータを比較し、IN1 と IN2 が等しく無いか?
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPEN_API void NE_EN(PVOID instance)
{
	struct NE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の比較結果
	} *pin = (struct NE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		NE(pin->IN1, pin->IN2, NULL, NULL);	// NE呼出

		if (pin->ENO = GetNeEno())	// NE実行結果ENO設定
		{
			*pin->OUT->pBool = *pin->IN1->pBool;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}