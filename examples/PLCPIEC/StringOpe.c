#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "common.h"		//共通ヘッダ
#include "PLCPIEC.h"	//ファンクションヘッダ

T_BOOL STAT_ENO_STRING_OPE;	// STRING_OPE用ENO状態保持変数(シングルスレッド用)

/// <summary>
/// STRING_OPE処理結果のENOを設定します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ書込みへ変更する必要あり
/// </summary>
/// <param name="eno">ENOの値</param>
/// <returns> (なし) </returns>
PLCPIEC_API void SetStringOpeEno(T_BOOL eno)
{
	STAT_ENO_STRING_OPE = eno;
}

/// <summary>
/// STRING_OPE処理結果のENOを返却します。
/// ※ マルチインスタンスに未対応
///    ローカルスレッドストレージ参照へ変更する必要あり
/// </summary>
/// <returns></returns>
PLCPIEC_API T_BOOL GetStringOpeEno()
{
	return STAT_ENO_STRING_OPE;
}

/*
* 文字列操作ファンクション
*/

/*
* 内部関数: フォーマット指定子の妥当性チェック
*/
BOOL Check_Format(WORD type, T_STRING format)
{
	int i = 0;
	BOOL floatpoint = FALSE;	// 小数点存在フラグ
	BOOL dicimal = FALSE;		// 小数点の桁存在フラグ

	// 先頭が%から始まらない場合
	if (strncmp(format.string, (const char*)"%", 1) != 0)
		return FALSE;

	// %以降の桁数と表示形式を判定
	for (int i = 1; i < format.length; i++)
	{
		// 数値の場合
		if (   (strncmp(format.string, (const char*)"1", 1) == 0) 
			&& (strncmp(format.string, (const char*)"9", 1) == 0))
		{
			// 小数点が見つかってから最初の数値の場合
			if (floatpoint && !dicimal)
			{					
				// 小数点以下桁数が1以上7以下でない場合
				if (   (strncmp(format.string, (const char*)"1", 1) == 0)
					&& (strncmp(format.string, (const char*)"7", 1) == 0))
					return FALSE;
				dicimal = TRUE;
			}
			// 小数点が見つかってから2回目の数値の場合
			if (floatpoint && dicimal)
				return FALSE;
		}
		// 小数点の場合
		else if (strncmp(format.string, (const char*)".", 1) == 0)
		{
			// 最初の小数点の場合
			if (!floatpoint)
				floatpoint = TRUE;
			// 小数点が2回見つかった場合
			else
				return FALSE;
		}
		// 文字の場合
		else
		{
			// 文字列の最後でない場合
			if (i != (format.length - 1))
				return FALSE;
			// 文字列の最後の場合
			else
			{
				// 変換対象の数値型に対応する形式か判定
				switch (type)
				{
				case D_BYTE:
					if (   (strncmp(format.string, (const char*)"c", 1) == 0)
						|| (strncmp(format.string, (const char*)"x", 1) == 0)
						|| (strncmp(format.string, (const char*)"u", 1) == 0))
						return TRUE;
					break;
				case D_WORD:
				case D_DWORD:
					if (   (strncmp(format.string, (const char*)"x", 1) == 0)
						|| (strncmp(format.string, (const char*)"u", 1) == 0))
						return TRUE;
					break;
				case D_SINT:
				case D_INT:
				case D_DINT:
				case D_LINT:
					if (strncmp(format.string, (const char*)"d", 1) == 0)
						return TRUE;
					break;
				case D_TIME:
				case D_USINT:
				case D_UINT:
				case D_UDINT:
					if (strncmp(format.string, (const char*)"u", 1) == 0)
						return TRUE;
					break;
				case D_REAL:
				case D_LREAL:
					if (   (strncmp(format.string, (const char*)"e", 1) == 0)
						|| (strncmp(format.string, (const char*)"f", 1) == 0))
						return TRUE;
					break;
				default:
					return FALSE;
				}
			}
		}
	}

	return FALSE;
}

/*
* 内部関数:空の文字列を返します
*/
P_ANY RETURN_NULL_STR(P_ANY a1)
{
	int i = 0;

	a1->pString->length = 0;
	for (i = 0; i < STRING_MAX + 1; i++)
		*(a1->pString->string + i) = '\0';

	return a1;
}

/*
* BYTE値を文字列に変換します
*/
PLCPIEC_API P_ANY BYTE_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	errno_t err = 0;
	T_BYTE byVal = 0;
	char strfmt[256] = {0};

	byVal = *a1->pByte;
	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{		
		// デフォルトをセット
		err = strcpy_s(strfmt, 3, "%x");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない
	

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, byVal);	// フォーマットに対して数値を適用して文字列化する
	// 文字列化に成功したか？
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
		
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "BYTE_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "BYTE_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* WORD値を文字列に変換します
*/
PLCPIEC_API P_ANY WORD_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	errno_t err = 0;
	T_WORD woVal = 0;
	char strfmt[256] = { 0 };

	woVal = *a1->pWord;

	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{
		// デフォルトをセット
		err = strcpy_s(strfmt, 3, "%x");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, woVal);	// フォーマットに対して数値を適用して文字列化する
	// 文字列化に成功したか？
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
		
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "WORD_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "WORD_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* DWORD値を文字列に変換します
*/
PLCPIEC_API P_ANY DWORD_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	errno_t err = 0;
	T_DWORD dwVal = 0;
	char strfmt[256] = { 0 };

	dwVal = *a1->pDword;
	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{
		// デフォルトをセット
		err = strcpy_s(strfmt, 3, "%x");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない+

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, dwVal);	// フォーマットに対して数値を適用して文字列化する
	// 文字列化に成功したか？
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
		
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "DWORD_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "DWORD_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* SINT値を文字列に変換します
*/
PLCPIEC_API P_ANY SINT_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	errno_t err = 0;
	T_SINT siVal = 0;
	char strfmt[256] = { 0 };

	siVal = *a1->pSint;
	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{
		// デフォルトをセット
		err = strcpy_s(strfmt, 3, "%x");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, siVal);	// フォーマットに対して数値を適用して文字列化する
	// 文字列化に成功したか？
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
		
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "SINT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "SINT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* INT値を文字列に変換します
*/
PLCPIEC_API P_ANY INT_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	errno_t err = 0;
	T_INT iVal = 0;
	char strfmt[256] = { 0 };

	iVal = *a1->pInt;
	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{
		// デフォルトをセット
		err = strcpy_s(strfmt, 3, "%x");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, iVal);	// フォーマットに対して数値を適用して文字列化する
	// 文字列化に成功したか？
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
		
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "INT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "INT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* DINT値を文字列に変換します
*/
PLCPIEC_API P_ANY DINT_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	errno_t err = 0;
	T_DINT diVal = 0;
	char strfmt[256] = { 0 };

	diVal = *a1->pDint;
	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{
		// デフォルトをセット
		err = strcpy_s(strfmt, 3, "%x");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, diVal);	// フォーマットに対して数値を適用して文字列化する
	// 文字列化に成功したか？
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
		
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "DINT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "DINT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* LINT値を文字列に変換します
*/
PLCPIEC_API P_ANY LINT_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	errno_t err = 0;
	T_LINT liVal = 0;
	char strfmt[256] = { 0 };

	liVal = *a1->pLint;
	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{
		// デフォルトをセット
		err = strcpy_s(strfmt, 5, "%llx");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, liVal);	// フォーマットに対して数値を適用して文字列化する
	// 文字列化に成功したか？
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
		
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "LINT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "LINT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* REAL値を文字列に変換します
*/
PLCPIEC_API P_ANY REAL_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	errno_t err = 0;
	T_REAL reVal = 0.0;
	char strfmt[256] = { 0 };

	reVal = *a1->pReal;
	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{
		// デフォルトをセット
		err = strcpy_s(strfmt, 3, "%e");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, reVal);	// フォーマットに対して数値を適用して文字列化する
	// 文字列化に成功したか？
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
		
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "REAL_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "REAL_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* LREAL値を文字列に変換します
*/
PLCPIEC_API P_ANY LREAL_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	errno_t err = 0;
	T_LREAL lreVal = 0.0;
	char strfmt[256] = { 0 };

	lreVal = *a1->pLreal;
	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{
		// デフォルトをセット
		err = strcpy_s(strfmt, 3, "%e");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, lreVal);	// フォーマットに対して数値を適用して文字列化する
	// 文字列化に成功したか？
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
		
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "LREAL_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "LREAL_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* TIME値を文字列に変換します
*/
PLCPIEC_API P_ANY TIME_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット
	
	errno_t err = 0;
	T_TIME tiVal = 0;
	char strfmt[256] = { 0 };

	tiVal = *a1->pTime;
	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{
		// デフォルトをセット
		err = strcpy_s(strfmt, 3, "%x");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, tiVal);	// フォーマットに対して数値を適用して文字列化する
	// 文字列化に成功したか？
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
		
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "TIME_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "TIME_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* USINT値を文字列に変換します
*/
PLCPIEC_API P_ANY USINT_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	errno_t err = 0;
	T_USINT usiVal = 0;
	char strfmt[256] = { 0 };

	usiVal = *a1->pUsint;
	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{
		// デフォルトをセット
		err = strcpy_s(strfmt, 3, "%x");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, usiVal);	// フォーマットに対して数値を適用して文字列化する
	// 文字列化に成功したか？
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
		
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "USINT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "USINT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* UINT値を文字列に変換します
*/
PLCPIEC_API P_ANY UINT_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	errno_t err = 0;
	T_UINT uiVal = 0;
	char strfmt[256] = { 0 };

	uiVal = *a1->pUint;
	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{
		// デフォルトをセット
		err = strcpy_s(strfmt, 3, "%x");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, uiVal);	// フォーマットに対して数値を適用して文字列化する
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
		
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "UINT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "UINT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* UDINT値を文字列に変換します
*/
PLCPIEC_API P_ANY UDINT_TO_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	errno_t err = 0;
	T_UDINT udiVal = 0;
	char strfmt[256] = { 0 };

	udiVal = *a1->pUdint;
	// フォーマット指定子が空だった場合
	if (a2->pString->length == 0)
	{
		// デフォルトをセット
		err = strcpy_s(strfmt, 4, "%lx");

		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		err = strcpy_s(strfmt, a2->pString->length + 1, a2->pString->string);
	}
	// フォーマット指定子の妥当性をチェック
	// ｖ1.0では実施しない

	// 数値→文字列変換
	err = snprintf(a1->pString->string, STRING_MAX, strfmt, udiVal);	// フォーマットに対して数値を適用して文字列化する
	// 文字列化に成功したか？
	if (err < 0)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);
	
		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "UDINT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	//変換後の文字列が文字列最大長を超えた場合
	else if (err > STRING_MAX)
	{
		// エラー発生時,文字列を空にする
		RETURN_NULL_STR(a1);

		// 例外を通知
		Eexception_Post(FUK_PARAMEFER_ERR, "UDINT_TO_STRING: To string failed.");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		// 成功時、文字列長を更新する
		a1->pString->length = (T_WORD)strlen(a1->pString->string);
	}
	a1->Type = D_STRING;

	return a1;
}

/*
* 文字列をBYTE値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_BYTE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	int tmp = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_BYTE:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換
	tmp = atoi((const char*)a1->pString->string);
	*a1->pByte = (T_BYTE)tmp;
	a1->Type = D_BYTE;

	return a1;
}

/*
* 文字列をWORD値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_WORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	int tmp = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_WORD:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換
	tmp = atoi((const char*)a1->pString->string);
	*a1->pWord = (T_WORD)tmp;
	a1->Type = D_WORD;

	return a1;
}

/*
* 文字列をDWORD値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_DWORD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	int tmp = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_DWORD:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換
	tmp = atoi((const char*)a1->pString->string);
	*a1->pDword = (T_DWORD)tmp;
	a1->Type = D_DWORD;

	return a1;
}

/*
* 文字列をSINT値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_SINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	int tmp = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_SINT:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換
	tmp = atoi((const char*)a1->pString->string);	
	*a1->pSint = (T_SINT)tmp;
	a1->Type = D_SINT;

	return a1;
}

/*
* 文字列をINT値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_INT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	int tmp = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_INT:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換
	tmp = atoi((const char*)a1->pString->string);
	*a1->pInt = (T_INT)tmp;
	a1->Type = D_INT;

	return a1;
}

/*
* 文字列をDINT値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_DINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	int tmp = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_DINT:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換
	tmp = atoi((const char*)a1->pString->string);
	*a1->pDint = (T_DINT)tmp;
	a1->Type = D_DINT;

	return a1;
}

/*
* 文字列をLINT値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_LINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	long long tmp = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_LINT:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換
	tmp = atoll((const char*)a1->pString->string);
	*a1->pLint = (T_LINT)tmp;
	a1->Type = D_LINT;

	return a1;
}

/*
* 文字列をREAL値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_REAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	double tmp = 0.0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_REAL:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換
	tmp = atof((const char*)a1->pString->string);
	*a1->pReal = (T_REAL)tmp;
	a1->Type = D_REAL;

	return a1;
}

/*
* 文字列をLREAL値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_LREAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	double tmp = 0.0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_LREAL:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換
	a1->Type = D_LREAL;
	tmp = atof((const char*)a1->pString->string);
	*a1->pLreal = (T_LREAL)tmp;

	return a1;
}

/*
* 文字列をTIME値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_TIME(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	int tmp = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_TIME:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換
	tmp = atoi((const char*)a1->pString->string);
	*a1->pTime = (T_TIME)tmp;
	a1->Type = D_TIME;

	return a1;
}

/*
* 文字列をUSINT値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_USINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	int tmp = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_USINT:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換	
	tmp = atoi((const char*)a1->pString->string);
	*a1->pUsint = (T_USINT)tmp;
	a1->Type = D_USINT;

	return a1;
}

/*
* 文字列をUINT値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_UINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	int tmp = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_UINT:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換
	tmp = atoi((const char*)a1->pString->string);
	*a1->pUint = (T_UINT)tmp;
	a1->Type = D_UINT;

	return a1;
}

/*
* 文字列をUDINT値に変換します
*/
PLCPIEC_API P_ANY STRING_TO_UDINT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	int tmp = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "STRING_TO_UDINT:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 文字列→数値変換
	tmp = atoi((const char*)a1->pString->string);
	*a1->pUdint = (T_UDINT)tmp;
	a1->Type = D_UDINT;

	return a1;
}

/*
* 文字列を連結します
*/
PLCPIEC_API P_ANY CONCAT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	T_WORD total = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "CONCAT:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	if (a2->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "CONCAT:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif
	// 連結後の文字列長が最大文字列数をオーバーする場合はエラー
	total = a1->pString->length + a2->pString->length;
	if (STRING_MAX < total)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		
		Eexception_Post(FUK_LIMIT_OVER_ERR, "CONCAT:String length limit over");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	// 文字列連結
	strcat(a1->pString->string, a2->pString->string);
	a1->pString->length = total;	// 文字列長更新

	return a1;
}

/*
* 文字列の指定箇所を削除します
*/
PLCPIEC_API P_ANY DELETE_STR(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	T_DINT i;
	T_DINT lendel = 0;	// 削除位置+削除数
#ifdef checkon	// v1.0ではパラメータチェック緩和
		// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "CONCAT:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	// 入力チェック
	// 削除数が0未満の場合
	if (*a2->pDint < 0)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		
		Eexception_Post(FUK_PARAMEFER_ERR, "DELETE:Delete length 0: a2");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする

		return a1;
	}
	// 削除数が0の場合
	if (*a2->pDint == 0)
	{
		// 入力文字列をそのまま返す
		return a1;
	}

	// 開始位置が0以下の場合
	if (*a3->pDint <= 0)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		
		Eexception_Post(FUK_PARAMEFER_ERR, "DELETE:Delete Start Under 0: a3");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする

		return a1;
	}
	// 文字列最大数よりも削除数のほうが大きい場合はエラー
	if (a1->pString->length < *a2->pDint)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		
		Eexception_Post(FUK_LIMIT_OVER_ERR, "DELETE:Delete size over");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする

		return a1;
	}
	lendel = *a2->pDint + (*a3->pDint - 1); // 削除位置以降の文字列開始位置

	// 削除開始位置＋削除数のほうが文字列長さよりも大きい場合はエラー
	if (a1->pString->length < lendel)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		
		Eexception_Post(FUK_LIMIT_OVER_ERR, "DELETE:Delete size over");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする

		return a1;
	}

	// 正常処理
	// 削除位置から削除文字数分 文字列を詰める
	for (i = 0; i < (STRING_MAX - *a2->pDint); i++)
	{		
		a1->pString->string[(*a3->pDint - 1) + i] = a1->pString->string[lendel + i]; 
	}
	// 末尾までクリアする
	for (i ; i < STRING_MAX; i++)
	{
		a1->pString->string[i] = '\0';
	}

	a1->pString->length = a1->pString->length - (T_WORD)(*a2->pDint);

	return a1;
}

/*
* 文字列が等しいか判定します
*/
PLCPIEC_API P_ANY EQ_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "EQ_STRING:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	if (a2->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "EQ_STRING:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif
	// 文字列比較: 一致
	if (strcmp(a1->pString->string, a2->pString->string) == 0)
		*a1->pBool = TRUE;
	else
		*a1->pBool = FALSE;

	a1->Type = D_BOOL;

	return a1;
}

/*
* 文字列内に指定文字列があるか検索します
*/
PLCPIEC_API P_ANY FIND(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	char* hit;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "FIND:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	if (a2->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "FIND:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif
	// 文字列検索
	hit = strstr(a1->pString->string, a2->pString->string);
	if (hit != 0)	// 見つかった
		*a1->pInt = hit - a1->pString->string + 1;	// 先頭からのインデックスを返す
	else
		*a1->pInt = 0;

	a1->Type = D_INT;

	return a1;
}

/*
* 文字列が等しい または大きいか判定します
*/
PLCPIEC_API P_ANY GE_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "GE_STRING:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	if (a2->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "GE_STRING:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif
	// 文字列比較: 一致または大なり
	if (strcmp(a1->pString->string, a2->pString->string) >= 0)
		*a1->pBool = TRUE;
	else
		*a1->pBool = FALSE;

	a1->Type = D_BOOL;

	return a1;
}

/*
* 文字列が大きいか判定します
*/
PLCPIEC_API P_ANY GT_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "GT_STRING:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	if (a2->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "GT_STRING:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif
	// 文字列比較: 大なり
	if (strcmp(a1->pString->string, a2->pString->string) > 0)
		*a1->pBool = TRUE;
	else
		*a1->pBool = FALSE;

	a1->Type = D_BOOL;

	return a1;
}
/*
* 文字列を指定箇所に挿入します
*/
PLCPIEC_API P_ANY INSERT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	T_WORD len1 = 0;
	T_WORD len2 = 0;
	T_DINT i = 0;
	T_DINT pos = 0;
	T_DINT lenins = 0;	// 挿入位置位置+挿入数
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "INSERT:Data type unsuitable: a1");	//パラメータエラー発生
		a1->Type = D_BYTE;
		*a1->pByte = 0;
		return a1;
	}
#endif
	len1 = a1->pString->length;	// 対象文字列長
	len2 = a2->pString->length;	// 挿入する文字列長
	pos = *a3->pDint;	// 挿入位置
	// 入力チェック
	// 挿入位置が0の場合
	if (pos == 0)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		
		Eexception_Post(FUK_PARAMEFER_ERR, "INSERT:Insert length 0: a3");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする

		return a1;
	}
	// 文字列最大数よりも挿入対象文字列数と挿入数の合計のほうが大きい場合はエラー
	if (STRING_MAX < len1 + len2)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		
		Eexception_Post(FUK_LIMIT_OVER_ERR, "INSERT:Insert size over");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする

		return a1;
	}
	// 挿入位置が挿入対象文字列の末尾より後ろの場合はエラー
	if (len1 < pos)
	{		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		
		Eexception_Post(FUK_PARAMEFER_ERR, "INSERT:Insert index error");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする

		return a1;
	}
	lenins = len2 + pos;
	// 挿入開始位置＋挿入数のほうが文字列長さよりも大きい場合はエラー
	if (STRING_MAX < lenins)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		
		Eexception_Post(FUK_LIMIT_OVER_ERR, "INSERT:Insert size over");	//パラメータエラー発生
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする

		return a1;
	}

	// 正常処理
	// 文字列1を挿入位置から文字列2の長さ分後ろにずらす
	for (i = 0; i < (len1 - pos) + len2; i++)
	{
		a1->pString->string[len1 + len2 - i - 1] = a1->pString->string[len1 - i - 1];
	}
	// 文字列1に文字列2を挿入する
	for (i = 0; i < len2; i++)
	{
		a1->pString->string[pos + i] = a2->pString->string[i];
	}

	a1->pString->length = a1->pString->length + (T_WORD)len2;

	return a1;
}

/*
* 文字列が等しい または小さいか判定します
*/
PLCPIEC_API P_ANY LE_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LE_STRING:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	if (a2->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LE_STRING:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif
	// 文字列比較: 一致または小なり
	if (strcmp(a1->pString->string, a2->pString->string) <= 0)
		*a1->pBool = TRUE;
	else
		*a1->pBool = FALSE;

	a1->Type = D_BOOL;

	return a1;
}

/*
* 文字列の左から指定文字数コピーします
*/
PLCPIEC_API P_ANY LEFT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LEFT:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// コピー文字数が最大文字列長さよりも大きい場合はエラー
	if (*a2->pDint > STRING_MAX)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	// コピー文字数が元の文字列長さよりも大きい場合はエラー
	else if (*a2->pDint > a1->pString->length)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		a1->pString->length =(T_WORD) *a2->pDint; // 文字列長更新
		// 文字列の左から指定文字数以降をnullにする
		strnset(&a1->pString->string[*a2->pDint], 0, (sizeof(a1->pString->string) - *a2->pDint));
	}

	return a1;
}

/*
* 文字列の長さを返します
*/
PLCPIEC_API P_ANY LEN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LEN:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif

	*a1->pInt = a1->pString->length;
	a1->Type = D_INT;

	return a1;
}


/*
* 文字列が小さいか判定します
*/
PLCPIEC_API P_ANY LT_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LT_STRING:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	if (a2->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LT_STRING:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif
	// 文字列比較: 小なり
	if (strcmp(a1->pString->string, a2->pString->string) < 0)
		*a1->pBool = TRUE;
	else
		*a1->pBool = FALSE;

	a1->Type = D_BOOL;

	return a1;
}


/*
* 文字列の中央から指定文字数コピーします
*/
PLCPIEC_API P_ANY MID(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	int i = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "MID:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// コピー文字数が最大文字列長さよりも大きい場合はエラー
	if (*a2->pDint > STRING_MAX)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// コピー文字数が元の文字列長さよりも大きい場合はエラー
	if (*a2->pDint > a1->pString->length)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// コピー開始位置が0以下の場合はエラー
	if (*a3->pDint <= 0)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 抽出位置＋文字数が文字列長よりも大きくなる場合はエラー
	if ((*a2->pDint + *a3->pDint) > (a1->pString->length + 1))
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}

	// 正常処理
	
	// チューニング前
	// 文字列のP番目からL文字分コピー
	strncpy(a1->pString->string, &a1->pString->string[(*a3->pDint - 1)], *a2->pDint);

	// コピー文字列以降を0にする
	for (i = 0; i < STRING_MAX - *a2->pDint; i++)
		a1->pString->string[*a2->pDint + i] = '\0';

	a1->pString->length = (T_WORD)*a2->pDint; // 文字列長更新

	return a1;
}

/*
* 文字列が等しくないか判定します
*/
PLCPIEC_API P_ANY NE_STRING(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "NE_STRING:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
	if (a2->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "NE_STRING:Data type unsuitable: a2");	//パラメータエラー発生
		return a1;
	}
#endif
	// 文字列比較: 不一致
	a1->Type = D_BOOL;
	if (strcmp(a1->pString->string, a2->pString->string) != 0)
		*a1->pBool = TRUE;
	else
		*a1->pBool = FALSE;

	return a1;
}

/*
* 文字列の一部を置換します
*/
PLCPIEC_API P_ANY REPLACE(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	T_WORD lenstr1 = 0;
	T_WORD lenstr2 = 0; 
	T_LINT pos = 0;
	T_LINT lenrep = 0;
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "REPLACE:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	lenstr1 = a1->pString->length;	// 置換対象文字列長
	lenstr2 = a2->pString->length;	// 置換文字列長
	lenrep = (T_LINT)*a3->pLint;	// 置換文字数
	pos = (T_LINT)*a4->pLint;		// 置換開始位置
	// 置換文字数が最大文字列長さよりも大きい場合はエラー
	if (lenstr2 > STRING_MAX)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 置換文字数が元の文字列長さよりも大きい場合はエラー
	if (lenstr2 > lenstr1)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 置換文字列が0の場合はエラー
	if (lenrep <= 0)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 置換位置が0の場合はエラー
	if (pos <= 0)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 置換位置が対象文字列長より大きい場合はエラー ※置換位置は1相対のため-1する
	if ((pos - 1) > lenstr1)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 置換文字数が置換文字列の長さより長い場合はエラー
	if (lenrep > lenstr2)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 置換位置＋文字数が最大文字列長よりも大きくなる場合はエラー ※置換位置は1相対のため-1する
	if ((lenrep + (pos - 1)) > STRING_MAX)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 置換位置＋文字数が置換対象文字列長よりも大きくなる場合はエラー ※置換位置は1相対のため-1する
	if ((lenrep + (pos - 1)) > a1->pString->length)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
		return a1;
	}
	// 正常処理
	// 文字列のP番目からL文字分コピー
	strncpy(&a1->pString->string[pos - 1], a2->pString->string, (size_t)lenrep);

	return a1;
}

/*
* 文字列の右から指定文字数コピーします
*/
PLCPIEC_API P_ANY RIGHT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	SetStringOpeEno(TRUE);	// ENOフラグのリセット

	T_WORD idx = 0;	// コピー位置のインデックス
#ifdef checkon	// v1.0ではパラメータチェック緩和
	// 入力が文字列でない場合
	if (a1->Type != D_STRING)
	{
		//パラメーターエラー
		Eexception_Post(FUK_PARAMEFER_ERR, "LEFT:Data type unsuitable: a1");	//パラメータエラー発生
		return a1;
	}
#endif
	// コピー文字数が最大文字列長さよりも大きい場合はエラー
	if (*a2->pDint > STRING_MAX)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	// コピー文字数が元の文字列長さよりも大きい場合はエラー
	else if (*a2->pDint > a1->pString->length)
	{
		// エラー発生時文字列を空にします
		RETURN_NULL_STR(a1);
		SetStringOpeEno(FALSE);	// パラメータエラーのためENOをFALSEにする
	}
	else
	{
		idx = (T_WORD)(a1->pString->length - *a2->pDint);	// コピー開始インデックス算出
		a1->pString->length = (T_WORD)*a2->pDint; // 文字列長更新
		// 文字列の右から指定文字数コピーする
		strncpy(a1->pString->string, &a1->pString->string[idx], *a2->pDint);
		// 末尾から指定文字数だけ空にする
		strnset(&a1->pString->string[*a2->pDint], 0, idx);
	}

	return a1;
}
