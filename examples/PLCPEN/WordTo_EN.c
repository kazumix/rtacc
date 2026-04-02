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
//　型変換 WORD型から～型へ
//-------------------------------------

/// <summary>
/// （型変換）WORD型の値をBOOL型に変換します。
/// 例　(WORD)0x0000 → (BOOL)0x0000  FALSE
///     (WORD)0x0001 → (BOOL)0x0001  TRUE
///		(WORD)0xFFFF → (BOOL)0x0001  TRUE
/// </summary>
PLCPEN_API void WORD_TO_BOOL_EN(PVOID instance)
{
	struct WORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// WORD型の値をBOOL型に変換した値
	} *pin = (struct WORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_BOOL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pBool = *pin->IN->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）WORDの値をBYTE型に変換します。
/// 例　(WORD)0x0000 → (D_BYTE)0x00	  0
///     (WORD)0x0001 → (D_BYTE)0x01	  1
///     (WORD)0x00FF → (D_BYTE)0xFF	255
///     (WORD)0x0100 → (D_BYTE)0x00	  0
///     (WORD)0xFFFF → (D_BYTE)0xFF	255
/// </summary>
PLCPEN_API void WORD_TO_BYTE_EN(PVOID instance)
{
	struct WORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// WORD型の値をBYTE型に変換した値
	} *pin = (struct WORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_BYTE(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）WORD型の値をDWORD型に変換します。
/// 例　(WORD)0x0000  → (DWORD)0x00000000
///     (WORD)0x0001  → (DWORD)0x00000001
///     (WORD)0x7FFF  → (DWORD)0x00007FFF
///     (WORD)0x8000  → (DWORD)0x00008000
///     (WORD)0xFFFF  → (DWORD)0x0000FFFF
/// </summary>
PLCPEN_API void WORD_TO_DWORD_EN(PVOID instance)
{
	struct WORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// WORD型の値をDWORD型に変換した値
	} *pin = (struct WORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_DWORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）WORD型の値をSINT型に変換します。
/// 例　(WORD)0x0000 → (SINT)0x00      0
///   　(WORD)0x007F → (SINT)0x7F    127
///     (WORD)0x0080 → (SINT)0x80   -128
///     (WORD)0x00FF → (SINT)0xFF     -1
///     (WORD)0x0100 → (SINT)0x00      0
///     (WORD)0xFFFF → (SINT)0xFF     -1
/// </summary>
PLCPEN_API void WORD_TO_SINT_EN(PVOID instance)
{
	struct WORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// WORD型の値をSINT型に変換した値
	} *pin = (struct WORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）WORD型の値をINT型に変換します。
/// 例　(WORD)0x0000 → (INT)0x0000     0
///   　(WORD)0x7FFF → (INT)0x7FFF  32767
///     (WORD)0x8000 → (INT)0x8000 -32768
///     (WORD)0xFFFF → (INT)0xFFFF     -1
/// </summary>
PLCPEN_API void WORD_TO_INT_EN(PVOID instance)
{
	struct WORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// WORD型の値をINT型に変換した値
	} *pin = (struct WORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）WORD型の値をDINT型に変換します。
/// 例　(WORD)0x0000 → (DINT)0x00000000      0
///   　(WORD)0x7FFF → (DINT)0x00007FFF  32767
///     (WORD)0x8000 → (DINT)0xFFFF8000 -32768
///     (WORD)0xFFFF → (DINT)0xFFFFFFFF     -1
/// </summary>
PLCPEN_API void WORD_TO_DINT_EN(PVOID instance)
{
	struct WORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// WORD型の値をDINT型に変換した値
	} *pin = (struct WORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）WORD型の値をREAL型に変換します。
/// 例　(WORD)0x0000 → (REAL)     0.0
///     (WORD)0x0001 → (REAL)     1.0
///     (WORD)0x7FFF → (REAL) 32767.0
///     (WORD)0x8000 → (REAL)-32768.0
///     (WORD)0xFFFF → (REAL)    -1.0
/// </summary>
PLCPEN_API void WORD_TO_REAL_EN(PVOID instance)
{
	struct WORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// WORD型の値をREAL型に変換した値
	} *pin = (struct WORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_REAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pReal = *pin->IN->pReal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）WORD型の値をLREAL型に変換します。
/// 例　(WORD)0x0000 → (LREAL)     0.0
///     (WORD)0x0001 → (LREAL)     1.0
///     (WORD)0x7FFF → (LREAL) 32767.0
///     (WORD)0x8000 → (LREAL)-32768.0
///     (WORD)0xFFFF → (LREAL)    -1.0
/// </summary>
PLCPEN_API void WORD_TO_LREAL_EN(PVOID instance)
{
	struct WORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// WORD型の値をLREAL型に変換した値
	} *pin = (struct WORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_LREAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLreal = *pin->IN->pLreal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）WORDの値をUSINT型に変換します。
/// 例　(WORD)0x0000     0  → (USINT)0x00	  0
///     (WORD)0x0001     1  → (USINT)0x01	  1
///     (WORD)0x00FF   255  → (USINT)0xFF	255
///     (WORD)0x0100   256  → (USINT)0x00	  0
///     (WORD)0xFFFF 65535  → (USINT)0xFF	255
/// </summary>
PLCPEN_API void WORD_TO_USINT_EN(PVOID instance)
{
	struct WORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// WORD型の値をUSINT型に変換した値
	} *pin = (struct WORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_USINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUsint = *pin->IN->pUsint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）WORD型の値をUINT型に変換します。
/// 例　(WORD)0x0000  → (UINT)0x0000      0
///   　(WORD)0x7FFF  → (UINT)0x7FFF  32767
///     (WORD)0x8000  → (UINT)0x8000  32768
///     (WORD)0xFFFF  → (UINT)0xFFFF  65535
/// </summary>
PLCPEN_API void WORD_TO_UINT_EN(PVOID instance)
{
	struct WORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// WORD型の値をUINT型に変換した値
	} *pin = (struct WORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_UINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUint = *pin->IN->pUint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）WORD型の値をUDINT型に変換します。
/// 例　(WORD)0x0000 → (UDINT)0x00000000     0
///     (WORD)0x0001 → (UDINT)0x00000001     1
///     (WORD)0x7FFF → (UDINT)0x00007FFF 32767
///     (WORD)0x8000 → (UDINT)0x00008000 32768
///     (WORD)0xFFFF → (UDINT)0x0000FFFF 65535
/// </summary>
PLCPEN_API void WORD_TO_UDINT_EN(PVOID instance)
{
	struct WORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// WORD型の値をUDINT型に変換した値
	} *pin = (struct WORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_UDINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUdint = *pin->IN->pUdint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）WORD型の値をLINT型に変換します。
/// 例　(WORD)0x0000 → (LINT)0x0000000000000000       0
///     (WORD)0x0001 → (LINT)0x0000000000000001       1
///     (WORD)0x7FFF → (LINT)0x0000000000007FFF   32767
///     (WORD)0x8000 → (LINT)0xFFFFFFFFFFFF8000  -32768
///     (WORD)0xFFFF → (LINT)0xFFFFFFFFFFFFFFFF      -1
/// </summary>
PLCPEN_API void WORD_TO_LINT_EN(PVOID instance)
{
	struct WORD_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// WORD型の値をLINT型に変換した値
	} *pin = (struct WORD_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		WORD_TO_LINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLint = *pin->IN->pLint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}