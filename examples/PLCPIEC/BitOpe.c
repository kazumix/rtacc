#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

/*
* ビット操作：単一ビット値読み取り
*/
PLCPIEC_API P_ANY BIT_TEST(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DWORD mask = 0x01;
	T_DWORD tmp = 0x00;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がANY_BITか？
	switch (a1->Type)
	{
	case D_BYTE:
	case D_WORD:
	case D_DWORD:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "BIT_TEST:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	//a2がSINTか？
	switch (a2->Type)
	{
	case D_SINT:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "BIT_TEST:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif
	// ビットの取得位置が正の場合
	if (*a2->pSint >= 0)
	{
		mask = mask << *a2->pSint; // マスク位置を計算
		// マスク対象の型で分岐
		// 各型のビットの取得位置がビットサイズ範囲内であればマスク、そうでなければ0をセット
		switch (a1->Type)
		{
		case D_SINT:
		case D_USINT:
		case D_BYTE:	// BYTE型
			if (*a2->pSint < 8)
				tmp = (T_DWORD)(*a1->pByte  & mask);
			else
				tmp = 0;
			break;
		case D_INT:
		case D_WORD:
		case D_UINT:	// WORD型
			if (*a2->pSint < 16)
				tmp = (T_DWORD)(*a1->pWord  & mask);
			else
				tmp = 0;
			break;
		case D_DINT:
		case D_DWORD:
		case D_UDINT:	// DWORD型
			if (*a2->pSint < 32)
				tmp = (T_DWORD)(*a1->pDword & mask);
			else
				tmp = 0;
			break;
		default:
			tmp = 0;
			break;
		}
		if (tmp > 0)
			*a1->pBool = TRUE;
		else
			*a1->pBool = FALSE;
	}
	else
		*a1->pBool = FALSE;
	// 戻り値の型をBOOLに指定
	a1->Type = D_BOOL;

	return a1;
}

/*
* ビット操作：1文字抽出
*/
PLCPIEC_API P_ANY GET_CHAR(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	char tmp = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がSTRINGか？
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "GET_CHAR:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	if(a2->Type != D_INT)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "GET_CHAR:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif

	// 抽出する文字の位置がマイナスの場合
	if (*a2->pInt < 0)
		*a1->pInt = 0;
	// 抽出する文字の位置が文字列の長さよりも大きい場合
	else if (*a2->pInt > a1->pString->length)
		*a1->pInt = 0;
	// 入力文字列が空の場合
	else if(a1->pString->length == 0)
		*a1->pInt = 0;
	// 通常処理
	else
	{
		tmp = a1->pString->string[(*a2->pInt - 1)];
		*a1->pInt = (T_INT)tmp;
	}

	a1->Type = D_INT;
	
	return a1;
}

/*
* ビット操作：下位ビット読取り
*/
PLCPIEC_API P_ANY GET_LSB(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がWORDか？
	if (a1->Type != D_WORD)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "GET_LSB:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	a1->Type = D_BYTE;
	*a1->pByte = (T_BYTE)(*a1->pWord & 0x00FF);

	return a1;
}

/*
* ビット操作：上位ビット読取り
*/
PLCPIEC_API P_ANY GET_MSB(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がWORDか？
	if (a1->Type != D_WORD)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "GET_MSB:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	a1->Type = D_BYTE;
	*a1->pByte = (T_BYTE)((*a1->pWord & 0xFF00) >> 8);

	return a1;
}

/*
* ビット操作：1ビット反転(BYTE)
*/
PLCPIEC_API P_ANY I_BIT_IN_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE reverse = 0x01;
	T_BYTE tmp = 0;

	tmp = *a2->pByte;
	reverse = (reverse << *a3->pSint);
	tmp = tmp ^ reverse;

	a1->Type = D_BYTE;
	*a1->pByte = tmp;

	return a1;
}

/*
* ビット操作：1ビット反転(WORD)
*/
PLCPIEC_API P_ANY I_BIT_IN_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_WORD tmp = 0;
	T_WORD reverse = 0x0001;

	tmp = *a2->pWord;
	reverse = (reverse << *a3->pSint);
	tmp = tmp ^ reverse;

	a1->Type = D_WORD;
	*a1->pWord = tmp;

	return a1;
}

/*
* ビット操作：1ビット反転(DWORD)
*/
PLCPIEC_API P_ANY I_BIT_IN_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DWORD tmp = 0;
	T_DWORD reverse = 0x00000001;

	tmp = *a2->pDword;
	reverse = (reverse << *a3->pSint);
	tmp = tmp ^ reverse;

	a1->Type = D_DWORD;
	*a1->pDword = tmp;

	return a1;
}

/*
* ビット操作：1ビット反転
*/
PLCPIEC_API P_ANY I_BIT_IN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	if(a1->Type != D_BOOL)
	{	//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "I_BIT_IN:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 関数実行信号が立っていない場合
	if (*a1->pBool == FALSE)
		return a1;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a2がANY_BITか？
	switch (a2->Type)
	{
	case D_BYTE:
	case D_WORD:
	case D_DWORD:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "I_BIT_IN:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
	//a3がSINTか？
	if(a3->Type != D_SINT)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "I_BIT_IN:Data type unsuitable: a3");	//パラメータエラー発生
		return a1;
	}
#endif

	// ビット反転位置がマイナスでない場合
	if (*a3->pSint >= 0)
	{
		switch (a2->Type)
		{
		case D_USINT:
		case D_SINT:
		case D_BYTE:  
			I_BIT_IN_BYTE (a1, a2, a3, a4); 
			break;
		case D_INT:
		case D_UINT:
		case D_WORD:  
			I_BIT_IN_WORD (a1, a2, a3, a4); 
			break;
		case D_DINT:
		case D_UDINT:
		case D_DWORD: 
			I_BIT_IN_DWORD(a1, a2, a3, a4); 
			break;
		}
	}

	return a1;
}

/*
* ビット操作：パリティ偶奇判定(BYTE)
*/
PLCPIEC_API P_ANY PARITY_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{		

	*a1->pByte = *a1->pByte ^ (*a1->pByte >> 4);
	*a1->pByte = *a1->pByte ^ (*a1->pByte >> 2);
	*a1->pByte = *a1->pByte ^ (*a1->pByte >> 1);
	*a1->pBool = (T_BOOL)*a1->pByte & 0x01;

	*a1->pBool = !(*a1->pBool);
	a1->Type = D_BOOL;
	return a1;
}
/*
* ビット操作：パリティ偶奇判定(WORD)
*/
PLCPIEC_API P_ANY PARITY_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pWord = *a1->pWord  ^ (*a1->pWord >> 8);
	*a1->pWord = *a1->pWord  ^ (*a1->pWord >> 4);
	*a1->pWord = *a1->pWord  ^ (*a1->pWord >> 2);
	*a1->pWord = *a1->pWord  ^ (*a1->pWord >> 1);
	*a1->pBool = (T_BOOL)*a1->pWord & 0x0001;

	*a1->pBool = !(*a1->pBool);
	a1->Type = D_BOOL;
	return a1;
}
/*
* ビット操作：パリティ偶奇判定(DWORD)
*/
PLCPIEC_API P_ANY PARITY_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pDword = *a1->pDword ^ (*a1->pDword >> 16);
	*a1->pDword = *a1->pDword ^ (*a1->pDword >> 8);
	*a1->pDword = *a1->pDword ^ (*a1->pDword >> 4);
	*a1->pDword = *a1->pDword ^ (*a1->pDword >> 2);
	*a1->pDword = *a1->pDword ^ (*a1->pDword >> 1);
	*a1->pBool = (T_BOOL)*a1->pDword & 0x0001;

	*a1->pBool = !(*a1->pBool);
	a1->Type = D_BOOL;
	return a1;
}
/*
* ビット操作：パリティ偶奇判定
* 　　　　　　奇数 FALSE 偶数 TRUE
*/
PLCPIEC_API P_ANY PARITY(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がANY_BITか？
	switch (a1->Type)
	{
	case D_BYTE:
	case D_WORD:
	case D_DWORD:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "PARITY:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	switch (a1->Type)
	{
	case D_SINT:
	case D_USINT:
	case D_BYTE:  
		PARITY_BYTE (a1, a2, a3, a4); 
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:  
		PARITY_WORD (a1, a2, a3, a4); 
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD: 
		PARITY_DWORD(a1, a2, a3, a4); 
		break;
	}

	return a1;
}

/*
* ビット操作：1ビットリセット(BYTE)
*/
PLCPIEC_API P_ANY R_BIT_IN_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE tmp = 0;
	T_BYTE reset = 0x01;

	tmp = *a2->pByte;
	reset = reset << *a3->pSint;
	tmp = tmp & (0xFF ^ reset);

	a1->Type = D_BYTE;
	*a1->pByte = tmp;

	return a1;
}

/*
* ビット操作：1ビットリセット(WORD)
*/
PLCPIEC_API P_ANY R_BIT_IN_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_WORD tmp = 0;
	T_WORD reset = 0x0001;

	tmp = *a2->pWord;
	reset = reset << *a3->pSint;
	tmp = tmp & (0xFFFF ^ reset);

	a1->Type = D_WORD;
	*a1->pWord = tmp;

	return a1;
}

/*
* ビット操作：1ビットリセット(DWORD)
*/
PLCPIEC_API P_ANY R_BIT_IN_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DWORD tmp = 0;
	T_DWORD reset = 0x00000001;

	tmp = *a2->pDword;
	reset = reset << *a3->pSint;
	tmp = tmp & (0xFFFFFFFF ^ reset);

	a1->Type = D_DWORD;
	*a1->pDword = tmp;

	return a1;
}

/*
* ビット操作：1ビットリセット
*/
PLCPIEC_API P_ANY R_BIT_IN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	if (a1->Type != D_BOOL)
	{	//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "R_BIT_IN:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 関数実行信号が立っていない場合
	if (*a1->pBool == FALSE)
		return a1;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a2がANY_BITか？
	switch (a2->Type)
	{
	case D_BYTE:
	case D_WORD:
	case D_DWORD:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "R_BIT_IN:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
	//a3がSINTか？
	if (a3->Type != D_SINT)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "R_BIT_IN:Data type unsuitable: a3");	//パラメータエラー発生
		return a1;
	}
#endif
	// ビットリセット位置がマイナスでない場合
	if (*a3->pSint >= 0)
	{
		switch (a2->Type)
		{
		case D_SINT:
		case D_USINT:
		case D_BYTE:  
			R_BIT_IN_BYTE (a1, a2, a3, a4); 
			break;
		case D_INT:
		case D_UINT:
		case D_WORD:  
			R_BIT_IN_WORD (a1, a2, a3, a4); 
			break;
		case D_DINT:
		case D_UDINT:
		case D_DWORD: 
			R_BIT_IN_DWORD(a1, a2, a3, a4); 
			break;
		}
	}

	return a1;
}

/*
* ビット操作：1ビットセット(BYTE)
*/
PLCPIEC_API P_ANY S_BIT_IN_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE tmp = 0;
	T_BYTE set = 0x01;

	tmp = *a2->pByte;
	set = set << *a3->pSint;
	tmp = tmp | set;

	a1->Type = D_BYTE;
	*a1->pByte = tmp;

	return a1;
}

/*
* ビット操作：1ビットセット(WORD)
*/
PLCPIEC_API P_ANY S_BIT_IN_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_WORD tmp = 0;
	T_WORD set = 0x0001;
	
	tmp = *a2->pWord;
	set = set << *a3->pSint;
	tmp = tmp | set;

	a1->Type = D_WORD;
	*a1->pWord = tmp;

	return a1;
}

/*
* ビット操作：1ビットセット(DWORD)
*/
PLCPIEC_API P_ANY S_BIT_IN_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DWORD tmp = 0;
	T_DWORD set = 0x00000001;

	tmp = *a2->pDword;
	set = set << *a3->pSint;
	tmp = *a2->pDword | set;

	a1->Type = D_DWORD;
	*a1->pDword = tmp;

	return a1;
}

/*
* ビット操作：1ビットセット
*/
PLCPIEC_API P_ANY S_BIT_IN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	if (a1->Type != D_BOOL)
	{	//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "S_BIT_IN:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 関数実行信号が立っていない場合
	if (*a1->pBool == FALSE)
		return a1;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a2がANY_BITか？
	switch (a2->Type)
	{
	case D_BYTE:
	case D_WORD:
	case D_DWORD:
		break;
	default:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "S_BIT_IN:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
	//a3がSINTか？
	if (a3->Type != D_SINT)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "S_BIT_IN:Data type unsuitable: a3");	//パラメータエラー発生
		return a1;
	}
#endif

	// ビットセット位置がマイナスでない場合
	if (*a3->pSint >= 0)
	{
		switch (a2->Type)
		{
		case D_SINT:
		case D_USINT:
		case D_BYTE:  
			S_BIT_IN_BYTE (a1, a2, a3, a4); 
			break;
		case D_INT:
		case D_UINT:
		case D_WORD:  
			S_BIT_IN_WORD (a1, a2, a3, a4); 
			break;
		case D_DINT:
		case D_UDINT:
		case D_DWORD: 
			S_BIT_IN_DWORD(a1, a2, a3, a4); 
			break;
		}
	}

	return a1;
}

/*
* ビット操作：下位ビットセット
*/
PLCPIEC_API P_ANY SET_LSB(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_WORD tmp = 0;

#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がBYTEか？
	if (a1->Type != D_BYTE)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SET_LSB:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	//a2がWORDか？
	if (a2->Type != D_WORD)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SET_LSB:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}

#endif
	tmp = *a2->pWord;
	tmp = tmp & 0xFF00;
	tmp = tmp | *a1->pByte;

	a1->Type = D_WORD;
	*a1->pWord = tmp;

	return a1;
}

/*
* ビット操作：上位ビットセット
*/
PLCPIEC_API P_ANY SET_MSB(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_WORD tmp = 0;
	T_WORD work = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がBYTEか？
	if (a1->Type != D_BYTE)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SET_LSB:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	//a2がWORDか？
	if (a2->Type != D_WORD)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SET_LSB:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}

#endif

	tmp = *a2->pWord;
	tmp = tmp & 0x00FF;
	work = (*a1->pByte << 8);
	tmp = tmp | work;

	a1->Type = D_WORD;
	*a1->pWord = tmp;

	return a1;
}

/*
* ビット操作：文字列のバイト配列へのコピー
*/
PLCPIEC_API P_ANY STRING_TO_BUFFER(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がSTRINGか？
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_BUFFER:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	//a2がBYTEか？
	if (a2->Type != D_BYTE)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_BUFFER:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
	//a3がINTか？
	if (a2->Type != D_INT)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_BUFFER:Data type unsuitable: a3");	//パラメータエラー発生
		return a1;
	}
#endif

	if(a1->pString->length == 0)		// コピー元文字列の長さが0の場合
		*a1->pInt = 14;
	else if(a2->pArray->length == 0)	// コピー先バイト配列の長さが0の場合
		*a1->pInt = 14;
	else if (*a3->pInt <= 0)			// コピーサイズ指定がマイナス値の場合
		*a1->pInt = 10;
	else if(*a3->pInt > a1->pString->length)	// コピーサイズ指定がコピー元文字列より大きい場合
		*a1->pInt = 11;
	else if (*a3->pInt > a2->pString->length)	// コピーサイズ指定がコピー先文字列より大きい場合
		*a1->pInt = 14;
	else
	{
		memcpy(a2->pArray->array, a1->pString->string, *a3->pInt);
		*a1->pInt = 0;
	}

	return a1;
}

/*
* ビット操作：MSBとLSBを入れ替える
*/
PLCPIEC_API P_ANY SWAP(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_WORD work = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//a1がSTRINGか？
	if (a1->Type != D_WORD)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SWAP:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif

	work = *a1->pWord >> 8;
	*a1->pWord = (*a1->pWord << 8) | work;

	return a1;
}
