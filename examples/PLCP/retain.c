#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"


// リテイン管理
DWORD	status_retain = STATUS_STOP;

// リテイン要求タグ名
static char _Retain_Save[128];
static char _Retain_Load[128];

/// <summary>
/// リテイン要求トリガタグ名を生成します
/// </summary>
/// <param name="inst">リテインインスタンス名</param>
void Retain_Set_Tagname(char* inst)
{
	sprintf(_Retain_Save, "SERVICE.%s.Save", inst);
	sprintf(_Retain_Load, "SERVICE.%s.Load", inst);
}

/// <summary>
/// リテインデータの復元リスエストを発行する
/// </summary>
/// <returns></returns>
BOOL Retain_Load_Request(void)
{
	static uint32_t		loadordernumber;
	BOOL				result;
	// リクエスト番号（０以外）を作る
	++loadordernumber;
	if (loadordernumber == 0)
		++loadordernumber;
	// リクエストを発行します
	result = Rtedge_TagWrite_UInt32(_Retain_Load, loadordernumber);
	return result;
}

/// <summary>
/// リテインデータの保管リクエストを発行する
/// </summary>
/// <returns></returns>
BOOL Retain_Save_Request(void)
{
	static uint32_t		saveordernumber;
	BOOL				result;
	// リクエスト番号（０以外）を作る
	++saveordernumber;
	if( saveordernumber == 0 )
		++saveordernumber;
	// リクエストを発行します
	result = Rtedge_TagWrite_UInt32(_Retain_Save, saveordernumber);

	return result;
}

/// <summary>
/// リテインデータの復元完了を待機します
/// </summary>
/// <param name="timeout">msec</param>
/// <returns></returns>
BOOL Retain_Load_Wait(DWORD timeout)
{
	BOOL				result;
	uint32_t			value;
	// レスポンス（値がゼロに変化すること）を指定時間内で待機します
	do {
		// エッジタグの読み込み
		result = Rtedge_TagRead_UInt32(_Retain_Load, &value);
		// 失敗の場合は即諦めます
		if (result == FALSE)
			return FALSE;
		// 値がゼロになっていれば応答を得られた
		if (value == 0)
			return TRUE;
		// 100ms単位でインターバルしつつタイムアウト判定
		timeout = (timeout < 100) ? timeout : timeout - 100;
		if (timeout == 0)
			return FALSE;
		// 待機
		RtSleepEx(100);
	} while (1);
}

/// <summary>
/// リテインデータの保管完了を待機します
/// </summary>
/// <param name="timeout">msec</param>
/// <returns></returns>
BOOL Retain_Save_Wait(DWORD timeout)
{
	BOOL				result;
	uint32_t			value;
	// レスポンス（値がゼロに変化すること）を指定時間内で待機します
	do {
		// エッジタグの読み込み
		result = Rtedge_TagRead_UInt32(_Retain_Save, &value);
		// 失敗の場合は即諦めます
		if (result == FALSE)
			return FALSE;
		// 値がゼロになっていれば応答を得られた
		if (value == 0)
			return TRUE;
		// 100ms単位でインターバルしつつタイムアウト判定
		timeout = (timeout < 100) ? 0 : timeout - 100;
		if (timeout == 0)
			return FALSE;
		// 待機
		RtSleepEx(100);

	} while (1);
}

/// <summary>
/// リテインデータの保管と保管完了の待機をおこないます
/// </summary>
/// <returns></returns>
BOOL Retain_Save(void)
{
	BOOL	ret = Retain_Save_Request();
	if (ret)
		ret = Retain_Save_Wait(RETAIN_WAIT_TIME);
	return ret;
}

/// <summary>
/// リテインデータの復元と復元完了の待機をおこないます
/// </summary>
/// <returns></returns>
BOOL Retain_Load(void)
{
	BOOL ret = Retain_Load_Request();
	if (ret)
		ret = Retain_Load_Wait(RETAIN_WAIT_TIME);
	return ret;
}
