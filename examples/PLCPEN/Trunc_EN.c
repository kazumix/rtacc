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
//　小数点以下切り捨て
//-------------------------------------

/// <summary>
/// （型変換）REAL型の小数点以下を切り捨てて、SINT型に変換します。
/// 例　(REAL)    0.0    → (SINT)0x00    0
///     (REAL)    0.49   → (SINT)0x00    0
///     (REAL)    0.50   → (SINT)0x00    0
///     (REAL)    1.0    → (SINT)0x00    1
///     (REAL)  127.0    → (SINT)0x80 -128
///     (REAL)  127.49   → (SINT)0x80 -128
///     (REAL)  127.50   → (SINT)0x80 -128
///     (REAL)   -0.49   → (SINT)0x00    0
///     (REAL)   -0.50   → (SINT)0xFF   -1
///     (REAL)   -1.00   → (SINT)0xFF   -1
///     (REAL) -128.00   → (SINT)0x80 -128
///     (REAL) -128.49   → (SINT)0x80 -128
///     (REAL) -128.50   → (SINT)0x80 -128
///     (REAL)  DBL_MAX  → (SINT)0x00    0
///     (REAL)  DBL_MIN  → (SINT)0x00    0
///     (REAL) -DBL_MAX  → (SINT)0x00    0
///     (REAL) -DBL_MIN  → (SINT)0x00    0
/// </summary>
PLCPEN_API void TRUNC_SINT_EN(PVOID instance)
{
	struct TRUNC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// REAL型の値をSINT型に変換した値
	} *pin = (struct TRUNC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		TRUNC_SINT(pin->IN, NULL, NULL, NULL);

		if (pin->ENO = GetTruncEno())	// TRUNC実行結果ENO設定
		{
			*pin->OUT->pSint = *pin->IN->pSint;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）REAL型の小数点以下を切り捨てて、INT型に変換します。
/// 例　(REAL)      0.0   → (INT)0x0000      0
///     (REAL)      0.49  → (INT)0x0000      0
///     (REAL)      0.50  → (INT)0x0000      0
///     (REAL)      1.0   → (INT)0x0001      1
///     (REAL)  32767.0   → (INT)0x7FFF  32767
///     (REAL)  32767.49  → (INT)0x7FFF  32767
///     (REAL)  32767.50  → (INT)0x7FFF  32767
///     (REAL)     -0.49  → (INT)0x0000      0
///     (REAL)     -0.50  → (INT)0xFFFF     -1
///     (REAL)     -1.00  → (INT)0xFFFF     -1
///     (REAL) -32768.00  → (INT)0x8000 -32768
///     (REAL) -32768.49  → (INT)0x8000 -32768
///     (REAL) -32768.50  → (INT)0x8000 -32768
///     (REAL)   DBL_MAX  → (INT)0x0000      0
///     (REAL)   DBL_MIN  → (INT)0x0000      0
///     (REAL)  -DBL_MAX  → (INT)0x0000      0
///     (REAL)  -DBL_MIN  → (INT)0x0000      0
/// </summary>
PLCPEN_API void TRUNC_INT_EN(PVOID instance)
{
	struct TRUNC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// REAL型の値をINT型に変換した値
	} *pin = (struct TRUNC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		TRUNC_INT(pin->IN, NULL, NULL, NULL);

		if (pin->ENO = GetTruncEno())	// TRUNC実行結果ENO設定
		{
			*pin->OUT->pInt = *pin->IN->pInt;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）REAL型の小数点以下を切り捨てて、DINT型に変換します。
/// 例　(REAL)           0.0   → (DINT)0x00000000           0
///     (REAL)           0.49  → (DINT)0x00000000           0
///     (REAL)           0.50  → (DINT)0x00000000           0
///     (REAL)           1.0   → (DINT)0x00000001           1
///     (REAL)  2147483647.0   → (DINT)0x7FFFFFFF  2147483647
///     (REAL)  2147483647.50  → (DINT)0x7FFFFFFF  2147483647
///     (REAL)          -0.49  → (DINT)0x00000000           0
///     (REAL)          -0.50  → (DINT)0x00000000           0
///     (REAL)          -1.00  → (DINT)0xFFFFFFFF          -1
///     (REAL) -2147483648.00  → (DINT)0x80000000 -2147483648
///     (REAL) -2147483648.49  → (DINT)0x80000000 -2147483648
///     (REAL) -2147483648.50  → (DINT)0x80000000 -2147483648
///     (REAL)        DBL_MAX  → (DINT)0x80000000 -2147483648
///     (REAL)        DBL_MIN  → (DINT)0x00000000           0
///     (REAL)       -DBL_MAX  → (DINT)0x80000000 -2147483648
///     (REAL)       -DBL_MIN  → (DINT)0x00000000           0
/// </summary>
PLCPEN_API void TRUNC_DINT_EN(PVOID instance)
{
	struct TRUNC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// REAL型の値をDINT型に変換した値
	} *pin = (struct TRUNC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		TRUNC_DINT(pin->IN, NULL, NULL, NULL);

		if (pin->ENO = GetTruncEno())	// TRUNC実行結果ENO設定
		{
			*pin->OUT->pDint = *pin->IN->pDint;
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）REAL型の小数点以下を切り捨てて、LINT型に変換します。
/// 例　(REAL)                    0.0   → (LINT)0x00000000000000000000                    0
///     (REAL                     0.49  → (LINT)0x00000000000000000000                    0
///     (REAL)                    0.50  → (LINT)0x00000000000000000000                    0
///     (REAL)                    1.0   → (LINT)0x00000000000000000001                    1
///     (REAL)  9223372036854775807.0   → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)  9223372036854775807.49  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)  9223372036854775807.50  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)                   -0.49  → (LINT)0x00000000000000000000                    0
///     (REAL)                   -0.50  → (LINT)0x00000000000000000000                    0
///     (REAL)                   -1.00  → (LINT)0xFFFFFFFFFFFFFFFFFFFF                   -1
///     (REAL) -9223372036854775808.00  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL) -9223372036854775808.49  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL) -9223372036854775808.50  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)                 DBL_MAX  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)                 DBL_MIN  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)                -DBL_MAX  → (LINT)0x80000000000000000000 -9223372036854775808
///     (REAL)                -DBL_MIN  → (LINT)0x80000000000000000000 -9223372036854775808
/// </summary>
PLCPEN_API void TRUNC_LINT_EN(PVOID instance)
{
	struct TRUNC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// REAL型の値をLINT型に変換した値
	} *pin = (struct TRUNC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		TRUNC_LINT(pin->IN, NULL, NULL, NULL);

		if (pin->ENO = GetTruncEno())	// TRUNC実行結果ENO設定
		{
			*pin->OUT->pLint = *pin->IN->pLint;
		}			
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}