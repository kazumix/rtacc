/// <summary>
/// RT-edge エッジシステムコンテナ
/// 
///		トリガタグ機能 trigger.c
/// 
///	Base programming K.Machii
/// 
/// </summary>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <rt.h>
#include "egapi.h"

#include "common.h"


/// <summary>
/// エッジタグの定義
/// </summary>
struct CONTAINER_TAGS		trigger[] =
{
	{"Control"	,EgVtUInt32		,0	,TRUE	},
	{0}
};

/// <summary>
/// トリガタグの管理用インスタンス構造体
/// </summary>
typedef struct _TRIGTAG
{
	LPEDGE_INDEX	TagIndex;
	uint32_t		reservedvalue;
} *TRIGTAG;

/// <summary>
/// 指定エッジタグでトリガタグ扱いを開始します
/// </summary>
/// <param name="TagIndex"></param>
/// <returns>トリガタグインスタンスを返す</returns>
TRIGTAG Trigger_TagInit(LPEDGE_INDEX TagIndex)
{
	int32_t		result;
	TRIGTAG		ttag = (TRIGTAG)malloc(sizeof(struct _TRIGTAG));
	// 初回、トリガはゼロクリアしておきます
	ttag->TagIndex = TagIndex;
	ttag->reservedvalue = 0;
	result = EgTagWriteByIndex(ttag->TagIndex, &ttag->reservedvalue, sizeof(ttag->reservedvalue));
	// トリガタグ管理用のインスタンスを返します(ヒープ)
	return ttag;
}

/// <summary>
/// トリガタグ扱いを終了します
/// </summary>
/// <param name="ttag"></param>
void Trigger_TagClear(TRIGTAG ttag)
{
	if( ttag )
		free(ttag);
}

/// <summary>
/// トリガタグの変化（トリガあり）を判定します
/// </summary>
/// <param name="ttag"></param>
/// <returns></returns>
BOOL Trigger_TagCheck(TRIGTAG ttag)
{
	int32_t			result;
	uint32_t		prevalue = ttag->reservedvalue;
	BOOL			triggered;
	// 現在値を読み込みます
	result = EgTagReadByIndex(ttag->TagIndex, &ttag->reservedvalue, sizeof(ttag->reservedvalue));
	// トリガ条件を判定します（前回値との比較）
	triggered = (prevalue != ttag->reservedvalue);
	// 戻り値
	return triggered;
}

/// <summary>
/// トリガのイベント処理を終えたとき、ゼロに書き戻すことで完了を通達します
/// </summary>
/// <param name="ttag"></param>
void Trigger_TagFinished(TRIGTAG ttag)
{
	int32_t			result;
	// 値を書き換えることで書き込み完了を通達します
	ttag->reservedvalue = 0;
	result = EgTagWriteByIndex(ttag->TagIndex, &ttag->reservedvalue, sizeof(ttag->reservedvalue));
}

/// <summary>
/// トリガ発動判定のスレッド
/// 
///		"SERVICE.EgRetain.Save"		リテイン書き込み。0以外の値を書き込むとトリガ。処理が終わると0に書き換わります
///		"SERVICE.EgRetain.Load"		リテイン読み込み。0以外の値を書き込むとトリガ。処理が終わると0に書き換わります
/// 
/// </summary>
void Trigger_DetectThread(void)
{
	// インターバル設定値を取得します
	DWORD		dwInterval;
	dwInterval = Property_Get_Interval();

	// トリガタグのインデックスを算出して以後のアクセスを高速化します
	LPEDGE_INDEX	ControlTag_index = trigger[0].index;

	// スレッドをカタログ
	CatalogRtHandle(0, GetRtThreadHandles(THIS_THREAD), CATALOG_TRIG);

	// トリガタグインスタンスを生成(ヒープ使用)してゼロクリアされます
	TRIGTAG	control = Trigger_TagInit(ControlTag_index);

	// トリガを処理します
	BOOL			controltrig;
	while (1)
	{
		// インターバルで動作します
		RtSleepEx(dwInterval);

		// コンテナ稼働状態で無いならこのスレッドを実行しない
		if (!Indicate_Run_Get())
			continue;

		// Liveインジケータ更新（生きてるよ！）
		Indicate_Live();

		// トリガ条件を判定し、リテイン保存のリクエストと断定した時
		controltrig = Trigger_TagCheck(control);
		if (controltrig)
		{
			// SERVICE.PLC.Controlトリガに設定されたコマンド番号で分岐する
			switch (control->reservedvalue)
			{
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

			case API_PLC_DOWNLOAD:
				Api_PlcDownload();
				break;

			case API_PLC_RETAIN_SAVE:		// リテインデータの保管
				Api_PlcRetainSave();
				break;

			case API_PLC_RETAIN_LOAD:		// リテインデータの復元
				Api_PlcRetainLoad();
				break;

			case API_DUMP_LOG:		// 内部ステータスの詳細情報掃き出し
				Api_DumpLog();
				break;

			case API_DUMP_LOGIC:			// ロジックの逆アセンブリ出力
				Api_PlcDisasm();
				break;

			case API_STEP_ENABLE:			// ステップ実行有効
				Api_StepEnable();
				break;

			case API_STEP_DISABLE:			// ステップ実行無効
				Api_StepDisable();
				break;

			case API_STEP_STEP:				// ステップ実行トリガ
				Api_StepStep();
				break;

			}

			// 値を書き換えることで書き込み完了を通達します
			Trigger_TagFinished(control);
		}
	}

	// トリガタグインスタンスを解放します
	Trigger_TagClear(control);
}

/// <summary>
/// トリガ機能を初期化します
/// </summary>
/// <returns></returns>
BOOL Trigger_Init(void)
{
	// タグリストを与えてエッジタグを生成します
	BOOL result;
	result = Container_CreateTagsFromList(trigger);

	// トリガスレッドを生成します
	CreateRtThread( Property_Get_Priority() + PRI_TRIG, Trigger_DetectThread, STACK_TRIG, 0);

	return result;
}