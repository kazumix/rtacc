#include <stdio.h>
#include <stdlib.h>

#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

T_BOOL STAT_ENO_NE;	// NE用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// NE処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetNeEno(T_BOOL eno)
{
	STAT_ENO_NE = eno;
}

/// <summary>
/// EN処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetNeEno()
{
	return STAT_ENO_NE;
}

/// <summary>
/// （比較 : <= ）パラメータを比較し、IN1 と IN2 が等しく無いか?
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY NE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターは同じ型か？
	if (a1->Type != a2->Type)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "NE:Data type mismatch");	//パラメータエラー発生
		return a1;
	}
#endif
	MaskBitfield(a1);	// ビット指定処理(第1パラメータ)
	MaskBitfield(a2);	// ビット指定処理(第2パラメータ)

	//データ型毎に分岐
	if (a1->Type == D_REAL)		return NE_REAL(a1, a2, a3, a4);
	if (a1->Type == D_LREAL)	return NE_LREAL(a1, a2, a3, a4);
	if (a1->Type == D_SINT)		return NE_SINT(a1, a2, a3, a4);
	if (a1->Type == D_DINT)		return NE_DINT(a1, a2, a3, a4);
	if (a1->Type == D_INT)		return NE_INT(a1, a2, a3, a4);
	if (a1->Type == D_LINT)		return NE_LINT(a1, a2, a3, a4);
	if (a1->Type == D_UDINT)	return NE_UDINT(a1, a2, a3, a4);
	if (a1->Type == D_UINT)		return NE_UINT(a1, a2, a3, a4);
	if (a1->Type == D_USINT)	return NE_USINT(a1, a2, a3, a4);
	if (a1->Type == D_ULINT)	return NE_ULINT(a1, a2, a3, a4);
	if (a1->Type == D_TIME)		return NE_TIME(a1, a2, a3, a4);
	if (a1->Type == D_DWORD)	return NE_DWORD(a1, a2, a3, a4);
	if (a1->Type == D_WORD)		return NE_WORD(a1, a2, a3, a4);
	if (a1->Type == D_BYTE)		return NE_BYTE(a1, a2, a3, a4);
	if (a1->Type == D_BOOL)		return NE_BOOL(a1, a2, a3, a4);
	
	//パラメーターエラー（未登録データタイプが渡された）
	Eexception_Post(FUK_PARAMEFER_ERR, "NE:invalid data type");	//パラメータエラー発生

	return a1;
}

PLCPIEC_API P_ANY NE_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	// REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "NE_REAL:IN1");	//値が無効値です。
		SetNeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	// REAL型の値が無効か確認
	if (ChckREAL(*a2->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "NE_REAL:IN2");	//値が無効値です。
		SetNeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pReal) != (*a2->pReal);

	return a1;
}

PLCPIEC_API P_ANY NE_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	// LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "NE_LREAL:IN1");	//値が無効値です。
		SetNeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	// LREAL型の値が無効か確認
	if (ChckLREAL(*a2->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "NE_LREAL:IN2");	//値が無効値です。
		SetNeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pLreal) != (*a2->pLreal);

	return a1;
}

PLCPIEC_API P_ANY NE_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pSint) != (*a2->pSint);

	return a1;
}

PLCPIEC_API P_ANY NE_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pDint) != (*a2->pDint);

	return a1;
}

PLCPIEC_API P_ANY NE_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pInt) != (*a2->pInt);

	return a1;
}

PLCPIEC_API P_ANY NE_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pLint) != (*a2->pLint);

	return a1;
}

PLCPIEC_API P_ANY NE_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pUdint) != (*a2->pUdint);

	return a1;
}

PLCPIEC_API P_ANY NE_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pUint) != (*a2->pUint);

	return a1;
}

PLCPIEC_API P_ANY NE_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pUsint) != (*a2->pUsint);

	return a1;
}

PLCPIEC_API P_ANY NE_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pUlint) != (*a2->pUlint);

	return a1;
}

PLCPIEC_API P_ANY NE_TIME(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pTime) != (*a2->pTime);

	return a1;
}

PLCPIEC_API P_ANY NE_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pDword) != (*a2->pDword);

	return a1;
}

PLCPIEC_API P_ANY NE_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pWord) != (*a2->pWord);

	return a1;
}

PLCPIEC_API P_ANY NE_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pByte) != (*a2->pByte);

	return a1;
}

PLCPIEC_API P_ANY NE_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetNeEno(TRUE);	// ENOフラグのリセット

	//出力情報
	a1->Type = D_BOOL;
	*a1->pBool = (*a1->pBool) != (*a2->pBool);

	return a1;
}