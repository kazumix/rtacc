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
//　型変換 UINT型から各型へ
//-------------------------------------

/// <summary>
/// （型変換）UINT型の値をBOOL型に変換します。
/// 例　(UINT)0x0000     0 → (BOOL)0x0000  FALSE
///     (UINT)0x0001     1 → (BOOL)0x0001  TRUE
///		(UINT)0xFFFF 65535 → (BOOL)0x0001  TRUE
/// </summary>
PLCPEN_API void UINT_TO_BOOL_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UINT型の値をBOOL型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_BOOL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pBool = *pin->IN->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UINTの値をBYTE型に変換します。
/// 例　(UINT)0x0000     0  → (D_BYTE)0x00	  0
///     (UINT)0x0001     1  → (D_BYTE)0x01	  1
///     (UINT)0x00FF   255  → (D_BYTE)0xFF	255
///     (UINT)0x0100   256  → (D_BYTE)0x00	  0
///     (UINT)0xFFFF 65535  → (D_BYTE)0xFF	255
/// </summary>
PLCPEN_API void UINT_TO_BYTE_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UINT型の値をBYTE型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_BYTE(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UINT型の値をWORD型に変換します。
/// 例　(UINT)0x0000     0 → (WORD)0x0000
///   　(UINT)0x7FFF 32767 → (WORD)0x7FFF
///     (UINT)0x8000 32768 → (WORD)0x8000
///     (UINT)0xFFFF 65535 → (WORD)0xFFFF
/// </summary>
PLCPEN_API void UINT_TO_WORD_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UINT型の値をWORD型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_WORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UINT型の値をDWORD型に変換します。
/// 例　(UINT)0x0000      0  → (DWORD)0x00000000
///     (UINT)0x0001      1  → (DWORD)0x00000001
///     (UINT)0x7FFF  32767  → (DWORD)0x00007FFF
///     (UINT)0x8000  32768  → (DWORD)0x00008000
///     (UINT)0xFFFF  65535  → (DWORD)0x0000FFFF
/// </summary>
PLCPEN_API void UINT_TO_DWORD_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UINT型の値をDWORD型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_DWORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UINT型の値をSINT型に変換します。
/// 例　(UINT)0x0000     0 → (SINT)0x00      0
///   　(UINT)0x007F   127 → (SINT)0x7F    127
///     (UINT)0x0080  -128 → (SINT)0x80   -128
///     (UINT)0x00FF   255 → (SINT)0xFF     -1
///     (UINT)0x0100   256 → (SINT)0x00      0
///     (UINT)0xFFFF 65535 → (SINT)0xFF     -1
/// </summary>
PLCPEN_API void UINT_TO_SINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UINT型の値をSINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UINT型の値をINT型に変換します。
/// 例　(UINT)0x0000          0 → (INT)0x0000     0
///   　(UINT)0x7FFF      32767 → (INT)0x7FFF  32767
///     (UINT)0x8000      32768 → (INT)0x8000 -32768
///     (UINT)0xFFFF      65535 → (INT)0xFFFF     -1
/// </summary>
PLCPEN_API void UINT_TO_INT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UINT型の値をINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UINT型の値をDINT型に変換します。
/// 例　(UINT)0x0000     0 → (DINT)0x00000000      0
///   　(UINT)0x7FFF 32767 → (DINT)0x00007FFF  32767
///     (UINT)0x8000 32768 → (DINT)0xFFFF8000 -32768
///     (UINT)0xFFFF 65535 → (DINT)0xFFFFFFFF     -1
/// </summary>
PLCPEN_API void UINT_TO_DINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UINT型の値をDINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UINTの値をUSINT型に変換します。
/// 例　(UINT)0x0000     0  → (USINT)0x00	  0
///     (UINT)0x0001     1  → (USINT)0x01	  1
///     (UINT)0x00FF   255  → (USINT)0xFF	255
///     (UINT)0x0100   256  → (USINT)0x00	  0
///     (UINT)0xFFFF 65535  → (USINT)0xFF	255
/// </summary>
PLCPEN_API void UINT_TO_USINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UINT型の値をUSINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_USINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUsint = *pin->IN->pUsint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UINT型の値をUDINT型に変換します。
/// 例　(UINT)0x0000      0  → (UDINT)0x00000000     0
///     (UINT)0x0001      1  → (UDINT)0x00000001     1
///     (UINT)0x7FFF  32767  → (UDINT)0x00007FFF 32767
///     (UINT)0x8000  32768  → (UDINT)0x00008000 32768
///     (UINT)0xFFFF  65535  → (UDINT)0x0000FFFF 65535
/// </summary>
PLCPEN_API void UINT_TO_UDINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UINT型の値をUDINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_UDINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUdint = *pin->IN->pUdint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UINT型の値をREAL型に変換します。
/// 例　(USINT)0x0000      0  → (REAL)     0.0
///     (USINT)0x0001      1  → (REAL)     1.0
///     (USINT)0x7FFF  32767  → (REAL) 32767.0
///     (USINT)0x8000  32768  → (REAL)-32768.0
///     (USINT)0xFFFF  65535  → (REAL)    -1.0
/// </summary>
PLCPEN_API void UINT_TO_REAL_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UINT型の値をREAL型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_REAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pReal = *pin->IN->pReal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UINT型の値をLREAL型に変換します。
/// 例　(UINT)0x0000      0  → (LREAL)     0.0
///     (UINT)0x0001      1  → (LREAL)     1.0
///     (UINT)0x7FFF  32767  → (LREAL) 32767.0
///     (UINT)0x8000  32768  → (LREAL)-32768.0
///     (UINT)0xFFFF  65535  → (LREAL)    -1.0
/// </summary>
PLCPEN_API void UINT_TO_LREAL_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UINT型の値をLREAL型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_LREAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLreal = *pin->IN->pLreal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）UINT型の値をLINT型に変換します。
/// 例　(UINT)0x0000      0 → (LINT)0x0000000000000000       0
///     (UINT)0x0001      1 → (LINT)0x0000000000000001       1
///     (UINT)0x7FFF  32767 → (LINT)0x0000000000007FFF   32767
///     (UINT)0x8000  32768 → (LINT)0xFFFFFFFFFFFF8000  -32768
///     (UINT)0xFFFF  65535 → (LINT)0xFFFFFFFFFFFFFFFF      -1
/// </summary>
PLCPEN_API void UINT_TO_LINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// UINT型の値をLINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		UINT_TO_LINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLint = *pin->IN->pLint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}