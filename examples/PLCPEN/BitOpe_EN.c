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
/// ビット操作：単一ビット値読み取り
/// </summary>
/// <param name="instance">BIT_TESTピン構造体</param>
PLCPEN_API void BIT_TEST_EN(PVOID instance)
{
	struct BIT_TEST_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1: 読み取り対象ビット列(ANY_BIT型)
		P_ANY		IN2;        // 入力2: 読み取り位置(SINT型)
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 単一ビット値読み取り結果(BOOL型)
	} *pin = (struct BIT_TEST_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BIT_TEST(pin->IN1, pin->IN2, NULL, NULL);	// ファンクション呼出

		pin->ENO = GetBitOpeEno();					// ビット操作実行結果ENO設定
		if (pin->ENO)								// 正常動作時
		{
			*pin->OUT->pBool = *pin->IN1->pBool;	// 処理結果を出力ピンにセット
			pin->OUT->Type = D_BOOL;				// 出力データ型をBOOLに指定
		}
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// ビット操作：1文字抽出
/// </summary>
/// <param name="instance">GET_CHARピン構造体</param>
PLCPEN_API void GET_CHAR_EN(PVOID instance)
{
	struct BIT_TEST_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1: 読み取り対象文字列
		P_ANY		IN2;        // 入力2: 読み取り位置
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 読み取り文字
	} *pin = (struct GET_CHAR_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		GET_CHAR(pin->IN1, pin->IN2, NULL, NULL);	// ファンクション呼出

		pin->ENO = GetBitOpeEno();					// ビット操作実行結果ENO設定
		if (pin->ENO)								// 正常動作時
		{
			*pin->OUT->pInt = *pin->IN1->pInt;		// 処理結果を出力ピンにセット
			pin->OUT->Type = D_INT;					// 出力データ型をBOOLに指定
		}
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}