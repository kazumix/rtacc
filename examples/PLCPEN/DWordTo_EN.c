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
//　型変換 DWORD型から～型へ
//-------------------------------------

/// <summary>
/// （型変換）WORD型の値をBOOL型に変換します。
/// 例　(WORD)0x0000 → (BOOL)0x0000  FALSE
///     (WORD)0x0001 → (BOOL)0x0001  TRUE
///		(WORD)0xFFFF → (BOOL)0x0001  TRUE
/// </summary>
PLCPEN_API void DWORD_TO_BOOL_EN(PVOID instance)
{
	struct DWORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DWORD型の値をBOOL型に変換した値
	} *pin = (struct DWORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_BOOL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pBool = *pin->IN->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DWORDの値をBYTE型に変換します。
/// 例　(DWORD)0x00000000        0  → (D_BYTE)0x00	  0
///     (DWORD)0x00000001        1  → (D_BYTE)0x01	  1
///     (DWORD)0x000000FF      255  → (D_BYTE)0xFF	255
///     (DWORD)0x00000100      256  → (D_BYTE)0x00	  0
///     (DWORD)0xFFFFFFFF       -1  → (D_BYTE)0xFF	255
/// </summary>
PLCPEN_API void DWORD_TO_BYTE_EN(PVOID instance)
{
	struct DWORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DWORD型の値をBYTE型に変換した値
	} *pin = (struct DWORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_BYTE(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DWORD型の値をWORD型に変換します。
/// 例　(DWORD)0x00000000 → (WORD)0x0000
///   　(DWORD)0x00007FFF → (WORD)0x7FFF
///     (DWORD)0x00008000 → (WORD)0x8000
///     (DWORD)0x0000FFFF → (WORD)0xFFFF
///     (DWORD)0x00010000 → (WORD)0x0000
///     (DWORD)0xFFFFFFFF → (WORD)0xFFFF
/// </summary>
PLCPEN_API void DWORD_TO_WORD_EN(PVOID instance)
{
	struct DWORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DWORD型の値をWORD型に変換した値
	} *pin = (struct DWORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_WORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DWORD型の値をSINT型に変換します。
/// 例　(DWORD)0x00000000 → (SINT)0x00      0
///   　(DWORD)0x0000007F → (SINT)0x7F    127
///     (DWORD)0x00000080 → (SINT)0x80   -128
///     (DWORD)0x000000FF → (SINT)0xFF     -1
///     (DWORD)0x00000100 → (SINT)0x00      0
///     (DWORD)0xFFFFFFFF → (SINT)0xFF     -1
/// </summary>
PLCPEN_API void DWORD_TO_SINT_EN(PVOID instance)
{
	struct DWORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DWORD型の値をSINT型に変換した値
	} *pin = (struct DWORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DWORD型の値をINT型に変換します。
/// 例　(DWORD)0x00000000 → (INT)0x0000     0
///   　(DWORD)0x00007FFF → (INT)0x7FFF  32767
///     (DWORD)0x00008000 → (INT)0x8000 -32768
///     (DWORD)0x0000FFFF → (INT)0xFFFF     -1
///     (DWORD)0x00010000 → (INT)0x0000      0
///     (DWORD)0xFFFFFFFF → (INT)0xFFFF     -1
/// </summary>
PLCPEN_API void DWORD_TO_INT_EN(PVOID instance)
{
	struct DWORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DWORD型の値をINT型に変換した値
	} *pin = (struct DWORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DWORD型の値をDINT型に変換します。
/// 例　(DWORD)0x00000000 → (DINT)0x00000000           0
///   　(DWORD)0x7FFFFFFF → (DINT)0x7FFFFFFF  2147483647
///     (DWORD)0x80000000 → (DINT)0x80000000 -2147483648
///     (DWORD)0xFFFFFFFF → (DINT)0xFFFFFFFF          -1
/// </summary>
PLCPEN_API void DWORD_TO_DINT_EN(PVOID instance)
{
	struct DWORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DWORD型の値をDINT型に変換した値
	} *pin = (struct DWORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DWORDの値をUSINT型に変換します。
/// 例　(DWORD)0x00000000        0  → (D_USINT)0x00	  0
///     (DWORD)0x00000001        1  → (D_USINT)0x01	  1
///     (DWORD)0x000000FF      255  → (D_USINT)0xFF	255
///     (DWORD)0x00000100      256  → (D_USINT)0x00	  0
///     (DWORD)0xFFFFFFFF       -1  → (D_USINT)0xFF	255
/// </summary>
PLCPEN_API void DWORD_TO_USINT_EN(PVOID instance)
{
	struct DWORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DWORD型の値をUSINT型に変換した値
	} *pin = (struct DWORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_USINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUsint = *pin->IN->pUsint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DWORD型の値をUINT型に変換します。
/// 例　(DWORD)0x00000000 → (UINT)0x0000     0
///   　(DWORD)0x00007FFF → (UINT)0x7FFF  32767
///     (DWORD)0x00008000 → (UINT)0x8000  32768
///     (DWORD)0x0000FFFF → (UINT)0xFFFF  65535
///     (DWORD)0x00010000 → (UINT)0x0000      0
///     (DWORD)0xFFFFFFFF → (UINT)0xFFFF  65535
/// </summary>
PLCPEN_API void DWORD_TO_UINT_EN(PVOID instance)
{
	struct DWORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DWORD型の値をUINT型に変換した値
	} *pin = (struct DWORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_UINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUint = *pin->IN->pUint;	
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
	/// <summary>
/// （型変換）DWORD型の値をUDINT型に変換します。
/// 例　(DWORD)0x00000000 → (UDINT)0x00000000           0
///   　(DWORD)0x7FFFFFFF → (UDINT)0x7FFFFFFF  2147483647
///     (DWORD)0x80000000 → (UDINT)0x80000000  2147483648
///     (DWORD)0xFFFFFFFF → (UDINT)0xFFFFFFFF  4294967925
/// </summary>
PLCPEN_API void DWORD_TO_UDINT_EN(PVOID instance)
{
	struct DWORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DWORD型の値をUDINT型に変換した値
	} *pin = (struct DWORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_UDINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUdint = *pin->IN->pUdint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DWORD型の値をLREAL型に変換します。
/// 例　(DWORD)0x00000000  → (LREAL)0.0000000E+000
///     (DWORD)0x00000001  → (LREAL)1.0000000E+000
///     (DWORD)0x7FFFFFFF  → (LREAL)2.147483647E+009
///     (DWORD)0xFFFFFFFF  → (LREAL)-1.0000000E+000
///     (DWORD)0x80000000  → (LREAL)-2.147483648E+009
/// </summary>
PLCPEN_API void DWORD_TO_LREAL_EN(PVOID instance)
{
	struct DWORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DWORD型の値をLREAL型に変換した値
	} *pin = (struct DWORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_LREAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLreal = *pin->IN->pLreal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DWORD型の値をLINT型に変換します。
/// 例　(DWORD)0x00000000    → (LINT)0x0000000000000000            0
///     (DWORD)0x00000001    → (LINT)0x0000000000000001            1
///     (DWORD)0x7FFFFFFF    → (LINT)0x000000007FFFFFFF   2147483647
///     (DWORD)0xFFFFFFFF    → (LINT)0xFFFFFFFFFFFFFFFF           -1
///     (DWORD)0x80000000    → (LINT)0xFFFFFFFF80000000  -2147483648
/// </summary>
PLCPEN_API void DWORD_TO_LINT_EN(PVOID instance)
{
	struct DWORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DWORD型の値をLINT型に変換した値
	} *pin = (struct DWORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_LINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLint = *pin->IN->pLint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/// <summary>
/// （型変換）DWORD型の値をREAL型に変換します。
/// 例　(DWORD)0x00000000  → (REAL)0.0000000E+000
///     (DWORD)0x00000001  → (REAL)1.0000000E+000
///     (DWORD)0x7FFFFFFF  → (REAL)2.147483647E+009
///     (DWORD)0xFFFFFFFF  → (REAL)-1.0000000E+000
///     (DWORD)0x80000000  → (REAL)-2.147483648E+009
/// </summary>
PLCPEN_API void DWORD_TO_REAL_EN(PVOID instance)
{
	struct DWORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DWORD型の値をREAL型に変換した値
	} *pin = (struct DWORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DWORD_TO_REAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pReal = *pin->IN->pReal;
		pin->ENO = GetDWordToEno();	// DWORD_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}