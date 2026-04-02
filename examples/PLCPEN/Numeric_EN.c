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
* 数値型の絶対値を返す
*/
PLCPEN_API void ABS_EN(PVOID instance)
{
	struct NUMERIC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// INの絶対値
	} *pin = (struct NUMERIC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ABS(pin->IN, NULL, NULL, NULL);	// ABS呼出

		if (pin->ENO = GetNumericEno())	// ABS実行結果ENO設定
		{
			switch (pin->IN->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN->pLreal;	break;
			case D_SINT:	*pin->OUT->pSint = *pin->IN->pSint;	break;
			case D_INT:		*pin->OUT->pInt = *pin->IN->pInt;	break;
			case D_DINT:	*pin->OUT->pDint = *pin->IN->pDint;	break;
			case D_LINT:	*pin->OUT->pLint = *pin->IN->pLint;	break;
			case D_USINT:	*pin->OUT->pUsint = *pin->IN->pUsint;	break;
			case D_UINT:	*pin->OUT->pUint = *pin->IN->pUint;	break;
			case D_UDINT:
			case D_TIME:	*pin->OUT->pUdint = *pin->IN->pUdint;	break;
			case D_ULINT:	*pin->OUT->pUlint = *pin->IN->pUlint;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 正弦演算を行います。
*/
PLCPEN_API void SIN_EN(PVOID instance)
{
	struct NUMERIC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 正弦演算結果
	} *pin = (struct NUMERIC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SIN(pin->IN, NULL, NULL, NULL);	// SIN呼出

		if (pin->ENO = GetNumericEno())	// SIN実行結果ENO設定
		{
			switch (pin->IN->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN->pLreal;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 余弦演算を行います。
*/
PLCPEN_API void COS_EN(PVOID instance)
{
	struct NUMERIC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 余弦演算結果
	} *pin = (struct NUMERIC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		COS(pin->IN, NULL, NULL, NULL);	// COS呼出

		if (pin->ENO = GetNumericEno())	// COS実行結果ENO設定
		{
			switch (pin->IN->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN->pLreal;	break;
			}
		}			
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 正接演算を行います。
*/
PLCPEN_API void TAN_EN(PVOID instance)
{
	struct NUMERIC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 正接演算結果
	} *pin = (struct NUMERIC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		TAN(pin->IN, NULL, NULL, NULL);	// TAN呼出

		if (pin->ENO = GetNumericEno())	// TAN実行結果ENO設定
		{
			switch (pin->IN->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN->pLreal;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 逆正弦演算を行います。
*/
PLCPEN_API void ASIN_EN(PVOID instance)
{
	struct NUMERIC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 逆正弦演算結果
	} *pin = (struct NUMERIC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ASIN(pin->IN, NULL, NULL, NULL);	// ASIN呼出

		if (pin->ENO = GetNumericEno())	// ASIN実行結果ENO設定
		{
			switch (pin->IN->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN->pLreal;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 逆余弦演算を行います。
*/
PLCPEN_API void ACOS_EN(PVOID instance)
{
	struct NUMERIC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 逆余弦演算結果
	} *pin = (struct NUMERIC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ACOS(pin->IN, NULL, NULL, NULL);	// ACOS呼出

		if (pin->ENO = GetNumericEno())	// ACOS実行結果ENO設定
		{
			switch (pin->IN->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN->pLreal;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* REAL値の逆正接演算を行います。
*/
PLCPEN_API void ATAN_EN(PVOID instance)
{
	struct NUMERIC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 逆正接演算結果
	} *pin = (struct NUMERIC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		ATAN(pin->IN, NULL, NULL, NULL);	// ATAN呼出

		if (pin->ENO = GetNumericEno())	// ATAN実行結果ENO設定
		{
			switch (pin->IN->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN->pLreal;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 自然指数関数を行います。
*/
PLCPEN_API void EXP_EN(PVOID instance)
{
	struct NUMERIC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 自然指数演算結果
	} *pin = (struct NUMERIC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		EXP(pin->IN, NULL, NULL, NULL);	// EXP呼出

		if (pin->ENO = GetNumericEno())	// EXP実行結果ENO設定
		{
			switch (pin->IN->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN->pLreal;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 自然対数演算を行います。
*/
PLCPEN_API void LN_EN(PVOID instance)
{
	struct NUMERIC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 自然対数演算結果
	} *pin = (struct NUMERIC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LN(pin->IN, NULL, NULL, NULL);	// LN呼出

		if (pin->ENO = GetNumericEno())	// LN実行結果ENO設定
		{
			switch (pin->IN->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN->pLreal;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 常用対数演算を行います。
*/
PLCPEN_API void LOG_EN(PVOID instance)
{
	struct NUMERIC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 常用対数演算結果
	} *pin = (struct NUMERIC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		LOG(pin->IN, NULL, NULL, NULL);	// LOG呼出

		if (pin->ENO = GetNumericEno())	// LOG実行結果ENO設定
		{
			switch (pin->IN->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN->pLreal;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}

/*
* 平方根演算を行います。
*/
PLCPEN_API void SQRT_EN(PVOID instance)
{
	struct NUMERIC_PIN
	{
		T_BOOL		EN;			// 実行フラグ
		P_ANY		IN;		    // 入力
		T_BOOL		ENO;		// 実行フラグ(出力)
		P_ANY		OUT;		// 平方根演算結果
	} *pin = (struct NUMERIC_PIN*)instance;

	// 実行フラグONの場合
	if (pin->EN)
	{
		SQRT(pin->IN, NULL, NULL, NULL);	// SQRT呼出

		if (pin->ENO = GetNumericEno())	// SQRT実行結果ENO設定
		{
			switch (pin->IN->Type)
			{
				// データ型に応じて結果をキャストして格納
			case D_REAL:	*pin->OUT->pReal = *pin->IN->pReal;	break;
			case D_LREAL:	*pin->OUT->pLreal = *pin->IN->pLreal;	break;
			}
		}				
	}
	else	// 実行フラグOFFの場合
		pin->ENO = FALSE;	// ENOは常にFALSE
}