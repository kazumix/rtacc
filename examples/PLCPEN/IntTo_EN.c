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
//　型変換 INT型から各型へ
//-------------------------------------

/// <summary>
/// （型変換）INT型の値をBOOL型に変換します。
/// 例　(INT)0x0000      0  → (BOOL)0x00 FALSE
///     (INT)0x0001      1  → (BOOL)0x01 TRUE
///     (INT)0xFFFF     -1  → (BOOL)0x01 TRUE
///     (INT)0x7FFF  32767  → (BOOL)0x01 TRUE
/// </summary>
PLCPEN_API void INT_TO_BOOL_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をBOOL型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_BOOL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pBool = *pin->IN->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
//-------------------------------------
/// <summary>
/// （型変換）INT型の値をBYTE型に変換します。
/// 例　(INT)0x0000       0  → (BYTE)0x00 0
///     (INT)0x0001       1  → (BYTE)0x01 1
///     (INT)0xFFFF      -1  → (BYTE)0xFF 255
///     (INT)0x7FFF   32767  → (BYTE)0xFF 255
///     (INT)0x8000  -32768  → (BYTE)0x00 0
/// </summary>
PLCPEN_API void INT_TO_BYTE_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をBYTE型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_BYTE(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// （型変換）INT型の値をWORD型に変換します。
/// 例　(INT)0x0000       0  → (WORD)0x0000
///     (INT)0x0001       1  → (WORD)0x0001
///     (INT)0x7FFF   32767  → (WORD)0x7FFF
///     (INT)0xFFFF      -1  → (WORD)0xFFFF
///     (INT)0x8000  -32768  → (WORD)0x8000
/// </summary>
PLCPEN_API void INT_TO_WORD_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をWORD型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_WORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）INT型の値をDWORD型に変換します。
/// 例　(INT)0x0000       0  → (DWORD)0x00000000
///     (INT)0x0001       1  → (DWORD)0x00000001
///     (INT)0x7FFF   32767  → (DWORD)0x00007FFF
///     (INT)0xFFFF      -1  → (DWORD)0x0000FFFF
///     (INT)0x8000  -32768  → (DWORD)0x00008000
/// </summary>
PLCPEN_API void INT_TO_DWORD_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をDWORD型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_DWORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）INT型の値をSINT型に変換します。
/// 例　(INT)0x0000       0  → (SINT)0x00       0
///     (INT)0x0001       1  → (SINT)0x01       1
///     (INT)0x007F     127  → (SINT)0x7F     127
///     (INT)0x0080    -128  → (SINT)0x80    -128
///     (INT)0x7FFF   32767  → (SINT)0xFF      -1
///     (INT)0xFFFF      -1  → (SINT)0xFF      -1
///     (INT)0x8000  -32768  → (SINT)0x00       0
/// </summary>
PLCPEN_API void INT_TO_SINT_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をSINT型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_SINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pSint = *pin->IN->pSint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）INT型の値をDINT型に変換します。
/// 例　(INT)0x0000       0  → (DINT)0x00000000       0
///     (INT)0x0001       1  → (DINT)0x00000001       1
///     (INT)0x7FFF   32767  → (DINT)0x00007FFF   32767
///     (INT)0xFFFF      -1  → (DINT)0xFFFFFFFF      -1
///     (INT)0x8000  -32768  → (DINT)0xFFFF8000  -32768
/// </summary>
PLCPEN_API void INT_TO_DINT_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をDINT型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_DINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDint = *pin->IN->pDint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）INT型の値をUSINT型に変換します。
/// 例　(INT)0x0000       0  → (USINT)0x00       0
///     (INT)0x0001       1  → (USINT)0x01       1
///     (INT)0x007F     127  → (USINT)0x7F     127
///     (INT)0x7FFF   32767  → (USINT)0xFF     255
///     (INT)0xFFFF      -1  → (USINT)0xFF     255
///     (INT)0x0080    -128  → (USINT)0x80     128
///     (INT)0x8000  -32768  → (USINT)0x00       0
/// </summary>
PLCPEN_API void INT_TO_USINT_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をUSINT型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_USINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUsint = *pin->IN->pUsint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）INT型の値をUINT型に変換します。
/// 例　(INT)0x0000       0  → (UINT)0x0000       0
///     (INT)0x0001       1  → (UINT)0x0001       1
///     (INT)0x7FFF   32767  → (UINT)0x7FFF   32767
///     (INT)0xFFFF      -1  → (UINT)0xFFFF   65535
///     (INT)0x8000  -32768  → (UINT)0x8000   32768
/// </summary>
PLCPEN_API void INT_TO_UINT_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をUINT型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_UINT(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUint = *pin->IN->pUint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）INT型の値をUDINT型に変換します。
/// 例　(INT)0x0000       0  → (UDINT)0x00000000       0
///     (INT)0x0001       1  → (UDINT)0x00000001       1
///     (INT)0x7FFF   32767  → (UDINT)0x00007FFF   32767
///     (INT)0xFFFF      -1  → (UDINT)0x0000FFFF   65535
///     (INT)0x8000  -32768  → (UDINT)0x00008000   32768
/// </summary>
PLCPEN_API void INT_TO_UDINT_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をUDINT型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_UDINT(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pUdint = *pin->IN->pUdint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）INT型の値をREAL型に変換します。
/// 例　(INT)0x0000       0  → (REAL)0.0000000E+000
///     (INT)0x0001       1  → (REAL)1.0000000E+000
///     (INT)0x7FFF   32767  → (REAL)3.2767000E+004
///     (INT)0xFFFF      -1  → (REAL)-1.0000000E+000
///     (INT)0x8000  -32768  → (REAL)-3.2768000E+004
/// </summary>
PLCPEN_API void INT_TO_REAL_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をREAL型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_REAL(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）INT型の値をLREAL型に変換します。
/// 例　(INT)0x0000       0  → (LREAL)0.0000000E+000
///     (INT)0x0001       1  → (LREAL)1.0000000E+000
///     (INT)0x7FFF   32767  → (LREAL)3.2767000E+004
///     (INT)0xFFFF      -1  → (LREAL)-1.0000000E+000
///     (INT)0x8000  -32768  → (LREAL)-3.2768000E+004
/// </summary>
PLCPEN_API void INT_TO_LREAL_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をLREAL型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_LREAL(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pLreal = *pin->IN->pLreal;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）INT型の値をB_BCD型に変換します。
///           範囲:0-99を2進化10進数に変換。
///			　負の値、および100以上は0xFFに変換。
/// 例　(INT)0x0000       0  → (B_BCD)0x00
///     (INT)0x0001       1  → (B_BCD)0x01
///     (INT)0x0063      99  → (B_BCD)0x99
///     (INT)0x0064     100  → (B_BCD)0xFF
///     (INT)0x7FFF   32767  → (B_BCD)0xFF
///     (INT)0xFFFF      -1  → (B_BCD)0xFF
///     (INT)0x8000  -32768  → (B_BCD)0xFF
/// </summary>
PLCPEN_API void INT_TO_B_BCD_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をB_BCD型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_B_BCD(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）INT型の値をW_BCD型に変換します。
///           範囲:0-9999を2進化10進数に変換。
///			　10000以上、負の値は0xFFFFに変換。
/// 例　(INT)0x0000       0  → (W_BCD)0x0000
///     (INT)0x0001       1  → (W_BCD)0x0001
///     (INT)0x270F    9999  → (W_BCD)0x9999
///     (INT)0x2710   10000  → (W_BCD)0xFFFF
///     (INT)0x7FFF   32767  → (W_BCD)0xFFFF
///     (INT)0xFFFF      -1  → (W_BCD)0xFFFF
///     (INT)0x8000  -32768  → (W_BCD)0xFFFF
/// </summary>
PLCPEN_API void INT_TO_W_BCD_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をW_BCD型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_W_BCD(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）INT型の値をD_BCD型に変換します。
///           範囲:0-32767を2進化10進数に変換。
///			　負の値は0xFFFFFFFFに変換。
/// 例　(INT)0x0000       0  → (D_BCD)0x00000000
///     (INT)0x0001       1  → (D_BCD)0x00000001
///     (INT)0x7FFF   32767  → (D_BCD)0x00032767
///     (INT)0xFFFF      -1  → (D_BCD)0xFFFFFFFF
///     (INT)0x8000  -32768  → (D_BCD)0xFFFFFFFF
/// </summary>
PLCPEN_API void INT_TO_D_BCD_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をD_BCD型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_D_BCD(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （型変換）INT型の値をLINT型に変換します。
/// 例　(INT)0x0000       0  → (LINT)0x0000000000000000       0
///     (INT)0x0001       1  → (LINT)0x0000000000000001       1
///     (INT)0x7FFF   32767  → (LINT)0x0000000000007FFF   32767
///     (INT)0xFFFF      -1  → (LINT)0xFFFFFFFFFFFFFFFF      -1
///     (INT)0x8000  -32768  → (LINT)0xFFFFFFFFFFFF8000  -32768
/// </summary>
PLCPEN_API void INT_TO_LINT_EN(PVOID instance)
{
	struct INT_TO_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INT型の値をLINT型に変換した値
	} *pin = (struct INT_TO_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		INT_TO_LINT(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pLint = *pin->IN->pLint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}