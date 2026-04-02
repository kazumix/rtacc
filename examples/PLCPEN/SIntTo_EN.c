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
//　型変換 SINT型から各型へ
//-------------------------------------

/// <summary>
/// （型変換）SINTの値をBOOL型に変換します。
/// 例　(SINT)0x00   0  → (D_BOOL)0x00	FALSE
///     (SINT)0x01   1  → (D_BOOL)0x01	TRUE
///     (SINT)0xFF  -1  → (D_BOOL)0x01	TRUE
/// </summary>
PLCPEN_API void SINT_TO_BOOL_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をBOOL型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_BOOL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pBool = *pin->IN->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）SINTの値をBYTE型に変換します。
/// 例　(SINT)0x00        0  → (D_BYTE)0x00
///     (SINT)0x01        1  → (D_BYTE)0x01
///     (SINT)0x7F      127  → (D_BYTE)0x7F
///     (SINT)0x80     -128  → (D_BYTE)0x7F
///     (SINT)0xFF       -1  → (D_BYTE)0xFF
/// </summary>
PLCPEN_API void SINT_TO_BYTE_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をBYTE型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_BYTE(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINT型の値をWORD型に変換します。
/// 例　(SINT)0x00    0 → (W_BCD)0x0000
///     (SINT)0x01    1 → (W_BCD)0x0001
///     (SINT)0x7F  127 → (W_BCD)0x007F
///     (SINT)0xFF   -1 → (W_BCD)0x00FF
///     (SINT)0x80 -128 → (W_BCD)0x0080
/// </summary>
PLCPEN_API void SINT_TO_WORD_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をWORD型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_WORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）SINT型の値をDWORD型に変換します。
/// 例　(SINT)0x00     0  → (DWORD)0x00000000
///     (SINT)0x01     1  → (DWORD)0x00000001
///     (SINT)0x7F   127  → (DWORD)0x0000007F
///     (SINT)0x80  -128  → (DWORD)0x00000080
///     (SINT)0xFF    -1  → (DWORD)0x000000FF
/// </summary>
PLCPEN_API void SINT_TO_DWORD_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をDWORD型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_DWORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）SINT型の値をINT型に変換します。
/// 例　(SINT)0x00     0  → (INT)0x0000      0
///     (SINT)0x00     1  → (INT)0x0001      1
///     (SINT)0x7F   127  → (INT)0x007F    127
///     (SINT)0x80  -128  → (INT)0xFF80   -128
///     (SINT)0xFF    -1  → (INT)0xFFFF     -1
/// </summary>
PLCPEN_API void SINT_TO_INT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）SINT型の値をDINT型に変換します。
/// 例　(SINT)0x00     0  → (DINT)0x00000000     0
///     (SINT)0x01     1  → (DINT)0x00000001     1
///     (SINT)0x7F   127  → (DINT)0x0000007F   127
///     (SINT)0xFF    -1  → (DINT)0xFFFFFFFF    -1
///     (SINT)0x80  -128  → (DINT)0xFFFFFF80  -128
/// </summary>
PLCPEN_API void SINT_TO_DINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をDINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）SINT型の値をUSINT型に変換します。
/// 例　(SINT)0x00     0  → (USINT)0x00    0
///     (SINT)0x01     1  → (USINT)0x01    1
///     (SINT)0x7F   127  → (USINT)0x7F  127
///     (SINT)0x80  -128  → (USINT)0x80  128
///     (SINT)0xFF    -1  → (USINT)0xFF  255
/// </summary>
PLCPEN_API void SINT_TO_USINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をUSINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_USINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUsint = *pin->IN->pUsint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）SINT型の値をUINT型に変換します。
/// 例　(SINT)0x00     0  → (UINT)0x0000    0
///     (SINT)0x01     1  → (UINT)0x0001    1
///     (SINT)0x7F   127  → (UINT)0x007F  127
///     (SINT)0x80  -128  → (UINT)0x0080  128
///     (SINT)0xFF    -1  → (UINT)0x00FF  255
/// </summary>
PLCPEN_API void SINT_TO_UINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をUINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_UINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUint = *pin->IN->pUint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）SINT型の値をUDINT型に変換します。
/// 例　(SINT)0x00     0  → (UDINT)0x00000000    0
///     (SINT)0x01     1  → (UDINT)0x00000001    1
///     (SINT)0x7F   127  → (UDINT)0x0000007F  127
///     (SINT)0x80  -128  → (UDINT)0x00000080 -128
///     (SINT)0xFF    -1  → (UDINT)0x000000FF  255
/// </summary>
PLCPEN_API void SINT_TO_UDINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をUDINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_UDINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUdint = *pin->IN->pUdint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）SINT型の値をREAL型に変換します。
/// 例　(SINT)0x00     0  → (REAL)   0.0
///     (SINT)0x00     1  → (REAL)   1.0
///     (SINT)0x7F   127  → (REAL) 127.0
///     (SINT)0xFF    -1  → (REAL)  -1.0
///     (SINT)0x80  -128  → (REAL)-128.0
/// </summary>
PLCPEN_API void SINT_TO_REAL_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をREAL型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_REAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pReal = *pin->IN->pReal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）SINT型の値をLREAL型に変換します。
/// 例　(SINT)0x00     0  → (LREAL)   0.0
///     (SINT)0x00     1  → (LREAL)   1.0
///     (SINT)0x7F   127  → (LREAL) 127.0
///     (SINT)0xFF    -1  → (LREAL)  -1.0
///     (SINT)0x80  -128  → (LREAL)-128.0
/// </summary>
PLCPEN_API void SINT_TO_LREAL_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をLREAL型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_LREAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLreal = *pin->IN->pLreal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）SINTの値をB_BCD型に変換します。
/// 例　(SINT)0x00   0 → (B_BCD)0x00
///     (SINT)0x01   1 → (B_BCD)0x01
///     (SINT)0x63  99 → (B_BCD)0x99
///     (SINT)0x64 100 → (B_BCD)0xFF
///     (SINT)0xFF  -1 → (B_BCD)0xFF
/// </summary>
PLCPEN_API void SINT_TO_B_BCD_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をB_BCD型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_B_BCD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINTの値をW_BCD型に変換します。
/// 例　(SINT)0x00    0 → (W_BCD)0x0000
///     (SINT)0x01    1 → (W_BCD)0x0001
///     (SINT)0x7F  127 → (W_BCD)0x0127
///     (SINT)0xFF   -1 → (W_BCD)0xFFFF
///     (SINT)0x80 -128 → (W_BCD)0xFFFF
/// </summary>
PLCPEN_API void SINT_TO_W_BCD_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をW_BCD型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_W_BCD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）SINTの値をD_BCD型に変換します。
/// 例　(SINT)0x00    0 → (D_BCD)0x00000000
///     (SINT)0x01    1 → (D_BCD)0x00000001
///     (SINT)0x7F  127 → (D_BCD)0x00000127
///     (SINT)0xFF   -1 → (D_BCD)0xFFFFFFFF
///     (SINT)0x80 -128 → (D_BCD)0xFFFFFFFF
/// </summary>
PLCPEN_API void SINT_TO_D_BCD_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をD_BCD型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_D_BCD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）SINT型の値をLINT型に変換します。
/// 例　(SINT)0x00     0  → (LINT)0x0000000000000000     0
///     (SINT)0x00     1  → (LINT)0x0000000000000001     1
///     (SINT)0x7F   127  → (LINT)0x000000000000007F   127
///     (SINT)0x80  -128  → (LINT)0xFFFFFFFFFFFFFF80  -128
///     (SINT)0xFF    -1  → (LINT)0xFFFFFFFFFFFFFFFF    -1
/// </summary>
PLCPEN_API void SINT_TO_LINT_EN(PVOID instance)
{
	struct SINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// SINT型の値をLINT型に変換した値
	} *pin = (struct SINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SINT_TO_LINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLint = *pin->IN->pLint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}