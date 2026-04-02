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
//　型変換 LINT型から～型へ
//-------------------------------------

/// <summary>
/// （型変換）LINTの値をBOOL型に変換します。
/// 例　(LINT)0x0000000000000000        0  → (D_BOOL)0x00	FALSE
///     (LINT)0x0000000000000001        1  → (D_BOOL)0x01	TRUE
///     (LINT)0xFFFFFFFFFFFFFFFF        -1 → (D_BOOL)0x01	TRUE
/// </summary>
PLCPEN_API void LINT_TO_BOOL_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をBOOL型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_BOOL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pBool = *pin->IN->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINTの値をBYTE型に変換します。
/// 例　(LINT)0x0000000000000000        0  → (D_BYTE)0x00	  0
///     (LINT)0x0000000000000001        1  → (D_BYTE)0x01	  1
///     (LINT)0x00000000000000FF      255  → (D_BYTE)0xFF	255
///     (LINT)0x0000000000000100      256  → (D_BYTE)0x00	  0
///     (LINT)0xFFFFFFFFFFFFFFFF       -1  → (D_BYTE)0xFF	255
/// </summary>
PLCPEN_API void LINT_TO_BYTE_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をBYTE型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_BYTE(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINT型の値をWORD型に変換します。
/// 例　(LINT)0x0000000000000000            0  → (WORD)0x0000
///     (LINT)0x0000000000000001            1  → (WORD)0x0001
///     (LINT)0x000000000000FFFF        65535  → (WORD)0xFFFF
///     (LINT)0x0000000000010000        65536  → (WORD)0x0000
///     (LINT)0xFFFFFFFFFFFFFFFF           -1  → (WORD)0xFFFF
/// </summary>
PLCPEN_API void LINT_TO_WORD_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をWORD型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_WORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINT型の値をDWORD型に変換します。
/// 例　(LINT)0x0000000000000000            0  → (DWORD)0x00000000
///     (LINT)0x0000000000000001            1  → (DWORD)0x00000001
///     (LINT)0x000000007FFFFFFF   2147483647  → (DWORD)0x7FFFFFFF
///     (LINT)0x0000000080000000   2147483648  → (DWORD)0x80000000
///     (LINT)0x00000000FFFFFFFF   4294967295  → (DWORD)0xFFFFFFFF
///     (LINT)0x0000000100000000   4294967296  → (DWORD)0x00000000
///     (LINT)0xFFFFFFFFFFFFFFFF           -1  → (DWORD)0xFFFFFFFF
/// </summary>
PLCPEN_API void LINT_TO_DWORD_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をDWORD型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_DWORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINT型の値をSINT型に変換します。
/// 例　(LINT)0x0000000000000000                     0  → (SINT)0x00      0
///     (LINT)0x0000000000000001                     1  → (SINT)0x00      1
///     (LINT)0x000000000000007F                   127  → (SINT)0x7F    127
///     (LINT)0x0000000000000080                   128  → (SINT)0x80   -128
///     (LINT)0x00000000000000FF                   255  → (SINT)0xFF     -1
///     (LINT)0x0000000000000100                   256  → (SINT)0x00      0
///     (LINT)0x7FFFFFFFFFFFFFFF   9223372036854775807  → (SINT)0xFF     -1
///     (LINT)0xFFFFFFFFFFFFFFFF                    -1  → (SINT)0xFF     -1
///     (LINT)0x8000000000000000  -9223372036854775808  → (SINT)0x00      0
/// </summary>
PLCPEN_API void LINT_TO_SINT_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をSINT型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINT型の値をINT型に変換します。
/// 例　(LINT)0x0000000000000000            0  → (INT)0x0000      0
///     (LINT)0x0000000000000001            1  → (INT)0x0001      1
///     (LINT)0x0000000000007FFF        32767  → (INT)0x7FFF  32767
///     (LINT)0x0000000000008000        32768  → (INT)0x8000 -32768
///     (LINT)0x000000000000FFFF        65535  → (INT)0xFFFF     -1
///     (LINT)0x0000000000010000        65536  → (INT)0x0000      0
///     (LINT)0xFFFFFFFFFFFFFFFF           -1  → (INT)0xFFFF     -1
/// </summary>
PLCPEN_API void LINT_TO_INT_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をINT型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINT型の値をUSINT型に変換します。
/// 例　(LINT)0x0000000000000000                     0  → (USINT)0x00      0
///     (LINT)0x0000000000000001                     1  → (USINT)0x00      1
///     (LINT)0x000000000000007F                   127  → (USINT)0x7F    127
///     (LINT)0x0000000000000080                   128  → (USINT)0x80    128
///     (LINT)0x00000000000000FF                   255  → (USINT)0xFF    255
///     (LINT)0x0000000000000100                   256  → (USINT)0x00      0
///     (LINT)0x7FFFFFFFFFFFFFFF   9223372036854775807  → (USINT)0xFF    255
///     (LINT)0xFFFFFFFFFFFFFFFF                    -1  → (USINT)0xFF    255
///     (LINT)0x8000000000000000  -9223372036854775808  → (USINT)0x00      0
/// </summary>
PLCPEN_API void LINT_TO_USINT_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をUSINT型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_USINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUsint = *pin->IN->pUsint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINT型の値をUINT型に変換します。
/// 例　(LINT)0x0000000000000000            0  → (UINT)0x0000     0
///     (LINT)0x0000000000000001            1  → (UINT)0x0001     1
///     (LINT)0x0000000000008000        32767  → (UINT)0x8000 32767
///     (LINT)0x000000000000FFFF        65535  → (UINT)0xFFFF 65535
///     (LINT)0x0000000000010000        65536  → (UINT)0x0000     0
///     (LINT)0xFFFFFFFFFFFFFFFF           -1  → (UINT)0xFFFF 65535
/// </summary>
PLCPEN_API void LINT_TO_UINT_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をUINT型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_UINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUint = *pin->IN->pUint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINT型の値をUDINT型に変換します。
/// 例　(LINT)0x0000000000000000            0  → (UDINT)0x00000000          0
///     (LINT)0x0000000000000001            1  → (UDINT)0x00000001          1
///     (LINT)0x000000007FFFFFFF   2147483647  → (UDINT)0x7FFFFFFF 2147483647
///     (LINT)0x0000000080000000   2147483648  → (UDINT)0x80000000 2147483648
///     (LINT)0x00000000FFFFFFFF   4294967925  → (UDINT)0xFFFFFFFF 4294967925
///     (LINT)0x0000000100000000   4294967926  → (UDINT)0x00000000          0
///     (LINT)0xFFFFFFFFFFFFFFFF           -1  → (UDINT)0xFFFFFFFF 4294967925
/// </summary>
PLCPEN_API void LINT_TO_UDINT_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をUDINT型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_UDINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUdint = *pin->IN->pUdint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINTの値をB_BCD型に変換します。
/// 例　(LINT)0x0000000000000000   0 → (B_BCD)0x00
///     (LINT)0x0000000000000001   1 → (B_BCD)0x01
///     (LINT)0x0000000000000063  99 → (B_BCD)0x99
///     (LINT)0x0000000000000064 100 → (B_BCD)0xFF
///     (LINT)0xFFFFFFFFFFFFFFFF  -1 → (B_BCD)0xFF
/// </summary>
PLCPEN_API void LINT_TO_B_BCD_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をB_BCD型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_B_BCD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINTの値をW_BCD型に変換します。
/// 例　(LINT)0x0000000000000000        0  → (W_BCD)0x0000
///     (LINT)0x0000000000000001        1  → (W_BCD)0x0001
///     (LINT)0x000000000000270F     9999  → (W_BCD)0x9999
///     (LINT)0x0000000000002710    10000  → (W_BCD)0xFFFF
///     (LINT)0xFFFFFFFFFFFFFFFF       -1  → (W_BCD)0xFFFF
/// </summary>
PLCPEN_API void LINT_TO_W_BCD_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をW_BCD型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_W_BCD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINTの値をD_BCD型に変換します。
/// 例　(LINT)0x0000000000000000         0 → (D_BCD)0x00000000
///     (LINT)0x0000000000000001         1 → (D_BCD)0x00000001
///     (LINT)0x0000000005F5E0FF  99999999 → (D_BCD)0x99999999
///     (LINT)0x0000000005F5E100 100000000 → (D_BCD)0xFFFFFFFF
///     (LINT)0xFFFFFFFFFFFFFFFF        -1 → (D_BCD)0xFFFFFFFF
/// </summary>
PLCPEN_API void LINT_TO_D_BCD_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をW_BCD型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_D_BCD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）LINT型の値をDINT型に変換します。
/// 例　(LINT)0x0000000000000000            0  → (DINT)0x00000000            0
///     (LINT)0x0000000000000001            1  → (DINT)0x00000001            1
///     (LINT)0x000000007FFFFFFF   2147483647  → (DINT)0x00007FFF   2147483647
///     (LINT)0x0000000080000000   2147483648  → (DINT)0xFFFF8000  -2147483648
///     (LINT)0x00000000FFFFFFFF   4294967295  → (DINT)0xFFFFFFFF           -1
///     (LINT)0x0000000100000000   4294967296  → (DINT)0x00000000            0
///     (LINT)0xFFFFFFFFFFFFFFFF           -1  → (DINT)0xFFFFFFFF           -1
/// </summary>
PLCPEN_API void LINT_TO_DINT_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をDINT型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}


/// <summary>
/// （型変換）LINT型の値をREAL型に変換します。
/// 例　(LINT)0x0000000000000000                     0  → (REAL)0.0000000E+000
///     (LINT)0x0000000000000001                     1  → (REAL)1.0000000E+000
///     (LINT)0x7FFFFFFFFFFFFFFF   9223372036854775807  → (REAL) 9223372036854775800.0
///     (LINT)0xFFFFFFFFFFFFFFFF                    -1  → (REAL)-1.0
///     (LINT)0x8000000000000000  -9223372036854775808  → (REAL)-9223372036854775800.0
/// </summary>
PLCPEN_API void LINT_TO_REAL_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をREAL型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_REAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pReal = *pin->IN->pReal;
		pin->ENO = GetLIntToEno();	// LINT_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）LINT型の値をLREAL型に変換します。
/// 例　(LINT)0x0000000000000000                     0  → (LREAL)0.0000000E+000
///     (LINT)0x0000000000000001                     1  → (LREAL)1.0000000E+000
///     (LINT)0x7FFFFFFFFFFFFFFF   9223372036854775807  → (LREAL) 9223372036854775800.0
///     (LINT)0xFFFFFFFFFFFFFFFF                    -1  → (LREAL)-1.0
///     (LINT)0x8000000000000000  -9223372036854775808  → (LREAL)-9223372036854775800.0
/// </summary>
PLCPEN_API void LINT_TO_LREAL_EN(PVOID instance)
{
	struct LINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LINT型の値をLREAL型に変換した値
	} *pin = (struct LINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LINT_TO_LREAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLreal = *pin->IN->pLreal;
		pin->ENO = GetLIntToEno();	// LINT_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}