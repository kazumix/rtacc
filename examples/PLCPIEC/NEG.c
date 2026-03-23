#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

T_BOOL STAT_ENO_NEG;	// NEG用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// NEG処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetNegEno(T_BOOL eno)
{
	STAT_ENO_NEG = eno;
}

/// <summary>
/// NEG処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetNegEno()
{
	return STAT_ENO_NEG;
}

/// <summary>
/// （加算）入力 IN1 と IN2 の2 の補数算出を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY NEG(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{

	//データ型毎に分岐
	if (a1->Type == D_REAL)			return NEG_REAL(a1, a2, a3, a4);
	else if (a1->Type == D_LREAL)	return NEG_LREAL(a1, a2, a3, a4);
	else if (a1->Type == D_SINT)	return NEG_SINT(a1, a2, a3, a4);
	else if (a1->Type == D_DINT)	return NEG_DINT(a1, a2, a3, a4);
	else if (a1->Type == D_INT)		return NEG_INT(a1, a2, a3, a4);
	else if (a1->Type == D_LINT)	return NEG_LINT(a1, a2, a3, a4);
	else if (a1->Type == D_UDINT)	return NEG_UDINT(a1, a2, a3, a4);
	else if (a1->Type == D_UINT)	return NEG_UINT(a1, a2, a3, a4);
	else if (a1->Type == D_USINT)	return NEG_USINT(a1, a2, a3, a4);
	else if (a1->Type == D_ULINT)	return NEG_ULINT(a1, a2, a3, a4);
	// v1.0ではRT-edgeタグのUSINT～UDINTがBYTE～にDWORDになってしまうため追加 ※ 型変換対応後削除
	else if (a1->Type == D_WORD)	return NEG_UINT(a1, a2, a3, a4);
	else if (a1->Type == D_BYTE)	return NEG_USINT(a1, a2, a3, a4);
	else if (a1->Type == D_DWORD)	return NEG_UDINT(a1, a2, a3, a4);
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターエラー（未登録データタイプが渡された）
	else
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "NEG:invalid data type");	//パラメータエラー発生
	}
#endif
	//結果を返す
	return a1;
}


PLCPIEC_API P_ANY NEG_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNegEno(TRUE);	// ENOフラグのリセット

	// REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "NEG_REAL:IN1");	//値が無効値です。
		SetNegEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (*a1->pReal) * (T_REAL)-1.0;

	return a1;
}
PLCPIEC_API P_ANY NEG_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNegEno(TRUE);	// ENOフラグのリセット

	// LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "NEG_LREAL:IN1");	//値が無効値です。
		SetNegEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (*a1->pLreal) * -1.0;

	return a1;
}
PLCPIEC_API P_ANY NEG_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNegEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_SINT;
	*a1->pSint = (*a1->pSint) * -1;

	//オーバーフローチェック
	if (*a1->pSint == SCHAR_MIN)
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "NEG_SINT");		//オーバーフロー発生
		SetNegEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY NEG_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNegEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_DINT;
	*a1->pDint = (*a1->pDint) * -1;

	//オーバーフローチェック
	if (*a1->pDint == LONG_MIN)
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "NEG_DINT");		//オーバーフロー発生
		SetNegEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY NEG_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNegEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_INT;
	*a1->pInt = (*a1->pInt) * -1;

	//オーバーフローチェック
	if (*a1->pInt == SHRT_MIN)
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "NEG_INT");		//オーバーフロー発生
		SetNegEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY NEG_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNegEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_LINT;
	*a1->pLint = (*a1->pLint) * -1;

	//オーバーフローチェック
	if (*a1->pLint == LLONG_MIN)
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "NEG_LINT");		//オーバーフロー発生
		SetNegEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY NEG_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNegEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_UDINT;
	*a1->pUdint = (*a1->pUdint) * -1;

	return a1;
}
PLCPIEC_API P_ANY NEG_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNegEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_UINT;
	*a1->pUint = (*a1->pUint) * -1;

	return a1;
}
PLCPIEC_API P_ANY NEG_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNegEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_USINT;
	*a1->pUsint = (*a1->pUsint) * -1;

	return a1;
}
PLCPIEC_API P_ANY NEG_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNegEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_ULINT;
	*a1->pUlint = (*a1->pUlint) * -1;

	return a1;
}