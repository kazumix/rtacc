/// <summary>
/// RT-edge エッジシステムコンテナ
/// 
///		コンテナ汎用タグ管理機能 container.c
/// 
///	Base programming K.Machii
/// 
/// </summary>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "egapi.h"

#include "common.h"

#define MAX_TASK 128	// 1ノードあたりの最大タスク数

static char catalogProc[12];

/// <summary>
/// インスタンス番号を付加したプロセス名を生成します
/// フォーマット : PLC_{1,2,…}
/// </summary>
/// <param name="instnum">インスタンス番号</param>
/// <returns>TRUE: 生成成功 FALSE] 生成失敗(タスク数オーバー)</returns>
BOOL Container_Set_Catalogname(RTHANDLE hRoot, char* catalogProc)
{
	int i = 1;	// インスタンス番号
	
	for (i = 0; i < MAX_TASK; i++)
	{
		sprintf(catalogProc, "%s_%03d", CATALOG_PROC, (i + 1) );	// カタログ用プロセス名生成

		// ルートプロセスにカタログされていない場合
		if (LookupRtHandle(hRoot, (LPCSTR)catalogProc, NO_WAIT) == BAD_RTHANDLE)
			return TRUE;	// 生成したカタログ名を返す
	}

	// ノード内のインスタンス数が最大数を超える場合
	if (i == MAX_TASK)
	{
		// TODO エラー処理 
	}

	return FALSE;
}

/// <summary>
/// エッジタグの存在をチェックします
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
BOOL Container_TagCheck(char* name)
{
	int32_t		result;
	uint16_t	tagtype;
	result = EgTagGetProperty(name, "Type", &tagtype, sizeof(tagtype));
	return (result == EDGE_SUCCESS);
}

/// <summary>
/// データサイズからバイト数を取得します
/// </summary>
/// <param name=""></param>
/// <returns></returns>
uint16_t Container_TagSize(enum egTagDataType type)
{
	switch (type)
	{
	case EgVtByte:
	case EgVtBoolean:
		return 1;
	case EgVtUInt16:
	case EgVtInt16:
		return 2;
	case EgVtUInt32:
	case EgVtInt32:
		return 4;
	}
	return 0;
}

/// <summary>
/// エッジタグのインデックスを取得します
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
void* Container_TagGetIndex(char* name)
{
	int32_t			result;
	LPEDGE_INDEX	index;
	result = EgTagGetProperty(name, "Index", &index, sizeof(index));
	return (result == EDGE_SUCCESS)?index:NULL;
}

/// <summary>
/// エッジタグの存在を確認して、存在しなければ初期値で作ります
/// </summary>
/// <param name="name"></param>
/// <param name=""></param>
/// <param name="inival"></param>
/// <param name="source"></param>
/// <param name="comment"></param>
/// <returns></returns>
BOOL Container_TagCreate(char* name, enum egTagDataType type, DWORD inival, char* source, char* comment)
{
	// エッジタグの存在を確認します
	int32_t		result;
	uint16_t	size = Container_TagSize(type);
	if (!Container_TagCheck(name))
	{
		// 存在しない時は作成します
		if (type != EgVtString)
		{
			result = EgTagCreate(name, type, size, (!source) ? "" : source, (!comment) ? "" : comment);
			if (result != EDGE_SUCCESS)
				return FALSE;
			// 初期値を格納します
			result = EgTagWrite(name, &inival, size);
			if (result != EDGE_SUCCESS)
				return FALSE;
		}
		else
		{
			// 文字列型の場合
			char*	string = (char*)inival;
			size = 80;
			char		regname[32];
			uint16_t	islink;
			result = EgTagCreateSegment(name, type, size, (!source) ? "" : source, (!comment) ? "" : comment ,regname ,sizeof(regname) ,&islink);
			if (result != EDGE_SUCCESS)
				return FALSE;
			// 初期値を格納します
			result = EgTagWriteString(name, string);
			if (result != EDGE_SUCCESS)
				return FALSE;
		}
	}
	// 準備ができたので成功
	return TRUE;
}

static char _ModuleName[128];
static char _ContainerTagName[128];

/// <summary>
/// マルチインスタンス対応のため、起動サービス名を返します。
/// </summary>
/// <returns></returns>
char* Container_GetModuleName(void)
{
	return ServiceRealName;
}

/// <summary>
/// エッジコンテナタグ名称を返します
/// </summary>
/// <returns></returns>
char* Container_GetTagName(char* tagname)
{
	sprintf(_ContainerTagName, "SERVICE.%s.%s", Container_GetModuleName(), tagname);
	return _ContainerTagName;
}

/// <summary>
/// （内部）モジュール名(RTA)を記録します
/// </summary>
/// <param name="argv0"></param>
void Container_SetModuleName(char* argv0)
{
	// オリジナルバッファを壊さないようにコピーします
	size_t	size = sizeof(_ModuleName);
	strcpy_s(_ModuleName, size, argv0);
	// フォルダパスの区切り文字を探す
	char* delim;
	delim = strrchr(_ModuleName, '\\');
	if (delim == NULL)
		delim = strrchr(_ModuleName, '/');
	if (delim == NULL)
		return;		// あり得ないけど安全のため失敗
	delim += 1;
	size_t len = strlen(delim) + 1;
	memmove_s(_ModuleName, size, delim ,len);
	// 拡張子'.'を取り除く
	char* end;
	end = strrchr(_ModuleName, '.');
	if (end)
		*end = '\0';
	// _ModuleNameが完成
}

/// <summary>
/// エッジログ出力コンテナ向けの要求
/// </summary>
/// <param name="pServiceName"></param>
/// <param name="pMode"></param>
/// <param name="_Format"></param>
/// <param name=""></param>
void Container_Log$(const char* pServiceName, const char* pMode, const char * _Format, ...)
{
	va_list arg;
	static char *messBuff;
	size_t bufsize = 1024;

	// 作業バッファのアロケート、プロセス終了までfreeすることはありません
	if (!messBuff)
	{
		messBuff = (char*)malloc(bufsize);
		if (messBuff == NULL)
			return;
		memset(messBuff, 0, bufsize);
	}
	// Log出力処理
	va_start(arg, _Format);
	vsprintf_s(messBuff, bufsize, _Format, arg);
	va_end(arg);
	EgFW_PrintLog(pServiceName, pMode, messBuff);
}


/// <summary>
/// プロセス終了制御用のイベント
/// </summary>
RTHANDLE hExitEvent;

void ExitEvent_Init(void)
{
	hExitEvent = CreateRtSemaphore(0, 1, FIFO_QUEUING);
	CatalogRtHandle(0, hExitEvent, CATALOG_EXITEVENT);
}
void ExitEvent_Wait(void)
{
	WaitForRtSemaphore(hExitEvent, 1, WAIT_FOREVER);
}
void ExitEvent_Post(void)
{
	// プロセス終了イベント発行
	ReleaseRtSemaphore(hExitEvent, 1);
}

/// <summary>
/// INtime RTAのmainイベントハンドラ
/// </summary>
void ExitEvent_RtaMsgHandler(void)
{
	EVENTINFO		eiEventInfo;

	// RTローダの-W同期用マーキング
	SynchronizeRtLoader();

	// スレッドをカタログ
	CatalogRtHandle(0, GetRtThreadHandles(THIS_THREAD), CATALOG_NOTYFY);
	// INtimeシステムメッセージを処理します
	while (RtNotifyEvent(RT_SYSTEM_NOTIFICATIONS | RT_EXIT_NOTIFICATIONS,
		WAIT_FOREVER,
		&eiEventInfo))
	{
		switch (eiEventInfo.dwNotifyType)
		{
		case NT_HOST_DOWN:
		case TERMINATE:
			// プロセス終了イベント発行
			Indicate_Run(FALSE);
			ExitEvent_Post();
			break;
		case NT_BLUESCREEN:
			break;
		}
	}
}

/// <summary>
/// エッジフレームワーク用のメッセージハンドラ処理
/// </summary>
/// <param name="sender"></param>
/// <param name="msgno"></param>
/// <param name="param"></param>
/// <returns></returns>
int32_t Container_EgdeMsgHandler(const char* sender, int32_t msgno, void *param)
{
	switch (msgno)
	{
	case EM_SERVICE_RUN:			// サービス開始指令
		Container_Log$(ServiceRealName, EG_LOG_DBG, "EM_SERVICE_RUN recieved.");
		Indicate_Run(TRUE);
		break;
	case EM_SERVICE_PAUSE:			// サービス一時停止指令
		Container_Log$(ServiceRealName, EG_LOG_DBG, "EM_SERVICE_PAUSE recieved.");
		Indicate_Run(FALSE);
		break;
	case EM_SERVICE_STOP:			// サービス終了指令
		Container_Log$(ServiceRealName, EG_LOG_DBG, "EM_SERVICE_STOP recieved.");
		// プロセス終了イベント発行
		Indicate_Run(FALSE);
		ExitEvent_Post();
		break;
	case EM_SERVICE_UPDATE:			// サービスアップデート指令
		// 無処理
		break;
	}
	return 0;
}

/// <summary>
/// コンテナプロセスの初期化
/// </summary>
void Container_Init(void)
{
	// エッジコンテナ共通処理、フレームワークメッセージハンドラの登録 EgInit
	EDGECONFIG		config = EDGE_CONFIG_DEFAULT;
	config.fpUserMessHdlFunc = Container_EgdeMsgHandler;
	EgInit(&config);

	// エッジコンテナ共通処理、フレームワークの処理待ち
	RtSleep(100);

	// エッジコンテナ共通処理、各機能を初期化します
	Property_Init();
	Indicate_Init();
	Trigger_Init();
	ExitEvent_Init();

	// このスレッドのプライオリティをセットします(Property_Initを済ませていること)
	SetRtProcessMaxPriority(0, 0);
	SetRtThreadPriority(THIS_THREAD, Property_Get_Priority() + PRI_MAIN);

	// ルートプロセスハンドル取得
	RTHANDLE hRoot = GetRtThreadHandles(ROOT_PROCESS);
	// 自プロセスのカタログ名生成
	Container_Set_Catalogname(hRoot, catalogProc);
	// プロセスをカタログ
	UncatalogRtHandle(hRoot, catalogProc);
	CatalogRtHandle(hRoot, GetRtThreadHandles(THIS_PROCESS), catalogProc);

	// スレッドをカタログ
	CatalogRtHandle(0, GetRtThreadHandles(THIS_THREAD), CATALOG_MAIN);

	// INtexによるINtimeプロセス終了指令を管理するスレッド
	CreateRtThread(Property_Get_Priority() + PRI_NOTIFY, ExitEvent_RtaMsgHandler, STACK_NOTIFY, 0);

	// インジケータ更新
	Indicate_STATE_ON(TRUE);
	Indicate_STATE_LOADING(FALSE);
	Indicate_STATE_STOP(FALSE);
	Indicate_STATE_STEP(FALSE);
	Indicate_STATE_HALT(FALSE);
	Indicate_STATE_RUN(TRUE);
	Indicate_ERRORS(Errorlog_Count());

	// AutoRunを処理
	if (Property_Get_Autorun())
		Indicate_Run(TRUE);
	else
		Indicate_Run(FALSE);
}

/// <summary>
/// コンテナプロセスの終了
/// </summary>
void Container_Finish(void)
{
	// ルートプロセスハンドル取得
	RTHANDLE hRoot = GetRtThreadHandles(ROOT_PROCESS);
	// プロセスをアンカタログ
	UncatalogRtHandle(hRoot, catalogProc);

	// インジケータ更新
	Indicate_STATE_ON(FALSE);
	Indicate_STATE_LOADING(FALSE);
	Indicate_STATE_STOP(FALSE);
	Indicate_STATE_RUN(FALSE);
	Indicate_STATE_STEP(FALSE);
	Indicate_STATE_HALT(FALSE);

	// エッジコンテナ終了処理
	EgFinalize();
}

/// <summary>
/// 与えられたタグリストを使ってエッジタグの生成を行います
/// </summary>
/// <param name="current"></param>
/// <returns></returns>
BOOL Container_CreateTagsFromList(struct CONTAINER_TAGS* current)
{
	BOOL	result;
	char*	containertagname;
	static T_ANY	dummy;

	// エッジタグを生成します
	while (current->name)
	{
		// タグ名を組み立てます
		containertagname = Container_GetTagName(current->name);
		// タグの存在を確認します
		if (Container_TagCheck(containertagname))
		{
			// 存在するのでインデックスを取得しておきます
			current->index = Container_TagGetIndex(containertagname);

			// タグのデータポインタを取得しておきます
			int32_t		result;
			RTEDGEVARIANT	*tagdescriptor = 0;
			result = EgTagGetProperty(containertagname, "Entry", &tagdescriptor, sizeof(tagdescriptor));
			if (result == EDGE_SUCCESS)
			{
				current->pvalue = (union ANYVAL*)&tagdescriptor->val;

				// エッジタグの接続OK
				current->linked = TRUE;
			}
			else
				current->pvalue = (union ANYVAL*)&dummy;
		}
		else if (current->create)
		{
			// 存在しない時にタグを生成します
			result = Container_TagCreate(containertagname, current->type, current->defaultval, current->source, current->comment);
			if (!result)
				return FALSE;

			// インデックスを取得しておきます
			current->index = Container_TagGetIndex(containertagname);

			// タグのデータポインタを取得しておきます
			int32_t		result;
			RTEDGEVARIANT	*tagdescriptor = 0;
			result = EgTagGetProperty(containertagname, "Entry", &tagdescriptor, sizeof(tagdescriptor));
			if (result == EDGE_SUCCESS)
			{
				current->pvalue = (union ANYVAL*)&tagdescriptor->val;

				// エッジタグの接続OK
				current->linked = TRUE;
			}
			else
				current->pvalue = (union ANYVAL*)&dummy;
		}

		current++;
	}

	return FALSE;
}