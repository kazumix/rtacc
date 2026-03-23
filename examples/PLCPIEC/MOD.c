#include <stdio.h>
#include <stdlib.h>

#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

T_BOOL STAT_ENO_MOD;	// MOD用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// MOD処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetModEno(T_BOOL eno)
{
	STAT_ENO_MOD = eno;
}

/// <summary>
/// MOD処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetModEno()
{
	return STAT_ENO_MOD;
}

/// <summary>
/// （加算）入力 IN1 と IN2 の剰余算を行います。 
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY MOD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "MOD:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif
	//データ型毎に分岐
	if (a1->Type == D_REAL)			return MOD_REAL(a1, a2, a3, a4);
	else if (a1->Type == D_LREAL)	return MOD_LREAL(a1, a2, a3, a4);
	else if (a1->Type == D_SINT)	return MOD_SINT(a1, a2, a3, a4);
	else if (a1->Type == D_DINT)	return MOD_DINT(a1, a2, a3, a4);
	else if (a1->Type == D_INT)		return MOD_INT(a1, a2, a3, a4);
	else if (a1->Type == D_LINT)	return MOD_LINT(a1, a2, a3, a4);
	else if (a1->Type == D_UDINT)	return MOD_UDINT(a1, a2, a3, a4);
	else if (a1->Type == D_UINT)	return MOD_UINT(a1, a2, a3, a4);
	else if (a1->Type == D_USINT)	return MOD_USINT(a1, a2, a3, a4);
	else if (a1->Type == D_ULINT)	return MOD_ULINT(a1, a2, a3, a4);
	// v1.0ではRT-edgeタグのUSINT～UDINTがBYTE～にDWORDになってしまうため追加 ※ 型変換対応後削除
	else if (a1->Type == D_WORD)	return MOD_UINT(a1, a2, a3, a4);
	else if (a1->Type == D_BYTE)	return MOD_USINT(a1, a2, a3, a4);
	else if (a1->Type == D_DWORD)	return MOD_UDINT(a1, a2, a3, a4);
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターエラー（未登録データタイプが渡された）
	else
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MOD:invalid data type");	//パラメータエラー発生
	}
#endif
	//結果を返す
	return a1;
}


PLCPIEC_API P_ANY MOD_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetModEno(TRUE);	// ENOフラグのリセット

	// REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MOD_REAL:IN1");	//値が無効値です。
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	// REAL型の値が無効か確認
	if (ChckREAL(*a2->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MOD_REAL:IN2");	//値が無効値です。
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//0除算チェック
	if (*a2->pReal == 0.0)
	{
		Eexception_Post(FUK_0DIV_ERR, "MOD_REAL");	//0除算例外発生
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (T_REAL)fmod(*a1->pReal, *a2->pReal);

	// 演算結果が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MOD_REAL:RESULT");	//値が無効値です。
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;

}
PLCPIEC_API P_ANY MOD_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetModEno(TRUE);	// ENOフラグのリセット

	// REAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MOD_LREAL:IN1");	//値が無効値です。
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	// REAL型の値が無効か確認
	if (ChckLREAL(*a2->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MOD_LREAL:IN2");	//値が無効値です。
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//0除算チェック
	if (*a2->pLreal == 0.0)
	{
		Eexception_Post(FUK_0DIV_ERR, "MOD_LREAL");	//0除算例外発生
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (T_LREAL)fmod(*a1->pLreal, *a2->pLreal);


	// 演算結果が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MOD_LREAL:RESULT");	//値が無効値です。
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY MOD_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetModEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pSint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "MOD_SINT");	//0除算例外発生
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_SINT;
	*a1->pSint = (T_SINT)fmod(*a1->pSint, *a2->pSint);

	return a1;
}
PLCPIEC_API P_ANY MOD_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetModEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pDint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "MOD_DINT");	//0除算例外発生
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_DINT;
	*a1->pDint = (T_DINT)fmod(*a1->pDint, *a2->pDint);

	return a1;
}
PLCPIEC_API P_ANY MOD_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetModEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pInt == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "MOD_INT");	//0除算例外発生
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_INT;
	*a1->pInt = (T_INT)fmod(*a1->pInt, *a2->pInt);

	return a1;
}
PLCPIEC_API P_ANY MOD_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetModEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pLint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "MOD_LINT");	//0除算例外発生
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_LINT;
	*a1->pLint = (T_LINT)(*a1->pLint % *a2->pLint);

	return a1;
}
PLCPIEC_API P_ANY MOD_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetModEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUdint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "MOD_UDINT");	//0除算例外発生
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_UDINT;
	*a1->pUdint = (T_UDINT)fmod(*a1->pUdint, *a2->pUdint);

	return a1;
}
PLCPIEC_API P_ANY MOD_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetModEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "MOD_UINT");	//0除算例外発生
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_UINT;
	*a1->pUint = (T_UINT)fmod(*a1->pUint, *a2->pUint);

	return a1;
}
PLCPIEC_API P_ANY MOD_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetModEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUsint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "MOD_USINT");	//0除算例外発生
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_USINT;
	*a1->pUsint = (T_USINT)fmod(*a1->pUsint, *a2->pUsint);

	return a1;
}
PLCPIEC_API P_ANY MOD_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetModEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUlint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "MOD_ULINT");	//0除算例外発生
		SetModEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_ULINT;
	*a1->pUlint = (T_ULINT)(*a1->pUlint % *a2->pUlint);

	return a1;
}