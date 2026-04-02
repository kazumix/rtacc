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
//　型変換 DINT型から～型へ
//-------------------------------------

/// <summary>
/// （型変換）DINTの値をBOOL型に変換します。
/// 例　(DINT)0x00000000        0  → (D_BOOL)0x00	FALSE
///     (DINT)0x00000001        1  → (D_BOOL)0x01	TRUE
///     (DINT)0x05F5E0FF  99999999 → (D_BOOL)0x01	TRUE
///     (DINT)0x05F5E100 100000000 → (D_BOOL)0x01	TRUE
///     (DINT)0xFFFFFFFF        -1 → (D_BOOL)0x01	TRUE
/// </summary>
PLCPEN_API void DINT_TO_BOOL_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をBOOL型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_BOOL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pBool = *pin->IN->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINTの値をBYTE型に変換します。
/// 例　(DINT)0x00000000        0  → (D_BYTE)0x00	  0
///     (DINT)0x00000001        1  → (D_BYTE)0x01	  1
///     (DINT)0x000000FF      255  → (D_BYTE)0xFF	255
///     (DINT)0x00000100      256  → (D_BYTE)0x00	  0
///     (DINT)0xFFFFFFFF       -1  → (D_BYTE)0xFF	255
/// </summary>
PLCPEN_API void DINT_TO_BYTE_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をBYTE型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_BYTE(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINT型の値をWORD型に変換します。
/// 例　(DINT)0x00000000            0  → (WORD)0x0000
///     (DINT)0x00000001            1  → (WORD)0x0001
///     (DINT)0x00008000        32767  → (WORD)0x8000
///     (DINT)0x0000FFFF        65535  → (WORD)0xFFFF
///     (DINT)0x00010000        65536  → (WORD)0x0000
///     (DINT)0x7FFFFFFF   2147483647  → (WORD)0xFFFF
///     (DINT)0xFFFFFFFF           -1  → (WORD)0xFFFF
///     (DINT)0x80000000  -2147483648  → (WORD)0x0000
/// </summary>
PLCPEN_API void DINT_TO_WORD_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をWORD型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_WORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINT型の値をDWORD型に変換します。
/// 例　(DINT)0x00000000            0  → (DWORD)0x00000000
///     (DINT)0x00000001            1  → (DWORD)0x00000001
///     (DINT)0x7FFFFFFF   2147483647  → (DWORD)0x7FFFFFFF
///     (DINT)0xFFFFFFFF           -1  → (DWORD)0xFFFFFFFF
///     (DINT)0x80000000  -2147483648  → (DWORD)0x80000000
/// </summary>
PLCPEN_API void DINT_TO_DWORD_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をDWORD型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_DWORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINT型の値をSINT型に変換します。
/// 例　(DINT)0x00000000            0  → (SINT)0x00      0
///     (DINT)0x00000001            1  → (SINT)0x00      1
///     (DINT)0x0000007F          127  → (SINT)0x7F    127
///     (DINT)0x00000080          128  → (SINT)0x80   -128
///     (DINT)0x7FFFFFFF   2147483647  → (SINT)0xFF     -1
///     (DINT)0xFFFFFFFF           -1  → (SINT)0xFF     -1
///     (DINT)0x80000000  -2147483648  → (SINT)0x00      0
/// </summary>
PLCPEN_API void DINT_TO_SINT_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をSINT型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINT型の値をINT型に変換します。
/// 例　(DINT)0x00000000            0  → (INT)0x0000      0
///     (DINT)0x00000001            1  → (INT)0x0001      1
///     (DINT)0x00007FFF        32767  → (INT)0x7FFF  32767
///     (DINT)0x7FFFFFFF   2147483647  → (INT)0xFFFF     -1
///     (DINT)0xFFFFFFFF           -1  → (INT)0xFFFF     -1
///     (DINT)0x00008000       -32768  → (INT)0x8000 -32768
///     (DINT)0x80000000  -2147483648  → (INT)0x0000      0
/// </summary>
PLCPEN_API void DINT_TO_INT_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をINT型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINT型の値をUSINT型に変換します。
/// 例　(DINT)0x00000000            0  → (USINT)0x00   0
///     (DINT)0x00000001            1  → (USINT)0x01   1
///     (DINT)0x00000080          128  → (USINT)0x80 128
///     (DINT)0x000000FF          255  → (USINT)0xFF 255
///     (DINT)0x7FFFFFFF   2147483647  → (USINT)0xFF 255
///     (DINT)0xFFFFFFFF           -1  → (USINT)0xFF 255
///     (DINT)0x80000000  -2147483648  → (USINT)0x00   0
/// </summary>
PLCPEN_API void DINT_TO_USINT_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をUSINT型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_USINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUsint = *pin->IN->pUsint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINT型の値をUINT型に変換します。
/// 例　(DINT)0x00000000            0  → (UINT)0x0000     0
///     (DINT)0x00000001            1  → (UINT)0x0001     1
///     (DINT)0x00008000        32767  → (UINT)0x8000 32767
///     (DINT)0x0000FFFF        65535  → (UINT)0xFFFF 65535
///     (DINT)0x00010000        65536  → (UINT)0x0000     0
///     (DINT)0x7FFFFFFF   2147483647  → (UINT)0xFFFF 65535
///     (DINT)0xFFFFFFFF           -1  → (UINT)0xFFFF 65535
///     (DINT)0x80000000  -2147483648  → (UINT)0x0000     0
/// </summary>
PLCPEN_API void DINT_TO_UINT_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をUINT型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_UINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUint = *pin->IN->pUint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINT型の値をUDINT型に変換します。
/// 例　(DINT)0x00000000            0  → (UDINT)0x00000000          0
///     (DINT)0x00000001            1  → (UDINT)0x00000001          1
///     (DINT)0x7FFFFFFF   2147483647  → (UDINT)0x7FFFFFFF 2147483647
///     (DINT)0xFFFFFFFF           -1  → (UDINT)0xFFFFFFFF 4294967925
///     (DINT)0x80000000  -2147483648  → (UDINT)0x80000000 2147483648
/// </summary>
PLCPEN_API void DINT_TO_UDINT_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をUDINT型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_UDINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUdint = *pin->IN->pUdint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINT型の値をLREAL型に変換します。
/// 例　(DINT)0x00000000            0  → (LREAL)0.0000000E+000
///     (DINT)0x00000001            1  → (LREAL)1.0000000E+000
///     (DINT)0x7FFFFFFF   2147483647  → (LREAL)2.147483647E+009
///     (DINT)0xFFFFFFFF           -1  → (LREAL)-1.0000000E+000
///     (DINT)0x80000000  -2147483648  → (LREAL)-2.147483648E+009
/// </summary>
PLCPEN_API void DINT_TO_LREAL_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をLREAL型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_LREAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLreal = *pin->IN->pLreal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINTの値をB_BCD型に変換します。
/// 例　(DINT)0x00000000   0 → (B_BCD)0x00
///     (DINT)0x00000001   1 → (B_BCD)0x01
///     (DINT)0x00000063  99 → (B_BCD)0x99
///     (DINT)0x00000064 100 → (B_BCD)0xFF
///     (DINT)0xFFFFFFFF  -1 → (B_BCD)0xFF
/// </summary>
PLCPEN_API void DINT_TO_B_BCD_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をB_BCD型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_B_BCD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINTの値をW_BCD型に変換します。
/// 例　(DINT)0x00000000        0  → (W_BCD)0x0000
///     (DINT)0x00000001        1  → (W_BCD)0x0001
///     (DINT)0x0000270F     9999  → (W_BCD)0x9999
///     (DINT)0x00002710    10000  → (W_BCD)0xFFFF
///     (DINT)0xFFFFFFFF       -1  → (W_BCD)0xFFFF
/// </summary>
PLCPEN_API void DINT_TO_W_BCD_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をW_BCD型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_W_BCD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINTの値をD_BCD型に変換します。
///           ※ DINT_TO_BCDと同じ動作をします。
/// 例　(DINT)0x00000000        0  → (D_BCD)0x00000000
///     (DINT)0x00000001        1  → (D_BCD)0x00000001
///     (DINT)0x05F5E0FF  99999999 → (D_BCD)0x99999999
///     (DINT)0x05F5E100 100000000 → (D_BCD)0xFFFFFFFF
///     (DINT)0xFFFFFFFF        -1 → (D_BCD)0xFFFFFFFF
/// </summary>
PLCPEN_API void DINT_TO_D_BCD_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をW_BCD型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_D_BCD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINT型の値をLINT型に変換します。
/// 例　(DINT)0x00000000            0  → (LINT)0x0000000000000000            0
///     (DINT)0x00000001            1  → (LINT)0x0000000000000001            1
///     (DINT)0x7FFFFFFF   2147483647  → (LINT)0x000000007FFFFFFF   2147483647
///     (DINT)0xFFFFFFFF           -1  → (LINT)0xFFFFFFFFFFFFFFFF           -1
///     (DINT)0x80000000  -2147483648  → (LINT)0xFFFFFFFF80000000  -2147483648
/// </summary>
PLCPEN_API void DINT_TO_LINT_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をLINT型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_LINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLint = *pin->IN->pLint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）DINT型の値をTIME型(単位:msec)に変換します。
/// 例　(DINT)0x00000000            0  → (TIME)          0
///     (DINT)0x00000001            1  → (TIME)          1
///     (DINT)0x7FFFFFFF   2147483647  → (TIME) 2147483647
///     (DINT)0xFFFFFFFF           -1  → (TIME) 4294967925
///     (DINT)0x80000000  -2147483648  → (TIME) 2147483648
/// </summary>
PLCPEN_API void DINT_TO_TIME_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をTIME型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_TIME(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pTime = *pin->IN->pTime;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/// <summary>
/// （型変換）DINT型の値をREAL型に変換します。
/// 例　(DINT)0x00000000            0  → (LREAL)0.0000000E+000
///     (DINT)0x00000001            1  → (LREAL)1.0000000E+000
///     (DINT)0x7FFFFFFF   2147483647  → (LREAL)2147483647.00000000
///     (DINT)0xFFFFFFFF           -1  → (LREAL)-1.0000000E+000
///     (DINT)0x80000000  -2147483648  → (LREAL)-2147483648.00000000
/// </summary>
PLCPEN_API void DINT_TO_REAL_EN(PVOID instance)
{
	struct DINT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// DINT型の値をREAL型に変換した値
	} *pin = (struct DINT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		DINT_TO_REAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pReal = *pin->IN->pReal;
		pin->ENO = GetDIntToEno();	// DINT_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}