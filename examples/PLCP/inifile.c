#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// INIファイル管理
DWORD	status_inifile = STATUS_STOP;

/// <summary>
/// Iniファイルを開く
/// </summary>
/// <param name="ipath"></param>
/// <returns></returns>
FILE* IniFile_Open(const char *ipath)
{
	// リードモードでファイルを開く
	static FILE	*fp;
	errno_t e = fopen_s(&fp, ipath, "rt");
	// ファイルポインタを返す
	return fp;
}

/// <summary>
/// Iniファイルを閉じる
/// </summary>
/// <param name="fp"></param>
void IniFile_Close(FILE *fp)
{
	// ファイルを閉じる
	if (fp != NULL)
	{
		fclose(fp);
	}

	// 本機能の動作状態を更新
	status_inifile = STATUS_READY;
}

/// <summary>
/// Iniファイルから行を１つ取り出す
/// </summary>
/// <param name="fp"></param>
/// <param name="line"></param>
/// <returns></returns>
char* IniFile_GetLine(FILE *fp, char *line, size_t linesize)
{
	// ファイルが開かれていることを確認
	if (fp == NULL)
		return NULL;
	// 読み出せデータ行を返却、ファイル終端ではNULLを返す
	return (fgets(line, linesize, fp));
}

/// <summary>
/// 行のコメント';'以降をカット加工する
/// </summary>
/// <param name="str"></param>
void IniFile_TrimLine(char* str, size_t strsize)
{
	char *token;
	// コメント(;)以降をトリミング
	token = strstr(str, ";");
	if (token != NULL)
		*token = '\0';
	// 改行を取り除く
	token = strstr(str, "\n");
	if (token != NULL)
		*token = '\0';
	// 大文字化
	//size_t len;
	//len = strnlen_s(str, strsize);
	//if (len > 0)
	//	_strupr_s(str, strsize);
}

static char SectionAndKey_get(FILE *fp, char *line)
{
	char	tmp[128];
	char	dlm1[] = "\x0a\x0d;#";						/* 行末文字			*/
	char	dlm3[] = " \x09";							/* 無視文字			*/
	WORD	lp1, lp2;

	if (fp == NULL)
		return(-1);

	line[0] = '\0';

	if (fgets(tmp, sizeof(tmp) - 1, fp) == NULL)				/* 一行読む			*/
		return(-1);

	tmp[sizeof(tmp) - 1] = '\0';
	tmp[strcspn(tmp, dlm1)] = '\0';
	for (lp1 = 0, lp2 = 0; lp1 < strlen(tmp); lp1++) {			/* 無視文字処理		*/
		if (strchr(dlm3, tmp[lp1]) == NULL) {
			line[lp2++] = tmp[lp1];
		}
	}
	line[lp2] = '\0';
	return(0);
}

static char LowlevelGetProfileString(FILE *fp, const char *sec, const char *key, char *buff ,size_t buffsize)
{
	char	tmp[128];
	char	nowsec[128];
	char	nowkey[128];
	char	*keypoint;

	if (fp == NULL)
		return(-1);

	fseek(fp, SEEK_SET, 0);
	buff[0] = '\0';
	nowsec[0] = '\0';
	nowkey[0] = '\0';

	while (1) {
		switch (SectionAndKey_get(fp, tmp)) {
		case -1:
			return(-1);
			break;
		case 0:
			if (strlen(tmp) < 3)
				continue;
			if ((tmp[0] == '[') && (tmp[strlen(tmp) - 1] == ']')) {
				strcpy_s(nowsec, sizeof(nowsec) ,tmp);
				continue;
			}
			else if ((strcmp(nowsec, sec) == 0) && ((keypoint = strstr(tmp, key)) != NULL)) {
				keypoint += strlen(key);
				if (*keypoint != '=') {
					continue;
				}
				keypoint++;
				strcpy_s(buff, buffsize, keypoint);
				return(0);
			}
			break;
		}
	}
}

/// <summary>
/// 指定セクション、指定キーから文字列の取得
/// </summary>
/// <param name="fp"></param>
/// <param name="section"></param>
/// <param name="key"></param>
/// <param name="def"></param>
/// <param name="dest"></param>
/// <param name="size"></param>
/// <returns></returns>
DWORD IniFile_GetProfileString(FILE* fp, const char *section, const char *key, const char *def, char *dest, size_t destsize)
{
	char	buff[128];

	// ファイルが開いてない時デフォルト値を返す
	if ( fp == NULL) {
		strcpy_s(dest, destsize ,def);
		return((DWORD)strlen(dest));
	}

	if (LowlevelGetProfileString(fp, section, key, buff, sizeof(buff)) != 0) {
		strcpy_s(dest, destsize, def);
		return((DWORD)strlen(dest));
	}
	else {
		strcpy_s(dest, destsize, buff);
		return((DWORD)strlen(dest));
	}
}

/// <summary>
/// 指定セクション、指定キーから数値の取得
/// </summary>
/// <param name="fp"></param>
/// <param name="section"></param>
/// <param name="key"></param>
/// <param name="def"></param>
/// <returns></returns>
DWORD IniFile_GetProfileInt(FILE* fp, const char *section, const char *key, DWORD def)
{
	char	buff[128];

	// ファイルが開いてない時デフォルト値を返す
	if ( fp == NULL )
		return(def);

	if (LowlevelGetProfileString(fp, section, key, buff, sizeof(buff)) != 0) {
		return(def);
	}
	else {
		return(atoi(buff));
	}
}

/// <summary>
/// INIファイル中の指定セクション迄シークする
/// </summary>
/// <param name="fp">オープンされているファイルポインタ</param>
/// <param name="sectionname">セクション名</param>
/// <returns>ファイル内の発見した行番号</returns>
int IniFile_SeekSection(FILE* fp, const char* sectionname)
{
	char	line[128];
	int		lineno = 0;

	fseek(fp, 0, SEEK_SET);
	while (IniFile_GetLine(fp, line, sizeof(line)) != NULL)
	{
		// 読んでいる行の番号
		lineno++;

		// トリミング
		IniFile_TrimLine(line, sizeof(line));

		// セクションの一致を判定
		if (strcmp(line, sectionname) == 0)
			return lineno;
	}
	return 0;
}

/// <summary>
/// タイマ指定値の分解解釈
/// </summary>
/// <param name="cTmp"></param>
/// <param name="cItem"></param>
/// <param name="cVal1"></param>
/// <param name="cVal2"></param>
void IniFile_PargeTimer(char* cTmp, char** cItem, char** cVal1,char** cVal2)
{
	char* context = NULL;
	// 左部の取り出し
	*cItem = strtok_s(cTmp, "=\n\r", &context);
	// 右部の取り出し
	*cVal1 = strtok_s(NULL, ":\n\r", &context);
	// 右部の取り出し
	*cVal2 = strtok_s(NULL, "\n\r", &context);
}

/// <summary>
/// INIファイルをすべて処理します
/// </summary>
/// <param name="iInifilePath"></param>
int IniFile_Load(char* iInifilePath)
{
	FILE*		fp;
	int			errors = 0;

	BYTE		byPriority;
	DWORD		dwScanFreq;
	DWORD		dwOverRunCnt;
	DWORD		dwNoConsole;
	char		cRSLPath[128];

	const char	cTabGlobal[] = "[PLC_SETTING]";

	// ファイルを開きます（あれば）
	fp = IniFile_Open(iInifilePath);
	if (fp)
	{

		// PLC実行制御指定
		byPriority = (BYTE)IniFile_GetProfileInt(fp, cTabGlobal, "PRIORITY", DEFAULT_PRIORITY);
		Config_Set_BasePriority(byPriority);

		// PLCスキャン周期
		dwScanFreq = IniFile_GetProfileInt(fp, cTabGlobal, "SCANRATE", DEFAULT_SCANFREQ);
		Config_Set_ScanFreq(dwScanFreq);

		// オーバーランの検知モード
		dwOverRunCnt = IniFile_GetProfileInt(fp, cTabGlobal, "OVERRUN", DEFAULT_OVERRUN);
		Config_Set_Overrun(dwOverRunCnt);

		// コンソール出力無しモード　[CONFIG] NOPRINT=1 隠しオプションで有効
		dwNoConsole = IniFile_GetProfileInt(fp, cTabGlobal, "NOPRINT", FALSE);
		if (dwNoConsole) {
			// NOPRINTの指定があるときだけコンソール出力抑止モードに切り替え
			Config_Set_PrintMode(FALSE);
		}

		// IODRV参照パス指定
		IniFile_GetProfileString(fp, cTabGlobal, "IODRV_PATH", "", cRSLPath, sizeof(cRSLPath));

		// ファイルを閉じます
		IniFile_Close(fp);
	}

	// エラー個数を返す
	return errors;
}