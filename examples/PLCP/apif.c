#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// アプリケーションインターフェース管理
DWORD	status_api = STATUS_STOP;

RTHANDLE	hAPImbx = 0;
RTHANDLE	hAPImbxRES = 0;
RTHANDLE	hAPIthread = 0;
struct PLCAPIMSG*	letter = 0;

#define		LETTER_SIZE		ALIGN_4KB( 1000 * sizeof(DWORD) )	// ヘッダDWORD2個を加える
#define		QUE_API			1		// APIの要求キューは１固定です


/// <summary>
/// アプリケーションインターフェース機能の生成
/// </summary>
void Api_Init(void)
{
	int lp1;
	RTHANDLE hMem;

	// APIメールボックスを生成する
	if (!hAPImbx)
	{
		hAPImbx = CreateRtMailbox(FIFO_QUEUING | OBJECT_MAILBOX);
		Catalog(0, hAPImbx, CATALOG_APIREQ);
	}

	// レスポンスメールボックスを生成する
	if (!hAPImbxRES)
	{
		hAPImbxRES = CreateRtMailbox(FIFO_QUEUING | OBJECT_MAILBOX);
		Catalog(0, hAPImbxRES, CATALOG_API);
		// レスポンスメールボックスにメモリをキューイングしておく
		for (lp1 = 0; lp1 < QUE_API; lp1++)
		{
			letter = (struct PLCAPIMSG*)AllocateRtMemory(LETTER_SIZE);
			memset(letter, 0, LETTER_SIZE);
			hMem = CreateRtMemoryHandle(letter, LETTER_SIZE);
			SendRtHandle(hAPImbxRES, hMem, hAPImbx);
		}
	}

	// API処理スレッドを生成する
	if (!hAPIthread)
	{
		hAPIthread = CreateRtThread(PRI_API+Config_Get_BasePriority(), Api_Thread, STACK_API, 0);
		Catalog(0, hAPIthread, CATALOG_APITHREAD);
	}

	// 本機能の動作状態を更新
	status_api = STATUS_RUN;
}

/// <summary>
/// アプリケーションインターフェーススレッド
/// </summary>
void Api_Thread(void)
{
	RTHANDLE			hMem;
	RTHANDLE			hResp;
	struct PLCAPIMSG*	pParam = letter;

	while (1)
	{
		// API要求の受信を待ちます
		hMem = ReceiveRtHandle(hAPImbx, WAIT_FOREVER, &hResp);

		// INtime Explorer空テストメッセージが届いたときはログ表示のみ行う
		if (GetRtHandleType(hMem) != SEGMENT_TYPE)
		{
			struct PLCAPIMSG		msg;
			msg.command = API_DUMP_LOG;
			Api_Dispatch(&msg);
			continue;
		}

		// コマンド処理
		Api_Dispatch(pParam);

		// 結果を返却します
		SendRtHandle(hResp, hMem, hAPImbx);
	}
}

void Api_DumpLog(void)
{
	Status_DetailDisplay();
}

void Api_PlcStop(void)
{
	PLCcontrol_Stop();
}

void Api_PlcReset(void)
{
	PLCcontrol_Reset();
}

void Api_PlcStartCold(void)
{
	PLCcontrol_ColdStart();
}

void Api_PlcStartWarm(void)
{
	PLCcontrol_HotStart();
}

void Api_PlcHalt(DWORD exceptioncode)
{
	PLCcontrol_Halt(exceptioncode);
}

void Api_PlcDownload(void)
{
	// PLCプロジェクトのローディングを行う
	PLCcontrol_Download();
	// 編集ロジックを実行ロジックに昇格します
	PLCcontrol_Swap();
#ifdef _DEBUG
	// コンソール出力が有効か
	if (Config_Get_PrintMode())
	{
		// 内部状態を詳細表示します
		Status_DetailDisplay();
	}
#endif
}

void Api_PlcRetainSave(void)
{
	PLCcontrol_RetainSave();
}

void Api_PlcRetainLoad(void)
{
	PLCcontrol_RetainLoad();
}

void Api_PlcDisasm(void)
{
	Logic_Disasm();
}

void Api_StepEnable(void)
{
	PLCcontrol_StepEnable();
}

void Api_StepDisable(void)
{
	PLCcontrol_StepDisable();
}

void Api_StepStep(void)
{
	PLCcontrol_StepStep();
}

/// <summary>
/// アプリケーションインターフェース処理タスク
///		※ここでは必ずmsg->entryで戻りデータサイズを伝える必要があります
/// </summary>
/// <param name="msg"></param>
void Api_Dispatch(struct PLCAPIMSG* msg)
{
	DWORD		p1, p2;
	char*		t1;
	//BOOL		ret;
	switch (msg->command)
	{
	//case API_TRACE_START: // トレース開始
	//	p1 = msg->datas[0];		// 採取対象の設定
	//	Trace_Set_Targets(p1, &msg->datas[1]);

	//	Trace_Enable();
	//	msg->entry = 0;			// 正常終了
	//	break;

	//case API_TRACE_STOP: // トレース停止
	//	Trace_Disable();
	//	msg->entry = 0;			// 正常終了
	//	break;

	//case API_TRACE_SET: // トレース停止条件設定
	//	p1 = msg->datas[0];		// トリガモードの指定
	//	p2 = msg->datas[1];		// トリガとなるリレーの指定
	//	p3 = msg->datas[2];		// トリガ条件成立前の採取レコード件数の指定
	//	Trace_Set_Trigger(p1,p2,p3);
	//	msg->entry = 0;			// 正常終了
	//	break;

	//case API_FORCE_START:
	//	Force_Start();
	//	msg->entry = 0;			// 正常終了
	//	break;
	//case API_FORCE_STOP:
	//	Force_Stop();
	//	msg->entry = 0;			// 正常終了
	//	break;
	//case API_FORCE_SET:
	//	p1 = msg->datas[0];		// 強制セットの値の指定
	//	p2 = msg->datas[1];		// 強制セットされるリレーの指定
	//	Force_Add(p2, FORCE_SET);
	//	msg->entry = 0;			// 正常終了
	//	break;
	//case API_FORCE_RESET:
	//	p1 = msg->datas[0];		// 強制解除されるリレーの指定
	//	Force_Delete(p1);
	//	msg->entry = 0;			// 正常終了
	//	break;
	//case API_FORCE_CLEAR:
	//	Force_Clear();
	//	msg->entry = 0;			// 正常終了
	//	break;

	//case API_QUERY_TRACESTATUS: // トレース状態取得
	//	p3 = Trace_Status();
	//	msg->entry = 1;			// 正常終了
	//	msg->datas[0] = p3;		// 状態コード
	//	break;

	//case API_QUERY_FORCE: // 強制出力リストの取得
	//	Force_GetList(&msg->entry, FORCE_MAX * sizeof(DWORD));				// entry数に続いてdatas[entry]が格納されます
	//	break;

	//case API_QUERY_TRACE: // トレースレコード取得
	//	ret = Trace_GetRecord(0, (BYTE*)msg->datas);						// byte datas[16]がdword datas[4]として格納されます
	//	if (ret == TRUE)
	//		msg->entry = (16 * 10000 + 4) / sizeof(DWORD);			// 正常終了
	//	else
	//		msg->entry = 0;			// データなし
	//	break;

	case API_DUMP_LOG:		// 内部ステータスの詳細情報掃き出し
		Api_DumpLog();
		break;

	case API_PLC_STOP:		// PLC停止
		Api_PlcStop();
		break;

	case API_PLC_RESET:		// PLCリセット
		Api_PlcReset();
		break;

	case API_PLC_START_COLD:	// PLCコールドスタート
		Api_PlcStartCold();
		break;

	case API_PLC_START_HOT:		// PLCホットスタート
		Api_PlcStartWarm();
		break;

	case API_PLC_HALT:			// PLCホルト
		p1 = msg->datas[0];
		p2 = msg->datas[1];
		t1 = (char*)&msg->datas[2];
		Api_PlcHalt(p1);
		Errorlog_Add(p2, p1, t1);
		Errorlog_Add(0, PLC_HALT, __FUNCTION__);
		break;

	case API_PLC_DOWNLOAD:
		Api_PlcDownload();
		break;

	case API_PLC_RETAIN_SAVE:		// リテインデータの保管
		Api_PlcRetainSave();
		break;

	case API_PLC_RETAIN_LOAD:		// リテインデータの復元
		Api_PlcRetainLoad();
		break;

	case API_DUMP_LOGIC:			// ロジックの逆アセンブリ出力
		Api_PlcDisasm();
		break;

	default:
		// 不明なリクエスト
		Errorlog_Add(0, API_REQUEST_ERR, "");

		msg->entry = 0;
	}
}

/// <summary>
/// PCPLC実行モジュールへAPIを要求します
/// </summary>
/// <param name="RtProcHandle"></param>
/// <param name="command"></param>
/// <param name="reqparam"></param>
/// <param name="reqparams"></param>
/// <param name="resparam"></param>
/// <param name="resparams"></param>
/// <returns></returns>
DWORD Api_Request(long RtProcHandle, DWORD command, DWORD *reqparam, DWORD reqparams, DWORD *resparam, DWORD resparams)
{
	// 初期データを格納しておく
	if (resparam)
		*resparam = 0;

	// IFを取得します
	DWORD	entry = -1;
	RTHANDLE hResMbx = LookupRtHandle((RTHANDLE)RtProcHandle, "API", 0);
	if (hResMbx == BAD_RTHANDLE)
		return entry;
	// リクエストバッファを取得します
	RTHANDLE hReqMbx;
	RTHANDLE hMem = ReceiveRtHandle(hResMbx, 0, &hReqMbx);
	if (hMem == BAD_RTHANDLE)
		return entry;
	// マッピングします
	DWORD* msg = (DWORD*)MapRtSharedMemory(hMem);
	if (msg == NULL)
		return entry;

	DWORD	size;
	DWORD	sizelimit;
	DWORD	entrylimit;

	// リクエストレターを組み立てます
	msg[0] = command;
	msg[1] = reqparams;
	if (reqparams)
	{
		// コール側の要求内容を転写します
		size = reqparams * sizeof(DWORD);
		memcpy(&msg[2], reqparam, size);
	}

	// リクエストします
	BOOL sensstatus = SendRtHandle(hReqMbx, hMem, hResMbx);
	// レスポンスを待機します
	hMem = ReceiveRtHandle(hResMbx, WAIT_FOREVER, &hReqMbx);

	// レスポンスレターを解釈します
	entry = msg[1];
	if (entry)
	{
		// コピー先に必要なサイズ
		size = sizeof(DWORD) + (entry * sizeof(DWORD));		// msg[1] + entrys
		// APIコール側のバッファを超えない範囲
		sizelimit = resparams * sizeof(DWORD);
		entrylimit = resparams - 1;
		if (size > sizelimit)
		{
			size = sizelimit;
			msg[1] = entrylimit;
			entry = entrylimit;
		}
		// システムからの受信内容を転写します
		memcpy(resparam, &msg[1], size);
	}

	// リクエストバッファを返却します
	FreeRtMemory(msg);
	SendRtHandle(hResMbx, hMem, hReqMbx);

	// 戻り値ステータス
	return entry;

	// TODO: 極めてまれなケースと思いますがこの構造は、APIコール中に強制プロセス終了するとリクエストバッファをロストする可能性があります
}