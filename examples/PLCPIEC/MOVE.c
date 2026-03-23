#include <stdio.h>
#include <stdlib.h>

#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

T_BOOL STAT_ENO_MOVE;	// MOVE用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// MOVE処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetMoveEno(T_BOOL eno)
{
	STAT_ENO_MOVE = eno;
}

/// <summary>
/// MOVE処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetMoveEno()
{
	return STAT_ENO_MOVE;
}

/// <summary>
/// （加算）入力 IN1 と IN2 の転送を行います。
/// </summary>
/// <param name="IN1"></param>
/// <param name="IN2"></param>
PLCPIEC_API P_ANY MOVE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{

	//データ型毎に分岐
	if (a1->Type == D_REAL)			return MOVE_REAL(a1, a2, a3, a4);
	else if (a1->Type == D_LREAL)	return MOVE_LREAL(a1, a2, a3, a4);
	else if (a1->Type == D_SINT)	return MOVE_SINT(a1, a2, a3, a4);
	else if (a1->Type == D_DINT)	return MOVE_DINT(a1, a2, a3, a4);
	else if (a1->Type == D_INT)		return MOVE_INT(a1, a2, a3, a4);
	else if (a1->Type == D_LINT)	return MOVE_LINT(a1, a2, a3, a4);
	else if (a1->Type == D_UDINT)	return MOVE_UDINT(a1, a2, a3, a4);
	else if (a1->Type == D_UINT)	return MOVE_UINT(a1, a2, a3, a4);
	else if (a1->Type == D_USINT)	return MOVE_USINT(a1, a2, a3, a4);
	else if (a1->Type == D_ULINT)	return MOVE_ULINT(a1, a2, a3, a4);
	else if (a1->Type == D_TIME)	return MOVE_TIME(a1, a2, a3, a4);
	else if (a1->Type == D_DWORD)	return MOVE_DWORD(a1, a2, a3, a4);
	else if (a1->Type == D_WORD)	return MOVE_WORD(a1, a2, a3, a4);
	else if (a1->Type == D_BYTE)	return MOVE_BYTE(a1, a2, a3, a4);
	else if (a1->Type == D_BOOL)	return MOVE_BOOL(a1, a2, a3, a4);
	else if (a1->Type == D_STRING)	return MOVE_STRING(a1, a2, a3, a4);
	//文字列型は要検討
	//配列型は未対応
	//構造体型は未対応
#ifdef checkon	// v1.0ではパラメータチェック緩和
	//パラメーターエラー（未登録データタイプが渡された）
	else
	{
		Eexception_Post(FUK_PARAMEFER_ERR, "MOVE:invalid data type");	//パラメータエラー発生
	}
#endif
	//結果を返す
	return a1;

}

PLCPIEC_API P_ANY MOVE_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット

	// REAL型の値が無効か確認
	if (ChckREAL(*a1->pReal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MOVE_REAL:IN1");	//値が無効値です。
		SetMoveEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY MOVE_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	//LREAL型の値が無効か確認
	if (ChckLREAL(*a1->pLreal))
	{
		Eexception_Post(FUK_INVALID_VALUE_ERR, "MOVE_LREAL:IN1");	//値が無効値です。
		SetMoveEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}

	return a1;
}
PLCPIEC_API P_ANY MOVE_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_ULINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_TIME(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_BOOL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}
PLCPIEC_API P_ANY MOVE_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetMoveEno(TRUE);	// ENOフラグのリセット
	return a1;
}