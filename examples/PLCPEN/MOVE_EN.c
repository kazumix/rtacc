#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPEN.h"
#include "PLCPIEC.h"

#pragma pack(push,1)
/// <summary>
/// ビット処理用マクロ関数
/// </summary>
#define	BOOLPOS(x)		((x) & 0x1)

//-----------------------------------
//代入
//-----------------------------------
PLCPEN_API void MOVE_EN(PVOID instance)
{
	struct MOVE_PIN {
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)	// 実行フラグONの場合
	{
		MOVE(pin->IN, NULL, NULL, NULL);	// MOVEファンクション呼出

		if (pin->ENO = GetMoveEno())	// MOVE実行結果ENO設定
		{
			WORD	bytesize = Type_GetSize(pin->IN);	// 代入元のデータ型からサイズを取得
		// サイズに応じて値の参照・代入処理を分岐
			switch (bytesize)
			{
			case 1:		*pin->OUT->pByte = (pin->IN->Type == D_BOOL) ? BOOLPOS(*pin->IN->pBool) : *pin->IN->pByte;	break;
			case 2:		*pin->OUT->pWord = *pin->IN->pWord;	break;
			case 4:		*pin->OUT->pDword = *pin->IN->pDword;	break;
			case 8:		Variable_Copy64((union ANYVAL*)pin->OUT->pQword, (union ANYVAL*)pin->IN->pQword);	break;
			}
		}						
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}
//-----------------------------------
//代入(BOOL)
//-----------------------------------
PLCPEN_API void MOVE_BOOL_EN(PVOID instance)
{
	struct MOVE_PIN {
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_BOOL(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pBool = *pin->IN->pBool;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(REAL)
//-----------------------------------
PLCPEN_API void MOVE_REAL_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_REAL(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(LREAL)
//-----------------------------------
PLCPEN_API void MOVE_LREAL_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_LREAL(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(SINT)
//-----------------------------------
PLCPEN_API void MOVE_SINT_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_SINT(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(DINT)
//-----------------------------------
PLCPEN_API void MOVE_DINT_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_DINT(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(INT)
//-----------------------------------
PLCPEN_API void MOVE_INT_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_INT(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(LINT)
//-----------------------------------
PLCPEN_API void MOVE_LINT_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_LINT(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(UDINT)
//-----------------------------------
PLCPEN_API void MOVE_UDINT_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_UDINT(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(UINT)
//-----------------------------------
PLCPEN_API void MOVE_UINT_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_UINT(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(USINT)
//-----------------------------------
PLCPEN_API void MOVE_USINT_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_USINT(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(ULINT)
//-----------------------------------
PLCPEN_API void MOVE_ULINT_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_ULINT(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(TIME)
//-----------------------------------
PLCPEN_API void MOVE_TIME_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_TIME(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(DWORD)
//-----------------------------------
PLCPEN_API void MOVE_DWORD_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_DWORD(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(WORD)
//-----------------------------------
PLCPEN_API void MOVE_WORD_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_WORD(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}
//-----------------------------------
//代入(BYTE)
//-----------------------------------
PLCPEN_API void MOVE_BYTE_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_BYTE(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}

//-----------------------------------
//代入(STRING)
//-----------------------------------
PLCPEN_API void MOVE_STRING_EN(PVOID instance)
{
	struct MOVE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;			// 代入元
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 代入結果
	} *pin = (struct MOVE_PIN*)instance;

	if (pin->EN)
	{
		MOVE_STRING(pin->IN, NULL, NULL, NULL);

		*pin->OUT->pReal = *pin->IN->pReal;
	}

	pin->ENO = pin->EN;	// ENOはENをそのまま設定
}


