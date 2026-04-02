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
/// （論理積）入力 IN1 と IN2 の論理積を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPEN_API void AND_EN(PVOID instance)
{
	struct AND_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の論理積
	} *pin = (struct AND_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)   
	{
		AND(pin->IN1, pin->IN2, NULL, NULL);
		//入力の型によって処理を分岐
		switch (pin->IN1->Type)
		{
		case D_BOOL: 
			*pin->OUT->pBool = *pin->IN1->pBool;
			break;
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
/// <summary>
/// （論理否定）入力 IN1 の論理否定を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPEN_API void NOT_EN(PVOID instance)
{
	struct NOT_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 入力の論理否定
	} *pin = (struct NOT_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		NOT(pin->IN, NULL, NULL, NULL);
		//入力の型によって処理を分岐
		switch (pin->IN->Type)
		{
		case D_BOOL:
			*pin->OUT->pBool = *pin->IN->pBool;
			break;
		case D_SINT:
		case D_USINT:
		case D_BYTE:
			*pin->OUT->pByte = *pin->IN->pByte;
			break;
		case D_INT:
		case D_UINT:
		case D_WORD:
			*pin->OUT->pWord = *pin->IN->pWord;
			break;
		case D_DINT:
		case D_UDINT:
		case D_DWORD:
			*pin->OUT->pDword = *pin->IN->pDword;
			break;
		}
	}   
	
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}
/// <summary>
/// （論理和）入力 IN1 と IN2 の論理和を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPEN_API void OR_EN(PVOID instance)
{
	struct OR_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の論理和
	} *pin = (struct OR_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		OR(pin->IN1, pin->IN2, NULL, NULL);
		//入力の型によって処理を分岐
		switch (pin->IN1->Type)
		{
		case D_BOOL:
			*pin->OUT->pBool = *pin->IN1->pBool;
			break;
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
/// <summary>
/// （排他的論理和）入力 IN1 と IN2 の排他的論理和を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPEN_API void XOR_EN(PVOID instance)
{
	struct XOR_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の排他的論理和
	} *pin = (struct XOR_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		XOR(pin->IN1, pin->IN2, NULL, NULL);
		//入力の型によって処理を分岐
		switch (pin->IN1->Type)
		{
		case D_BOOL:
			*pin->OUT->pBool = *pin->IN1->pBool;
			break;
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
/// <summary>
/// （論理積）入力 IN1 と IN2の否定値 との論理積を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPEN_API void ANDN_EN(PVOID instance)
{
	struct ANDN_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定値との論理積
	} *pin = (struct ANDN_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ANDN(pin->IN1, pin->IN2, NULL, NULL);
		//入力の型によって処理を分岐
		switch (pin->IN1->Type)
		{
		case D_BOOL:
			*pin->OUT->pBool = *pin->IN1->pBool;
			break;
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
/// <summary>
/// （論理積）入力 IN1 と IN2の否定値 との論理和を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPEN_API void ORN_EN(PVOID instance)
{
	struct ORN_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定値との論理和
	} *pin = (struct ORN_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ORN(pin->IN1, pin->IN2, NULL, NULL);
		//入力の型によって処理を分岐
		switch (pin->IN1->Type)
		{
		case D_BOOL:
			*pin->OUT->pBool = *pin->IN1->pBool;
			break;
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
/// <summary>
/// （排他的論理和）入力 IN1 と IN2の否定値 との排他的論理和を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPEN_API void XORN_EN(PVOID instance)
{
	struct XORN_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定値との排他的論理和
	} *pin = (struct XORN_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		XORN(pin->IN1, pin->IN2, NULL, NULL);
		//入力の型によって処理を分岐
		switch (pin->IN1->Type)
		{
		case D_BOOL:
			*pin->OUT->pBool = *pin->IN1->pBool;
			break;
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

PLCPEN_API void AND_BOOL_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の論理積
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		AND_BOOL(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void AND_BYTE_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の論理積
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		AND_BYTE(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pByte = *pin->IN1->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void AND_WORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の論理積
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		AND_WORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pWord = *pin->IN1->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void AND_DWORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の論理積
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		AND_DWORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pDword = *pin->IN1->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void ANDN_BOOL_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定値の論理積
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ANDN_BOOL(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void ANDN_BYTE_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定値の論理積
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ANDN_BYTE(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pByte = *pin->IN1->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void ANDN_WORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定値の論理積
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ANDN_WORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pWord = *pin->IN1->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void ANDN_DWORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定値の論理積
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ANDN_DWORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pDword = *pin->IN1->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void NOT_BOOL_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INの否定
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		NOT_BOOL(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pBool = *pin->IN->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void NOT_BYTE_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INの否定
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		NOT_BYTE(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pByte = *pin->IN->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void NOT_WORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INの否定
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		NOT_WORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pWord = *pin->IN->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void NOT_DWORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		// 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INの否定
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		NOT_DWORD(pin->IN, NULL, NULL, NULL);
		*pin->OUT->pDword = *pin->IN->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void OR_BOOL_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		OR_BOOL(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void OR_BYTE_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		OR_BYTE(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pByte = *pin->IN1->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void OR_WORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		OR_WORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pWord = *pin->IN1->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void OR_DWORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		OR_DWORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pDword = *pin->IN1->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void ORN_BOOL_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定の論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ORN_BOOL(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void ORN_BYTE_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定の論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ORN_BYTE(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pByte = *pin->IN1->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void ORN_WORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定の論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ORN_WORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pWord = *pin->IN1->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void ORN_DWORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定の論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ORN_DWORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pDword = *pin->IN1->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void XOR_BOOL_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の排他的論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		XOR_BOOL(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void XOR_BYTE_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の排他的論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		XOR_BYTE(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pByte = *pin->IN1->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void XOR_WORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の排他的論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		XOR_WORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pWord = *pin->IN1->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void XOR_DWORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の排他的論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		XOR_DWORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pDword = *pin->IN1->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void XORN_BOOL_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定の排他的論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		XORN_BOOL(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pBool = *pin->IN1->pBool;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void XORN_BYTE_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定の排他的論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		XORN_BYTE(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pByte = *pin->IN1->pByte;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void XORN_WORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定の排他的論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		XORN_WORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pWord = *pin->IN1->pWord;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}

PLCPEN_API void XORN_DWORD_EN(PVOID instance)
{
	struct LOGIC_OPE_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN1;		// 入力1
		P_ANY		IN2;        // 入力2
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// IN1とIN2の否定の排他的論理和
	} *pin = (struct LOGIC_OPE_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		XORN_DWORD(pin->IN1, pin->IN2, NULL, NULL);
		*pin->OUT->pDword = *pin->IN1->pDword;
	}
	// ENOはENをそのまま設定
	pin->ENO = pin->EN;
}