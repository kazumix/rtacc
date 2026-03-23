#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

T_BOOL STAT_ENO_SELECT;	// SELECT用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// Select処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetSelectEno(T_BOOL eno)
{
	STAT_ENO_SELECT = eno;
}

/// <summary>
/// Select処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetSelectEno()
{
	return STAT_ENO_SELECT;
}

//
// 選択ファンクション実装
//
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (BOOL型用)
*/
PLCPIEC_API P_ANY LIMIT_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_BOOL min, max, val;

	min = *a1->pBool;	// 下限値
	max = *a3->pBool;	// 上限値

	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pBool = *a2->pBool;
		return a1;		// 何もしない
	}
	val = *a2->pBool;	// 判定する値

	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_BOOL;
	*a1->pBool = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (BYTE型用)
*/
PLCPIEC_API P_ANY LIMIT_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_BYTE min, max, val;

	min = *a1->pByte;	// 下限値
	max = *a3->pByte;	// 上限値

	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pByte = *a2->pByte;
		return a1;		// 何もしない
	}
	val = *a2->pByte;	// 判定する値

	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_BYTE;
	*a1->pByte = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (WORD型用)
*/
PLCPIEC_API P_ANY LIMIT_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_WORD min, max, val;

	min = *a1->pWord;	// 下限値
	max = *a3->pWord;	// 上限値

	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pWord = *a2->pWord;
		return a1;		// 何もしない
	}
	val = *a2->pWord;	// 判定する値

	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_WORD;
	*a1->pWord = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (WORD型用)
*/
PLCPIEC_API P_ANY LIMIT_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_DWORD min, max, val;

	min = *a1->pDword;	// 下限値
	max = *a3->pDword;	// 上限値

	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pDword = *a2->pDword;
		return a1;		// 何もしない
	}
	val = *a2->pDword;	// 判定する値

	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_DWORD;
	*a1->pDword = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (SINT型用)
*/
PLCPIEC_API P_ANY LIMIT_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_SINT min, max,val;

	min = *a1->pSint;	// 下限値
	max = *a3->pSint;	// 上限値

	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする

		*a1->pSint = *a2->pSint;
		return a1;		// 何もしない
	}
	val = *a2->pSint;	// 判定する値

	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_SINT;
	*a1->pSint = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (INT型用)
*/
PLCPIEC_API P_ANY LIMIT_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_INT min, max, val;

	min = *a1->pInt;	// 下限値
	max = *a3->pInt;	// 上限値

	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする

		*a1->pInt = *a2->pInt;
		return a1;		// 何もしない
	}
	val = *a2->pInt;	// 判定する値

	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_INT;
	*a1->pInt = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (DINT型用)
*/
PLCPIEC_API P_ANY LIMIT_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_DINT min, max, val;

	min = *a1->pDint;	// 下限値
	max = *a3->pDint;	// 上限値

	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする

		*a1->pDint = *a2->pDint;
		return a1;		// 何もしない
	}
	val = *a2->pDint;	// 判定する値

	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_DINT;
	*a1->pDint = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (LINT型用)
*/
PLCPIEC_API P_ANY LIMIT_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_LINT min, max, val;

	min = *a1->pLint;	// 下限値
	max = *a3->pLint;	// 上限値

	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする

		*a1->pLint = *a2->pLint;
		return a1;		// 何もしない
	}
	val = *a2->pLint;	// 判定する値

	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_LINT;
	*a1->pLint = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (USINT型用)
*/
PLCPIEC_API P_ANY LIMIT_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_USINT min, max, val;

	min = *a1->pUsint;	// 下限値
	max = *a3->pUsint;	// 上限値

	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pUsint = *a2->pUsint;
		return a1;		// 何もしない
	}
	val = *a2->pUsint;	// 判定する値

	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_USINT;
	*a1->pUsint = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (UINT型用)
*/
PLCPIEC_API P_ANY LIMIT_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_UINT min, max, val;

	min = *a1->pUint;	// 下限値
	max = *a3->pUint;	// 上限値

	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pUint = *a2->pUint;
		return a1;		// 何もしない
	}
	val = *a2->pUint;	// 判定する値

	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_UINT;
	*a1->pUint = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (UDINT型用)
*/
PLCPIEC_API P_ANY LIMIT_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_UDINT min, max, val;

	min = *a1->pUdint;	// 下限値
	max = *a3->pUdint;	// 上限値

	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pUdint = *a2->pUdint;
		return a1;		// 何もしない
	}
	val = *a2->pUdint;	// 判定する値

	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_UDINT;
	*a1->pUdint = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (TIME型用)
*/
PLCPIEC_API P_ANY LIMIT_TIME(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_TIME min, max, val;

	min = *a1->pTime;	// 下限値
	max = *a3->pTime;	// 上限値

	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pTime = *a2->pTime;
		return a1;		// 何もしない
	}
	val = *a2->pTime;	// 判定する値

	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_TIME;
	*a1->pTime = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (REAL型用)
*/
PLCPIEC_API P_ANY LIMIT_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_REAL min, max, val;

	min = *a1->pReal;	// 下限値
	max = *a3->pReal;	// 上限値
	val = *a2->pReal;	// 判定する値

	// 値が有効か？
	if (ChckREAL(min))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "LIMIT_REAL:Data is invalid: a1");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pReal = *a2->pReal;
		return a1;
	}
	if (ChckREAL(max))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "LIMIT_REAL:Data is invalid: a3");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pReal = *a2->pReal;
		return a1;
	}
	if (ChckREAL(val))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "LIMIT_REAL:Data is invalid: a2");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pReal = *a2->pReal;
		return a1;
	}
	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pReal = *a2->pReal;
		return a1;
	}
	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_REAL;
	*a1->pReal = val;	// 判定結果を戻り値にセット

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (LREAL型用)
*/
PLCPIEC_API P_ANY LIMIT_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_LREAL min, max, val;

	min = *a1->pLreal;	// 下限値
	max = *a3->pLreal;	// 上限値
	val = *a2->pLreal;	// 判定する値

	// 値が有効か？
	if (ChckLREAL(min))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "LIMIT_LREAL:Data is invalid: a1");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pLreal = *a2->pLreal;
		return a1;
	}
	if (ChckLREAL(max))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "LIMIT_LREAL:Data is invalid: a3");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pLreal = *a2->pLreal;
		return a1;
	}
	if (ChckLREAL(val))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "LIMIT_LREAL:Data is invalid: a2");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pLreal = *a2->pLreal;
		return a1;
	}
	if (min > max)		// 下限値が上限値以上の場合
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pLreal = *a2->pLreal;
		return a1;		// 何もしない
	}
	if (val <= min)		// 下限以下の場合
		val = min;		// 下限をセット
	else if (val >= max)	// 上限以上の場合
		val = max;			// 上限をセット

	a1->Type = D_LREAL;
	*a1->pLreal = val;	// 判定結果を戻り値にセット

	return a1;
}

/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
* (STRING型用)
*/
PLCPIEC_API P_ANY LIMIT_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_WORD lenmin, lenmax, lenval;
	char strmin[81] = { 0 };
	char strmax[81] = { 0 };
	char strval[81] = { 0 };
	
	// 下限
	lenmin = a1->pString->length;
	strcpy_s((char*)strmin, lenmin + 1, (char*)a1->pString->string);
	// 判定値
	lenval = a2->pString->length;
	strcpy_s((char*)strval, lenval + 1, (char*)a2->pString->string);
	// 上限
	lenmax = a3->pString->length;
	strcpy_s((char*)strmax, lenmax + 1, (char*)a3->pString->string);
	
	// 文字列の大きさが上限値<下限値の場合
	if (strcmp((char*)strmin, (char*)strmax) > 0 )
	{
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		// 戻り値に""をセット
		a1->pString->length = 0;
		strnset(a1->pString->string, 0, STRING_MAX + 1);
		return a1;
	}
	else
	{
		// 下限値以下の場合
		if (strcmp((char*)strmin, (char*)strval) > 0)
		{
			a1->pString->length = lenmin;
			strcpy_s((char*)a1->pString->string, STRING_MAX + 1, (char*)strmin);
		}
		// 上限値以上の場合
		else if(strcmp((char*)strmax, (char*)strval) < 0)
		{
			a1->pString->length = lenmax;
			strcpy_s((char*)a1->pString->string, STRING_MAX + 1, (char*)strmax);
		}
		// 下限以上上限以下の場合
		else
		{
			a1->pString->length = lenval;
			strcpy_s((char*)a1->pString->string, STRING_MAX + 1, (char*)strval);
		}
	}

	return a1;
}
/*
* 入力値を指定範囲(最小-最大)に含まれるか判定し、範囲外の場合は最小値または最大値を返します
*/
PLCPIEC_API P_ANY LIMIT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 対象データ型か？
	switch (a2->Type)
	{
	case D_BOOL:
	case D_BYTE:
	case D_WORD:
	case D_DWORD:
	case D_LINT:
	case D_USINT:
	case D_UINT:
	case D_UDINT:
	case D_ULINT:
	case D_TIME:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LIMIT:Type invalid");	//パラメータエラー発生
		return a1;
	}
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LIMIT:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
	if (a2->Type != a3->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LIMIT:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
	if (a1->Type != a3->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LIMIT:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)
	MaskBitfield(a2);	// ビット指定処理(第2パラメータ)

	switch (a2->Type)
	{
	case D_BOOL:
		LIMIT_BOOL(a1, a2, a3, a4);
		break;
	case D_BYTE:
		LIMIT_BYTE(a1, a2, a3, a4);
		break;
	case D_WORD:
		LIMIT_WORD(a1, a2, a3, a4);
		break;
	case D_DWORD:
		LIMIT_DWORD(a1, a2, a3, a4);
		break;
	case D_SINT:
		LIMIT_SINT(a1, a2, a3, a4);
		break;
	case D_INT:
		LIMIT_INT(a1, a2, a3, a4);
		break;
	case D_DINT:
		LIMIT_DINT(a1, a2, a3, a4);
		break;
	case D_LINT:
		LIMIT_LINT(a1, a2, a3, a4);
		break;
	case D_USINT:
		LIMIT_USINT(a1, a2, a3, a4);
		break;
	case D_UINT:
		LIMIT_UINT(a1, a2, a3, a4);
		break;
	case D_UDINT:
		LIMIT_UDINT(a1, a2, a3, a4);
		break;
	case D_TIME:
		LIMIT_TIME(a1, a2, a3, a4);
		break;
	case D_REAL:
		LIMIT_REAL(a1, a2, a3, a4);
		break;
	case D_LREAL:
		LIMIT_LREAL(a1, a2, a3, a4);
		break;
	case D_STRING:
		LIMIT_STRING(a1, a2, a3, a4);
		break;
	default:
		Eexception_Post(FUK_PARAMEFER_ERR, "LIMIT:Type invalid");	//パラメータエラー発生
		break;
	}

	return a1;
}

/*
* 2つの入力値のうち、大きい方を返します(BOOL型)
*/
PLCPIEC_API P_ANY MAX_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_BOOL val1, val2;

	val1 = *a1->pBool;
	val2 = *a2->pBool;

	if (val1 >= val2)
		*a1->pBool = val1;
	else
		*a1->pBool = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(BYTE型)
*/
PLCPIEC_API P_ANY MAX_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_BYTE val1, val2;

	val1 = *a1->pByte;
	val2 = *a2->pByte;

	if (val1 >= val2)
		*a1->pByte = val1;
	else
		*a1->pByte = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(WORD型)
*/
PLCPIEC_API P_ANY MAX_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_WORD val1, val2;

	val1 = *a1->pWord;
	val2 = *a2->pWord;

	if (val1 >= val2)
		*a1->pWord = val1;
	else
		*a1->pWord = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(DWORD型)
*/
PLCPIEC_API P_ANY MAX_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_DWORD val1, val2;

	val1 = *a1->pDword;
	val2 = *a2->pDword;

	if (val1 >= val2)
		*a1->pDword = val1;
	else
		*a1->pDword = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(SINT型)
*/
PLCPIEC_API P_ANY MAX_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_SINT val1, val2;
	
	val1 = *a1->pSint;
	val2 = *a2->pSint;

	if (val1 >= val2)
		*a1->pSint = val1;
	else
		*a1->pSint = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(INT型)
*/
PLCPIEC_API P_ANY MAX_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_INT val1, val2;

	val1 = *a1->pInt;
	val2 = *a2->pInt;

	if (val1 >= val2)
		*a1->pInt = val1;
	else
		*a1->pInt = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(DINT型)
*/
PLCPIEC_API P_ANY MAX_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_DINT val1, val2;

	val1 = *a1->pDint;
	val2 = *a2->pDint;

	if (val1 >= val2)
		*a1->pDint = val1;
	else
		*a1->pDint = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(LINT型)
*/
PLCPIEC_API P_ANY MAX_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_LINT val1, val2;

	val1 = *a1->pLint;
	val2 = *a2->pLint;

	if (val1 >= val2)
		*a1->pLint = val1;
	else
		*a1->pLint = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(USINT型)
*/
PLCPIEC_API P_ANY MAX_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_USINT val1, val2;

	val1 = *a1->pUsint;
	val2 = *a2->pUsint;

	if (val1 >= val2)
		*a1->pUsint = val1;
	else
		*a1->pUsint = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(UINT型)
*/
PLCPIEC_API P_ANY MAX_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_UINT val1, val2;

	val1 = *a1->pUint;
	val2 = *a2->pUint;

	if (val1 >= val2)
		*a1->pUint = val1;
	else
		*a1->pUint = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(SINT型)
*/
PLCPIEC_API P_ANY MAX_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_UDINT val1, val2;

	val1 = *a1->pUdint;
	val2 = *a2->pUdint;

	if (val1 >= val2)
		*a1->pUdint = val1;
	else
		*a1->pUdint = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(ULINT型)
*/
PLCPIEC_API P_ANY MAX_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_ULINT val1, val2;

	val1 = *a1->pUlint;
	val2 = *a2->pUlint;

	if (val1 >= val2)
		*a1->pUlint = val1;
	else
		*a1->pUlint = val2;

	return a1;
}

/*
* 2つの入力値のうち、大きい方を返します(TIME型)
*/
PLCPIEC_API P_ANY MAX_TIME(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_TIME val1, val2;

	val1 = *a1->pTime;
	val2 = *a2->pTime;

	if (val1 >= val2)
		*a1->pTime = val1;
	else
		*a1->pTime = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(REAL型)
*/
PLCPIEC_API P_ANY MAX_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_REAL val1, val2;

	val1 = *a1->pReal;
	val2 = *a2->pReal;

	// 値が有効か？
	if (ChckREAL(val1))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "MAX_REAL:Data is invalid: a1");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pReal = *a2->pReal;
		return a1;
	}
	if (ChckREAL(val2))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "MAX_REAL:Data is invalid: a2");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pReal = *a2->pReal;
		return a1;
	}

	if (val1 >= val2)
		*a1->pReal = val1;
	else
		*a1->pReal = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(LREAL型)
*/
PLCPIEC_API P_ANY MAX_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_LREAL val1, val2;

	val1 = *a1->pLreal;
	val2 = *a2->pLreal;

	// 値が有効か？
	if (ChckLREAL(val1))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "MAX_LREAL:Data is invalid: a1");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pLreal = *a2->pLreal;
		return a1;
	}
	if (ChckLREAL(val2))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "MAX_LREAL:Data is invalid: a2");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pLreal = *a2->pLreal;
		return a1;
	}

	if (val1 >= val2)
		*a1->pLreal = val1;
	else
		*a1->pLreal = val2;

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します(LREAL型)
* (STRING型用)
*/
PLCPIEC_API P_ANY MAX_STR(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	// 第2パラメータのほうが大きい場合は第2パラメータの値をコピーする
	// 小さい場合は第1パラメータをそのまま返すので何もしない
	if (strcmp((char*)a1->pString->string, (char*)a2->pString->string) < 0)
	{
		a1->pString->length = a2->pString->length;
		strcpy_s((char*)a1->pString->string, STRING_MAX + 1, (char*)a2->pString->string);
	}

	return a1;
}
/*
* 2つの入力値のうち、大きい方を返します
*/
PLCPIEC_API P_ANY MAX(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 対象データ型か？
	switch (a2->Type)
	{
	case D_BOOL:
	case D_BYTE:
	case D_WORD:
	case D_DWORD:
	case D_TIME:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "MAX:Type invalid");	//パラメータエラー発生
		return a1;
}
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "MAX:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)
	MaskBitfield(a2);	// ビット指定処理(第2パラメータ)

	switch (a2->Type)
	{
	case D_BOOL:
		MAX_BOOL(a1, a2, a3, a4);
		break;
	case D_BYTE:
		MAX_BYTE(a1, a2, a3, a4);
		break;
	case D_WORD:
		MAX_WORD(a1, a2, a3, a4);
		break;
	case D_DWORD:
		MAX_DWORD(a1, a2, a3, a4);
		break;
	case D_SINT:
		MAX_SINT(a1, a2, a3, a4);
		break;
	case D_INT:
		MAX_INT(a1, a2, a3, a4);
		break;
	case D_DINT:
		MAX_DINT(a1, a2, a3, a4);
		break;
	case D_LINT:
		MAX_LINT(a1, a2, a3, a4);
		break;
	case D_USINT:
		MAX_USINT(a1, a2, a3, a4);
		break;
	case D_UINT:
		MAX_UINT(a1, a2, a3, a4);
		break;
	case D_UDINT:
		MAX_UDINT(a1, a2, a3, a4);
		break;
	case D_ULINT:
		MAX_ULINT(a1, a2, a3, a4);
		break;
	case D_TIME:
		MAX_TIME(a1, a2, a3, a4);
		break;
	case D_REAL:
		MAX_REAL(a1, a2, a3, a4);
		break;
	case D_LREAL:
		MAX_LREAL(a1, a2, a3, a4);
		break;
	case D_STRING:
		MAX_STR(a1, a2, a3, a4);
		break;
	default:
		Eexception_Post(FUK_PARAMEFER_ERR, "MAX:Type invalid");	//パラメータエラー発生
		break;
	}

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(BOOL型)
*/
PLCPIEC_API P_ANY MIN_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_BOOL val1, val2;

	val1 = *a1->pBool;
	val2 = *a2->pBool;

	if (val1 >= val2)
		*a1->pBool = val2;
	else
		*a1->pBool = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(BYTE型)
*/
PLCPIEC_API P_ANY MIN_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_BYTE val1, val2;

	val1 = *a1->pByte;
	val2 = *a2->pByte;

	if (val1 >= val2)
		*a1->pByte = val2;
	else
		*a1->pByte = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(WORD型)
*/
PLCPIEC_API P_ANY MIN_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_WORD val1, val2;

	val1 = *a1->pWord;
	val2 = *a2->pWord;

	if (val1 >= val2)
		*a1->pWord = val2;
	else
		*a1->pWord = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(DWORD型)
*/
PLCPIEC_API P_ANY MIN_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_DWORD val1, val2;

	val1 = *a1->pDword;
	val2 = *a2->pDword;

	if (val1 >= val2)
		*a1->pDword = val2;
	else
		*a1->pDword = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(SINT型)
*/
PLCPIEC_API P_ANY MIN_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_SINT val1, val2;

	val1 = *a1->pSint;
	val2 = *a2->pSint;

	if (val1 >= val2)
		*a1->pSint = val2;
	else
		*a1->pSint = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(INT型)
*/
PLCPIEC_API P_ANY MIN_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_INT val1, val2;

	val1 = *a1->pInt;
	val2 = *a2->pInt;

	if (val1 >= val2)
		*a1->pInt = val2;
	else
		*a1->pInt = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(DINT型)
*/
PLCPIEC_API P_ANY MIN_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_DINT val1, val2;

	val1 = *a1->pDint;
	val2 = *a2->pDint;

	if (val1 >= val2)
		*a1->pDint = val2;
	else
		*a1->pDint = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(LINT型)
*/
PLCPIEC_API P_ANY MIN_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_LINT val1, val2;

	val1 = *a1->pLint;
	val2 = *a2->pLint;

	if (val1 >= val2)
		*a1->pLint = val2;
	else
		*a1->pLint = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(USINT型)
*/
PLCPIEC_API P_ANY MIN_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_USINT val1, val2;

	val1 = *a1->pUsint;
	val2 = *a2->pUsint;

	if (val1 >= val2)
		*a1->pUsint = val2;
	else
		*a1->pUsint = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(UINT型)
*/
PLCPIEC_API P_ANY MIN_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_UINT val1, val2;

	val1 = *a1->pUint;
	val2 = *a2->pUint;

	if (val1 >= val2)
		*a1->pUint = val2;
	else
		*a1->pUint = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(UDINT型)
*/
PLCPIEC_API P_ANY MIN_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_UDINT val1, val2;

	val1 = *a1->pUdint;
	val2 = *a2->pUdint;

	if (val1 >= val2)
		*a1->pUdint = val2;
	else
		*a1->pUdint = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(ULINT型)
*/
PLCPIEC_API P_ANY MIN_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_ULINT val1, val2;

	val1 = *a1->pUlint;
	val2 = *a2->pUlint;

	if (val1 >= val2)
		*a1->pUlint = val2;
	else
		*a1->pUlint = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(TIME型)
*/
PLCPIEC_API P_ANY MIN_TIME(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_TIME val1, val2;

	val1 = *a1->pTime;
	val2 = *a2->pTime;

	if (val1 >= val2)
		*a1->pTime = val2;
	else
		*a1->pTime = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(REAL型)
*/
PLCPIEC_API P_ANY MIN_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_REAL val1, val2;

	val1 = *a1->pReal;
	val2 = *a2->pReal;

	// 値が有効か？
	if (ChckREAL(val1))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "MIN_REAL:Data is invalid: a1");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pReal = *a2->pReal;
		return a1;
	}
	if (ChckREAL(val2))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "MIN_REAL:Data is invalid: a2");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pReal = *a2->pReal;
		return a1;
	}

	if (val1 >= val2)
		*a1->pReal = val2;
	else
		*a1->pReal = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(LREAL型)
*/
PLCPIEC_API P_ANY MIN_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_LREAL val1, val2;

	val1 = *a1->pLreal;
	val2 = *a2->pLreal;

	// 値が有効か？
	if (ChckLREAL(val1))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "MIN_LREAL:Data is invalid: a1");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pLreal = *a2->pLreal;
		return a1;
	}
	if (ChckLREAL(val2))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "MIN_LREAL:Data is invalid: a2");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pLreal = *a2->pLreal;
		return a1;
	}
	if (val1 >= val2)
		*a1->pLreal = val2;
	else
		*a1->pLreal = val1;

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します(STRING型)
*/
PLCPIEC_API P_ANY MIN_STR(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	// 第2パラメータのほうが小さい場合は第2パラメータの値をコピーする
	// 大きい場合は第1パラメータをそのまま返すので何もしない
	if (strcmp((char*)a1->pString->string, (char*)a2->pString->string) > 0)
	{
		a1->pString->length = a2->pString->length;
		strcpy_s((char*)a1->pString->string, STRING_MAX + 1, (char*)a2->pString->string);
	}

	return a1;
}
/*
* 2つの入力値のうち、小さい方を返します
*/
PLCPIEC_API P_ANY MIN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 対象データ型か？
	switch (a2->Type)
	{
	case D_BOOL:
	case D_BYTE:
	case D_WORD:
	case D_DWORD:
	case D_TIME:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "MIN:Type invalid");	//パラメータエラー発生
		return a1;
	}
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "MIN:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)
	MaskBitfield(a2);	// ビット指定処理(第2パラメータ)

	switch (a2->Type)
	{
	case D_BOOL:
		MIN_BOOL(a1, a2, a3, a4);
		break;
	case D_BYTE:
		MIN_BYTE(a1, a2, a3, a4);
		break;
	case D_WORD:
		MIN_WORD(a1, a2, a3, a4);
		break;
	case D_DWORD:
		MIN_DWORD(a1, a2, a3, a4);
		break;
	case D_SINT:
		MIN_SINT(a1, a2, a3, a4);
		break;
	case D_INT:
		MIN_INT(a1, a2, a3, a4);
		break;
	case D_DINT:
		MIN_DINT(a1, a2, a3, a4);
		break;
	case D_LINT:
		MIN_LINT(a1, a2, a3, a4);
		break;
	case D_USINT:
		MIN_USINT(a1, a2, a3, a4);
		break;
	case D_UINT:
		MIN_UINT(a1, a2, a3, a4);
		break;
	case D_UDINT:
		MIN_UDINT(a1, a2, a3, a4);
		break;
	case D_ULINT:
		MIN_ULINT(a1, a2, a3, a4);
		break;
	case D_TIME:
		MIN_TIME(a1, a2, a3, a4);
		break;
	case D_REAL:
		MIN_REAL(a1, a2, a3, a4);
		break;
	case D_LREAL:
		MIN_LREAL(a1, a2, a3, a4);
		break;
	case D_STRING:
		MIN_STR(a1, a2, a3, a4);
		break;
	default:
		Eexception_Post(FUK_PARAMEFER_ERR, "MIN:Type invalid");	//パラメータエラー発生
		break;
	}

	return a1;
}

/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(BOOL型)
*/
PLCPIEC_API P_ANY SEL_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_BOOL val1, val2;

	val1 = *a2->pBool;
	val2 = *a3->pBool;

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pBool = val1;
	else
		*a1->pBool = val2;

	a1->Type = D_BOOL;

	return a1;
}

/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(BYTE型)
*/
PLCPIEC_API P_ANY SEL_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_BYTE val1, val2;

	val1 = *a2->pByte;
	val2 = *a3->pByte;

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pByte = val1;
	else
		*a1->pByte = val2;

	a1->Type = D_BYTE;

	return a1;
}

/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(WORD型)
*/
PLCPIEC_API P_ANY SEL_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_WORD val1, val2;

	val1 = *a2->pWord;
	val2 = *a3->pWord;

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pWord = val1;
	else
		*a1->pWord = val2;

	a1->Type = D_WORD;

	return a1;
}

/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(DWORD型)
*/
PLCPIEC_API P_ANY SEL_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_DWORD val1, val2;

	val1 = *a2->pDword;
	val2 = *a3->pDword;

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pDword = val1;
	else
		*a1->pDword = val2;

	a1->Type = D_DWORD;

	return a1;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(USINT型)
*/
PLCPIEC_API P_ANY SEL_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_USINT val1, val2;

	val1 = *a2->pUsint;
	val2 = *a3->pUsint;

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pUsint = val1;
	else
		*a1->pUsint = val2;

	a1->Type = D_USINT;

	return a1;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(UINT型)
*/
PLCPIEC_API P_ANY SEL_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_UINT val1, val2;

	val1 = *a2->pUint;
	val2 = *a3->pUint;

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pUint = val1;
	else
		*a1->pUint = val2;

	a1->Type = D_UINT;

	return a1;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(UDINT型)
*/
PLCPIEC_API P_ANY SEL_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_UDINT val1, val2;

	val1 = *a2->pUdint;
	val2 = *a3->pUdint;

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pUdint = val1;
	else
		*a1->pUdint = val2;

	a1->Type = D_DINT;

	return a1;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(SINT型)
*/
PLCPIEC_API P_ANY SEL_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_SINT val1, val2;
	
	val1 = *a2->pSint;
	val2 = *a3->pSint;
	
	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pSint = val1;
	else
		*a1->pSint = val2;

	a1->Type = D_SINT;

	return a1;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(INT型)
*/
PLCPIEC_API P_ANY SEL_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_INT val1, val2;

	val1 = *a2->pInt;
	val2 = *a3->pInt;

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pInt = val1;
	else
		*a1->pInt = val2;

	a1->Type = D_INT;

	return a1;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(DINT型)
*/
PLCPIEC_API P_ANY SEL_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_DINT val1, val2;

	val1 = *a2->pDint;
	val2 = *a3->pDint;

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pDint = val1;
	else
		*a1->pDint = val2;

	a1->Type = D_DINT;

	return a1;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(LINT型)
*/
PLCPIEC_API P_ANY SEL_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_LINT val1, val2;

	val1 = *a2->pLint;
	val2 = *a3->pLint;

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pLint = val1;
	else
		*a1->pLint = val2;

	a1->Type = D_LINT;

	return a1;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(TIME型)
*/
PLCPIEC_API P_ANY SEL_TIME(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_TIME val1, val2;

	val1 = *a2->pTime;
	val2 = *a3->pTime;

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pTime = val1;
	else
		*a1->pTime = val2;

	a1->Type = D_TIME;

	return a1;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(REAL型)
*/
PLCPIEC_API P_ANY SEL_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_REAL val1, val2;

	val1 = *a2->pReal;
	val2 = *a3->pReal;

	// 値が有効か？
	if (ChckREAL(val1))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "SEL_REAL:Data is invalid: a2");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pReal = *a2->pReal;
		return a1;
	}
	if (ChckREAL(val2))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "SEL_REAL:Data is invalid: a3");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pReal = *a2->pReal;
		return a1;
	}

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pReal = val1;
	else
		*a1->pReal = val2;

	a1->Type = D_REAL;

	return a1;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(LREAL型)
*/
PLCPIEC_API P_ANY SEL_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_LREAL val1, val2;

	val1 = *a2->pLreal;
	val2 = *a3->pLreal;

	// 値が有効か？
	if (ChckLREAL(val1))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "SEL_LREAL:Data is invalid: a2");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pLreal = *a2->pLreal;
		return a1;
	}
	if (ChckLREAL(val2))
	{
		//Inf または NaN
		Eexception_Post(FUK_PARAMEFER_ERR, "SEL_LREAL:Data is invalid: a3");	//パラメータエラー発生
		SetSelectEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		*a1->pLreal = *a2->pLreal;
		return a1;
	}

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
		*a1->pLreal = val1;
	else
		*a1->pLreal = val2;

	a1->Type = D_LREAL;

	return a1;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します(STRING型)
*/
PLCPIEC_API P_ANY SEL_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSelectEno(TRUE);	// ENOフラグのリセット

	T_WORD lenval1 = 0;
	T_WORD lenval2 = 0;
	char strval1[81] = { 0 };
	char strval2[81] = { 0 };

	lenval1 = a2->pString->length;
	strncpy(strval1, a2->pString->string, STRING_MAX + 1);
	lenval2 = a3->pString->length;
	strncpy(strval2, a3->pString->string, STRING_MAX + 1);

	// 第1パラメータがFALSEの場合は第2パラメータを返す
	if (!*a1->pBool)
	{
		a1->pString->length = lenval1;
		strncpy(a1->pString->string, strval1, STRING_MAX + 1);
	}
	else
	{
		a1->pString->length = lenval2;
		strncpy(a1->pString->string, strval2, STRING_MAX + 1);
	}
	a1->Type = D_STRING;

	return a1;
}
/*
* 第1パラメータの値に応じて、第2・第3パラメータのいずれかを返します
*/
PLCPIEC_API P_ANY SEL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	if (a1->Type != D_BOOL)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SEL:Type invalid :a1");	//パラメータエラー発生
		return a2;
	}

	// 対象データ型か？
	switch (a2->Type)
	{
	case D_BOOL:
	case D_BYTE:
	case D_WORD:
	case D_DWORD:
	case D_LINT:
	case D_USINT:
	case D_UINT:
	case D_UDINT:
	case D_ULINT:
	case D_TIME:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SEL:Type invalid :a2");	//パラメータエラー発生
		return a1;
	}
	//パラメーターデータ型が一致しないか？
	if (a2->Type != a3->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SEL:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)
	MaskBitfield(a2);	// ビット指定処理(第2パラメータ)

	switch (a2->Type)
	{
	case D_BOOL:
		SEL_BOOL(a1, a2, a3, a4);
		break;
	case D_BYTE:
		SEL_BYTE(a1, a2, a3, a4);
		break;
	case D_USINT:
		SEL_USINT(a1, a2, a3, a4);
		break;
	case D_SINT:
		SEL_SINT(a1, a2, a3, a4);
		break;
	case D_WORD:
		SEL_WORD(a1, a2, a3, a4);
		break;
	case D_UINT:
		SEL_UINT(a1, a2, a3, a4);
		break;
	case D_INT:
		SEL_INT(a1, a2, a3, a4);
		break;
	case D_DWORD:
		SEL_DWORD(a1, a2, a3, a4);
		break;
	case D_UDINT:
		SEL_UDINT(a1, a2, a3, a4);
		break;
	case D_DINT:
		SEL_DINT(a1, a2, a3, a4);
		break;
	case D_TIME:
		SEL_TIME(a1, a2, a3, a4);
		break;
	case D_LINT:
		SEL_LINT(a1, a2, a3, a4);
		break;
	case D_REAL:
		SEL_REAL(a1, a2, a3, a4);
		break;
	case D_LREAL:
		SEL_LREAL(a1, a2, a3, a4);
		break;
	case D_STRING:
		SEL_STRING(a1, a2, a3, a4);
		break;
	default:
		Eexception_Post(FUK_PARAMEFER_ERR, "SEL:Type invalid");	//パラメータエラー発生
		break;
	}

	return a1;
}

