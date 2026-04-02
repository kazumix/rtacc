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
//　型変換 BCD型から数値型へ
//-------------------------------------

/// <summary>
/// （型変換）B_BCD型の値をDINT型に変換します。
/// 例　(B_BCD)0x00  → (DINT)0x00000000   0
///     (B_BCD)0x01  → (DINT)0x00000001   1
///     (B_BCD)0x99  → (DINT)0x00000063  99
///     (B_BCD)0xFF  → (DINT)0xFFFFFFFF  -1
///     (B_BCD)0x0A  → (DINT)0xFFFFFFFF  -1
///     (B_BCD)0xA0  → (DINT)0xFFFFFFFF  -1
/// </summary>
PLCPEN_API void B_BCD_TO_DINT_EN(PVOID instance)
{
	struct BCD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// B_BCD型の値をDINT型に変換した値
	} *pin = (struct BCD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		B_BCD_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
		pin->ENO = GetBcdToEno();	// BCD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）B_BCD型の値をINT型に変換します。
/// 例　(B_BCD)0x00  → (INT)0x0000   0
///     (B_BCD)0x01  → (INT)0x0001   1
///     (B_BCD)0x99  → (INT)0x0063  99
///     (B_BCD)0xFF  → (INT)0xFFFF  -1
///     (B_BCD)0x0A  → (INT)0xFFFF  -1
///     (B_BCD)0xA0  → (INT)0xFFFF  -1
/// </summary>
PLCPEN_API void B_BCD_TO_INT_EN(PVOID instance)
{
	struct BCD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// B_BCD型の値をINT型に変換した値
	} *pin = (struct BCD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		B_BCD_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
		pin->ENO = GetBcdToEno();	// BCD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）B_BCD型の値をLINT型に変換します。
/// 例　(B_BCD)0x00  → (LINT)0x0000000000000000   0
///     (B_BCD)0x01  → (LINT)0x0000000000000001   1
///     (B_BCD)0x99  → (LINT)0x0000000000000063  99
///     (B_BCD)0xFF  → (LINT)0xFFFFFFFFFFFFFFFF  -1
///     (B_BCD)0x0A  → (LINT)0xFFFFFFFFFFFFFFFF  -1
///     (B_BCD)0xA0  → (LINT)0xFFFFFFFFFFFFFFFF  -1
/// </summary>
PLCPEN_API void B_BCD_TO_LINT_EN(PVOID instance)
{
	struct BCD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// B_BCD型の値をLINT型に変換した値
	} *pin = (struct BCD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		B_BCD_TO_LINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLint = *pin->IN->pLint;
		pin->ENO = GetBcdToEno();	// BCD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）B_BCD型の値をSINT型に変換します。
/// 例　(B_BCD)0x00  → (SINT)0x00   0
///     (B_BCD)0x01  → (SINT)0x01   1
///     (B_BCD)0x99  → (SINT)0x63  99
///     (B_BCD)0xFF  → (SINT)0xFF  -1
///     (B_BCD)0x0A  → (SINT)0xFF  -1
///     (B_BCD)0xA0  → (SINT)0xFF  -1
/// </summary>
PLCPEN_API void B_BCD_TO_SINT_EN(PVOID instance)
{
	struct BCD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// B_BCD型の値をSINT型に変換した値
	} *pin = (struct BCD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		B_BCD_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
		pin->ENO = GetBcdToEno();	// BCD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）D_BCD型の値をDINT型に変換します。
/// 例　(D_BCD)0x00000000  → (DINT)0x00000000         0
///     (D_BCD)0x00000001  → (DINT)0x00000001         1
///     (D_BCD)0x99999999  → (DINT)0x05F5E0FF  99999999
///     (D_BCD)0xFFFFFFFF  → (DINT)0xFFFFFFFF        -1
///     (D_BCD)0x0000000A  → (DINT)0xFFFFFFFF        -1
///     (D_BCD)0xA0000000  → (DINT)0xFFFFFFFF        -1
/// </summary>
PLCPEN_API void D_BCD_TO_DINT_EN(PVOID instance)
{
	struct BCD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// D_BCD型の値をDINT型に変換した値
	} *pin = (struct BCD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		D_BCD_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
		pin->ENO = GetBcdToEno();	// BCD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）D_BCD型の値をINT型に変換します。
/// 例　(D_BCD)0x00000000  → (INT)0x0000         0
///     (D_BCD)0x00000001  → (INT)0x0001         1
///     (D_BCD)0x00032767  → (INT)0x7FFF     32767
///     (D_BCD)0x00032768  → (INT)0xFFFF        -1
///     (D_BCD)0xFFFFFFFF  → (INT)0xFFFF        -1
///     (D_BCD)0x0000000A  → (INT)0xFFFF        -1
///     (D_BCD)0xA0000000  → (INT)0xFFFF        -1
/// </summary>
PLCPEN_API void D_BCD_TO_INT_EN(PVOID instance)
{
	struct BCD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// D_BCD型の値をINT型に変換した値
	} *pin = (struct BCD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		D_BCD_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
		pin->ENO = GetBcdToEno();	// BCD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）D_BCD型の値をLINT型に変換します。
/// 例　(D_BCD)0x00000000  → (LINT)0x0000000000000000         0
///     (D_BCD)0x00000001  → (LINT)0x0000000000000001         1
///     (D_BCD)0x99999999  → (LINT)0x0000000005F5E0FF  99999999
///     (D_BCD)0xFFFFFFFF  → (LINT)0xFFFFFFFFFFFFFFFF        -1
///     (D_BCD)0x0000000A  → (LINT)0xFFFFFFFFFFFFFFFF        -1
///     (D_BCD)0xA0000000  → (LINT)0xFFFFFFFFFFFFFFFF        -1
/// </summary>
PLCPEN_API void D_BCD_TO_LINT_EN(PVOID instance)
{
	struct BCD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// D_BCD型の値をLINT型に変換した値
	} *pin = (struct BCD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		D_BCD_TO_LINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLint = *pin->IN->pLint;
		pin->ENO = GetBcdToEno();	// BCD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）D_BCD型の値をSINT型に変換します。
/// 例　(D_BCD)0x00000000  → (INT)0x00         0
///     (D_BCD)0x00000001  → (INT)0x01         1
///     (D_BCD)0x00000127  → (INT)0x7F       127
///     (D_BCD)0x00000128  → (INT)0xFF        -1
///     (D_BCD)0xFFFFFFFF  → (INT)0xFF        -1
///     (D_BCD)0x0000000A  → (INT)0xFF        -1
///     (D_BCD)0xA0000000  → (INT)0xFF        -1
/// </summary>
PLCPEN_API void D_BCD_TO_SINT_EN(PVOID instance)
{
	struct BCD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// D_BCD型の値をSINT型に変換した値
	} *pin = (struct BCD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		D_BCD_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
		pin->ENO = GetBcdToEno();	// BCD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）W_BCD型の値をDINT型に変換します。
/// 例　(W_BCD)0x0000  → (DINT)0x00000000         0
///     (W_BCD)0x0001  → (DINT)0x00000001         1
///     (W_BCD)0x9999  → (DINT)0x0000270F      9999
///     (W_BCD)0xFFFF  → (DINT)0xFFFFFFFF        -1
///     (W_BCD)0x000A  → (DINT)0xFFFFFFFF        -1
///     (W_BCD)0xA000  → (DINT)0xFFFFFFFF        -1
/// </summary>
PLCPEN_API void W_BCD_TO_DINT_EN(PVOID instance)
{
	struct BCD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// W_BCD型の値をDINT型に変換した値
	} *pin = (struct BCD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		W_BCD_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
		pin->ENO = GetBcdToEno();	// BCD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）W_BCD型の値をINT型に変換します。
/// 例　(W_BCD)0x0000  → (INT)0x0000         0
///     (W_BCD)0x0001  → (INT)0x0001         1
///     (W_BCD)0x9999  → (INT)0x270F      9999
///     (W_BCD)0xFFFF  → (INT)0xFFFF        -1
///     (W_BCD)0x000A  → (INT)0xFFFF        -1
///     (W_BCD)0xA000  → (INT)0xFFFF        -1
/// </summary>
PLCPEN_API void W_BCD_TO_INT_EN(PVOID instance)
{
	struct BCD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// W_BCD型の値をINT型に変換した値
	} *pin = (struct BCD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		W_BCD_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
		pin->ENO = GetBcdToEno();	// BCD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）W_BCD型の値をLINT型に変換します。
/// 例　(W_BCD)0x0000  → (LINT)0x0000000000000000         0
///     (W_BCD)0x0001  → (LINT)0x0000000000000001         1
///     (W_BCD)0x9999  → (LINT)0x000000000000270F      9999
///     (W_BCD)0xFFFF  → (LINT)0xFFFFFFFFFFFFFFFF        -1
///     (W_BCD)0x000A  → (LINT)0xFFFFFFFFFFFFFFFF        -1
///     (W_BCD)0xA000  → (LINT)0xFFFFFFFFFFFFFFFF        -1
/// </summary>
PLCPEN_API void W_BCD_TO_LINT_EN(PVOID instance)
{
	struct BCD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// W_BCD型の値をLINT型に変換した値
	} *pin = (struct BCD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		W_BCD_TO_LINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLint = *pin->IN->pLint;
		pin->ENO = GetBcdToEno();	// BCD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）W_BCD型の値をSINT型に変換します。
/// 例　(W_BCD)0x0000  → (SINT)0x00         0
///     (W_BCD)0x0001  → (SINT)0x01         1
///     (W_BCD)0x0127  → (SINT)0x7F       127
///     (W_BCD)0x0128  → (SINT)0xFF        -1
///     (W_BCD)0xFFFF  → (SINT)0xFF        -1
///     (W_BCD)0x000A  → (SINT)0xFF        -1
///     (W_BCD)0xA000  → (SINT)0xFF        -1
/// </summary>
PLCPEN_API void W_BCD_TO_SINT_EN(PVOID instance)
{
	struct BCD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// W_BCD型の値をSINT型に変換した値
	} *pin = (struct BCD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		W_BCD_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
		pin->ENO = GetBcdToEno();	// BCD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}