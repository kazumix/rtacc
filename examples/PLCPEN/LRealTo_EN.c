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
//　型変換 LREAL型から～型へ
//  小数点第一を四捨五入して近似値に丸めます
//  (MULTIPROG動作と同じ)
//-------------------------------------

/// <summary>
/// （型変換）LREAL型の値をBOOL型に変換します。
/// 例　(LREAL)     0.0  → (BOOL)0x00 FALSE
///     (LREAL)     1.0  → (BOOL)0x01 TRUE
///     (LREAL) DBL_MAX  → (BOOL)0x01 TRUE
///     (LREAL) DBL_MIN  → (BOOL)0x01 TRUE
///     (LREAL)-DBL_MAX  → (BOOL)0x01 TRUE
///     (LREAL)-DBL_MIN  → (BOOL)0x01 TRUE
/// </summary>
PLCPEN_API void LREAL_TO_BOOL_EN(PVOID instance)
{
	struct LREAL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LREAL型の値をBOOL型に変換した値
	} *pin = (struct LREAL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_BOOL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pBool = *pin->IN->pBool;
		pin->ENO = GetLRealToEno();	// LREAL_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）LREAL値をBYTE型に変換します。
/// 例　(LREAL)     0.0   → (BYTE)0x00   0
///     (LREAL)     0.49  → (BYTE)0x00   0
///     (LREAL)     0.50  → (BYTE)0x00   0
///     (LREAL)     1.0   → (BYTE)0x01   1
///     (LREAL)   255.0   → (BYTE)0xFF 255
///     (LREAL)   255.49  → (BYTE)0xFF 255
///     (LREAL)   255.50  → (BYTE)0x00   0
///     (LREAL)  -128.00  → (BYTE)0x80 128
///     (LREAL)  -128.49  → (BYTE)0x80 128
///     (LREAL)  -128.50  → (BYTE)0x81 129
///     (LREAL)  DBL_MAX  → (BYTE)0x00   0
///     (LREAL)  DBL_MIN  → (BYTE)0x00   0
///     (LREAL) -DBL_MAX  → (BYTE)0x00   0
///     (LREAL) -DBL_MIN  → (BYTE)0x00   0
/// </summary>
PLCPEN_API void LREAL_TO_BYTE_EN(PVOID instance)
{
	struct LREAL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LREAL型の値をBYTE型に変換した値
	} *pin = (struct LREAL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_BYTE(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
		pin->ENO = GetLRealToEno();	// LREAL_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）LREAL型の値をWORD型に変換します。
/// 例　(LREAL)           0.0   → (WORD)0x0000
///     (LREAL)           0.49  → (WORD)0x0000
///     (LREAL)           0.50  → (WORD)0x0000
///     (LREAL)           1.0   → (WORD)0x0001
///     (LREAL)       65535.0   → (WORD)0xFFFF
///     (LREAL)       65535.50  → (WORD)0x0000
///     (LREAL)       65536.0   → (WORD)0x0000
///     (LREAL)          -0.49  → (WORD)0x0000
///     (LREAL)          -0.50  → (WORD)0xFFFF
///     (LREAL)          -1.00  → (WORD)0xFFFF
///     (LREAL)      DBL_MAX    → (WORD)0x0000
///     (LREAL)      DBL_MIN    → (WORD)0x0000
///     (LREAL)     -DBL_MAX    → (WORD)0x0000
///     (LREAL)     -DBL_MIN    → (WORD)0x0000
/// </summary>
PLCPEN_API void LREAL_TO_WORD_EN(PVOID instance)
{
	struct LREAL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LREAL型の値をWORD型に変換した値
	} *pin = (struct LREAL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_WORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
		pin->ENO = GetLRealToEno();	// LREAL_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）LREAL型の値をDWORD型に変換します。
/// 例　(LREAL)           0.0   → (DWORD)0x00000000
///     (LREAL)           0.49  → (DWORD)0x00000000
///     (LREAL)           0.50  → (DWORD)0x00000000
///     (LREAL)           1.0   → (DWORD)0x00000001
///     (LREAL)  2147483647.0   → (DWORD)0x7FFFFFFF
///     (LREAL)  2147483647.50  → (DWORD)0x7FFFFFFF
///     (LREAL)          -0.49  → (DWORD)0x00000000
///     (LREAL)          -0.50  → (DWORD)0xFFFFFFFF
///     (LREAL)          -1.00  → (DWORD)0xFFFFFFFF
///     (LREAL)  4294967295.0   → (DWORD)0xFFFFFFFF
///     (LREAL)  4294967295.49  → (DWORD)0xFFFFFFFF
///     (LREAL) -2147483648.00  → (DWORD)0x80000000
///     (LREAL) -2147483648.49  → (DWORD)0x80000000
///     (LREAL) -2147483648.50  → (DWORD)0x80000000
///     (LREAL)      DBL_MAX    → (DWORD)0x00000000
///     (LREAL)      DBL_MIN    → (DWORD)0x00000000
///     (LREAL)     -DBL_MAX    → (DWORD)0x00000000
///     (LREAL)     -DBL_MIN    → (DWORD)0x00000000
/// </summary>
PLCPEN_API void LREAL_TO_DWORD_EN(PVOID instance)
{
	struct LREAL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LREAL型の値をDWORD型に変換した値
	} *pin = (struct LREAL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_DWORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
		pin->ENO = GetLRealToEno();	// LREAL_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）LREAL型の値をSINT型に変換します。
/// 例　(LREAL)    0.0    → (SINT)0x00    0
///     (LREAL)    0.49   → (SINT)0x00    0
///     (LREAL)    0.50   → (SINT)0x00    0
///     (LREAL)    1.0    → (SINT)0x00    1
///     (LREAL)  127.0    → (SINT)0x80 -128
///     (LREAL)  127.49   → (SINT)0x80 -128
///     (LREAL)  127.50   → (SINT)0x80 -128
///     (LREAL)   -0.49   → (SINT)0x00    0
///     (LREAL)   -0.50   → (SINT)0xFF   -1
///     (LREAL)   -1.00   → (SINT)0xFF   -1
///     (LREAL) -128.00   → (SINT)0x80 -128
///     (LREAL) -128.49   → (SINT)0x80 -128
///     (LREAL) -128.50   → (SINT)0x7F  127
///     (LREAL)  DBL_MAX  → (SINT)0x00    0
///     (LREAL)  DBL_MIN  → (SINT)0x00    0
///     (LREAL) -DBL_MAX  → (SINT)0x00    0
///     (LREAL) -DBL_MIN  → (SINT)0x00    0
/// </summary>
PLCPEN_API void LREAL_TO_SINT_EN(PVOID instance)
{
	struct LREAL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LREAL型の値をSINT型に変換した値
	} *pin = (struct LREAL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
		pin->ENO = GetLRealToEno();	// LREAL_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）LREAL型の値をINT型に変換します。
/// 例　(LREAL)      0.0   → (INT)0x0000      0
///     (LREAL)      0.49  → (INT)0x0000      0
///     (LREAL)      0.50  → (INT)0x0000      0
///     (LREAL)      1.0   → (INT)0x0001      1
///     (LREAL)  32767.0   → (INT)0x7FFF  32767
///     (LREAL)  32767.49  → (INT)0x7FFF  32767
///     (LREAL)  32767.50  → (INT)0x8000 -32768
///     (LREAL)     -0.49  → (INT)0x0000      0
///     (LREAL)     -0.50  → (INT)0xFFFF     -1
///     (LREAL)     -1.00  → (INT)0xFFFF     -1
///     (LREAL) -32768.00  → (INT)0x8000 -32768
///     (LREAL) -32768.49  → (INT)0x8000 -32768
///     (LREAL) -32768.50  → (INT)0x7FFF  32767
///     (LREAL)   DBL_MAX  → (INT)0x0000      0
///     (LREAL)   DBL_MIN  → (INT)0x0000      0
///     (LREAL)  -DBL_MAX  → (INT)0x0000      0
///     (LREAL)  -DBL_MIN  → (INT)0x0000      0
/// </summary>
PLCPEN_API void LREAL_TO_INT_EN(PVOID instance)
{
	struct LREAL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LREAL型の値をINT型に変換した値
	} *pin = (struct LREAL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_INT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pInt = *pin->IN->pInt;
		pin->ENO = GetLRealToEno();	// LREAL_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）LREAL型の値をDINT型に変換します。
/// 例　(LREAL)           0.0   → (DINT)0x00000000           0
///     (LREAL)           0.49  → (DINT)0x00000000           0
///     (LREAL)           0.50  → (DINT)0x00000000           0
///     (LREAL)           1.0   → (DINT)0x00000001           1
///     (LREAL)  2147483647.0   → (DINT)0x7FFFFFFF  2147483647
///     (LREAL)  2147483647.50  → (DINT)0x80000000 -2147483648
///     (LREAL)          -0.49  → (DINT)0x00000000           0
///     (LREAL)          -0.50  → (DINT)0x00000000           0
///     (LREAL)          -1.00  → (DINT)0xFFFFFFFF          -1
///     (LREAL) -2147483648.00  → (DINT)0x80000000 -2147483648
///     (LREAL) -2147483648.49  → (DINT)0x80000000 -2147483648
///     (LREAL) -2147483648.50  → (DINT)0x7FFFFFFF  2147483647
///     (LREAL)        DBL_MAX  → (DINT)0x80000000 -2147483648
///     (LREAL)        DBL_MIN  → (DINT)0x00000000           0
///     (LREAL)       -DBL_MAX  → (DINT)0x80000000 -2147483648
///     (LREAL)       -DBL_MIN  → (DINT)0x00000000           0
/// </summary>
PLCPEN_API void LREAL_TO_DINT_EN(PVOID instance)
{
	struct LREAL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LREAL型の値をDINT型に変換した値
	} *pin = (struct LREAL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
		pin->ENO = GetLRealToEno();	// LREAL_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）LREAL型の値をLINT型に変換します。
/// 例　(LREAL)                    0.0   → (LINT)0x00000000000000000000                    0
///     (LREAL                     0.49  → (LINT)0x00000000000000000000                    0
///     (LREAL)                    0.50  → (LINT)0x00000000000000000000                    0
///     (LREAL)                    1.0   → (LINT)0x00000000000000000001                    1
///     (LREAL)  9223372036854775807.0   → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)  9223372036854775807.49  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)  9223372036854775807.50  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)                   -0.49  → (LINT)0x00000000000000000000                    0
///     (LREAL)                   -0.50  → (LINT)0x00000000000000000000                    0
///     (LREAL)                   -1.00  → (LINT)0xFFFFFFFFFFFFFFFFFFFF                   -1
///     (LREAL) -9223372036854775808.00  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL) -9223372036854775808.49  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL) -9223372036854775808.50  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)                 DBL_MAX  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)                 DBL_MIN  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)                -DBL_MAX  → (LINT)0x80000000000000000000 -9223372036854775808
///     (LREAL)                -DBL_MIN  → (LINT)0x80000000000000000000 -9223372036854775808
/// </summary>
PLCPEN_API void LREAL_TO_LINT_EN(PVOID instance)
{
	struct LREAL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LREAL型の値をLINT型に変換した値
	} *pin = (struct LREAL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_LINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pLint = *pin->IN->pLint;
		pin->ENO = GetLRealToEno();	// LREAL_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）LREAL型の値をUSINT型に変換します。
/// 例　(LREAL)         0.0   → (USINT)0x00       0
///     (LREAL)         0.49  → (USINT)0x00       0
///     (LREAL)         0.50  → (USINT)0x00       0
///     (LREAL)         1.0   → (USINT)0x01       1
///     (LREAL)       255.0   → (USINT)0xFF	 255
///     (LREAL)       255.50  → (USINT)0x00       0
///     (LREAL)       256.0   → (USINT)0x00       0
///     (LREAL)        -0.49  → (USINT)0x00       0
///     (LREAL)        -0.50  → (USINT)0xFF	 255
///     (LREAL)        -1.00  → (USINT)0xFF	 255
///     (LREAL)      DBL_MAX  → (USINT)0x00	   0
///     (LREAL)      DBL_MIN  → (USINT)0x00	   0
///     (LREAL)     -DBL_MAX  → (USINT)0x00	   0
///     (LREAL)     -DBL_MIN  → (USINT)0x00	   0
/// </summary>
PLCPEN_API void LREAL_TO_USINT_EN(PVOID instance)
{
	struct LREAL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LREAL型の値をUSINT型に変換した値
	} *pin = (struct LREAL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_USINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUsint = *pin->IN->pUsint;
		pin->ENO = GetLRealToEno();	// LREAL_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）LREAL型の値をUINT型に変換します。
/// 例　(LREAL)           0.0   → (UINT)0x0000		 0
///     (LREAL)           0.49  → (UINT)0x0000		 0
///     (LREAL)           0.50  → (UINT)0x0000		 0
///     (LREAL)           1.0   → (UINT)0x0001		 1
///     (LREAL)       65535.0   → (UINT)0xFFFF	 65535
///     (LREAL)       65535.50  → (UINT)0x0000		 0
///     (LREAL)       65536.0   → (UINT)0x0000		 0
///     (LREAL)          -0.49  → (UINT)0x0000		 0
///     (LREAL)          -0.50  → (UINT)0xFFFF	 65535
///     (LREAL)          -1.00  → (UINT)0xFFFF	 65535
///     (LREAL)      DBL_MAX    → (UINT)0x0000		 0
///     (LREAL)      DBL_MIN    → (UINT)0x0000		 0
///     (LREAL)     -DBL_MAX    → (UINT)0x0000		 0
///     (LREAL)     -DBL_MIN    → (UINT)0x0000		 0
/// </summary>
PLCPEN_API void LREAL_TO_UINT_EN(PVOID instance)
{
	struct LREAL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LREAL型の値をUINT型に変換した値
	} *pin = (struct LREAL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_UINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUint = *pin->IN->pUint;
		pin->ENO = GetLRealToEno();	// LREAL_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）REAL型の値をUDINT型に変換します。
/// 例　(REAL)           0.0   → (UDINT)0x00000000           0
///     (REAL)           0.49  → (UDINT)0x00000000           0
///     (REAL)           0.50  → (UDINT)0x00000000           0
///     (REAL)           1.0   → (UDINT)0x00000001           1
///     (REAL)      524287.0   → (UDINT)0x0007FFFF      524287
///     (REAL)  2147483647.0   → (UDINT)0x80000000  2147483648
///     (REAL)  2147483647.50  → (UDINT)0x80000000  2147483648
///     (REAL)          -0.49  → (UDINT)0x00000000           0
///     (REAL)          -0.50  → (UDINT)0x00000000           0
///     (REAL)          -1.00  → (UDINT)0xFFFFFFFF	 4294967295	   
///     (REAL)  4294967295.0   → (UDINT)0x80000000  2147483648
///     (REAL)  4294967295.49  → (UDINT)0x80000000  2147483648
///     (REAL)     -524288.0   → (UDINT)0xFFF80000      524288
///     (REAL) -2147483648.00  → (UDINT)0x80000000  2147483648
///     (REAL) -2147483648.49  → (UDINT)0x80000000  2147483648
///     (REAL) -2147483648.50  → (UDINT)0x80000000  2147483648
///     (REAL)      FLT_MAX    → (UDINT)0x00000000
///     (REAL)      FLT_MIN    → (UDINT)0x00000000
///     (REAL)     -FLT_MAX    → (UDINT)0x00000000
///     (REAL)     -FLT_MIN    → (UDINT)0x00000000
/// </summary>
PLCPEN_API void LREAL_TO_UDINT_EN(PVOID instance)
{
	struct LREAL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LREAL型の値をUDINT型に変換した値
	} *pin = (struct LREAL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_UDINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUdint = *pin->IN->pUdint;
		pin->ENO = GetLRealToEno();	// LREAL_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/// <summary>
/// （型変換）LREAL型の値をREAL型に変換します。
/// 例　(LREAL)             0.0   → (REAL)            0.0
///     (LREAL              0.49  → (REAL)            0.49
///     (LREAL)             0.50  → (REAL)            0.50
///     (LREAL)             1.0   → (REAL)            1.0
///     (LREAL)     3.402823e+38  → (REAL)    3.402823e+38
///     (LREAL)            -0.49  → (REAL)           -0.49
///     (LREAL)            -0.50  → (REAL)           -0.50
///     (LREAL)            -1.00  → (REAL)           -1.0
///     (LREAL)     1.175494e-38  → (REAL)    1.175494e-38
///     (LREAL)          DBL_MAX  → (REAL)			   NaN
///     (LREAL)          DBL_MIN  → (REAL)            0.0
///     (LREAL)         -DBL_MAX  → (REAL)			   NaN
///     (LREAL)         -DBL_MIN  → (REAL)			   NaN
/// </summary>
PLCPEN_API void LREAL_TO_REAL_EN(PVOID instance)
{
	struct LREAL_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// LREAL型の値をREAL型に変換した値
	} *pin = (struct LREAL_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LREAL_TO_REAL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pReal = *pin->IN->pReal;
		pin->ENO = GetLRealToEno();	// LREAL_TO実行結果ENO設定
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}