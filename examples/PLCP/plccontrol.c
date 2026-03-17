#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// エンジン管理
DWORD	status_plccontrol = STATUS_STOP;

/// <summary>
/// PLC動作をスタートします
/// </summary>
void PLCcontrol_Start(void)
{
	// このコール時点でのエンジン稼働状況を取得
	BOOL		run = Engine_IsStart();
	if (!run)
	{
		// ビギンPOUを処理します
		Logic_Begin();

		// 最終安全装置解除
		Engine_Start();

		// 状態表示を変更します
		status_plccontrol = STATUS_RUN;
	}
	// インジケータ更新
	Indicate_STATE_RUN(TRUE);
	Indicate_STATE_STOP(FALSE);
	Indicate_STATE_STEP(FALSE);
	Indicate_STATE_HALT(FALSE);
	Indicate_DEBUG_EXCEPTICODE(0);
}

/// <summary>
/// PLC動作を停止します
/// </summary>
void PLCcontrol_Stop(void)
{
	// このコール時点でのエンジン稼働状況を取得
	BOOL		run = Engine_IsStart();
	if (run)
	{
		// 動作を停止します
		Engine_Stop();

		// 動作停止の完了待ち
		Engine_WaitStop();

		// ファイナルPOUを処理します
		Logic_Final();

		// リテイン
		PLCcontrol_RetainSave();

		// 状態表示を変更します
		status_plccontrol = STATUS_STOP;
	}
	// インジケータ更新
	Indicate_STATE_RUN(FALSE);
	Indicate_STATE_STOP(TRUE);
	Indicate_STATE_STEP(FALSE);
	Indicate_STATE_HALT(FALSE);
	Indicate_DEBUG_EXCEPTICODE(0);
}

/// <summary>
/// PLC動作をホルトします
/// </summary>
void PLCcontrol_Halt(DWORD exceptioncode)
{
	// このコール時点でのエンジン稼働状況を取得
	BOOL		run = Engine_IsStart();
	if (run)
	{
		// 動作を停止します
		Engine_Stop();

		// 動作停止の完了待ち
//		Engine_WaitStop();

		// ファイナルPOUを処理します
//		Logic_Final();

		// リテイン
		PLCcontrol_RetainSave();

		// 状態表示を変更します
		status_plccontrol = STATUS_HALT;
	}
	// インジケータ更新
	Indicate_STATE_RUN(FALSE);
	Indicate_STATE_STOP(FALSE);
	Indicate_STATE_STEP(FALSE);
	Indicate_STATE_HALT(TRUE);
	Indicate_DEBUG_EXCEPTICODE(exceptioncode);
}

/// <summary>
/// PLC変数をリセットします
/// </summary>
void PLCcontrol_Reset(void)
{
	// リテイン保存
	PLCcontrol_RetainSave();

	// 変数の初期化
	Variable_Reset_All();

	// タグ初期値セット
	Rtedge_SetTagDefaultValue();

	// リテイン読込
	PLCcontrol_RetainLoad();
}

/// <summary>
/// PLCをコールドスタートします
/// </summary>
void PLCcontrol_ColdStart(void)
{
	PLCcontrol_Reset();
	PLCcontrol_Start();
}

/// <summary>
/// PLCをホットスタートします
/// </summary>
void PLCcontrol_HotStart(void)
{
	PLCcontrol_Start();
}

/// <summary>
/// PLCプログラムをダウンロードします
/// </summary>
void PLCcontrol_Download(void)
{
	// プロジェクトのローディング
	Project_Load();

	// インジケータを更新します
	Indicate_STATE_LOADING(TRUE);

	// リテインファイルのロードを試みます
	PLCcontrol_RetainLoad();
}

/// <summary>
/// PLCプログラムを切替えます
/// </summary>
void PLCcontrol_Swap(void)
{
	// 編集ロジックを実行ロジックに昇格します
	Logic_Swap();
	// 編集ロジックPLC変数を実行PLC変数に昇格します
	Variable_Swap();
}

/// <summary>
/// リテインデータを保管します
/// </summary>
void PLCcontrol_RetainSave(void)
{
	Retain_Save();
}

/// <summary>
/// リテインデータを復元します
/// </summary>
void PLCcontrol_RetainLoad(void)
{
	Retain_Load();
}

/// <summary>
/// ステップ実行モードを有効にします
/// </summary>
void PLCcontrol_StepEnable(void)
{
	Step_Enable();
}

/// <summary>
/// ステップ実行モードを無効にします
/// </summary>
void PLCcontrol_StepDisable(void)
{
	Step_Disable();
}

/// <summary>
/// ステップ実行を実施します
/// </summary>
void PLCcontrol_StepStep(void)
{
	Step_Trigger();
}
