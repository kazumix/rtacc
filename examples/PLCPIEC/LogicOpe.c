#include <stdio.h>
#include <stdlib.h>

#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

PLCPIEC_API P_ANY AND_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pBool = *a1->pBool & *a2->pBool;
	return a1; 
}
PLCPIEC_API P_ANY AND_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pByte = *a1->pByte & *a2->pByte;
	return a1;
}
PLCPIEC_API P_ANY AND_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pWord = *a1->pWord & *a2->pWord;
	return a1;
}
PLCPIEC_API P_ANY AND_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pDword = *a1->pDword & *a2->pDword;
	return a1;
}
/// <summary>
/// （論理積）入力 IN1 と IN2 の論理積を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY AND(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型が演算対象のビット列か？
	if (!((a1->Type == D_BOOL) || (a1->Type == D_BYTE) || (a1->Type == D_WORD) || (a1->Type == D_DWORD)))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "AND:invalid data type");	//パラメータエラー発生
		return a1;
	}
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "AND:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif	
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)
	MaskBitfield(a2);	// ビット指定処理(第2パラメータ)

	switch (a1->Type)
	{
	case D_BOOL:  AND_BOOL(a1, a2, a3, a4); break;
	case D_SINT:
	case D_USINT:
	case D_BYTE:
		AND_BYTE(a1, a2, a3, a4); 
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:  
		AND_WORD(a1, a2, a3, a4); 
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD: 
		AND_DWORD(a1, a2, a3, a4); 
		break;
	}
	//演算結果を返す
	return a1;
}

PLCPIEC_API P_ANY NOT_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pBool = (T_BOOL)(~(*a1->pBool) & 0x01); // 最下位ビットのみ返す
	return a1;
}
PLCPIEC_API P_ANY NOT_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pByte = ~(*a1->pByte);
	return a1;
}
PLCPIEC_API P_ANY NOT_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pWord = ~(*a1->pWord);
	return a1;
}
PLCPIEC_API P_ANY NOT_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pDword = ~(*a1->pDword);
	return a1;
}
/// <summary>
/// （論理否定）入力 IN1 の論理否定を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY NOT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型が演算対象のビット列か？
	if (!((a1->Type == D_BOOL) || (a1->Type == D_BYTE) || (a1->Type == D_WORD) || (a1->Type == D_DWORD)))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "NOT:invalid data type");	//パラメータエラー発生
		return a1;
	}
#endif
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)

	switch (a1->Type)
	{
	case D_BOOL:  NOT_BOOL (a1, a2, a3, a4); break;
	case D_SINT:
	case D_USINT:
	case D_BYTE:  
		NOT_BYTE (a1, a2, a3, a4); 
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:  
		NOT_WORD (a1, a2, a3, a4); 
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD: 
		NOT_DWORD(a1, a2, a3, a4); 
		break;
	}
	//演算結果を返す
	return a1;
}

PLCPIEC_API P_ANY OR_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pBool = *a1->pBool | *a2->pBool;
	return a1;
}
PLCPIEC_API P_ANY OR_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pByte = *a1->pByte | *a2->pByte;
	return a1;
}
PLCPIEC_API P_ANY OR_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pWord = *a1->pWord | *a2->pWord;
	return a1;
}
PLCPIEC_API P_ANY OR_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pDword = *a1->pDword | *a2->pDword;
	return a1;
}
/// <summary>
/// （論理和）入力 IN1 と IN2 の論理和を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY OR(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型が演算対象のビット列か？
	if (!((a1->Type == D_BOOL) || (a1->Type == D_BYTE) || (a1->Type == D_WORD) || (a1->Type == D_DWORD)))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "OR:invalid data type");	//パラメータエラー発生
		return a1;
	}
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "OR:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)
	MaskBitfield(a2);	// ビット指定処理(第2パラメータ)

	switch (a1->Type)
	{
	case D_BOOL:  OR_BOOL (a1, a2, a3, a4); break;
	case D_SINT:
	case D_USINT:
	case D_BYTE:  
		OR_BYTE (a1, a2, a3, a4); 
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:  
		OR_WORD (a1, a2, a3, a4); 
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD: 
		OR_DWORD(a1, a2, a3, a4); 
		break;
	}
	//演算結果を返す
	return a1;
}

PLCPIEC_API P_ANY XOR_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pBool = *a1->pBool ^ *a2->pBool;
	return a1;
}
PLCPIEC_API P_ANY XOR_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pByte = *a1->pByte ^ *a2->pByte;
	return a1;
}
PLCPIEC_API P_ANY XOR_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pWord = *a1->pWord ^ *a2->pWord;
	return a1;
}
PLCPIEC_API P_ANY XOR_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	*a1->pDword = *a1->pDword ^ *a2->pDword;
	return a1;
}
/// <summary>
/// （排他的論理和）入力 IN1 と IN2 の排他的論理和を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY XOR(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型が演算対象のビット列か？
	if (!((a1->Type == D_BOOL) || (a1->Type == D_BYTE) || (a1->Type == D_WORD) || (a1->Type == D_DWORD)))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "XOR:invalid data type");	//パラメータエラー発生
		return a1;
	}
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "XOR:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)
	MaskBitfield(a2);	// ビット指定処理(第2パラメータ)

	switch (a1->Type)
	{
	case D_BOOL:  XOR_BOOL (a1, a2, a3, a4); break;
	case D_SINT:
	case D_USINT:
	case D_BYTE:  
		XOR_BYTE (a1, a2, a3, a4); 
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:  
		XOR_WORD (a1, a2, a3, a4); 
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD: 
		XOR_DWORD(a1, a2, a3, a4); 
		break;
	}
	//演算結果を返す
	return a1;
}

PLCPIEC_API P_ANY ANDN_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BOOL tmp = ~(*a2->pBool);
	*a1->pBool = (T_BOOL)((*a1->pBool & tmp) & 0x01); // 最下位ビットのみを返す
	return a1;
}

PLCPIEC_API P_ANY ANDN_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE tmp = ~(*a2->pByte);
	*a1->pByte = *a1->pByte & tmp;
	return a1;
}
PLCPIEC_API P_ANY ANDN_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_WORD tmp = ~(*a2->pWord);
	*a1->pWord = *a1->pWord & tmp;
	return a1;
}
PLCPIEC_API P_ANY ANDN_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DWORD tmp = ~(*a2->pDword);
	*a1->pDword = *a1->pDword & tmp;
	return a1;
}
/// <summary>
/// （論理積）入力 IN1 と IN2の否定値 との論理積を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY ANDN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型が演算対象のビット列か？
	if (!((a1->Type == D_BOOL) || (a1->Type == D_BYTE) || (a1->Type == D_WORD) || (a1->Type == D_DWORD)))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "ANDN:invalid data type");	//パラメータエラー発生
		return a1;
	}
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "ANDN:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif	
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)
	MaskBitfield(a2);	// ビット指定処理(第2パラメータ)

	switch (a1->Type)
	{
	case D_BOOL:  ANDN_BOOL(a1, a2, a3, a4); break;
	case D_SINT:
	case D_USINT:
	case D_BYTE:  
		ANDN_BYTE(a1, a2, a3, a4); 
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:  
		ANDN_WORD(a1, a2, a3, a4); 
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD: 
		ANDN_DWORD(a1, a2, a3, a4); 
		break;
	}
	//演算結果を返す
	return a1;
}

PLCPIEC_API P_ANY ORN_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BOOL tmp = ~(*a2->pBool);
	*a1->pBool = (T_BOOL)((*a1->pBool | tmp) & 0x01);	// 最下位1ビットだけを返す
	return a1;
}

PLCPIEC_API P_ANY ORN_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE tmp = ~(*a2->pByte);
	*a1->pByte = *a1->pByte | tmp;
	return a1;
}
PLCPIEC_API P_ANY ORN_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_WORD tmp = ~(*a2->pWord);
	*a1->pWord = *a1->pWord | tmp;
	return a1;
}
PLCPIEC_API P_ANY ORN_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DWORD tmp = ~(*a2->pDword);
	*a1->pDword = *a1->pDword | tmp;
	return a1;
}

/// <summary>
/// （論理和）入力 IN1 と IN2の否定値 との論理和を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY ORN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型が演算対象のビット列か？
	if (!((a1->Type == D_BOOL) || (a1->Type == D_BYTE) || (a1->Type == D_WORD) || (a1->Type == D_DWORD)))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "ORN:invalid data type");	//パラメータエラー発生
		return a1;
	}
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "ORN:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif	
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)
	MaskBitfield(a2);	// ビット指定処理(第2パラメータ)

	switch (a1->Type)
	{
	case D_BOOL:  ORN_BOOL(a1, a2, a3, a4); break;
	case D_SINT:
	case D_USINT:
	case D_BYTE:  
		ORN_BYTE(a1, a2, a3, a4); 
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:  
		ORN_WORD(a1, a2, a3, a4); 
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD: 
		ORN_DWORD(a1, a2, a3, a4); 
		break;
	}
	//演算結果を返す
	return a1;
}


PLCPIEC_API P_ANY XORN_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BOOL tmp = ~(*a2->pBool);
	*a1->pBool = (T_BOOL)((*a1->pBool ^ tmp) &0x01);	// 最下位1ビットだけ返す
	return a1;
}

PLCPIEC_API P_ANY XORN_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BYTE tmp = ~(*a2->pByte);
	*a1->pByte = *a1->pByte ^ tmp;
	return a1;
}
PLCPIEC_API P_ANY XORN_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_WORD tmp = ~(*a2->pWord);
	*a1->pWord = *a1->pWord ^ tmp;
	return a1;
}
PLCPIEC_API P_ANY XORN_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_DWORD tmp = ~(*a2->pDword);
	*a1->pDword = *a1->pDword ^ tmp;
	return a1;
}

/// <summary>
/// （排他的論理和）入力 IN1 と IN2の否定値 との排他的論理和を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY XORN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型が演算対象のビット列か？
	if (!((a1->Type == D_BOOL) || (a1->Type == D_BYTE) || (a1->Type == D_WORD) || (a1->Type == D_DWORD)))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "XORN:invalid data type");	//パラメータエラー発生
		return a1;
	}
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "XORN:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif	
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)
	MaskBitfield(a2);	// ビット指定処理(第2パラメータ)

	switch (a1->Type)
	{
	case D_BOOL:  XORN_BOOL(a1, a2, a3, a4); break;
	case D_SINT:
	case D_USINT:
	case D_BYTE:  
		XORN_BYTE(a1, a2, a3, a4); 
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:  
		XORN_WORD(a1, a2, a3, a4); 
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD: 
		XORN_DWORD(a1, a2, a3, a4); 
		break;
	}
	//演算結果を返す
	return a1;
}
