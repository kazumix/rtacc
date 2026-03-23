#include <stdio.h>
#include <stdlib.h>

#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

T_BOOL STAT_ENO_EXPT;	// EXPT用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// EXPT処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetExptEno(T_BOOL eno)
{
	STAT_ENO_EXPT = eno;
}

/// <summary>
/// EXPT処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetExptEno()
{
	return STAT_ENO_EXPT;
}

/// <summary>
/// （加算）入力 IN1 と IN2 のべき乗を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY EXPT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//第一パラメーターデータ型がANY_REALでは無いか？
	if ((a1->Type != D_REAL) && (a1->Type != D_LREAL))
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "EXPT:invalid data type");	//パラメータエラー発生
		return a1;
	}
#endif
	if (a1->Type == D_REAL)
	{
		//データ型毎に分岐
		if (a2->Type == D_REAL)			return EXPT_REAL_REAL(a1, a2, a3, a4);
		else if (a2->Type == D_LREAL)	return EXPT_REAL_LREAL(a1, a2, a3, a4);
		else if (a2->Type == D_SINT)	return EXPT_REAL_SINT(a1, a2, a3, a4);
		else if (a2->Type == D_DINT)	return EXPT_REAL_DINT(a1, a2, a3, a4);
		else if (a2->Type == D_INT)		return EXPT_REAL_INT(a1, a2, a3, a4);
		else if (a2->Type == D_LINT)	return EXPT_REAL_LINT(a1, a2, a3, a4);
		else if (a2->Type == D_UDINT)	return EXPT_REAL_UDINT(a1, a2, a3, a4);
		else if (a2->Type == D_UINT)	return EXPT_REAL_UINT(a1, a2, a3, a4);
		else if (a2->Type == D_USINT)	return EXPT_REAL_USINT(a1, a2, a3, a4);
		else if (a2->Type == D_ULINT)	return EXPT_REAL_ULINT(a1, a2, a3, a4);
		// v1.0ではRT-edgeタグのUSINT～UDINTがBYTE～にDWORDになってしまうため追加 ※ 型変換対応後削除
		else if (a2->Type == D_WORD)	return EXPT_REAL_UINT(a1, a2, a3, a4);
		else if (a2->Type == D_BYTE)	return EXPT_REAL_USINT(a1, a2, a3, a4);
		else if (a2->Type == D_DWORD)	return EXPT_REAL_UDINT(a1, a2, a3, a4);
#ifdef checkon	// v1.0ではパラメータチェック緩和
		//パラメーターエラー（未登録データタイプが渡された）
		else
		{
			Eexception_Post(FUK_PARAMEFER_ERR, "EXPT:IN2:invalid data type");	//パラメータエラー発生
		}
#endif
	}
	else if(a1->Type == D_LREAL)
	{
		//データ型毎に分岐
		if (a2->Type == D_REAL)			return EXPT_LREAL_REAL(a1, a2, a3, a4);
		else if (a2->Type == D_LREAL)	return EXPT_LREAL_LREAL(a1, a2, a3, a4);
		else if (a2->Type == D_SINT)	return EXPT_LREAL_SINT(a1, a2, a3, a4);
		else if (a2->Type == D_DINT)	return EXPT_LREAL_DINT(a1, a2, a3, a4);
		else if (a2->Type == D_INT)		return EXPT_LREAL_INT(a1, a2, a3, a4);
		else if (a2->Type == D_LINT)	return EXPT_LREAL_LINT(a1, a2, a3, a4);
		else if (a2->Type == D_UDINT)	return EXPT_LREAL_UDINT(a1, a2, a3, a4);
		else if (a2->Type == D_UINT)	return EXPT_LREAL_UINT(a1, a2, a3, a4);
		else if (a2->Type == D_USINT)	return EXPT_LREAL_USINT(a1, a2, a3, a4);
		else if (a2->Type == D_ULINT)	return EXPT_LREAL_ULINT(a1, a2, a3, a4);
		// v1.0ではRT-edgeタグのUSINT～UDINTがBYTE～にDWORDになってしまうため追加 ※ 型変換対応後削除
		else if (a2->Type == D_WORD)	return EXPT_LREAL_UINT(a1, a2, a3, a4);
		else if (a2->Type == D_BYTE)	return EXPT_LREAL_USINT(a1, a2, a3, a4);
		else if (a2->Type == D_DWORD)	return EXPT_LREAL_UDINT(a1, a2, a3, a4);
#ifdef checkon	// v1.0ではパラメータチェック緩和
		//パラメーターエラー（未登録データタイプが渡された）
		else
		{
			Eexception_Post(FUK_PARAMEFER_ERR, "EXPT:IN2:invalid data type");	//パラメータエラー発生
		}
#endif
	}
	else
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "EXPT:IN1:invalid data type");	//パラメータエラー発生
	}

	//結果を返す
	return a1;
}



PLCPIEC_API P_ANY EXPT_REAL_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_LREAL:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	// REAL型の値が無効か確認
	if (ChckREAL(*a2->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_REAL:IN2");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)pow((T_LREAL)(*a1->pReal), (T_LREAL)(*a2->pReal));

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_REAL:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_REAL_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_LREAL:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	// LREAL型の値が無効か確認
	if (ChckLREAL(*a2->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_LREAL:IN2");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)pow((T_LREAL)(*a1->pReal), (*a2->pLreal));

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_LREAL:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_REAL_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_SINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)pow((T_LREAL)(*a1->pReal), (T_LREAL)(*a2->pSint));

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_SINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_REAL_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_DINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)pow((T_LREAL)(*a1->pReal), (T_LREAL)(*a2->pDint));

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_DINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_REAL_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_INT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)pow((T_LREAL)(*a1->pReal), (T_LREAL)(*a2->pInt));

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_INT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_REAL_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_LINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)pow((T_LREAL)(*a1->pReal), (T_LREAL)(*a2->pLint));

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_LINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_REAL_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_UDINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)pow((T_LREAL)(*a1->pReal), (T_LREAL)(*a2->pUdint));

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_UDINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_REAL_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_UINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)pow((T_LREAL)(*a1->pReal), (T_LREAL)(*a2->pUint));

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_UINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_REAL_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_USINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)pow((T_LREAL)(*a1->pReal), (T_LREAL)(*a2->pUsint));

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_USINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_REAL_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_ULINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)pow((T_LREAL)(*a1->pReal), (T_LREAL)(*a2->pUlint));

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_REAL_ULINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}

PLCPIEC_API P_ANY EXPT_LREAL_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_REAL:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	// REAL型の値が無効か確認
	if (ChckREAL(*a2->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_REAL:IN2");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)pow((*a1->pLreal), (T_LREAL)(*a2->pReal));

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_REAL:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
	
}
PLCPIEC_API P_ANY EXPT_LREAL_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_LREAL:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//LREAL型の値が無効か確認
	if (ChckLREAL(*a2->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_LREAL:IN2");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)pow((*a1->pLreal), (T_LREAL)(*a2->pLreal));

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_LREAL:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;

}
PLCPIEC_API P_ANY EXPT_LREAL_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_SINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)pow((*a1->pLreal), (T_LREAL)(*a2->pSint));

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_SINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_LREAL_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_DINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)pow((*a1->pLreal), (T_LREAL)(*a2->pDint));

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_DINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_LREAL_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_INT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)pow((*a1->pLreal), (T_LREAL)(*a2->pInt));

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_INT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_LREAL_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_LINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)pow((*a1->pLreal), (T_LREAL)(*a2->pLint));

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_LINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_LREAL_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_UDINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)pow((*a1->pLreal), (T_LREAL)(*a2->pUdint));

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_UDINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_LREAL_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_UINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)pow((*a1->pLreal), (T_LREAL)(*a2->pUint));

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_UINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_LREAL_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_USINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)pow((*a1->pLreal), (T_LREAL)(*a2->pUsint));

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_USINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY EXPT_LREAL_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetExptEno(TRUE);	// ENOフラグのリセット

	//LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_ULINT:IN1");	//値が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)pow((*a1->pLreal), (T_LREAL)(*a2->pUlint));

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "EXPT_LREAL_ULINT:RESULT");	//演算結果が無効値です。
		SetExptEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}

