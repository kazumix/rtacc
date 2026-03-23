#include <stdio.h>
#include <stdlib.h>

#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

T_BOOL STAT_ENO_LT;	// LT用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// LT処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetLtEno(T_BOOL eno)
{
	STAT_ENO_LT = eno;
}

/// <summary>
/// LT処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetLtEno()
{
	return STAT_ENO_LT;
}

/// <summary>
/// （比較 : <= ）パラメータを比較し、IN1 が IN2 より小さいか?
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>

PLCPIEC_API P_ANY LT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターは同じ型か？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LT:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)
	MaskBitfield(a2);	// ビット指定処理(第2パラメータ)

	//データ型毎に分岐
	if (a1->Type == D_REAL)		return LT_REAL(a1, a2, a3, a4);
	if (a1->Type == D_LREAL)	return LT_LREAL(a1, a2, a3, a4);
	if (a1->Type == D_SINT)		return LT_SINT(a1, a2, a3, a4);
	if (a1->Type == D_DINT)		return LT_DINT(a1, a2, a3, a4);
	if (a1->Type == D_INT)		return LT_INT(a1, a2, a3, a4);
	if (a1->Type == D_LINT)		return LT_LINT(a1, a2, a3, a4);
	if (a1->Type == D_UDINT)	return LT_UDINT(a1, a2, a3, a4);
	if (a1->Type == D_UINT)		return LT_UINT(a1, a2, a3, a4);
	if (a1->Type == D_USINT)	return LT_USINT(a1, a2, a3, a4);
	if (a1->Type == D_ULINT)	return LT_ULINT(a1, a2, a3, a4);
	if (a1->Type == D_TIME)		return LT_TIME(a1, a2, a3, a4);
	if (a1->Type == D_DWORD)	return LT_DWORD(a1, a2, a3, a4);
	if (a1->Type == D_WORD)		return LT_WORD(a1, a2, a3, a4);
	if (a1->Type == D_BYTE)		return LT_BYTE(a1, a2, a3, a4);
	if (a1->Type == D_BOOL)		return LT_BOOL(a1, a2, a3, a4);

	//パラメーターエラー（未登録データタイプが渡された）
	Eexception_Post(FUK_PARAMEFER_ERR, "LT:invalid data type");	//パラメータエラー発生
	return a1;
}


PLCPIEC_API P_ANY LT_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	// REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LT_REAL:IN1");	//値が無効値です。
		SetLtEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	// REAL型の値が無効か確認
	if (ChckREAL(*a2->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LT_REAL:IN2");	//値が無効値です。
		SetLtEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pReal) < (*a2->pReal);

	return a1;
}

PLCPIEC_API P_ANY LT_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	// LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LT_LREAL:IN1");	//値が無効値です。
		SetLtEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	// LREAL型の値が無効か確認
	if (ChckLREAL(*a2->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "LT_LREAL:IN2");	//値が無効値です。
		SetLtEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pLreal) < (*a2->pLreal);

	return a1;
}

PLCPIEC_API P_ANY LT_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pSint) < (*a2->pSint);

	return a1;
}

PLCPIEC_API P_ANY LT_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pDint) < (*a2->pDint);

	return a1;
}

PLCPIEC_API P_ANY LT_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pInt) < (*a2->pInt);

	return a1;
}

PLCPIEC_API P_ANY LT_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pLint) < (*a2->pLint);

	return a1;
}

PLCPIEC_API P_ANY LT_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pUdint) < (*a2->pUdint);

	return a1;
}

PLCPIEC_API P_ANY LT_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pUint) < (*a2->pUint);

	return a1;
}

PLCPIEC_API P_ANY LT_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pUsint) < (*a2->pUsint);

	return a1;
}

PLCPIEC_API P_ANY LT_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pUlint) < (*a2->pUlint);

	return a1;
}

PLCPIEC_API P_ANY LT_TIME(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pTime) < (*a2->pTime);

	return a1;
}

PLCPIEC_API P_ANY LT_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pDword) < (*a2->pDword);

	return a1;
}

PLCPIEC_API P_ANY LT_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pWord) < (*a2->pWord);

	return a1;
}

PLCPIEC_API P_ANY LT_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pByte) < (*a2->pByte);

	return a1;
}

PLCPIEC_API P_ANY LT_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetLtEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pBool) < (*a2->pBool);

	return a1;
}