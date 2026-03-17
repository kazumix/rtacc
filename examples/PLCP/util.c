#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "md5.h"

#include "common.h"

// INtimeユーティリティ関数

RTHANDLE		hRootProcess;
RTHANDLE		hThisProcess;
DWORD			dwKtickInUsecs;


///////////////////////////////////////////////////////////////////////////////
//	関数	：	INtime_CheckDRTOS
//	処理	：	INtime dRTOSか判断
//	引数	： 	なし
//	戻り値	：	0:通常環境 1:dRTOS
//	変更履歴：	
///////////////////////////////////////////////////////////////////////////////
WORD INtime_CheckDRTOS(void)
{
	char	iodRTOS[] = "RINTM";						// dRTOS判断用カタログ名
	WORD	woRtn;										// 0:通常 1:dRTOS
	RTHANDLE	hRoot;

	woRtn = 0;											// 初期値　0：通常

	hRoot = GetRtThreadHandles(ROOT_PROCESS);

	// dRTOSか確認
	if (LookupRtHandle(hRoot, iodRTOS, 0) != BAD_RTHANDLE) woRtn = 1;	// 1：dRTOS

	return(woRtn);
}

///////////////////////////////////////////////////////////////////////////////
//	関数	：	INtime_WaitIO
//	処理	：	INtime I/Oのオブジェクトがカタログされるのを待つ
//	引数	： 	なし
//	戻り値	：	正常終了で0を返す（0以外は返さない）
//	変更履歴：	
///////////////////////////////////////////////////////////////////////////////
WORD INtime_WaitIO(void)
{
	char ioReq[] = "RTIOSrvReq";
	char ioRsp[] = "RTIOSrvRsp";
	char ioSem[] = "RTIOSrvSem";

	RTHANDLE hRoot = GetRtThreadHandles(ROOT_PROCESS);

	for (;;) {
		if ((LookupRtHandle(hRoot, ioReq, 0) != BAD_RTHANDLE)
			&& (LookupRtHandle(hRoot, ioRsp, 0) != BAD_RTHANDLE)
			&& (LookupRtHandle(hRoot, ioSem, 0) != BAD_RTHANDLE))
			break;
		RtSleep(500);
	}
	return(0);
}

struct				_INIT {
	enum States {
		BEFORE_INIT,
		INIT_BUSY,
		INIT_DONE,
		CLEANUP_BUSY
	}					state;
	RTHANDLE			hMain;
	BOOL				bCataloged;

	RTHANDLE			hSQengineThread;	// シーケンススレッド

}strInit;

__inline DWORD UsecsToKticks(DWORD dwUsecs)
{
	return (dwUsecs + dwKtickInUsecs - 1) / dwKtickInUsecs;
}

/*****************************************************************************
*
* FUNCTION:			Fail
*
* PARAMETERS:		printf同様のパラメータを期待します
*
* RETURNS:			この関数から処理が戻ることはありません
*
* DESCRIPTION:
*  デバッグモードにおいてメッセージを表示します
*  このとき現在のプロセスは無条件に削除されます
\*****************************************************************************/
void			Fail(LPSTR lpszMessage, ...)
{
	EXCEPTION		eh;
	RTHANDLE		hDelMbx;
	DWORD			dwTerminate;

	va_list			ap;

	va_start(ap, lpszMessage);
	vprintf(lpszMessage, ap);
	va_end(ap);
	printf("\nError nr=%x\n", GetLastRtError());

	// 例外を調査します
	GetRtExceptionHandlerInfo(THREAD_HANDLER, &eh);
	eh.ExceptionMode = 0;
	SetRtExceptionHandler(&eh);

	// 初期化がまだ開始されていない状態では直ちに終了します
	if (strInit.state == BEFORE_INIT)
		exit(0);

	if (strInit.hMain == GetRtThreadHandles(THIS_THREAD))
	{
		// メインスレッドの場合：
		// もしも初期化作業中ならばクリーンアップ終了します
		if (strInit.state == INIT_BUSY)
			Cleanup();	// 戻ることはありません

		// メインスレッドの場合：
		// 現在初期化作業を行っていないときreturnにより終了します
		return;
	}

	// メインスレッド以外：
	// メインスレッドにクリーンアップの実行を要求する
	// （削除要求メールを送る）エラーは無視します
	hDelMbx = LookupRtHandle(NULL_RTHANDLE, "R?EXIT_MBOX", 5000);
	dwTerminate = TERMINATE;
	SendRtData(hDelMbx, &dwTerminate, 4);
	SuspendRtThread(NULL_RTHANDLE);

	// ここはサスペンド失敗を意味します
	while (1)
		RtSleep(655349);	// 最大限までスリープします
}


/*****************************************************************************
*
* FUNCTION:		Cleanup (local function)
*
* DESCRIPTION:
*  すべてのオブジェクトを削除します
*
\*****************************************************************************/
void			Cleanup(void)
{
	// クリーンアップ作業中を示します
	strInit.state = CLEANUP_BUSY;

	// プロセス終了
	exit(0);
}

/// <summary>
/// カタログ
/// </summary>
/// <param name="hProcess"></param>
/// <param name="hObject"></param>
/// <param name="lpszName"></param>
/// <returns></returns>
BOOL				Catalog(
	RTHANDLE			hProcess,
	RTHANDLE			hObject,
	LPSTR				lpszName)
{
	RTHANDLE		hOld;

	if (CatalogRtHandle(hProcess, hObject, lpszName))
		return TRUE;

	// よくあるエラーを検出します
	if (hProcess &&
		((hOld = LookupRtHandle(hProcess, lpszName, NO_WAIT)) != BAD_RTHANDLE) &&
		(GetRtHandleType(hOld) == INVALID_TYPE))
	{
		// 古いエントリーを削除して再度試みます
		if (UncatalogRtHandle(hProcess, lpszName))
			return (CatalogRtHandle(hProcess, hObject, lpszName));
	}
	return FALSE;
}

/// <summary>
/// INtimeシステムにおけるプロセスの基本的な初期化
/// </summary>
void INtime_ProcessInitialize(void)
{
	SYSINFO	sysinfo;

	// ルートプロセスの取得
	hRootProcess = GetRtThreadHandles(ROOT_PROCESS);
	hThisProcess = GetRtThreadHandles(THIS_PROCESS);

	// 最後に起動されたPLCエンジンプロセスをルートにカタログする
	Catalog(hRootProcess, hThisProcess, CATALOG_PROC);

	// プロセスのMAXPRIORITY引き上げ
	SetRtProcessMaxPriority(0, 0);

	// IOサブシステムとの同期
	if (!INtime_CheckDRTOS())
		INtime_WaitIO();

	// システムカーネルティック設定の取得
	CopyRtSystemInfo(&sysinfo);
	dwKtickInUsecs = 10000 / sysinfo.KernelTickRatio;

	// mainスレッドのプライオリティを下げる（初期化処理が他プロセスに影響無いよう）
	SetRtThreadPriority(0, 240);
}

/// <summary>
/// INtimeシステムでのプロセスの終了処理
/// </summary>
void INtime_ProcessFinalize(void)
{
	// このプロセスのアンカタログ
	UncatalogRtHandle(hRootProcess , Config_Get_BaseName());
}

/// <summary>
/// 実行ラダー名でこのプロセスをカタログします
/// </summary>
void INtime_ProcessCatalog(void)
{
	// このプロセスのカタログ
	Catalog(hRootProcess, hThisProcess, Config_Get_BaseName());
}

/// <summary>
/// 継続できない致命的エラーなのでメッセージでカタログしてサスペンドします
/// </summary>
/// <param name="reasonmessage"></param>
void INtime_Halt(char *reasonmessage)
{
	Catalog(0, GetRtThreadHandles(THIS_THREAD), reasonmessage);
	SuspendRtThread(NULL_RTHANDLE);
}

/// <summary>
/// RSLファイルを規定フォルダ順にサーチしてローディングします
/// </summary>
/// <param name="RslName">RSLファイル名</param>
/// <returns></returns>
WORD INtime_RslLoad(char* RslName)
{
	char			RslFilePath[128];
	RTHANDLE		hRSL;

	// RSLのローディング(STEP1: ワークフォルダ)
	strcpy_s(RslFilePath, sizeof(RslFilePath), Config_Get_RslFolder());
	strcat_s(RslFilePath, sizeof(RslFilePath), RslName);
	hRSL = LoadRtLibrary(RslFilePath);
	if (hRSL == NULL_RTHANDLE)
	{
		// 見つからなければRSLのローディング(STEP2: デフォルトRSLフォルダ)
		strcpy_s(RslFilePath, sizeof(RslFilePath), Config_Get_RslFolder_Default());
		strcat_s(RslFilePath, sizeof(RslFilePath), RslName);
		hRSL = LoadRtLibrary(RslFilePath);
	}
	if (hRSL == NULL_RTHANDLE)
	{
		// 見つからなければRSLのローディング(STEP3: RTA同一フォルダ)
		strcpy_s(RslFilePath, sizeof(RslFilePath), Config_Get_RtaFolder());
		strcat_s(RslFilePath, sizeof(RslFilePath), RslName);
		hRSL = LoadRtLibrary(RslFilePath);
	}

	return hRSL;
}

/// <summary>
/// 命令ハッシュコードの取得
/// </summary>
/// <param name="cmdname"></param>
/// <returns></returns>
HASHCODE _Hash(const char *name)
{
	MD5_CONTEXT		hMd5;
	HASHCODE		hash;
	MD5Init(&hMd5);
	MD5Update(&hMd5, (unsigned char*)name, (unsigned int)strlen(name));
	MD5Final(hash.code, &hMd5);
	return hash;
}
