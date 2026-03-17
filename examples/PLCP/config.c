#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// コンフィグ（動作設定）管理

BOOL		bStepMode = 0;					// ｽﾃｯﾌﾟﾓｰﾄﾞ確認Flg
BOOL		bPrintMode = 1;					// ﾌﾟﾘﾝﾄﾓｰﾄﾞ確認Flg
BOOL		bRemote = 0;					// ﾘﾓｰﾄﾓｰﾄﾞ確認Flg
BOOL		bTraceMode = 0;					// ﾄﾚｰｽﾓｰﾄﾞ確認ﾌﾗｸﾞ
BYTE		byRunMode = RUNMODE_EXE;		// PLC動作モード
BYTE		bBasePriority = 0;				// PLCベースプライオリティ
DWORD		dwScanFreq = 0;					// PLC制御周期
DWORD		dwOverRunCnt = 0;

char		WorkFolder[128] = { 0 };
char		RslFolder[128] = { 0 };
char		RtaFolder[128] = { 0 };
char		BaseName[128] = { 0 };
char		RtaFilePath[128] = { 0 };
char		MnmFilePath[128] = { 0 };
char		IniFilePath[128] = { 0 };
char		RetainInstName[128] = { 0 };

void Config_Init(void)
{
	Config_Set_StepMode(DEFAULT_STEP);
	Config_Set_PrintMode(DEFAULT_PRINT);
	Config_Set_RemoteMode(DEFAULT_REMOTE);
	Config_Set_TraceMode(DEFAULT_TRACE);
	Config_Set_RunMode(RUNMODE_EXE);
	Config_Set_BasePriority(DEFAULT_PRIORITY);
	Config_Set_ScanFreq(DEFAULT_SCANFREQ);
	Config_Set_Overrun(DEFAULT_OVERRUN);
	Config_Set_WorkFolder("");
	Config_Set_BaseName("");
	Config_Set_RslFolder("");
	Config_Set_RtaFolder("");
	Config_Set_RtaFilePath("");
	Config_Set_IniFilePath("");
	Config_Set_MnmFilePath("");
	Config_Set_RetainInstName(DEFAULT_RETAININST);
}

void Config_Set_StepMode(BOOL sw)
{
	bStepMode = sw;
}

BOOL Config_Get_StepMode(void)
{
	return bStepMode;
}

void Config_Set_PrintMode(BOOL sw)
{
	bPrintMode = sw;
}

BOOL Config_Get_PrintMode(void)
{
	return bPrintMode;
}

void Config_Set_RemoteMode(BOOL sw)
{
	bRemote = sw;
}

BOOL Config_Get_RemoteMode(void)
{
	return bRemote;
}

void Config_Set_TraceMode(BOOL sw)
{
	bTraceMode = sw;
}

BOOL Config_Get_TraceMode(void)
{
	return bTraceMode;
}

void Config_Set_RunMode(BYTE mode)
{
	byRunMode = mode;
}

BYTE Config_Get_RunMode(void)
{
	return byRunMode;
}

void Config_Set_BasePriority(BYTE prio)
{
	bBasePriority = prio;
}

BYTE Config_Get_BasePriority(void)
{
	return bBasePriority;
}

void Config_Set_ScanFreq(DWORD freq)
{
	dwScanFreq = freq;
}

DWORD Config_Get_ScanFreq(void)
{
	return dwScanFreq;
}
void Config_Set_Overrun(DWORD count)
{
	dwOverRunCnt = count;
}

DWORD Config_Get_Overrun(void)
{
	return dwOverRunCnt;
}


char* Config_Get_WorkFolder(void)
{
	return WorkFolder;
}

char* Config_Get_BaseName(void)
{
	return BaseName;
}

char* Config_Get_RslFolder(void)
{
	return RslFolder;
}

char* Config_Get_RslFolder_Default(void)
{
	if (INtime_CheckDRTOS())
		return "/";
	else
		return "C:\\INplc\\";
}

char* Config_Get_RtaFolder(void)
{
	return RtaFolder;
}

char* Config_Get_RtaFilePath(void)
{
	return RtaFilePath;
}

char* Config_Get_IniFilePath(void)
{
	return IniFilePath;
}

char* Config_Get_MnmFilePath(void)
{
	return MnmFilePath;
}

char* Config_Get_RetainInstName(void)
{
	return RetainInstName;
}
void Config_Set_WorkFolder(char* string)
{
	strcpy_s(WorkFolder, sizeof(WorkFolder), string);
}

void Config_Set_BaseName(char* string)
{
	strcpy_s(BaseName, sizeof(BaseName), string);
//	_strupr(BaseName);
}

void Config_Set_RslFolder(char* string)
{
	strcpy_s(RslFolder, sizeof(RslFolder), string);
}

void Config_Set_RtaFolder(char* string)
{
	strcpy_s(RtaFolder, sizeof(RtaFolder), string);
}

void Config_Set_RtaFilePath(char* string)
{
	strcpy_s(RtaFilePath, sizeof(RtaFilePath), string);
}

void Config_Set_IniFilePath(char* string)
{
	strcpy_s(IniFilePath, sizeof(IniFilePath), string);
}

void Config_Set_MnmFilePath(char* string)
{
	strcpy_s(MnmFilePath, sizeof(MnmFilePath), string);
}

void Config_Set_RetainInstName(char* string)
{
	strcpy_s(IniFilePath, sizeof(RetainInstName), string);
}
