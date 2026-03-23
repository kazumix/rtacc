#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <math.h>
#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

T_BOOL STAT_ENO_MUL;	// MUL用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// MUL処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetMulEno(T_BOOL eno)
{
	STAT_ENO_MUL = eno;
}

/// <summary>
/// MUL処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetMulEno()
{
	return STAT_ENO_MUL;
}

/// <summary>
/// （加算）入力 IN1 と IN2 の乗算を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY MUL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{

#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif

	//データ型毎に分岐
	if (a1->Type == D_REAL)			return MUL_REAL(a1, a2, a3, a4);
	else if (a1->Type == D_LREAL)	return MUL_LREAL(a1, a2, a3, a4);
	else if (a1->Type == D_SINT)	return MUL_SINT(a1, a2, a3, a4);
	else if (a1->Type == D_DINT)	return MUL_DINT(a1, a2, a3, a4);
	else if (a1->Type == D_INT)		return MUL_INT(a1, a2, a3, a4);
	else if (a1->Type == D_LINT)	return MUL_LINT(a1, a2, a3, a4);
	else if (a1->Type == D_UDINT)	return MUL_UDINT(a1, a2, a3, a4);
	else if (a1->Type == D_UINT)	return MUL_UINT(a1, a2, a3, a4);
	else if (a1->Type == D_USINT)	return MUL_USINT(a1, a2, a3, a4);
	else if (a1->Type == D_ULINT)	return MUL_ULINT(a1, a2, a3, a4);
	// v1.0ではRT-edgeタグのUSINT～UDINTがBYTE～にDWORDになってしまうため追加 ※ 型変換対応後削除
	else if (a1->Type == D_DWORD)	return MUL_UDINT(a1, a2, a3, a4);
	else if (a1->Type == D_WORD)	return MUL_UINT(a1, a2, a3, a4);
	else if (a1->Type == D_BYTE)	return MUL_USINT(a1, a2, a3, a4);

#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターエラー（未登録データタイプが渡された）
	else
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL:invalid data type");	//パラメータエラー発生
	}
#endif

	//結果を返す
	return a1;
}


PLCPIEC_API P_ANY	MUL_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	//REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_REAL:IN1");	//値が無効値です。
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//REAL型の値が無効か確認
	if (ChckREAL(*a2->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_REAL:IN2");	//値が無効値です。
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (*a1->pReal) * (*a2->pReal);

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_REAL:RESULT");	//演算結果が無効値です。
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY MUL_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	//LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_LREAL:IN1");	//値が無効値です。
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//LREAL型の値が無効か確認
	if (ChckLREAL(*a2->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_LREAL:IN2");	//値が無効値です。
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (*a1->pLreal) * (*a2->pLreal);

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_LREAL:RESULT");	//演算結果が無効値です。
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY MUL_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (MUL_Overflow_SINT(*a1->pSint, *a2->pSint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "MUL_SINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_SINT;
	*a1->pSint = (*a1->pSint) * (*a2->pSint);

	return a1;
}
PLCPIEC_API P_ANY MUL_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (MUL_Overflow_DINT(*a1->pDint, *a2->pDint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "MUL_DINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_DINT;
	*a1->pDint = (*a1->pDint) * (*a2->pDint);

	return a1;
}
PLCPIEC_API P_ANY MUL_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (MUL_Overflow_INT(*a1->pInt, *a2->pInt))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "MUL_INT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_INT;
	*a1->pInt = (*a1->pInt) * (*a2->pInt);

	return a1;
}
PLCPIEC_API P_ANY MUL_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (MUL_Overflow_LINT(*a1->pLint, *a2->pLint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "MUL_LINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LINT;
	*a1->pLint = (*a1->pLint) * (*a2->pLint);

	return a1;
}
PLCPIEC_API P_ANY MUL_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (MUL_Overflow_UDINT(*a1->pUdint, *a2->pUdint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "MUL_UDINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_UDINT;
	*a1->pUdint = (*a1->pUdint) * (*a2->pUdint);

	return a1;
}
PLCPIEC_API P_ANY MUL_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (MUL_Overflow_UINT(*a1->pUint, *a2->pUint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "MUL_UINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_UINT;
	*a1->pUint = (*a1->pUint) * (*a2->pUint);

	return a1;
}
PLCPIEC_API P_ANY MUL_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{	
	SetMulEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (MUL_Overflow_USINT(*a1->pUsint, *a2->pUsint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "MUL_USINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_USINT;
	*a1->pUsint = (*a1->pUsint) * (*a2->pUsint);

	return a1;
}
PLCPIEC_API P_ANY MUL_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (MUL_Overflow_ULINT(*a1->pUlint, *a2->pUlint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "MUL_ULINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_ULINT;
	*a1->pUlint = (*a1->pUlint) * (*a2->pUlint);

	return a1;
}



/// <summary>
/// （加算）入力 IN1 と IN2 の乗算を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY MUL_T_AN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{

	//データ型毎に分岐
	if (a2->Type == D_SINT)			return MUL_T_AN_SINT(a1, a2, a3, a4);
	else if (a2->Type == D_DINT)	return MUL_T_AN_DINT(a1, a2, a3, a4);
	else if (a2->Type == D_INT)		return MUL_T_AN_INT(a1, a2, a3, a4);
	else if (a2->Type == D_LINT)	return MUL_T_AN_LINT(a1, a2, a3, a4);
	else if (a2->Type == D_UDINT)	return MUL_T_AN_UDINT(a1, a2, a3, a4);
	else if (a2->Type == D_UINT)	return MUL_T_AN_UINT(a1, a2, a3, a4);
	else if (a2->Type == D_USINT)	return MUL_T_AN_USINT(a1, a2, a3, a4);
	else if (a2->Type == D_ULINT)	return MUL_T_AN_ULINT(a1, a2, a3, a4);
	else if (a2->Type == D_REAL)	return MUL_T_AN_REAL(a1, a2, a3, a4);
	else if (a2->Type == D_LREAL)	return MUL_T_AN_LREAL(a1, a2, a3, a4);
	// v1.0ではRT-edgeタグのUSINT～UDINTがBYTE～にDWORDになってしまうため追加 ※ 型変換対応後削除
	else if (a2->Type == D_WORD)	return MUL_T_AN_UINT(a1, a2, a3, a4);
	else if (a2->Type == D_BYTE)	return MUL_T_AN_USINT(a1, a2, a3, a4);
	else if (a2->Type == D_DWORD)	return MUL_T_AN_UDINT(a1, a2, a3, a4);

#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターエラー（未登録データタイプが渡された）
	else
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_AN:invalid data type");	//パラメータエラー発生
	}
#endif
	//結果を返す
	return a1;
}
PLCPIEC_API P_ANY MUL_T_AN_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	// REAL型の値が無効か確認
	if (ChckREAL(*a2->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AN_REAL:IN2");	//値が無効値です。
		a1->Type = D_TIME;
		*a1->pTime = 0;
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	// 乗数マイナスチェック
	if (*a2->pReal < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_AN_REAL:IN2");	//マイナスによる乗算発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	T_LREAL tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_LREAL)(*a2->pReal);	// 一時変数に演算結果を格納
	
	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AN_REAL");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}

PLCPIEC_API P_ANY MUL_T_AN_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	// REAL型の値が無効か確認
	if (ChckLREAL(*a2->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AN_LREAL:IN2");	//値が無効値です。
		a1->Type = D_TIME;
		*a1->pTime = 0;
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	// 乗数マイナスチェック
	if (*a2->pLreal < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_AN_LREAL:IN2");	//マイナスによる乗算発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	T_LREAL tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意

	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_LREAL)(*a2->pLreal);	// 一時変数に演算結果を格納
	
	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AN_LREAL");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト
	return a1;
}

PLCPIEC_API P_ANY MUL_T_AN_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	// 乗数マイナスチェック
	if (*a2->pSint < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_AN_SINT:IN2");	//マイナスによる乗算発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pSint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AN_SINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AN_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{	
	SetMulEno(TRUE);	// ENOフラグのリセット

	// 乗数マイナスチェック
	if (*a2->pDint < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_AN_DINT:IN2");	//マイナスによる乗算発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pDint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AN_DINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AN_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// 乗数マイナスチェック
	if (*a2->pInt < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_AN_INT:IN2");	//マイナスによる乗算発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pInt);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AN_INT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}

PLCPIEC_API P_ANY MUL_T_AN_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{	
	SetMulEno(TRUE);	// ENOフラグのリセット

	// 乗数マイナスチェック
	if (*a2->pLint < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_AN_LINT:IN2");	//マイナスによる乗算発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	T_LINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pLint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AN_LINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AN_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pUdint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (MUL_Overflow_TIME_UDINT(*a1->pTime, *a2->pUdint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "MUL_T_AN_UDINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AN_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pUint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AN_UINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AN_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pUsint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AN_USINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AN_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pUlint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AN_ULINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}



/// <summary>
/// （加算）入力 IN1 と IN2 の乗算を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY MUL_T_AI(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	//データ型毎に分岐
	if (a2->Type == D_SINT)			return MUL_T_AI_SINT(a1, a2, a3, a4);
	else if (a2->Type == D_DINT)	return MUL_T_AI_DINT(a1, a2, a3, a4);
	else if (a2->Type == D_INT)		return MUL_T_AI_INT(a1, a2, a3, a4);
	else if (a2->Type == D_LINT)	return MUL_T_AI_LINT(a1, a2, a3, a4);
	else if (a2->Type == D_UDINT)	return MUL_T_AI_UDINT(a1, a2, a3, a4);
	else if (a2->Type == D_UINT)	return MUL_T_AI_UINT(a1, a2, a3, a4);
	else if (a2->Type == D_USINT)	return MUL_T_AI_USINT(a1, a2, a3, a4);
	else if (a2->Type == D_ULINT)	return MUL_T_AI_ULINT(a1, a2, a3, a4);
	// v1.0ではRT-edgeタグのUSINT～UDINTがBYTE～にDWORDになってしまうため追加 ※ 型変換対応後削除
	else if (a2->Type == D_WORD)	return MUL_T_AI_UINT(a1, a2, a3, a4);
	else if (a2->Type == D_BYTE)	return MUL_T_AI_USINT(a1, a2, a3, a4);
	else if (a2->Type == D_DWORD)	return MUL_T_AI_UDINT(a1, a2, a3, a4);

#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターエラー（未登録データタイプが渡された）
	else
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_AI:invalid data type");	//パラメータエラー発生
	}
#endif
	//結果を返す
	return a1;

}

PLCPIEC_API P_ANY MUL_T_AI_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pSint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AI_SINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	// 乗数マイナスチェック
	if (*a2->pSint < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_AI_SINT:IN2");	//マイナスによる乗算発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AI_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pDint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AI_DINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	// 乗数マイナスチェック
	if (*a2->pDint < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_AI_DINT:IN2");	//マイナスによる乗算発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AI_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pInt);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AI_INT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	// 乗数マイナスチェック
	if (*a2->pInt < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_AI_INT:IN2");	//マイナスによる乗算発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AI_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pLint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AI_LINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	// 乗数マイナスチェック
	if (*a2->pLint < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_AI_LINT:IN2");	//マイナスによる乗算発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AI_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pUdint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (MUL_Overflow_TIME_UDINT(*a1->pTime, *a2->pUdint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "MUL_T_AI_UDINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AI_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pUint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AI_UINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AI_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pUsint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AI_USINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}
PLCPIEC_API P_ANY MUL_T_AI_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_ULINT tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_ULINT)(*a2->pUlint);	// 一時変数に演算結果を格納

	//オーバーフロー判定
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_AI_ULINT");	//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)tmp;			// 演算結果をTIME型にキャスト

	return a1;
}

/// <summary>
/// （加算）入力 IN1 と IN2 の乗算を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY MUL_T_R(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMulEno(TRUE);	// ENOフラグのリセット

	T_LREAL tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意

	//出力情報
	a1->Type = D_TIME;
	tmp = (*a1->pTime) * (T_LREAL)(*a2->pReal);	// 一時変数に演算結果を格納

	//REAL型の値が無効か確認
	if (ChckREAL(*a2->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MUL_T_R:IN2");	//値が無効値です。
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//オーバーフローチェック
	if(tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "MUL_T_R");		//オーバーフロー発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//マイナス値による乗算チェック
	if (*a2->pReal < 0.0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MUL_T_R:IN2");	//マイナス乗算例外発生
		SetMulEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	*a1->pTime = (T_TIME)round(tmp);			// 演算結果をTIME型にキャスト

	return a1;
}
