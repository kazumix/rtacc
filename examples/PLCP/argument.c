#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// 起動引数管理


/// <summary>
/// ワークフォルダを取得します。RTAの配置場所、またはMNMファイルの配置場所を示します
/// </summary>
/// <param name="originalpath"></param>
/// <param name="outputpath"></param>
/// <param name="outputpathsize"></param>
void Argument_PathFromFolder(const char* originalpath, char* outputpath, size_t outputpathsize)
{
	char		work[128];
	char*		mark;
	BOOL		IsDRTOS;

	memset(outputpath, 0, outputpathsize);

	// 作業用にコピーします
	strcpy_s(work, sizeof(work), originalpath);

	// 
	IsDRTOS = (BOOL)INtime_CheckDRTOS();
	mark = (IsDRTOS) ? strrchr(work, '/') : strrchr(work, '\\');

	if (mark)
	{
		*(++mark) = '\0';
		strcpy_s(outputpath, outputpathsize, work);
	}
}

/// <summary>
/// ベースPLCロジック名を取得します
/// </summary>
/// <param name="originalpath"></param>
/// <param name="outputpath"></param>
/// <param name="outputpathsize"></param>
void Argument_PathFromBase(const char* originalpath, char* outputpath, size_t outputpathsize)
{
	char		work[128];
	char*		head;
	char*		bottom;
	BOOL		IsDRTOS;

	memset(outputpath, 0, outputpathsize);

	// 作業用にコピーします
	strcpy_s(work, sizeof(work), originalpath);

	// 
	IsDRTOS = (BOOL)INtime_CheckDRTOS();
	head = (IsDRTOS) ? strrchr(work, '/') : strrchr(work, '\\');
	bottom = strrchr(work, '.');

	if (bottom)
	{
		*bottom = '\0';
	}
	if (head && bottom)
	{
		++head;
		strcpy_s(outputpath, outputpathsize, head );
	}
}

/// <summary>
/// POUファイルパスのリスト構文を解釈して処理します
/// </summary>
/// <param name="filelist"></param>
void Argument_PouFiles(char* filelist)
{
	// 作業用にバッファを確保して文字列をコピ―します
	int		length = strlen(filelist) + 1;
	char*	buf = (char*)Heap_Alloc(length,__FUNCTION__);
	if (buf)
	{
		strcpy_s(buf, length, filelist);
		// 空白文字入りのパスを処理するためにパッキングする
		String_Packing(buf);
		// カンマ区切りのPOUファイルパスを１つ切り出し
		char* context = NULL;
		char* file;
		file = strtok_s(buf, ",", &context);
		// カンマ区切りのトークンをすべて処理します
		while (file != NULL)
		{
			// 空白文字入りのパスを処理するためにアンパッキングする
			String_Unpacking(buf);
			// POUファイルリストに加えます
			Poufile_Add(file);
			// カンマ区切りのPOUファイルパスを１つ切り出し
			file = strtok_s(NULL, ",", &context);
		}
		// 作業用バッファを開放します
		Heap_Free(buf);
	}
}

/// <summary>
/// 起動引数から基本的な情報の引き出し
/// </summary>
/// <param name="argc"></param>
/// <param name="argv"></param>
void Argument_Init(int argc, const char* argv[])
{
	char	path[128], base[128], file[128];

	// ワークフォルダ（デフォルト）算出の処理
	Argument_PathFromFolder(argv[0], path, sizeof(path));
	Config_Set_WorkFolder(path);
	Config_Set_RtaFolder(path);

	// ベースファイル名（デフォルト）算出の処理
	Argument_PathFromBase(argv[0], base, sizeof(base));
	Config_Set_BaseName(base);

	// RTAファイル名算出の処理
	strcpy_s(file, sizeof(file), path);
	strcat_s(file, sizeof(file), base);
	strcat_s(file, sizeof(file), ".RTA");
	Config_Set_RtaFilePath(file);

	// INIファイル名算出の処理
	strcpy_s(file, sizeof(file), path);
	strcat_s(file, sizeof(file), base);
	strcat_s(file, sizeof(file), ".INI");
	Config_Set_IniFilePath(file);

	// RSLフォルダ算出の処理
	strcpy_s(file, sizeof(file), path);
	Config_Set_RslFolder(file);
}

void Argument_Step(char* cTmp)
{
	// ステップ実行モード
	if (!strcmp(cTmp, "-STEP"))
		Config_Set_StepMode(TRUE);
}

void Argument_NoPrint(char* cTmp)
{
	// コンソール出力抑制モード
	if (!strcmp(cTmp, "-NOPRINT"))
		Config_Set_PrintMode(FALSE);
}

void Argument_Print(char* cTmp)
{
	// コンソール出力抑制モード
	if (!strcmp(cTmp, "-PRINT"))
		Config_Set_PrintMode(TRUE);
}

void Argument_Remote(char* cTmp)
{
	// リモートモード
	if (!strcmp(cTmp, "-REMOTE"))
		Config_Set_RemoteMode(TRUE);
}

void Argument_Priority(char* cTmp)
{
	// 動作ベースプライオリティ
	if (!strnicmp(cTmp, "-PRIORITY/", 10))
		Config_Set_BasePriority(atoi(cTmp + 10));
}

void Argument_ScanRate(char* cTmp)
{
	// 動作周期
	if (!strnicmp(cTmp, "-SCANRATE/", 10))
		Config_Set_ScanFreq(atoi(cTmp + 10));
}

void Argument_Intprt(char* cTmp)
{
	char	path[128], base[128];
	//インタープリタモード
	if (!strnicmp(cTmp, "-INTPRT/", 8))
	{
		Config_Set_RunMode(RUNMODE_INTERPRIT);

		// MNMファイル名算出の処理
		Config_Set_MnmFilePath(cTmp + 8);

		// ワークフォルダ算出の処理
		Argument_PathFromFolder(Config_Get_MnmFilePath(), path, sizeof(path));
		Config_Set_WorkFolder(path);

		// ベースファイル名算出の処理
		Argument_PathFromBase(Config_Get_MnmFilePath(), base, sizeof(base));
		Config_Set_BaseName(base);
	}
}

void Argument_Pou(char* cTmp)
{
	//POUファイルの指定があれば処理します
	if (!strnicmp(cTmp, "-POU/", 5))
	{
		Argument_PouFiles(cTmp + 5);
	}
}

void Argument_Begin(char* cTmp)
{
	//ビギンPOUファイルの指定があれば処理します
	if (!strnicmp(cTmp, "-BEGIN/", 7))
	{
		Poufile_Set_Begin(cTmp + 7);
	}
}

void Argument_Final(char* cTmp)
{
	//ファイナルPOUファイルの指定があれば処理します
	if (!strnicmp(cTmp, "-FINAL/", 7))
	{
		Poufile_Set_Final(cTmp + 7);
	}
}

/// <summary>
/// 起動引数の解釈処理を実行
/// </summary>
/// <param name="argc"></param>
/// <param name="argv"></param>
void Argument_Process(int argc, const char* argv[])
{
	int		lp1;
	char	cTmp[512];								//汎用ﾃﾝﾎﾟﾗﾘ領域

	/*---- 1.  起動オプションの解析 --------*/
	for (lp1 = 1; lp1 < argc; lp1++) {

		strcpy_s(cTmp, sizeof(cTmp), argv[lp1]);

		Argument_Step(cTmp);

		Argument_NoPrint(cTmp);

		Argument_Print(cTmp);

		Argument_Remote(cTmp);

		Argument_Priority(cTmp);

		Argument_ScanRate(cTmp);

		Argument_Intprt(cTmp);

		Argument_Pou(cTmp);

		Argument_Begin(cTmp);

		Argument_Final(cTmp);
	}
}

