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
//　型変換 Bool型から～型へ
//-------------------------------------

/// <summary>
/// （型変換）BOOL型の値をBYTE型に変換します。
///   　(BOOL)0x00 FALSE → (BYTE)0x0000  0
///     (BOOL)0x01 TRUE  → (BYTE)0x0001  1
/// </summary>
PLCPEN_API void BOOL_TO_BYTE_EN(PVOID instance)
{
	struct BOOL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// BOOL型の値をBYTE型に変換した値
	} *pin = (struct BOOL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BOOL_TO_BYTE(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）BOOL型の値をWORD型に変換します。
///   　(BOOL)0x00 FALSE → (WORD)0x0000 0
///     (BOOL)0x01 TRUE  → (WORD)0x0001 1
/// </summary>
PLCPEN_API void BOOL_TO_WORD_EN(PVOID instance)
{
	struct BOOL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// BOOL型の値をWORD型に変換した値
	} *pin = (struct BOOL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BOOL_TO_WORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）BOOL型の値をDWORD型に変換します。
///   　(BOOL)0x00 FALSE → (DWORD)0x00000000  0
///     (BOOL)0x01 TRUE  → (DWORD)0x00000001  1
/// </summary>
PLCPEN_API void BOOL_TO_DWORD_EN(PVOID instance)
{
	struct BOOL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// BOOL型の値をDWORD型に変換した値
	} *pin = (struct BOOL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BOOL_TO_DWORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）BOOL型の値をSINT型に変換します。
///   　(BOOL)0x00 FALSE → (SINT)0x00 0
///     (BOOL)0x01 TRUE  → (SINT)0x01 1
/// </summary>
PLCPEN_API void BOOL_TO_SINT_EN(PVOID instance)
{
	struct BOOL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// BOOL型の値をSINT型に変換した値
	} *pin = (struct BOOL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BOOL_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）BOOL型の値をINT型に変換します。
///   　(BOOL)0x00 FALSE → (INT)0x0000  0
///     (BOOL)0x01 TRUE  → (INT)0x0001  1
/// </summary>
PLCPEN_API void BOOL_TO_INT_EN(PVOID instance)
{
	struct BOOL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// BOOL型の値をINT型に変換した値
	} *pin = (struct BOOL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BOOL_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）BOOL型の値をDINT型に変換します。
///   　(BOOL)0x00 FALSE → (DINT)0x00000000  0
///     (BOOL)0x01 TRUE  → (DINT)0x00000001  1
/// </summary>
PLCPEN_API void BOOL_TO_DINT_EN(PVOID instance)
{
	struct BOOL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// BOOL型の値をDINT型に変換した値
	} *pin = (struct BOOL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BOOL_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）BOOL型の値をUSINT型に変換します。
///   　(BOOL)0x00 FALSE → (USINT)0x00 0
///     (BOOL)0x01 TRUE  → (USINT)0x01 1
/// </summary>
PLCPEN_API void BOOL_TO_USINT_EN(PVOID instance)
{
	struct BOOL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// BOOL型の値をUSINT型に変換した値
	} *pin = (struct BOOL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BOOL_TO_USINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUsint = *pin->IN->pUsint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）BOOL型の値をUINT型に変換します。
///   　(BOOL)0x00 FALSE → (UINT)0x0000 0
///     (BOOL)0x01 TRUE  → (UINT)0x0001 1
/// </summary>
PLCPEN_API void BOOL_TO_UINT_EN(PVOID instance)
{
	struct BOOL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// BOOL型の値をUINT型に変換した値
	} *pin = (struct BOOL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BOOL_TO_UINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUint = *pin->IN->pUint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）BOOL型の値をUDINT型に変換します。
///   　(BOOL)0x00 FALSE → (UDINT)0x00000000 0
///     (BOOL)0x01 TRUE  → (UDINT)0x00000001 1
/// </summary>
PLCPEN_API void BOOL_TO_UDINT_EN(PVOID instance)
{
	struct BOOL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// BOOL型の値をUDINT型に変換した値
	} *pin = (struct BOOL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BOOL_TO_UDINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUdint = *pin->IN->pUdint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）BOOL型の値をREAL型に変換します。
///   　(BOOL)0x00 FALSE → (REAL)0.00000000
///     (BOOL)0x01 TRUE  → (REAL)1.00000000
/// </summary>
PLCPEN_API void BOOL_TO_REAL_EN(PVOID instance)
{
	struct BOOL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// BOOL型の値をREAL型に変換した値
	} *pin = (struct BOOL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BOOL_TO_REAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pReal = *pin->IN->pReal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）BOOL型の値をLREAL型に変換します。
///   　(BOOL)0x00 FALSE → (LREAL)0.00000000
///     (BOOL)0x01 TRUE  → (LREAL)1.00000000
/// </summary>
PLCPEN_API void BOOL_TO_LREAL_EN(PVOID instance)
{
	struct BOOL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// BOOL型の値をLREAL型に変換した値
	} *pin = (struct BOOL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BOOL_TO_LREAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLreal = *pin->IN->pLreal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）BOOL型の値をLINT型に変換します。
///   　(BOOL)0x00 FALSE → (LINT)0x0000000000000000  0
///     (BOOL)0x01 TRUE  → (LINT)0x0000000000000001  1
/// </summary>
PLCPEN_API void BOOL_TO_LINT_EN(PVOID instance)
{
	struct BOOL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// BOOL型の値をLINT型に変換した値
	} *pin = (struct BOOL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		BOOL_TO_LINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLint = *pin->IN->pLint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}