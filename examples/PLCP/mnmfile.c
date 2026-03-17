#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// ニーモニックファイル管理
DWORD	status_mnmfile = STATUS_STOP;


/// <summary>
/// ニーモニックファイルを開く
/// </summary>
/// <param name="ipath"></param>
/// <returns></returns>
FILE* MnmFile_Open(char *ipath)
{
	static FILE	*fp;
	// コメントネスト深さをゼロクリアしておく
	Comment_ClearNest();
	// リードモードでファイルを開く
	errno_t e = fopen_s(&fp, ipath, "rt");
	return fp;
}

/// <summary>
/// ニーモニックファイルを閉じる
/// </summary>
/// <param name="fp"></param>
void MnmFile_Close(FILE *fp)
{
	// 元々開いていない
	if (fp == NULL)
		return;

	// ファイルを閉じる
	fclose(fp);

	// 本機能の動作状態を更新
	status_mnmfile = STATUS_READY;
}

/// <summary>
/// ニーモニックファイルから行を１つ取り出す
/// </summary>
/// <param name="fp"></param>
/// <param name="line"></param>
/// <returns></returns>
char* MnmFile_GetLine(FILE *fp, char *line, size_t linesize)
{
	// ファイルが開かれていることを確認
	if (fp == NULL)
		return NULL;
	// 読み出せデータ行を返却、ファイル終端ではNULLを返す
	return (fgets(line, linesize, fp));
}

/// <summary>
/// 取り込んだニーモニック行を事前処理加工する
/// </summary>
/// <param name="str"></param>
void MnmFile_TrimLine_Stage1(char* str)
{
	char		*line = str;		// オリジナルstrは保持して作業にはこちらを使用
	char		*hit;
	// 行冒頭セミコロン(;)はコメント行として全てカットします
	if (strncmp(line, ";", 1) == 0)
	{
		*line = '\0';
		return;
	}
	// 改行を取り除く
	hit = strstr(line, "\n");
	if (hit != NULL)
	{
		*hit = '\0';
	}
	// これまでのコメントのネストを考慮しつつ、コメント構文を処理する
	Comment_ProcessBracket(str);
	// 行頭の空白やタグは切り捨てて前詰め加工する
	hit = str;
	while(1)
	{
		// 無駄空白に合致するかを判断します
		if ((*hit != ' ') && (*hit != '\t') && (*hit != '\n') && (*hit != '\r'))
		{
			// 文字列冒頭そのものと合致するなら何もする必要はないのでブレイク
			if (hit == str)
				break;

			// ヒット位置まで無駄な空白なので前詰めしてオリジナルを書き換えてブレイク
			strcpy(str, hit);
			break;
		}
		// 文字列終端まで１文字進めていく
		hit++;
	}
}

/// <summary>
/// 文字列のトリミング。不要な空白を取り除いていきます
/// このコールは命令とオペランドの区切りスペース文字を許容します
/// </summary>
/// <param name="str"></param>
void MnmFile_TrimLine_Stage2(char* str)
{
	char		*src = str;		// ソース
	char		*dst = str;		// デスティネーション
	BOOL		packzone;
	BOOL		opcode;

	// 空白行なら無処理
	if (src == 0)
		return;
	// 空白やタグは切り捨てて前詰め加工する。但し以下のルール：
	//		・文字列パックされたSTX～ETX区間は除外）
	//		・１つ目の空白orTAB（命令とオペラントの区切り)はそのまま
	packzone = FALSE;
	opcode = FALSE;
	while (1)
	{
		switch (*src)
		{
		case '\x02':
			packzone = TRUE;		// 文字列パックゾーンに入る
			*dst++ = *src;		// そのまま転写します
			break;
		case '\x03':
			packzone = FALSE;		// 文字列パックゾーンを出る
			*dst++ = *src;		// そのまま転写します
			break;
		case '\t':
		case ' ':
			// 文字列パック区間中ならそのまま扱う
			if (packzone)
			{
				*dst++ = *src;	// そのまま転写します
				break;
			}
			// 命令コードの区切り空白に置換
			if (!opcode)
			{
				opcode = TRUE;
				*dst++ = ' ';		// スペースを入れる
			}
			else
			{
									// 文字転写をしません
			}
			break;
		default:
			*dst++ = *src;			// そのまま転写します

		}

		// src の \0 をコピーしたら終わりです
		if (*src == '\0')
			break;

		// 次の文字テストに進めます
		src++;
	}
}

/// <summary>
/// 文字列のトリミング。不要な空白を取り除いていきます
/// </summary>
/// <param name="str"></param>
void MnmFile_TrimLine_Stage3(char* str)
{
	char		*src = str;		// ソース
	char		*dst = str;		// デスティネーション
	BOOL		packzone;

	// 空白行なら無処理
	if (src == 0)
		return;
	// 空白やタグは切り捨てて前詰め加工する。但し以下のルール：
	//		・文字列パックされたSTX～ETX区間は除外）
	//		・１つ目の空白orTAB（命令とオペラントの区切り)はそのまま
	packzone = FALSE;
	while (1)
	{
		switch (*src)
		{
		case '\x02':
			packzone = TRUE;		// 文字列パックゾーンに入る
			*dst++ = *src;		// そのまま転写します
			break;
		case '\x03':
			packzone = FALSE;		// 文字列パックゾーンを出る
			*dst++ = *src;		// そのまま転写します
			break;
		case '\t':
		case ' ':
			// 文字列パック区間中ならそのまま扱う
			if (packzone)
			{
				*dst++ = *src;	// そのまま転写します
				break;
			}
			else
			{
				// 文字転写をしません
			}
			break;
		default:
			*dst++ = *src;			// そのまま転写します

		}

		// src の \0 をコピーしたら終わりです
		if (*src == '\0')
			break;

		// 次の文字テストに進めます
		src++;
	}
}


/// <summary>
/// ニーモニック行の構文分解解釈処理
/// </summary>
/// <param name="cTmp"></param>
/// <param name="cCmd"></param>
/// <param name="cArg1"></param>
/// <param name="cArg2"></param>
/// <param name="cArg3"></param>
void MnmFile_PargeLine(char* cTmp, char** cCmd, char** cArg1, char** cArg2, char** cArg3)
{
	char* context = NULL;
	// ニーモニック、オペコード部の取り出し
	*cCmd = strtok_s(cTmp, " \t\n\r", &context);
	// ニーモニック、オペランド部の取り出し３個
	*cArg1 = strtok_s(NULL, " \t\n\r", &context);
	*cArg2 = strtok_s(NULL, " \t\n\r", &context);
	*cArg3 = strtok_s(NULL, " \t\n\r", &context);
}

/// <summary>
/// カンマ区切り、ファンクション複数引数を分解します(ビルトインファンクション用）
/// </summary>
/// <param name="cTmp"></param>
/// <param name="cArg1"></param>
/// <param name="cArg2"></param>
/// <param name="cArg3"></param>
void MnmFile_PargeCamma(char* cTmp, char** cArg1, char** cArg2, char** cArg3)
{
	char* context = NULL;
	// ニーモニック、オペランド部の取り出し３個
	*cArg1 = strtok_s(cTmp, ",", &context);
	*cArg2 = strtok_s(NULL, ",", &context);
	*cArg3 = strtok_s(NULL, ",", &context);

	// 文字列リテラルを見越して文字列パッキングを行います（空白文字対策）
	String_Packing(*cArg1);

	// 行のトリミング、文字列パッキングを踏まえたうえで、不要な空白を取り除く
	MnmFile_TrimLine_Stage3(*cArg1);

	// 文字列リテラルの可能性がある引数１に対して文字列パッキングを解除を行います
	String_Unpacking(*cArg1);


	// 文字列リテラルを見越して文字列パッキングを行います（空白文字対策）
	String_Packing(*cArg2);

	// 行のトリミング、文字列パッキングを踏まえたうえで、不要な空白を取り除く
	MnmFile_TrimLine_Stage3(*cArg2);

	// 文字列リテラルの可能性がある引数１に対して文字列パッキングを解除を行います
	String_Unpacking(*cArg2);


	// 文字列リテラルを見越して文字列パッキングを行います（空白文字対策）
	String_Packing(*cArg3);

	// 行のトリミング、文字列パッキングを踏まえたうえで、不要な空白を取り除く
	MnmFile_TrimLine_Stage3(*cArg3);

	// 文字列リテラルの可能性がある引数１に対して文字列パッキングを解除を行います
	String_Unpacking(*cArg3);
}

/// <summary>
/// 引数のチェックと変換。
/// 命令書式一致しているか判定、書式にそぐわない引数はエラーとして検知します
/// </summary>
/// <param name="argument">引数文字列</param>
/// <param name="byType">引数書式タイプ</param>
/// <returns>解釈のエラーコード</returns>
WORD MnmFile_PargeArgument(char *argument, T_TYPE byType, P_ANY *result)
{
	P_ANY			literal;
	BITFIELD		bitfield;

	switch (byType)
	{
	case NA:
		//　引数項目無しでなければならない。適切か
		if (argument == NULL) {
			// 引数無しで正解なのでOK
			return MNM_OK;
		}
		// 引数があるので異常
		return MNM_ARG_ERR;
		break;
	case D_ANY:
	case D_ANY_NUM:
	case D_ANY_NUM_BIT:
	case D_ANY_BIT:
	case D_BOOL:
	case D_LABEL:
	case D_NAME:
	case D_ANY_INT:
	case D_ANY_REAL:
	case D_ELEMENTARY:
	case D_QWORD:
	case D_DWORD:
	case D_WORD:
	case D_BYTE:
	case D_LINT:
	case D_DINT:
	case D_INT:
	case D_SINT:
	case D_ULINT:
	case D_UDINT:
	case D_UINT:
	case D_USINT:
	case D_LREAL:
	case D_REAL:
	case D_STRING:
	case D_TIME:


		// 引数"argument"に対してビットフィールド指定の有無をチェックします
		bitfield = Bitfield_Check(argument);

		// realVariableName = 実際の変数名を保持
		char *realVariableName = argument;

		// baseVariableName = ベース変数名を作成（ビットフィールドがある場合は除去）
		char *baseVariableName = NULL;
		if (realVariableName != NULL) {
			baseVariableName = strdup(realVariableName);
			if (baseVariableName == NULL) {
				return MNM_ARG_ERR; // メモリ割り当て失敗
			}
			if (bitfield.use) {
				char *lastDot = strrchr(baseVariableName, '.');
				if (lastDot != NULL) {
					*lastDot = '\0'; // ビットフィールド部分を切り取り
				}
			}
		}

		// scopedBaseVariableName = スコープ付きのベース変数名を作成
		char *scopedBaseVariableName = NULL;
		if (baseVariableName != NULL) {
			scopedBaseVariableName = Scope_variable(baseVariableName);
		}

		//// ビットフィールド付きの変数名で検索
		//if (bitfield.use) {
		//	scopedBaseVariable = Scope_variable(baseVariable);
		//	
		//	// まず基本変数名（ビット指定なし）で検索
		//	P_ANY baseVar = Variable_Search(scopedBaseVariable);
		//	if (baseVar != NULL && baseVar->bitfield.use == 0) {
		//		// 基本変数が存在し、ビット指定なしの場合
		//		// ビットフィールド付きの形式を登録
		//		P_ANY bitfieldLiteral = Variable_Create(D_BOOL); // ビットフィールドはBOOL型
		//		*bitfieldLiteral = *baseVar; // 基本情報をコピー
		//		bitfieldLiteral->Type = D_BOOL; // 型をBOOLに設定
		//		bitfieldLiteral->bitfield = bitfield;
		//		Variable_Add(scopedvariable, bitfieldLiteral->Type);
		//		if (baseVariable != NULL) {
		//			free(baseVariable); // メモリ解放
		//		}
		//		*result = bitfieldLiteral;
		//		return MNM_OK;
		//	}
		//
		//	// 基本変数が存在しない場合、リテラルとして登録を試みる
		//	literal = Literal_Compile(scopedBaseVariable);
		//	if (!literal) {
		//		literal = Structure_Compile(scopedBaseVariable);
		//	}
		//	if (!literal) {
		//		literal = Rtedge_Compile(scopedBaseVariable);
		//	}
		//
		//	if (literal) {
		//		// 基本変数名でマッチした場合、そのliteralにビットフィールド情報を設定
		//		literal->bitfield = bitfield;
		//		literal->Type = D_BOOL; // 型をBOOLに設定
		//		Variable_Add(scopedvariable, literal->Type);
		//		if (baseVariable != NULL) {
		//			free(baseVariable); // メモリ解放
		//		}
		//		*result = literal;
		//		return MNM_OK;
		//	}
		//} else {

		// PLC変数が既に存在する場合はそれを使います
		if ((literal = Variable_Search(scopedBaseVariableName)) == NULL) {

			// PLC変数が存在しない場合
			// scopedBaseVariableName がLiteral,Structure,Rtedgeのいずれかにマッチするかチェックします
			literal = Literal_Compile(scopedBaseVariableName);
			if (!literal) {
				literal = Structure_Compile(scopedBaseVariableName);
			}
			if (!literal) {
				literal = Rtedge_Compile(scopedBaseVariableName);
			}
		}

		// PLC変数がいずれにも一致しない場合
		if (!literal) {
			if (baseVariableName != NULL) {
				free(baseVariableName); // メモリ解放
			}
			return MNM_ARG_ERR;
		}

		// ビット指定されるPLC変数として追加登録
		P_ANY bitfieldLiteral;
		if (bitfield.use) {

			// 多重登録を避けるため、既存変数を検索
			if ((bitfieldLiteral = Variable_Search(realVariableName)) == NULL) {

				// ビット指定されるPLC変数として追加登録
				bitfieldLiteral = Variable_Add(realVariableName, D_BOOL);

				// 元のliteralの情報をコピー
				*bitfieldLiteral = *literal;

				// ビットフィールド情報を設定
				bitfieldLiteral->bitfield = bitfield;
			}

			literal = bitfieldLiteral;
		}

		// 結果を確定
		*result = literal;
		if (baseVariableName != NULL) {
			free(baseVariableName); // メモリ解放
		}

		return MNM_OK;


	default:
		// その他エラー
		return MNM_ARG_ERR;
	}
}

/// <summary>
/// ニーモニックファイルパスからベースファイル名（ラベル名）を取り出します
/// </summary>
/// <param name="cMnmFilePath"></param>
/// <returns>スレッドセーフではない</returns>
char* MnmFile_Base(char* cMnmFilePath)
{
	// 作業用にファイルパスを複製します
	static char Label[128];
	strncpy_s(Label, sizeof(Label), cMnmFilePath, sizeof(Label));
	// 最後のピリオドで文字終端にします
	char* lastperiod = strrchr(Label, '.');
	if (lastperiod != NULL)
		*lastperiod = '\0';
	// 最後のパス区切り文字('\'か'/')を探します
	char* lastdelimiter;
	lastdelimiter = strrchr(Label, '\\');
	if (lastdelimiter != NULL)
		return lastdelimiter + 1;
	lastdelimiter = strrchr(Label, '/');
	if (lastdelimiter != NULL)
		return lastdelimiter + 1;
	// パス区切り文字が見つからなかったなら先頭を返せばよい
	return Label;
}

/// <summary>
/// ニーモニックファイルのロードと解釈
/// </summary>
/// <param name="cMnmFilePath"></param>
/// <returns></returns>
int MnmFile_Load(char* cMnmFilePath)
{
	int		errors = 0;						// 処理している ILファイルのエラーの件数
	DWORD	dwFileLine = 0;					// 処理しているニーモニックファイル行番号
	FILE	*fp;							// 処理している ILファイルのファイルポインタ
	char	cTmp[128];						// 行解析用の一時バッファ
	char	*cCmd, *cArg1, *cArg2, *cArg3;	// 行解析用の一時バッファ
	struct MNMTEMPLATE* targetcmd;			// 解析結果の命令
	WORD	wArgStatus;						// 引数解釈結果ステータス
	P_ANY	ArgValue1;						// 引数１
	P_ANY	ArgValue2;						// 引数２
	P_ANY	ArgValue3;						// 引数３
	BOOL	endok = FALSE;					// フラグ：END命令が適切に入っている
	BOOL	retok = FALSE;					// フラグ：RET命令が適切に入っている
	int		hasbit = -1;					// フラグ：ビット指定子を示す
	BOOL	taboo;							// フラグ：禁止ワードに抵触した

	// ニーモニックファイルを開く
	fp = MnmFile_Open(cMnmFilePath);
	if (fp == NULL) {
		Errorlog_Add(0, MNM_FILE_ERR, cMnmFilePath);
		++errors;
		goto end;
	}

	// ロジック冒頭にラベル命令を挿入します
	struct MNMTEMPLATE* labelcmd = Instruction_GetTemplate("LABEL");
	struct PLCLOGIC* logiclabel = Logic_Add(labelcmd, 0, 0, 0);

	// ファイル名からベース名を取り出してラベル名とし、ラベルリストに追加します、ラベル名とロジックエントリポイント
	char* labelname = MnmFile_Base(cMnmFilePath);
	struct PLCLABEL* mnmname = Label_Add(labelname,dwFileLine+1, logiclabel);

	// ファイル終端までニーモニックの解釈
	while (MnmFile_GetLine(fp, cTmp, sizeof(cTmp)) != NULL)
	{
		/// <summary>
		/// IL行のトリミング処理
		/// </summary>
		/// <param name="cMnmFilePath"></param>
		/// <returns></returns>
		{
			// ファイル内行番号
			dwFileLine++;

			// 行のトリミング、コメント構文の処理、無駄な冒頭空白のカット
			MnmFile_TrimLine_Stage1(cTmp);

			// トリムの結果、空白行は無視します
			if (strlen(cTmp) == 0)
				continue;
		}

		/// <summary>
		/// ILコマンドの分解処理
		/// </summary>
		/// <param name="cMnmFilePath"></param>
		/// <returns></returns>
		{
			// 文字列リテラルを見越して文字列パッキングを行います（空白文字対策）
			String_Packing(cTmp);

			// 行のトリミング、文字列パッキングを踏まえたうえで、不要な空白を取り除く
			MnmFile_TrimLine_Stage2(cTmp);

			// 行の構文分解（コマンド、引数１、引数２、引数３）
			MnmFile_PargeLine(cTmp, &cCmd, &cArg1, &cArg2, &cArg3);

			// 文字列リテラルの可能性がある引数１に対して文字列パッキングを解除を行います
			String_Unpacking(cArg1);

			// 該当する命令文無し（空行とみなすので無処理スキップ）
			if (cCmd == NULL)
				continue;
		}

		/// <summary>
		/// 命令部、行ラベルの判定
		/// </summary>
		/// <param name="cMnmFilePath"></param>
		/// <returns></returns>
		//{
		//	// 登録済の行ラベルに該当するか判定します
		//	struct PLCLABEL *labelentry;
		//	labelentry = Label_Search(cArg1);
		//	if (labelentry)
		//	{
		//		// 同じラベルが登録されるのは二重定義エラー
		//		Errorlog_Add(dwFileLine, MNM_DUPLICATE_LABEL_ERR, "");
		//		++errors;
		//		continue;
		//	}

		//	// ラベル行に合致するかチェックする
		//	Label = Label_Check(cArg1);
		//	if (Label)
		//	{
		//		// ロジックにラベル命令を挿入します
		//		logiclabel = Logic_Add(labelcmd, 0, 0, 0);
		//		// ラベルのリストに追加します
		//		struct PLCLABEL *labelentry = Label_Add(labelentry->name, dwFileLine, logiclabel);
		//		// PLC変数(ラベル)を生成して変数リストに登録します
		//		P_ANY LabelTag = Variable_Create(D_LABEL);
		//		union ANYVAL *LabelBody = Variable_Body(sizeof(union ANYVAL));
		//		LabelBody->pLabel = logiclabel;
		//		Variable_Add(Label, LabelTag);
		//	}
		//}

		/// <summary>
		/// 命令部の解釈処理
		/// </summary>
		/// <param name="cMnmFilePath"></param>
		/// <returns></returns>
		{
			// 該当する命令のテンプレートを取得（ハッシュを使って高速に）
			targetcmd = Instruction_GetTemplate(cCmd);

			// 実在しない命令の場合エラーです
			if (targetcmd == NULL)
			{
				Errorlog_Add(dwFileLine, MNM_INST_ERR, mnmname->name);
				++errors;
				continue;
			}
		}

		/// <summary>
		/// 宣言系命令(VAR)の処理 .precode=TRUE の定義のもの
		/// </summary>
		{
			if (targetcmd->precode)
			{
				// 宣言命令を今すぐ処理します
				//	引数１	引数文字列
				//	引数２	命令文字列
				(targetcmd->lpMnmInstruct)((P_ANY)cArg1, (P_ANY)cCmd, 0, 0);
				// ロジックリストへの積込みはありません
				continue;
			}
		}

		// ビルトインファンクション呼び出しのカンマ区切り複数引数の場合があるので更に分解します（引数１、引数２、引数３）
		MnmFile_PargeCamma(cArg1, &cArg1, &cArg2, &cArg3);

		// 引数１が予約語（禁止ワード）に抵触していないか判断する
		taboo = Reservedword_Check(cArg1);
		if (taboo)
		{
			Errorlog_Add(dwFileLine, MNM_ARG1_ERR, mnmname->name);
			++errors;
			// 予約語エラーです
			Errorlog_Add(dwFileLine, MNM_RESERVEDWORD_ERR, mnmname->name);
			++errors;
			continue;
		}

		// 引数２が予約語（禁止ワード）に抵触していないか判断する
		taboo = Reservedword_Check(cArg2);
		if (taboo)
		{
			Errorlog_Add(dwFileLine, MNM_ARG2_ERR, mnmname->name);
			++errors;
			// 予約語エラーです
			Errorlog_Add(dwFileLine, MNM_RESERVEDWORD_ERR, mnmname->name);
			++errors;
			continue;
		}

		// 引数３が予約語（禁止ワード）に抵触していないか判断する
		taboo = Reservedword_Check(cArg3);
		if (taboo)
		{
			Errorlog_Add(dwFileLine, MNM_ARG3_ERR, mnmname->name);
			++errors;
			// 予約語エラーです
			Errorlog_Add(dwFileLine, MNM_RESERVEDWORD_ERR, mnmname->name);
			++errors;
			continue;
		}

		// 引数無しにリセットしてから分析をスタートします
		ArgValue1 = &VARIANT_EMPTY;
		ArgValue2 = &VARIANT_EMPTY;
		ArgValue3 = &VARIANT_EMPTY;

		// 引数１のビット指定子解釈　hasbitには、ビット指定があれば0~31、合致しない時は-1が返ります
		// ビット演算子指定があるならば、命令が変化します ('B'が付きます)
		//		LD src -> LD src
		//				  BIT bit
		//
		//		LDN src -> LD src
		//				   NEG
		//				   BIT bit
		//
		//		ST dst -> STB dst,bit
		//		STN dst -> STNB dst,bit
		//				
		//		LD src -> LDB src,bit
		//		LDN src -> LDBN src,bit
		//
		//		AND src -> ARG src
		//					
		//
		//hasbit = MnmFile_BitArgument(cArg1, ArgValue1->Type);
		//if (hasbit >= 0)
		//{
		//	// 命令後の末尾に'B'が取りつきます
		//	strcat(cTmp, "B");
		//	// 再度、該当する命令のテンプレートを取得（ハッシュを使って高速に）
		//	targetcmd = Instruction_GetTemplate(cTmp);
		//	// 'B'命令では引数２として、ビット位置(hasbit)を持つArgValue2を生成します
		//	union ANYVAL bitpos;
		//	bitpos.bVal = hasbit;
		//	ArgValue2->Type = D_BYTE;
		//	ArgValue2->pByte = *Literal_Create(D_BYTE, bitpos);
		//}

		// 引数１の解釈 (戻り MNM_OK の場合 ArgValue1 が返ります)
		if(cArg1)
		{
			wArgStatus = MnmFile_PargeArgument(cArg1, targetcmd->byArgType1 ,&ArgValue1);
			if (wArgStatus != MNM_OK)
			{
				Errorlog_Add(dwFileLine, MNM_ARG1_ERR, mnmname->name);
				++errors;
				Errorlog_Add(dwFileLine, wArgStatus, mnmname->name);
				++errors;
				continue;
			}
		}

		// 引数２の解釈 (戻り MNM_OK の場合 ArgValue2 が返ります)
		if (cArg2)
		{
			wArgStatus = MnmFile_PargeArgument(cArg2, targetcmd->byArgType2, &ArgValue2);
			if (wArgStatus != MNM_OK)
			{
				Errorlog_Add(dwFileLine, MNM_ARG2_ERR, mnmname->name);
				++errors;
				Errorlog_Add(dwFileLine, wArgStatus, mnmname->name);
				++errors;
				continue;
			}
		}

		// 引数３の解釈 (戻り MNM_OK の場合 ArgValue3 が返ります)
		if (cArg3)
		{
			wArgStatus = MnmFile_PargeArgument(cArg3, targetcmd->byArgType3, &ArgValue3);
			if (wArgStatus != MNM_OK)
			{
				Errorlog_Add(dwFileLine, MNM_ARG3_ERR, mnmname->name);
				++errors;
				Errorlog_Add(dwFileLine, wArgStatus, mnmname->name);
				++errors;
				continue;
			}
		}

		// CAL命令の場合は関数エントリを算出する
		if (targetcmd->code == CMD_CAL)
		{
			// インスタンス名からオリジナル名を得ます
			char					*originalname;
			originalname = Rtedge_GetStructureName(cArg1);
			// CALのパラメータを生成します
			ArgValue2 = Variable_Search(originalname);
			// 正しく取れなかった場合は安全のためダミーを挿入します
			if (ArgValue2 == NULL)
			{
				Errorlog_Add(dwFileLine, FB_NOTFOUND_ERR, mnmname->name);
				ArgValue2 = &_Variable_Zero_FUNCTION;
			}
		}

		// 引数も含めて適切なので命令リストに加える
		Logic_Add(targetcmd, ArgValue1, ArgValue2, ArgValue3);

		// END命令で以降の解釈を終わりにします
		if (targetcmd->code == CMD_END)
		{
			endok = TRUE;
			break;
		}

		// RET命令で以降の解釈を終わりにします
		if (targetcmd->code == CMD_RET)
		{
			retok = TRUE;
			break;
		}
	}

	// ニーモニックファイルを閉じる
	if (fp)
		MnmFile_Close(fp);

	// メイン以外のPOUの場合で、終端RET命令が入っていないなら強制的に取り付けます
	char* scope = Scope_get();
	int scopelen = strlen(scope);
	BOOL notmain = (scopelen != 0);
	if (notmain)
	{
		if (!retok)
		{
			// RET命令をリストに加える
			struct MNMTEMPLATE* retcmd = Instruction_GetTemplate("RET");
			Logic_Add(retcmd, &VARIANT_EMPTY, &VARIANT_EMPTY, &VARIANT_EMPTY);
		}
	}
	else
	{
		if (!endok)
		{
			// END命令をリストに加える
			struct MNMTEMPLATE* retcmd = Instruction_GetTemplate("END");
			Logic_Add(retcmd, &VARIANT_EMPTY, &VARIANT_EMPTY, &VARIANT_EMPTY);
		}
	}

end:
	// エラー個数を返す
	return errors;
}

/// <summary>
/// ビット指定子があるか判定、ビット位置(0~63)の返却(該当しない場合-1)、アーギュメント文字列
/// </summary>
int MnmFile_BitArgument(char *argument, T_TYPE byType)
{
	// アーギュメントなしはスキップ
	if (argument == 0)
		return -1;

	//// 型を判定する
	//// 浮動小数点値ではドット(.)をビット指定とは認識しないのでスキップです
	//if ((byType == D_REAL) || (byType == D_LREAL))
	//	return -1;

	// 1) 終端が".X99"となっていること
	// 2) 数値がPLC変数型に応じたビット数であること

	// アーギュメント文字列の末尾が ".X16" のように、".X"と数値(0~63)で指定される場合
	// ビット指定子と判断できる
	char*		rchr;
	int			bitpos = -1;
	int			numscan;
	// アーギュメント中の最後のピリオドを探します
	rchr = strrchr(argument ,'.');
	if (rchr != NULL)
	{

		// ピリオドがあったのでビット位置数値の取得を試みる
		numscan = sscanf(rchr, ".X%d" ,&bitpos);
		if ((numscan == 1) && (bitpos >= 0) && (bitpos <= 63))
		{
			// 妥当なビット位置ならばアーギュメント文字列のビット指定子以降は NULL文字 で潰してビット位置を返します
			*rchr = '\0';
			return bitpos;
		}
	}

	// ビット指定子には該当しません
	return -1;
}
