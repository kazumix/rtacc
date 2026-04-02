#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPEN.h"
#include "PLCPIEC.h"

#pragma pack(push,1)

/*
* ローテーションシフト：右シフト
*/
PLCPEN_API void SHR_EN(PVOID instance)
{
	struct SHR_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct SHR_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SHR(pin->IN1, pin->IN2, NULL, NULL);
		//入力の型によって処理を分岐
		switch (pin->IN1->Type)
		{
		case D_SINT:
		case D_USINT:
		case D_BYTE:
			*pin->OUT->pByte = *pin->IN1->pByte;
			break;
		case D_INT:
		case D_UINT:
		case D_WORD:
			*pin->OUT->pWord = *pin->IN1->pWord;
			break;
		case D_DINT:
		case D_UDINT:
		case D_DWORD:
			*pin->OUT->pDword = *pin->IN1->pDword;
			break;
		}
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：右シフト(WORD)
*/
PLCPEN_API void SHR_WORD_EN(PVOID instance)
{
	struct SHR_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct SHR_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SHR_WORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pWord = *pin->IN1->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：右シフト(DWORD)
*/
PLCPEN_API void SHR_DWORD_EN(PVOID instance)
{
	struct SHR_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct SHR_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SHR_DWORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pDword = *pin->IN1->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：左シフト
*/
PLCPEN_API void SHL_EN(PVOID instance)
{
	struct SHL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct SHL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SHL(pin->IN1, pin->IN2, NULL, NULL);
		//入力の型によって処理を分岐
		switch (pin->IN1->Type)
		{
		case D_SINT:
		case D_USINT:
		case D_BYTE:
			*pin->OUT->pByte = *pin->IN1->pByte;
			break;
		case D_INT:
		case D_UINT:
		case D_WORD:
			*pin->OUT->pWord = *pin->IN1->pWord;
			break;
		case D_DINT:
		case D_UDINT:
		case D_DWORD:
			*pin->OUT->pDword = *pin->IN1->pDword;
			break;
		}
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：左シフト(WORD)
*/
PLCPEN_API void SHL_WORD_EN(PVOID instance)
{
	struct SHL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct SHL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SHL_WORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pWord = *pin->IN1->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：左シフト(DWORD)
*/
PLCPEN_API void SHL_DWORD_EN(PVOID instance)
{
	struct SHL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct SHL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SHL_DWORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pDword = *pin->IN1->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：右ローテーション
*/
PLCPEN_API void ROR_EN(PVOID instance)
{
	struct ROR_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct ROR_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ROR(pin->IN1, pin->IN2, NULL, NULL);
		//入力の型によって処理を分岐
		switch (pin->IN1->Type)
		{
		case D_SINT:
		case D_USINT:
		case D_BYTE:
			*pin->OUT->pByte = *pin->IN1->pByte;
			break;
		case D_INT:
		case D_UINT:
		case D_WORD:
			*pin->OUT->pWord = *pin->IN1->pWord;
			break;
		case D_DINT:
		case D_UDINT:
		case D_DWORD:
			*pin->OUT->pDword = *pin->IN1->pDword;
			break;
		}
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：右ローテーション(WORD)
*/
PLCPEN_API void ROR_WORD_EN(PVOID instance)
{
	struct ROR_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct ROR_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ROR_WORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pWord = *pin->IN1->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：右ローテーション(DWORD)
*/
PLCPEN_API void ROR_DWORD_EN(PVOID instance)
{
	struct ROR_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct ROR_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ROR_DWORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pDword = *pin->IN1->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：左ローテーション
*/
PLCPEN_API void ROL_EN(PVOID instance)
{
	struct ROL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct ROL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ROL(pin->IN1, pin->IN2, NULL, NULL);
		//入力の型によって処理を分岐
		switch (pin->IN1->Type)
		{
		case D_SINT:
		case D_USINT:
		case D_BYTE:
			*pin->OUT->pByte = *pin->IN1->pByte;
			break;
		case D_INT:
		case D_UINT:
		case D_WORD:
			*pin->OUT->pWord = *pin->IN1->pWord;
			break;
		case D_DINT:
		case D_UDINT:
		case D_DWORD:
			*pin->OUT->pDword = *pin->IN1->pDword;
			break;
		}
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：左ローテーション(WORD)
*/
PLCPEN_API void ROL_WORD_EN(PVOID instance)
{
	struct ROL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct ROL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ROL_WORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pWord = *pin->IN1->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：左ローテーション(DWORD)
*/
PLCPEN_API void ROL_DWORD_EN(PVOID instance)
{
	struct ROL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct ROL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ROL_DWORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pDword = *pin->IN1->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* データサイズ取得
*/
PLCPEN_API void SIZEOF_EN(PVOID instance)
{
	struct SIZEOF_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力の型のサイズ
	} *pin = (struct SIZEOF_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SIZEOF(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pUdint = *pin->IN->pUdint;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：右シフト(BYTE)
*/
PLCPEN_API void SHR_BYTE_EN(PVOID instance)
{
	struct SHR_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct SHR_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SHR_BYTE(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pByte = *pin->IN1->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：左シフト(BYTE)
*/
PLCPEN_API void SHL_BYTE_EN(PVOID instance)
{
	struct SHL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct SHL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SHL_BYTE(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pByte = *pin->IN1->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：右ローテーション(BYTE)
*/
PLCPEN_API void ROR_BYTE_EN(PVOID instance)
{
	struct ROR_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct ROR_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ROR_BYTE(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pByte = *pin->IN1->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

/*
* ローテーションシフト：左ローテーション(BYTE)
*/
PLCPEN_API void ROL_BYTE_EN(PVOID instance)
{
	struct ROL_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 出力
	} *pin = (struct ROL_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ROL_BYTE(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pByte = *pin->IN1->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}