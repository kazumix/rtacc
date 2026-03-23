#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <math.h>
#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

T_BOOL STAT_ENO_DIV;	// DIV用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// DIV処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetDivEno(T_BOOL eno)
{
	STAT_ENO_DIV = eno;
}

/// <summary>
/// DIV処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetDivEno()
{
	return STAT_ENO_DIV;
}


/// <summary>
/// （除算）入力 IN1 と IN2 の除算を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY DIV(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターデータ型が一致しないか？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif
	//データ型毎に分岐
	if (a1->Type == D_REAL)			return DIV_REAL(a1, a2, a3, a4);
	else if (a1->Type == D_LREAL)	return DIV_LREAL(a1, a2, a3, a4);
	else if (a1->Type == D_SINT)	return DIV_SINT(a1, a2, a3, a4);
	else if (a1->Type == D_DINT)	return DIV_DINT(a1, a2, a3, a4);
	else if (a1->Type == D_INT)		return DIV_INT(a1, a2, a3, a4);
	else if (a1->Type == D_LINT)	return DIV_LINT(a1, a2, a3, a4);
	else if (a1->Type == D_UDINT)	return DIV_UDINT(a1, a2, a3, a4);
	else if (a1->Type == D_UINT)	return DIV_UINT(a1, a2, a3, a4);
	else if (a1->Type == D_USINT)	return DIV_USINT(a1, a2, a3, a4);
	else if (a1->Type == D_ULINT)	return DIV_ULINT(a1, a2, a3, a4);
	// v1.0ではRT-edgeタグのUSINT～UDINTがBYTE～にDWORDになってしまうため追加 ※ 型変換対応後削除
	else if (a1->Type == D_WORD)	return DIV_UINT(a1, a2, a3, a4);
	else if (a1->Type == D_BYTE)	return DIV_USINT(a1, a2, a3, a4);
	else if (a1->Type == D_DWORD)	return DIV_UDINT(a1, a2, a3, a4);
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターエラー（未登録データタイプが渡された）
	else
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV:invalid data type");	//パラメータエラー発生
	}
#endif
	//除算結果を返す
	return a1;
}

PLCPIEC_API P_ANY	DIV_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	// REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "DIV_REAL:IN1");	//値が無効値です。
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	// REAL型の値が無効か確認
	if (ChckREAL(*a2->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "DIV_REAL:IN2");	//値が無効値です。
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//0除算チェック
	if (*a2->pReal == 0.0)
	{
		Eexception_Post(FUK_0DIV_ERR,"DIV_REAL");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_REAL;
	*a1->pReal = (*a1->pReal) / (*a2->pReal);

	// 演算結果が有効かチェック
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "DIV_REAL:RESULT");	//演算結果が無効値です。
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY DIV_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	// LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "DIV_LREAL:IN1");	//値が無効値です。
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	// LREAL型の値が無効か確認
	if (ChckLREAL(*a2->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "DIV_LREAL:IN2");	//値が無効値です。
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//0除算チェック
	if (*a2->pLreal == 0.0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_LREAL");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_LREAL;
	*a1->pLreal = (*a1->pLreal) / (*a2->pLreal);

	// 演算結果が有効かチェック
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "DIV_LREAL:RESULT");	//演算結果が無効値です。
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY	DIV_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pSint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_SINT");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	
	//オーバーフロー判定
	if (DIV_Overflow_SINT(*a1->pSint, *a2->pSint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "DIV_SINT");	//オーバーフロー発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_SINT;
	*a1->pSint = (*a1->pSint) / (*a2->pSint);

	return a1;
}
PLCPIEC_API P_ANY	DIV_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pDint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_DINT");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	
	//オーバーフロー判定
	if (DIV_Overflow_DINT(*a1->pDint, *a2->pDint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "DIV_DINT");	//オーバーフロー発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	

	//出力情報
	a1->Type = D_DINT;
	*a1->pDint = (*a1->pDint) / (*a2->pDint);

	return a1;
}
PLCPIEC_API P_ANY	DIV_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pInt == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_INT");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	
	//オーバーフロー判定
	if (DIV_Overflow_INT(*a1->pInt, *a2->pInt))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "DIV_INT");	//オーバーフロー発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_INT;
	*a1->pInt = (*a1->pInt) / (*a2->pInt);

	return a1;

}
PLCPIEC_API P_ANY	DIV_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pLint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_LINT");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	
	//オーバーフロー判定
	if (DIV_Overflow_LINT(*a1->pLint, *a2->pLint))
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "DIV_LINT");	//オーバーフロー発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	
	//出力情報
	a1->Type = D_LINT;
	*a1->pLint = (*a1->pLint) / (*a2->pLint);

	return a1;
}
PLCPIEC_API P_ANY DIV_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUdint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_UDINT");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_UDINT;
	*a1->pUdint = (*a1->pUdint) / (*a2->pUdint);

	return a1;
}
PLCPIEC_API P_ANY	DIV_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_UINT");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_UINT;
	*a1->pUint = (*a1->pUint) / (*a2->pUint);

	return a1;
}
PLCPIEC_API P_ANY DIV_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUsint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_USINT");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_USINT;
	*a1->pUsint = (*a1->pUsint) / (*a2->pUsint);

	return a1;
}
PLCPIEC_API P_ANY DIV_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUlint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_ULINT");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_ULINT;
	*a1->pUlint = (*a1->pUlint) / (*a2->pUlint);

	return a1;
}


/// <summary>
/// （除算）入力 IN1 と IN2 の除算を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
P_ANY DIV_T_AN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{

	//データ型毎に分岐
	if (a2->Type == D_SINT)			return DIV_T_AN_SINT(a1, a2, a3, a4);
	else if (a2->Type == D_DINT)	return DIV_T_AN_DINT(a1, a2, a3, a4);
	else if (a2->Type == D_INT)		return DIV_T_AN_INT(a1, a2, a3, a4);
	else if (a2->Type == D_LINT)	return DIV_T_AN_LINT(a1, a2, a3, a4);
	else if (a2->Type == D_UDINT)	return DIV_T_AN_UDINT(a1, a2, a3, a4);
	else if (a2->Type == D_UINT)	return DIV_T_AN_UINT(a1, a2, a3, a4);
	else if (a2->Type == D_USINT)	return DIV_T_AN_USINT(a1, a2, a3, a4);
	else if (a2->Type == D_ULINT)	return DIV_T_AN_ULINT(a1, a2, a3, a4);
	else if (a2->Type == D_REAL)	return DIV_T_AN_REAL(a1, a2, a3, a4);
	else if (a2->Type == D_LREAL)	return DIV_T_AN_LREAL(a1, a2, a3, a4);
	// v1.0ではRT-edgeタグのUSINT～UDINTがBYTE～にDWORDになってしまうため追加 ※ 型変換対応後削除
	else if (a2->Type == D_DWORD)	return DIV_T_AN_UDINT(a1, a2, a3, a4);
	else if (a2->Type == D_WORD)	return DIV_T_AN_UINT(a1, a2, a3, a4);
	else if (a2->Type == D_BYTE)	return DIV_T_AN_USINT(a1, a2, a3, a4);
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターエラー（未登録データタイプが渡された）
	else
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_AN:invalid data type");	//パラメータエラー発生
	}
#endif
	//結果を返す
	return a1;

}
P_ANY DIV_T_AN_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	T_LREAL tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	tmp = (*a1->pTime) / (T_LREAL)(*a2->pReal);	// 一時変数に演算結果を格納

	//オーバーフローチェック
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "DIV_T_AN_REAL");		//オーバーフロー発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	// REAL型の値が無効か確認
	if (ChckREAL(*a2->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "DIV_T_AN_REAL:IN2");	//値が無効値です。
		a1->Type = D_TIME;
		*a1->pTime = 0;
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	//0除算チェック
	if (*a2->pReal == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AN_REAL:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 除数マイナスチェック
	if (*a2->pReal < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_AN_REAL:IN2");	//マイナスによる除算発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}


	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (T_TIME)round(tmp);

	return a1;
}

P_ANY DIV_T_AN_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	T_LREAL tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	tmp = (*a1->pTime) / (T_LREAL)(*a2->pLreal);	// 一時変数に演算結果を格納

	//オーバーフローチェック
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "DIV_T_AN_LREAL");		//オーバーフロー発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	// LREAL型の値が無効か確認
	if (ChckLREAL(*a2->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "DIV_T_AN_LREAL:IN2");	//値が無効値です。

		a1->Type = D_TIME;
		*a1->pTime = 0;
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//0除算チェック
	if (*a2->pLreal == 0.0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AN_LREAL:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 除数マイナスチェック
	if (*a2->pLreal < 0.0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_AN_LREAL:IN2");	//マイナスによる除算発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (T_TIME)round(tmp);

	return a1;
}
P_ANY DIV_T_AN_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pSint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AN_SINT:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 除数マイナスチェック
	if (*a2->pSint < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_AN_SINT:IN2");	//マイナスによる除算発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pSint);

	return a1;
}
P_ANY DIV_T_AN_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pDint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AN_DINT:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 除数マイナスチェック
	if (*a2->pDint < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_AN_DINT:IN2");	//マイナスによる除算発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pDint);

	return a1;
}
P_ANY DIV_T_AN_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pInt == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AN_INT:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 除数マイナスチェック
	if (*a2->pInt < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_AN_DINT:IN2");	//マイナスによる除算発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pInt);

	return a1;
}
P_ANY DIV_T_AN_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pLint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AN_LINT:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 除数マイナスチェック
	if (*a2->pLint < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_AN_LINT:IN2");	//マイナスによる除算発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pLint);

	return a1;
}
P_ANY DIV_T_AN_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUdint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AN_UDINT");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pUdint);

	return a1;
}
P_ANY DIV_T_AN_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AN_UINT");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pUint);

	return a1;
}
P_ANY DIV_T_AN_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUsint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AN_USINT");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pUsint);

	return a1;
}
P_ANY DIV_T_AN_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUlint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AN_ULINT");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pUlint);

	return a1;
}




/// <summary>
/// （除算）入力 IN1 と IN2 の除算を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
P_ANY DIV_T_AI(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{

	//データ型毎に分岐
	if (a2->Type == D_SINT)			return DIV_T_AI_SINT(a1, a2, a3, a4);
	else if (a2->Type == D_DINT)	return DIV_T_AI_DINT(a1, a2, a3, a4);
	else if (a2->Type == D_INT)		return DIV_T_AI_INT(a1, a2, a3, a4);
	else if (a2->Type == D_LINT)	return DIV_T_AI_LINT(a1, a2, a3, a4);
	else if (a2->Type == D_UDINT)	return DIV_T_AI_UDINT(a1, a2, a3, a4);
	else if (a2->Type == D_UINT)	return DIV_T_AI_UINT(a1, a2, a3, a4);
	else if (a2->Type == D_USINT)	return DIV_T_AI_USINT(a1, a2, a3, a4);
	else if (a2->Type == D_ULINT)	return DIV_T_AI_ULINT(a1, a2, a3, a4);
	// v1.0ではRT-edgeタグのUSINT～UDINTがBYTE～にDWORDになってしまうため追加 ※ 型変換対応後削除
	else if (a2->Type == D_DWORD)	return DIV_T_AI_UDINT(a1, a2, a3, a4);
	else if (a2->Type == D_WORD)	return DIV_T_AI_UINT(a1, a2, a3, a4);
	else if (a2->Type == D_BYTE)	return DIV_T_AI_USINT(a1, a2, a3, a4);
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターエラー（未登録データタイプが渡された）
	else
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_AI:invalid data type");	//パラメータエラー発生
	}
#endif
	//結果を返す
	return a1;

}

P_ANY DIV_T_AI_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pSint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AI_SINT:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 除数マイナスチェック
	if (*a2->pSint < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_AI_SINT:IN2");	//マイナスによる除算発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pSint);

	return a1;
}
P_ANY DIV_T_AI_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pDint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AI_DINT:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 除数マイナスチェック
	if (*a2->pDint < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_AI_DINT:IN2");	//マイナスによる除算発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pDint);

	return a1;
}
P_ANY DIV_T_AI_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pInt == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AI_INT:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 除数マイナスチェック
	if (*a2->pInt < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_AI_INT:IN2");	//マイナスによる除算発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pInt);

	return a1;
}
P_ANY DIV_T_AI_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pLint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AI_LINT:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 除数マイナスチェック
	if (*a2->pLint < 0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_AI_LINT:IN2");	//マイナスによる除算発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pLint);

	return a1;
}
P_ANY DIV_T_AI_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUdint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AI_UDINT:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pUdint);

	return a1;
}
P_ANY DIV_T_AI_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AI_UINT:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pUint);

	return a1;
}
P_ANY DIV_T_AI_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUsint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AI_USINT:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pUsint);

	return a1;
}
P_ANY DIV_T_AI_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	//0除算チェック
	if (*a2->pUlint == 0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_AI_ULINT:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (*a1->pTime) / (T_TIME)(*a2->pUlint);

	return a1;
}



/// <summary>
/// （除算）入力 IN1 と IN2 の除算を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
P_ANY DIV_T_R(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetDivEno(TRUE);	// ENOフラグのリセット

	T_LREAL tmp = 0;	// オーバーフロー判定用にひとまわり大きい変数を用意
	tmp = (*a1->pTime) / (T_LREAL)(*a2->pReal);	// 一時変数に演算結果を格納

	//オーバーフローチェック
	if (tmp > ULONG_MAX)
	{
		Eexception_Post(FUK_OVERFLOW_ERR, "DIV_T_R");		//オーバーフロー発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	// REAL型の値が無効か確認
	if (ChckREAL(*a2->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "DIV_T_R:IN2");	//値が無効値です。

		a1->Type = D_TIME;
		*a1->pTime = 0;
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//0除算チェック
	if (*a2->pReal == 0.0)
	{
		Eexception_Post(FUK_0DIV_ERR, "DIV_T_R:IN2");	//0除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//マイナス値による除算チェック
	if (*a2->pReal < 0.0)
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "DIV_T_R:IN2");	//マイナス除算例外発生
		SetDivEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	//出力情報
	a1->Type = D_TIME;
	*a1->pTime = (T_TIME)round(tmp);

	return a1;
}

