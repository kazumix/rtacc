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
//　型変換 UDINT型から各型へ
//-------------------------------------

/// <summary>
/// （型変換）UDINT型の値をBOOL型に変換します。
/// 例　(UDINT)0x00000000          0 → (BOOL)0x0000  FALSE
///     (UDINT)0x00000001          1 → (BOOL)0x0001  TRUE
///		(UDINT)0xFFFFFFFF 4294967925 → (BOOL)0x0001  TRUE
/// </summary>
PLCPEN_API void UDINT_TO_BOOL_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UDINT型の値をBOOL型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_BOOL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pBool = *pin->IN->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UDINTの値をBYTE型に変換します。
/// 例　(UDINT)0x00000000          0  → (D_BYTE)0x00	  0
///     (UDINT)0x00000001          1  → (D_BYTE)0x01	  1
///     (UDINT)0x000000FF        255  → (D_BYTE)0xFF	255
///     (UDINT)0x00000100        256  → (D_BYTE)0x00	  0
///     (UDINT)0xFFFFFFFF 4294967925  → (D_BYTE)0xFF	255
/// </summary>
PLCPEN_API void UDINT_TO_BYTE_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UDINT型の値をBYTE型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_BYTE(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UDINT型の値をWORD型に変換します。
/// 例　(UDINT)0x00000000          0 → (WORD)0x0000
///   　(UDINT)0x00007FFF      32767 → (WORD)0x7FFF
///     (UDINT)0x00008000      32768 → (WORD)0x8000
///     (UDINT)0x0000FFFF      65535 → (WORD)0xFFFF
///     (UDINT)0x00010000      65536 → (WORD)0x0000
///     (UDINT)0xFFFFFFFF 4294967925 → (WORD)0xFFFF
/// </summary>
PLCPEN_API void UDINT_TO_WORD_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UDINT型の値をWORD型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_WORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UDINT型の値をDWORD型に変換します。
/// 例　(UDINT)0x00000000            0  → (DWORD)0x00000000
///     (UDINT)0x00000001            1  → (DWORD)0x00000001
///     (UDINT)0x7FFFFFFF   2147483647  → (DWORD)0x7FFFFFFF
///     (UDINT)0x80000000   2147483648  → (DWORD)0x80000000
///     (UDINT)0xFFFFFFFF   4294967295  → (DWORD)0xFFFFFFFF
/// </summary>
PLCPEN_API void UDINT_TO_DWORD_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UDINT型の値をDWORD型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_DWORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UDINT型の値をSINT型に変換します。
/// 例　(UDINT)0x00000000          0 → (SINT)0x00      0
///   　(UDINT)0x0000007F        127 → (SINT)0x7F    127
///     (UDINT)0x00000080       -128 → (SINT)0x80   -128
///     (UDINT)0x000000FF        255 → (SINT)0xFF     -1
///     (UDINT)0x00000100        256 → (SINT)0x00      0
///     (UDINT)0xFFFFFFFF 4294967925 → (SINT)0xFF     -1
/// </summary>
PLCPEN_API void UDINT_TO_SINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UDINT型の値をSINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UDINT型の値をINT型に変換します。
/// 例　(UDINT)0x00000000          0 → (INT)0x0000     0
///   　(UDINT)0x00007FFF      32767 → (INT)0x7FFF  32767
///     (UDINT)0x00008000      32768 → (INT)0x8000 -32768
///     (UDINT)0x0000FFFF      65535 → (INT)0xFFFF     -1
///     (UDINT)0x00010000      65536 → (INT)0x0000      0
///     (UDINT)0xFFFFFFFF 4294967925 → (INT)0xFFFF     -1
/// </summary>
PLCPEN_API void UDINT_TO_INT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UDINT型の値をINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UDINT型の値をDINT型に変換します。
/// 例　(UDINT)0x00000000          0 → (DINT)0x00000000           0
///   　(UDINT)0x7FFFFFFF 2147483647 → (DINT)0x7FFFFFFF  2147483647
///     (UDINT)0x80000000 2147483648 → (DINT)0x80000000 -2147483648
///     (UDINT)0xFFFFFFFF 4294967925 → (DINT)0xFFFFFFFF          -1
/// </summary>
PLCPEN_API void UDINT_TO_DINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UDINT型の値をDINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UDINTの値をUSINT型に変換します。
/// 例　(UDINT)0x00000000          0  → (D_USINT)0x00	  0
///     (UDINT)0x00000001          1  → (D_USINT)0x01	  1
///     (UDINT)0x000000FF        255  → (D_USINT)0xFF	255
///     (UDINT)0x00000100        256  → (D_USINT)0x00	  0
///     (UDINT)0xFFFFFFFF 4294967925  → (D_USINT)0xFF	255
/// </summary>
PLCPEN_API void UDINT_TO_USINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UDINT型の値をUSINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_USINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUsint = *pin->IN->pUsint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UDINT型の値をUDINT型に変換します。
/// 例　(UDINT)0x00000000          0 → (UDINT)0x0000     0
///   　(UDINT)0x00007FFF      32767 → (UDINT)0x7FFF  32767
///     (UDINT)0x00008000      32768 → (UDINT)0x8000  32768
///     (UDINT)0x0000FFFF      65535 → (UDINT)0xFFFF  65535
///     (UDINT)0x00010000      65536 → (UDINT)0x0000      0
///     (UDINT)0xFFFFFFFF 4294967925 → (UDINT)0xFFFF  65535
/// </summary>
PLCPEN_API void UDINT_TO_UINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UDINT型の値をUINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_UINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUint = *pin->IN->pUint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UDINT型の値をREAL型に変換します。
/// 例　(UDINT)0x00000000           0  → (REAL)0.0000000E+000
///     (UDINT)0x00000001           1  → (REAL)1.0000000E+000
///     (UDINT)0x7FFFFFFF  2147483647  → (REAL)2.147483647E+009
///     (UDINT)0x80000000  2147483648  → (REAL)-1.0000000E+000
///     (UDINT)0xFFFFFFFF  4294967925  → (REAL)-2.147483648E+009
/// </summary>
PLCPEN_API void UDINT_TO_REAL_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UDINT型の値をREAL型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_REAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pReal = *pin->IN->pReal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UDINT型の値をLREAL型に変換します。
/// 例　(UDINT)0x00000000           0  → (LREAL)0.0000000E+000
///     (UDINT)0x00000001           1  → (LREAL)1.0000000E+000
///     (UDINT)0x7FFFFFFF  2147483647  → (LREAL)2.147483647E+009
///     (UDINT)0x80000000  2147483648  → (LREAL)-1.0000000E+000
///     (UDINT)0xFFFFFFFF  4294967925  → (LREAL)-2.147483648E+009
/// </summary>
PLCPEN_API void UDINT_TO_LREAL_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UDINT型の値をLREAL型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_LREAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLreal = *pin->IN->pLreal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UDINT型の値をLINT型に変換します。
/// 例　(UDINT)0x00000000           0 → (LINT)0x0000000000000000            0
///     (UDINT)0x00000001           1 → (LINT)0x0000000000000001            1
///     (UDINT)0x7FFFFFFF  2147483647 → (LINT)0x000000007FFFFFFF   2147483647
///     (UDINT)0x80000000  2147483648 → (LINT)0xFFFFFFFF80000000  -2147483648
///     (UDINT)0xFFFFFFFF  4294967925 → (LINT)0xFFFFFFFFFFFFFFFF           -1
/// </summary>
PLCPEN_API void UDINT_TO_LINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UDINT型の値をLINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UDINT_TO_LINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLint = *pin->IN->pLint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}