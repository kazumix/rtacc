#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPEN.h"
#include "PLCPIEC.h"

#pragma pack(push,1)

// ------------------------------------ 
//　その他 型変換
//-------------------------------------

/// <summary>
/// （型変換）TIME型の値をDINT型に変換します。
/// 例　(TIME)0x00000000          0 → (DINT)0x00000000           0
///   　(TIME)0x7FFFFFFF 2147483647 → (DINT)0x7FFFFFFF  2147483647
///     (TIME)0x80000000 2147483648 → (DINT)0x80000000 -2147483648
///     (TIME)0xFFFFFFFF 4294967925 → (DINT)0xFFFFFFFF          -1
/// </summary>
PLCPEN_API void TIME_TO_DINT_EN(PVOID instance)
{
	struct TIME_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// TIME型の値をDINT型に変換した値
	} *pin = (struct TIME_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		TIME_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}