#include <stdio.h>
#include <stdlib.h>

#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

T_BOOL STAT_ENO_SUB;	// SUB用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// SUB処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetSubEno(T_BOOL eno)
{
	STAT_ENO_SUB = eno;
}

/// <summary>
/// SUB処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetSubEno()
{
	return STAT_ENO_SUB;
}

/// <summary>
/// （加算）入力 IN1 と IN2 の加算を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>

PLCPIEC_API P_ANY SUB(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "SUB:Data type mismatch");	//パラメータエラー発生
		
		return a1;
	}
#endif
	//データ型毎に分岐
	if (a1->Type == D_REAL)			return SUB_REAL(a1, a2, a3, a4);
	else if (a1->Type == D_LREAL)	return SUB_LREAL(a1, a2, a3, a4);
	else if (a1->Type == D_SINT)	return SUB_SINT(a1, a2, a3, a4);
	else if (a1->Type == D_DINT)	return SUB_DINT(a1, a2, a3, a4);
	else if (a1->Type == D_INT)		return SUB_INT(a1, a2, a3, a4);
	else if (a1->Type == D_LINT)	return SUB_LINT(a1, a2, a3, a4);
	else if (a1->Type == D_UDINT)	return SUB_UDINT(a1, a2, a3, a4);
	else if (a1->Type == D_UINT)	return SUB_UINT(a1, a2, a3, a4);
	else if (a1->Type == D_USINT)	return SUB_USINT(a1, a2, a3, a4);
	else if (a1->Type == D_ULINT)	return SUB_ULINT(a1, a2, a3, a4);
	// v1.0ではRT-edgeタグのUSINT～UDINTがBYTE～にDWORDになってしまうため追加 ※ 型変換対応後削除
	else if (a1->Type == D_WORD)	return SUB_UINT(a1, a2, a3, a4);
	else if (a1->Type == D_BYTE)	return SUB_USINT(a1, a2, a3, a4);
	else if (a1->Type == D_DWORD)	return SUB_UDINT(a1, a2, a3, a4);
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターエラー（未登録データタイプが渡された）
	else
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "SUB:invalid data type");	//パラメータエラー発生
	}
#endif
	//結果を返す
	return a1;
}


PLCPIEC_API P_ANY SUB_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{	
	SetSubEno(TRUE);	// ENOフラグのリセット

	// REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "SUB_REAL:IN1");	//値が無効値です。
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	// LREAL型の値が無効か確認
	if (ChckREAL(*a2->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "SUB_REAL:IN2");	//値が無効値です。
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (*a1->pReal) - (*a2->pReal);

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "SUB_REAL:RESULT");	//演算結果が無効値です。
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}

PLCPIEC_API P_ANY SUB_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSubEno(TRUE);	// ENOフラグのリセット

	// LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "SUB_LREAL:IN1");	//値が無効値です。
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	// LREAL型の値が無効か確認
	if (ChckLREAL(*a2->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "SUB_LREAL:IN2");	//値が無効値です。
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (*a1->pLreal) - (*a2->pLreal);

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "SUB_LREAL:RESULT");	//演算結果が無効値です。
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}

PLCPIEC_API P_ANY SUB_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSubEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (SUB_Overflow_SINT(*a1->pSint, *a2->pSint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "SUB_SINT");	//オーバーフロー発生
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	

	//出力情報
	a1->Type = D_SINT;
	*a1->pSint = (*a1->pSint) - (*a2->pSint);

	return a1;
}

PLCPIEC_API P_ANY SUB_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSubEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (SUB_Overflow_DINT(*a1->pDint, *a2->pDint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "SUB_DINT");	//オーバーフロー発生
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	
	//出力情報
	a1->Type = D_DINT;
	*a1->pDint = (*a1->pDint) - (*a2->pDint);

	return a1;
}

PLCPIEC_API P_ANY SUB_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSubEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (SUB_Overflow_INT(*a1->pInt, *a2->pInt))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "SUB_INT");	//オーバーフロー発生
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	
	//出力情報
	a1->Type = D_INT;
	*a1->pInt = (*a1->pInt) - (*a2->pInt);

	return a1;
}

PLCPIEC_API P_ANY SUB_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSubEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (SUB_Overflow_LINT(*a1->pLint, *a2->pLint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "SUB_LINT");	//オーバーフロー発生
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	
	//出力情報
	a1->Type = D_LINT;
	*a1->pLint = (*a1->pLint) - (*a2->pLint);

	return a1;
}

PLCPIEC_API P_ANY SUB_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSubEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (SUB_Overflow_UDINT(*a1->pUdint, *a2->pUdint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "SUB_UDINT");	//オーバーフロー発生
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	
	//出力情報
	a1->Type = D_UDINT;
	*a1->pUdint = (*a1->pUdint) - (*a2->pUdint);

	return a1;
}

PLCPIEC_API P_ANY SUB_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSubEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (SUB_Overflow_UINT(*a1->pUint, *a2->pUint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "SUB_UINT");	//オーバーフロー発生
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	
	//出力情報
	a1->Type = D_UINT;
	*a1->pUint = (*a1->pUint) - (*a2->pUint);

	return a1;
}

PLCPIEC_API P_ANY SUB_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSubEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (SUB_Overflow_USINT(*a1->pUsint, *a2->pUsint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "SUB_USINT");	//オーバーフロー発生
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	
	//出力情報
	a1->Type = D_USINT;
	*a1->pUsint = (*a1->pUsint) - (*a2->pUsint);

	return a1;
}

PLCPIEC_API P_ANY SUB_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{	
	SetSubEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (SUB_Overflow_ULINT(*a1->pUlint, *a2->pUlint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "SUB_ULINT");	//オーバーフロー発生
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	

	//出力情報
	a1->Type = D_ULINT;
	*a1->pUlint = (*a1->pUlint) - (*a2->pUlint);

	return a1;
}

/// <summary>
/// （減算）入力 IN1 と IN2 の減算を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY SUB_T_T(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetSubEno(TRUE);	// ENOフラグのリセット

	//オーバーフロー判定
	if (SUB_Overflow_TIME(*a1->pTime, *a2->pTime))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "SUB_T_T");	//オーバーフロー発生
		SetSubEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) - (*a2->pTime);

	return a1;
}
