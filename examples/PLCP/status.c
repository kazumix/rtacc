/// <summary>
/// PLC plus / INplc 5
/// 
/// Programmed by Kazumi.Machii 2023
/// 
/// PLC status module
/// </summary>

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"

// ステータス管理
//extern DWORD status_attrib;
extern DWORD status_bluescreen;
//extern DWORD status_channel;
//extern DWORD status_counter;
extern DWORD status_engine;
extern DWORD status_errorlog;
//extern DWORD status_force;
extern DWORD status_inifile;
extern DWORD status_instruction;
extern DWORD status_internalclock;
//extern DWORD status_iodriver;
extern DWORD status_logic;
extern DWORD status_mnmfile;
extern DWORD status_pause;
extern DWORD status_step;
//extern DWORD status_tasksignal;
//extern DWORD status_timer;
//extern DWORD status_trace;
extern DWORD status_watchdog;
extern DWORD status_api;
//extern DWORD status_userfunc;
extern DWORD status_plccontrol;
extern DWORD status_retain;



char* Status_Topic(DWORD code)
{
	char* topic[] = {
		"STOP",
		"",
		"READY",
		"",
		"WAIT",
		"",
		"RUN",
		"",
		"HALT",
	};
	return topic[code];
}

/// <summary>
/// 機能ステータスの表示
/// </summary>
void Status_Display(void)
{
	printf("Status list\n");
//	printf("  %-20s ... %s \n", "channel list"			,Status_Topic(status_channel));
//	printf("  %-20s ... %s \n", "attrib list"			,Status_Topic(status_attrib));
//	printf("  %-20s ... %s \n", "couner list"			,Status_Topic(status_counter));
//	printf("  %-20s ... %s \n", "timer list"			,Status_Topic(status_timer));
	//printf("  %-20s ... %s \n", "force list"			,Status_Topic(status_force));
	printf("  %-20s ... %s \n", "errorlog list"			,Status_Topic(status_errorlog));
	printf("  %-20s ... %s \n", "logic list"			,Status_Topic(status_logic));
//	printf("  %-20s ... %s \n", "iodriver list"			,Status_Topic(status_iodriver));
	printf("  %-20s ... %s \n", "inifile feature"		,Status_Topic(status_inifile));
	printf("  %-20s ... %s \n", "mnmfile feature"		,Status_Topic(status_mnmfile));
	printf("  %-20s ... %s \n", "internalclock"			,Status_Topic(status_internalclock));
	//printf("  %-20s ... %s \n", "trace feature"			,Status_Topic(status_trace));
	printf("  %-20s ... %s \n", "engine feature"		,Status_Topic(status_engine));
	printf("  %-20s ... %s \n", "bluescreen feature"	,Status_Topic(status_bluescreen));
	printf("  %-20s ... %s \n", "instruction feature"	,Status_Topic(status_instruction));
	printf("  %-20s ... %s \n", "pause feature"			,Status_Topic(status_pause));
	printf("  %-20s ... %s \n", "step feature"			,Status_Topic(status_step));
	//printf("  %-20s ... %s \n", "tasksignal feature"	,Status_Topic(status_tasksignal));
	printf("  %-20s ... %s \n", "watchdog feature"		,Status_Topic(status_watchdog));
	printf("  %-20s ... %s \n", "api feature"			,Status_Topic(status_api));
	//printf("  %-20s ... %s \n", "user func feature"		,Status_Topic(status_userfunc));
	printf("  %-20s ... %s \n", "plc control state"		,Status_Topic(status_plccontrol));
	printf("  %-20s ... %s \n", "retain feature"		,Status_Topic(status_retain));
}

/// <summary>
/// 内部状態を詳細表示します
/// </summary>
void Status_DetailDisplay(void)
{
	// 機能ステータスの表示
	Status_Display();
	// ヒープメモリのリストアップ
	Heap_Display();
	// 基本ファンクションのリストアップ
	Basicfunction_Display();
	// ファンクションブロックのリストアップ
	Functionblock_Display();
	// POUファイルの一覧表示
	Poufile_Display();
	// 完成した命令リストのデバッグ表示
	Logic_Display();
	// ラベルのリストアップ
	Label_Display();
	// ユーザファンクションのリストアップ
	Userfunction_Display();
	// PLC変数のリストアップ
	Variable_Display();

	// エラーがあったか
	if (Errorlog_Count() > 0)
	{
		// ロードエラー表示
		Errorlog_Display("");
	}
}
