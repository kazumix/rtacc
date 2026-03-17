#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"


/// /// <summary>
/// スタティックライブラリに組み込まれるPLCメイン処理
/// </summary>
/// <param name="argc"></param>
/// <param name="argv"></param>
/// <returns></returns>
int plcmain(int argc, char* argv[])
{
	int		errors = 0;

	// ヒープシステム初期化
	Heap_Clear();

	// コンフィグの初期値
	Config_Init();

	// 起動引数から基本的情報の初期化
	Argument_Init(argc, argv);

	// ルートプロセス取得などINtimeの基本的な初期化
	INtime_ProcessInitialize();

	// システムのリセット(生成したリソースは解放されない)
	SQTBL_Create();
	Api_Init();
	Pause_Init();
	Step_Init();
	Watchdog_Init();
	Exception_Init();

	// プロセスのリセット(解放されません)
	Errorlog_Clear();
	Poufile_Clear();

	// （起動設定１）INIファイルを処理します
	IniFile_Load( Config_Get_IniFilePath() );

	// （起動設定２）起動引数の処理
	Argument_Process(argc, argv);

	// （起動設定３）エッジコンテナの初期化
	Container_Init();

	// このプロセス名のカタログ
	INtime_ProcessCatalog();
	ExitEvent_Init();

	// SQTBL初期値の設定
	SQTBL_Initialize();

	// ファンクションのインストール処理（なければデフォルト無処理が適用されます）(Errorlog出力あり)
	Basicfunction_Load("PLCPIEC.rsl");
	Functionblock_Load("PLCPEN.rsl");
	Functionblock_Load("PLCPFB.rsl");

	// 予約語ハッシュテーブルの構築
	Reservedword_CreateCatalog();

	// エンジンを生成します
	Engine_Init();

	// プロセスのリセット(初回のみ)
	Logic_Clear();
	Variable_Clear();
	Label_Clear();

	//
	//  ブートプロジェクトローディング処理
	//
	char*	BaseName = Config_Get_MnmFilePath();
	BOOL	BootProject = (strlen(BaseName) > 0);
	if( BootProject )
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

		// PLCをコールドスタートします
		PLCcontrol_ColdStart();
	}


	// プロセス停止イベント待ち
	ExitEvent_Wait();

	// エンジン停止
	PLCcontrol_Stop();
	RtSleep(100);

	// ルートプロセスのカタログから私の名前を削除します
	INtime_ProcessFinalize();

	// エッジコンテナの終了
	Container_Finish();

	return 0;
}

