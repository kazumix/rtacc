#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <limits.h>

#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

T_BOOL STAT_ENO_NUMERIC;	// Numeric用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// Numeric処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetNumericEno(T_BOOL eno)
{
	STAT_ENO_NUMERIC = eno;
}

/// <summary>
/// Numeric処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetNumericEno()
{
	return STAT_ENO_NUMERIC;
}

PLCPIEC_API P_ANY ABS_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	// パラメータがSINT最小値の場合
	if (*a1->pSint == CHAR_MIN)
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "ABS_SINT:IN1");	//オーバフロー発生
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	*a1->pSint = abs((T_DINT)*a1->pSint);

	return a1;
}
PLCPIEC_API P_ANY ABS_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	// パラメータがINT最小値の場合
	if (*a1->pInt == SHRT_MIN)
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "ABS_INT:IN1");	//オーバフロー発生
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pInt = abs((T_DINT)*a1->pInt);

	return a1;
}
PLCPIEC_API P_ANY ABS_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// パラメータがDINT最小値の場合
	if (*a1->pInt == INT_MIN)
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "ABS_DINT:IN1");	//オーバフロー発生
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	SetNumericEno(TRUE);	// ENOフラグのリセット
	*a1->pDint = abs(*a1->pDint);

	return a1;
}
PLCPIEC_API P_ANY ABS_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// パラメータがDINT最小値の場合
	if (*a1->pInt == LLONG_MIN)
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "ABS_DINT:IN1");	//オーバフロー発生
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	SetNumericEno(TRUE);	// ENOフラグのリセット
	*a1->pLint = llabs(*a1->pLint);

	return a1;
}
PLCPIEC_API P_ANY ABS_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット
	*a1->pUsint = (T_USINT)abs((T_DINT)*a1->pSint);

	return a1;
}
PLCPIEC_API P_ANY ABS_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット
	*a1->pUint = (T_UINT)abs((T_DINT)*a1->pUint);

	return a1;
}
PLCPIEC_API P_ANY ABS_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット
	*a1->pUdint = (T_UDINT)abs((T_DINT)*a1->pUdint);

	return a1;
}
PLCPIEC_API P_ANY ABS_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット
	*a1->pUlint = (T_ULINT)llabs((T_LINT)*a1->pUlint);

	return a1;
}
PLCPIEC_API P_ANY ABS_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	// REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "ABS_REAL:IN1");	//値が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	*a1->pReal = fabsf(*a1->pReal);

	// 演算結果が有効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "ABS_REAL:RESULT");	//値が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY ABS_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	// LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "ABS_LREAL:IN1");	//値が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	*a1->pLreal = fabs(*a1->pLreal);

	// 演算結果が有効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "ABS_LREAL:RESULT");	//値が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY ABS_TIME(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pTime = (T_TIME)abs((T_DINT)*a1->pTime);

	return a1;
}
/*
* 数値型の絶対値を返す
*/
PLCPIEC_API P_ANY ABS(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメータのデータ型が数値型か？
	switch (a1->Type)
	{
	case D_BOOL:
	case D_BYTE:
	case D_WORD:
	case D_DWORD:
	case D_STRING:
	case D_ARRAY:
	case D_STRUCT:
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "ABS:invalid data type");	//パラメータエラー発生
		return a1;
	}

#endif
	switch (a1->Type)
	{
	case D_SINT:  ABS_SINT (a1, a2, a3, a4); break;
	case D_INT:   ABS_INT  (a1, a2, a3, a4); break;
	case D_DINT:  ABS_DINT (a1, a2, a3, a4); break;
	case D_LINT:  ABS_LINT (a1, a2, a3, a4); break;
	case D_USINT: ABS_USINT(a1, a2, a3, a4); break;
	case D_UINT:  ABS_UINT (a1, a2, a3, a4); break;
	case D_UDINT: 
	case D_TIME:
		ABS_UDINT(a1, a2, a3, a4); 
		break;
	case D_ULINT: ABS_ULINT(a1, a2, a3, a4); break;
	case D_REAL:  ABS_REAL (a1, a2, a3, a4); break;
	case D_LREAL: ABS_LREAL(a1, a2, a3, a4); break;
	}

	return a1;
}

/*
* REAL値の逆余弦演算を行います。
*/
PLCPIEC_API P_ANY ACOS_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	T_REAL tmp = *a1->pReal;
	*a1->pReal = acosf(*a1->pReal);	// 逆余弦演算実施
	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "ACOS_REAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* LREAL値の逆余弦演算を行います。
*/
PLCPIEC_API P_ANY ACOS_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pLreal = acos(*a1->pLreal);	// 逆余弦演算実施
	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "ACOS_LREAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* 逆余弦演算を行います。
*/
PLCPIEC_API P_ANY ACOS(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型がANY_REAL型でない場合
	if ((a1->Type != D_REAL) && (a1->Type != D_LREAL))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "ACOS:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 型による処理分岐
	if (a1->Type == D_REAL)	// REAL型
	{
		// 値が有効か？
		if(ChckREAL(*a1->pReal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "ACOS:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		if(fabsf((T_REAL)*a1->pReal) > 1.0)
		{
			//パラメータの絶対値が1.0以上の場合
			Eexception_Post(FUK_PARAMEFER_ERR, "ACOS:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		ACOS_REAL(a1, a2, a3, a4);	// 逆余弦演算
	}
	else if (a1->Type == D_LREAL)// LREAL型
	{
		// 値が有効か？
		if (ChckLREAL(*a1->pLreal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "ACOS:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		if (fabs((T_LREAL)*a1->pLreal) > 1.0)
		{
			//パラメータの絶対値が1.0以上の場合
			Eexception_Post(FUK_PARAMEFER_ERR, "ACOS:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		ACOS_LREAL(a1, a2, a3, a4);	// 逆余弦演算
	}

	return a1;
}

/*
* REAL値の逆正弦演算を行います。
*/
PLCPIEC_API P_ANY ASIN_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pReal = asinf(*a1->pReal);	// 逆正弦演算実施
	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "ASIN_REAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* LREAL値の逆正弦演算を行います。
*/
PLCPIEC_API P_ANY ASIN_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pLreal = asin(*a1->pLreal);	// 逆正弦演算実施
	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "ASIN_LREAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* 逆正弦演算を行います。
*/
PLCPIEC_API P_ANY ASIN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型がANY_REAL型でない場合
	if ((a1->Type != D_REAL) && (a1->Type != D_LREAL))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "ASIN:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 型による処理分岐
	if (a1->Type == D_REAL)	// REAL型
	{
		// 値が有効か？
		if (ChckREAL(*a1->pReal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "ASIN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		if (fabsf((T_REAL)*a1->pReal) > 1.0)
		{
			//パラメータの絶対値が1.0以上の場合
			Eexception_Post(FUK_PARAMEFER_ERR, "ASIN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		ASIN_REAL(a1, a2, a3, a4);	// 逆正弦演算
	}
	else if (a1->Type == D_LREAL)// LREAL型
	{
		// 値が有効か？
		if (ChckLREAL(*a1->pLreal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "ASIN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		if (fabs((T_LREAL)*a1->pLreal) > 1.0)
		{
			//パラメータの絶対値が1.0以上の場合
			Eexception_Post(FUK_PARAMEFER_ERR, "ASIN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		ASIN_LREAL(a1, a2, a3, a4);	// 逆正弦演算
	}

	return a1;
}

/*
* REAL値の逆正接演算を行います。
*/
PLCPIEC_API P_ANY ATAN_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pReal = atanf(*a1->pReal);	// 逆正接演算実施

	return a1;
}
/*
* LREAL値の逆正接演算を行います。
*/
PLCPIEC_API P_ANY ATAN_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pLreal = atan(*a1->pLreal);	// 逆正接演算実施

	return a1;
}
/*
* 逆正接演算を行います。
*/
PLCPIEC_API P_ANY ATAN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型がANY_REAL型でない場合
	if ((a1->Type != D_REAL) && (a1->Type != D_LREAL))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "ATAN:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 型による処理分岐
	if (a1->Type == D_REAL)	// REAL型
	{
		// 値が有効か？
		if (ChckREAL(*a1->pReal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "ATAN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		if (fabsf((T_REAL)*a1->pReal) > 1.0)
		{
			//パラメータの絶対値が1.0以上の場合
			Eexception_Post(FUK_PARAMEFER_ERR, "ATAN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		ATAN_REAL(a1, a2, a3, a4);	// 逆正接演算
	}
	else if (a1->Type == D_LREAL)// LREAL型
	{
		// 値が有効か？
		if (ChckLREAL(*a1->pLreal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "ATAN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		ATAN_LREAL(a1, a2, a3, a4);	// 逆正接演算
	}

	return a1;
}

/*
* REAL値の余弦演算を行います。
*/
PLCPIEC_API P_ANY COS_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pReal = cosf(*a1->pReal);	// 余弦演算実施
	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "COS_REAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
/*
* LREAL値の余弦演算を行います。
*/
PLCPIEC_API P_ANY COS_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pLreal = cos(*a1->pLreal);	// 余弦演算実施
	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "COS_LREAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
/*
* 余弦演算を行います。
*/
PLCPIEC_API P_ANY COS(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型がANY_REAL型でない場合
	if ((a1->Type != D_REAL) && (a1->Type != D_LREAL))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "COS:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 型による処理分岐
	if (a1->Type == D_REAL)	// REAL型
	{
		// 値が有効か？
		if (ChckREAL(*a1->pReal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "COS:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		COS_REAL(a1, a2, a3, a4);	// 逆余弦演算
	}
	else if (a1->Type == D_LREAL)// LREAL型
	{
		// 値が有効か？
		if (ChckLREAL(*a1->pLreal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "COS:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		COS_LREAL(a1, a2, a3, a4);	// 逆余弦演算
	}

	return a1;
}
/*
* REAL値の正弦演算を行います。
*/
PLCPIEC_API P_ANY SIN_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pReal = sinf(*a1->pReal);	// 正弦演算実施

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "SIN_REAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
/*
* LREAL値の正弦演算を行います。
*/
PLCPIEC_API P_ANY SIN_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pLreal = sin(*a1->pLreal);	// 正弦演算実施
	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "SIN_LREAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* 正弦演算を行います。
*/
PLCPIEC_API P_ANY SIN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型がANY_REAL型でない場合
	if ((a1->Type != D_REAL) && (a1->Type != D_LREAL))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SIN:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 型による処理分岐
	if (a1->Type == D_REAL)	// REAL型
	{
		// 値が有効か？
		if (ChckREAL(*a1->pReal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "SIN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		SIN_REAL(a1, a2, a3, a4);	// 逆正弦演算
	}
	else if (a1->Type == D_LREAL)// LREAL型
	{
		// 値が有効か？
		if (ChckLREAL(*a1->pLreal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "SIN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		SIN_LREAL(a1, a2, a3, a4);	// 逆正弦演算
	}

	return a1;
}
/*
* REAL値の正接演算を行います。
*/
PLCPIEC_API P_ANY TAN_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pReal = tanf(*a1->pReal);	// 正接演算実施
	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "TAN_REAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* LREAL値の正接演算を行います。
*/
PLCPIEC_API P_ANY TAN_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pLreal = tan(*a1->pLreal);	// 正接演算実施
	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "TAN_LREAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* 正接演算を行います。
*/
PLCPIEC_API P_ANY TAN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型がANY_REAL型でない場合
	if ((a1->Type != D_REAL) && (a1->Type != D_LREAL))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "TAN:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 型による処理分岐
	if (a1->Type == D_REAL)	// REAL型
	{
		// 値が有効か？
		if (ChckREAL(*a1->pReal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "TAN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		TAN_REAL(a1, a2, a3, a4);	// 正接演算
	}
	else if (a1->Type == D_LREAL)// LREAL型
	{
		// 値が有効か？
		if (ChckLREAL(*a1->pLreal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "TAN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		TAN_LREAL(a1, a2, a3, a4);	// 逆正接演算
	}

	return a1;
}
/*
* REAL値の自然指数関数を行います。
*/
PLCPIEC_API P_ANY EXP_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pReal = expf(*a1->pReal);	// 演算実施
	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXP_REAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* LREAL値の自然指数関数を行います。
*/
PLCPIEC_API P_ANY EXP_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pLreal = exp(*a1->pLreal);	// 演算実施
	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXP_LREAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* 自然指数関数を行います。
*/
PLCPIEC_API P_ANY EXP(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型がANY_REAL型でない場合
	if ((a1->Type != D_REAL) && (a1->Type != D_LREAL))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "EXP:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 型による処理分岐
	if (a1->Type == D_REAL)	// REAL型
	{
		// 値が有効か？
		if (ChckREAL(*a1->pReal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "EXP:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		EXP_REAL(a1, a2, a3, a4);	// 演算
	}
	else if (a1->Type == D_LREAL)// LREAL型
	{
		// 値が有効か？
		if (ChckLREAL(*a1->pLreal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "EXP:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		EXP_LREAL(a1, a2, a3, a4);	// 演算
	}

	return a1;
}
/*
* REAL値の自然対数演算を行います。
*/
PLCPIEC_API P_ANY LN_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pReal = logf(*a1->pReal);	// 演算実施
	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LN_REAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
/*
* LREAL値の自然対数演算を行います。
*/
PLCPIEC_API P_ANY LN_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pLreal = log(*a1->pLreal);	// 演算実施
	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LN_LREAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* 自然対数演算を行います。
*/
PLCPIEC_API P_ANY LN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型がANY_REAL型でない場合
	if ((a1->Type != D_REAL) && (a1->Type != D_LREAL))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LN:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 型による処理分岐
	if (a1->Type == D_REAL)	// REAL型
	{
		// 値が有効か？
		if (ChckREAL(*a1->pReal))
		{
			//Inf または NaN
			Eexception_Post(FUK_INVALID_VALUE_ERR, "LN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		// 値がマイナスか？
		if (*a1->pReal < 0.0)
		{
			//マイナス値の場合
			Eexception_Post(FUK_INVALID_VALUE_ERR, "LN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		LN_REAL(a1, a2, a3, a4);	// 演算
	}
	else if (a1->Type == D_LREAL)// LREAL型
	{
		// 値が有効か？
		if (ChckLREAL(*a1->pLreal))
		{
			//Inf または NaN
			Eexception_Post(FUK_INVALID_VALUE_ERR, "LN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		// 値がマイナスか？
		if (*a1->pLreal < 0.0)
		{
			//マイナス値の場合
			Eexception_Post(FUK_INVALID_VALUE_ERR, "LN:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		LN_LREAL(a1, a2, a3, a4);	// 演算
	}

	return a1;
}
/*
* REAL値の常用対数演算を行います。
*/
PLCPIEC_API P_ANY LOG_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pReal = log10f(*a1->pReal);	// 演算実施
	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LOG_REAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* LREAL値の常用対数演算を行います。
*/
PLCPIEC_API P_ANY LOG_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pLreal = log10(*a1->pLreal);	// 演算実施
	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LOG_LREAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* 常用対数演算を行います。
*/
PLCPIEC_API P_ANY LOG(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型がANY_REAL型でない場合
	if ((a1->Type != D_REAL) && (a1->Type != D_LREAL))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LOG:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 型による処理分岐
	if (a1->Type == D_REAL)	// REAL型
	{
		// 値が有効か？
		if (ChckREAL(*a1->pReal))
		{
			//Inf または NaN
			Eexception_Post(FUK_INVALID_VALUE_ERR, "LOG:Param is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		// 値が0以下か
		if (*a1->pReal <= 0.0)
		{
			//0以下の場合
			Eexception_Post(FUK_PARAMEFER_ERR, "LOG:Param is less than or equal to 0: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		LOG_REAL(a1, a2, a3, a4);	// 演算
	}
	else if (a1->Type == D_LREAL)// LREAL型
	{
		// 値が有効か？
		if (ChckLREAL(*a1->pLreal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "LOG:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		// 値が0以下か
		if (*a1->pLreal <= 0.0)
		{
			//0以下の場合
			Eexception_Post(FUK_PARAMEFER_ERR, "LOG:Param is less than or equal to 0: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		LOG_LREAL(a1, a2, a3, a4);	// 演算
	}

	return a1;
}
/*
* REAL値の平方根演算を行います。
*/
PLCPIEC_API P_ANY SQRT_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pReal = sqrtf(*a1->pReal);	// 演算実施
	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "SQRT_REAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* LREAL値の平方根演算を行います。
*/
PLCPIEC_API P_ANY SQRT_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNumericEno(TRUE);	// ENOフラグのリセット

	*a1->pLreal = sqrt(*a1->pLreal);	// 演算実施
	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "SQRT_LREAL:RESULT");	//演算結果が無効値です。
		SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	return a1;
}
/*
* 平方根演算を行います。
*/
PLCPIEC_API P_ANY SQRT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// データ型がANY_REAL型でない場合
	if ((a1->Type != D_REAL) && (a1->Type != D_LREAL))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SQRT:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// 型による処理分岐
	if (a1->Type == D_REAL)	// REAL型
	{
		// 値が有効か？
		if (ChckREAL(*a1->pReal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "SQRT:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		
		SQRT_REAL(a1, a2, a3, a4);	// 演算
	}
	else if (a1->Type == D_LREAL)// LREAL型
	{
		// 値が有効か？
		if (ChckLREAL(*a1->pLreal))
		{
			//Inf または NaN
			Eexception_Post(FUK_PARAMEFER_ERR, "SQRT:Data is invalid: a1");	//パラメータエラー発生
			SetNumericEno(FALSE);	// パラメータエラーのためENOをFALSEにする
			return a1;
		}
		SQRT_LREAL(a1, a2, a3, a4);	// 演算
	}

	return a1;
}
