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
//　型変換 USINT型から各型へ
//-------------------------------------

/// <summary>
/// （型変換）USINT型の値をBOOL型に変換します。
/// 例　(USINT)0x00   0 → (BOOL)0x0000  FALSE
///     (USINT)0x01   1 → (BOOL)0x0001  TRUE
///		(USINT)0xFF 255 → (BOOL)0x0001  TRUE
/// </summary>
PLCPEN_API void USINT_TO_BOOL_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// USINT型の値をBOOL型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_BOOL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pBool = *pin->IN->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）USINTの値をBYTE型に変換します。
/// 例　(UDINT)0x00     0  → (D_BYTE)0x00	  0
///     (UDINT)0x01     1  → (D_BYTE)0x01	  1
///     (UDINT)0xFF   255  → (D_BYTE)0xFF	255
/// </summary>
PLCPEN_API void USINT_TO_BYTE_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// USINT型の値をBYTE型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_BYTE(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）USINT型の値をWORD型に変換します。
/// 例　(USINT)0x00   0 → (WORD)0x0000
///   　(USINT)0x7F 127 → (WORD)0x007F
///     (USINT)0x80 128 → (WORD)0x0080
///     (USINT)0xFF 255 → (WORD)0x00FF
/// </summary>
PLCPEN_API void USINT_TO_WORD_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// USINT型の値をWORD型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_WORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）USINT型の値をDWORD型に変換します。
/// 例　(USINT)0x00    0  → (DWORD)0x00000000
///     (USINT)0x01    1  → (DWORD)0x00000001
///     (USINT)0x7F  127  → (DWORD)0x0000007F
///     (USINT)0x80  128  → (DWORD)0x00000080
///     (USINT)0xFF  255  → (DWORD)0x000000FF
/// </summary>
PLCPEN_API void USINT_TO_DWORD_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// USINT型の値をDWORD型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_DWORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）USINT型の値をSINT型に変換します。
/// 例　(USINT)0x00     0 → (SINT)0x00      0
///   　(USINT)0x7F   127 → (SINT)0x7F    127
///     (USINT)0x80   128 → (SINT)0x80   -128
///     (USINT)0xFF   255 → (SINT)0xFF     -1
/// </summary>
PLCPEN_API void USINT_TO_SINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// USINT型の値をSINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）USINT型の値をINT型に変換します。
/// 例　(USINT)0x00    0 → (INT)0x0000    0
///   　(USINT)0x7F  127 → (INT)0x007F  127
///     (USINT)0x80  128 → (INT)0xFF80 -128
///     (USINT)0xFF  255 → (INT)0xFFFF   -1
/// </summary>
PLCPEN_API void USINT_TO_INT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// USINT型の値をINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）USINT型の値をDINT型に変換します。
/// 例　(USINT)0x00   0 → (DINT)0x00000000    0
///   　(USINT)0x7F 127 → (DINT)0x0000007F  127
///     (USINT)0x80 128 → (DINT)0xFFFFFF80 -128
///     (USINT)0xFF 255 → (DINT)0xFFFFFFFF   -1
/// </summary>
PLCPEN_API void USINT_TO_DINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// USINT型の値をDINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）USINT型の値をUINT型に変換します。
/// 例　(USINT)0x00   0 → (UINT)0x0000    0
///   　(USINT)0x7F 127 → (UINT)0x007F  127
///     (USINT)0x80 128 → (UINT)0x0080  128
///     (USINT)0xFF 255 → (UINT)0x00FF  255
/// </summary>
PLCPEN_API void USINT_TO_UINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// USINT型の値をUINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_UINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUint = *pin->IN->pUint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）USINT型の値をUDINT型に変換します。
/// 例　(USINT)0x00    0  → (UDINT)0x00000000   0
///     (USINT)0x00    1  → (UDINT)0x00000000   1
///     (USINT)0x7F  127  → (UDINT)0x0000007F 127
///     (USINT)0x80  128  → (UDINT)0x00000080 128
///     (USINT)0xFF  255  → (UDINT)0x000000FF 255
/// </summary>
PLCPEN_API void USINT_TO_UDINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// USINT型の値をUDINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_UDINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUdint = *pin->IN->pUdint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）USINT型の値をREAL型に変換します。
/// 例　(USINT)0x00   0  → (REAL)   0.0
///     (USINT)0x01   1  → (REAL)   1.0
///     (USINT)0x7F 127  → (REAL) 127.0
///     (USINT)0x80 128  → (REAL)-128.0
///     (USINT)0xFF 255  → (REAL)  -1.0
/// </summary>
PLCPEN_API void USINT_TO_REAL_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// USINT型の値をREAL型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_REAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pReal = *pin->IN->pReal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）USINT型の値をLREAL型に変換します。
/// 例　(USINT)0x00   0  → (LREAL)    0.0
///     (USINT)0x01   1  → (LREAL)    1.0
///     (USINT)0x7F 127  → (LREAL)  127.0
///     (USINT)0x80 128  → (LREAL) -128.0
///     (USINT)0xFF 255  → (LREAL)   -1.0
/// </summary>
PLCPEN_API void USINT_TO_LREAL_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// USINT型の値をLREAL型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_LREAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLreal = *pin->IN->pLreal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）USINT型の値をLINT型に変換します。
/// 例　(USINT)0x00    0 → (LINT)0x0000000000000000     0
///     (USINT)0x00    1 → (LINT)0x0000010000000000     1
///     (USINT)0x7F  127 → (LINT)0x000000000000007F   127
///     (USINT)0x80  128 → (LINT)0xFFFFFFFFFFFFFF80  -128
///     (USINT)0xFF  255 → (LINT)0xFFFFFFFFFFFFFFFF    -1
/// </summary>
PLCPEN_API void USINT_TO_LINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// USINT型の値をLINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		USINT_TO_LINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLint = *pin->IN->pLint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}