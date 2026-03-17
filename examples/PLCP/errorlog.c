#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// エラーログ管理
DWORD	status_errorlog = STATUS_STOP;


/// <summary>
/// ニーモニックエラーリスト
/// </summary>
struct PLCERR*	plcErrList = NULL;
struct PLCERR*	plcErrBottom = NULL;


/// <summary>
/// エラーカウント
/// </summary>
uint32_t	errors = 0;


struct ErrorLog_Message
{
	WORD		errorcode;
	char*		message;
} errormessages[] = {
	{MNM_OK					,"OK"},
	{MNM_DIF_ERR			,"DIFF命令が上限数を超えています"},
	{MNM_STACK_ERR			,"MPS/MPP命令数マッチング(スタック)に異常があります"},
	{MNM_ARG_ERR			,"命令引数の指定に異常があります"},
	{MNM_ARG1_ERR			,"命令引数1の指定に異常があります"},
	{MNM_ARG2_ERR			,"命令引数2の指定に異常があります"},
	{MNM_ARG3_ERR			,"命令引数3の指定に異常があります"},
	{MNM_LD_ERR				,"LD命令整合に異常があります"},
	{MNM_END_ERR			,"END命令で終了する必要があります"},
	{MNM_FILE_ERR			,"ファイルの読み込みに失敗しました"},
	{MNM_STRING_ERR			,"不正な文字列を検知しました"},
	{MNM_INST_ERR			,"不正な命令を検知しました"},
	{INI_FILE_ERR			,"INIファイルが見つかりません"},
	{INI_TIM_SEC_ERR		,"INIファイルにTIMERセクションが見つかりません"},
	{INI_TIM_NUM_ERR		,"INIファイルのTIMER番号の指定に異常があります"},
	{INI_TIM_TYPE_ERR		,"INIファイルのTIMER種別の指定に異常があります"},
	{INI_TIM_VALU_ERR		,"INIファイルのTIMER値の指定に異常があります"},
	{INI_CNT_SEC_ERR		,"INIファイルにCNT_INIセクションが見つかりません"},
	{INI_CNT_NUM_ERR		,"INIファイルのCOUNTER番号の指定に異常があります"},
	{INI_CNT_VALU_ERR		,"INIファイルのCOUNTER値の指定に異常があります"},
	{INI_CH_SEC_ERR			,"INIファイルにCHANNELセクションが見つかりません"},
	{INI_CH_NUM_ERR			,"INIファイルのCHANNEL番号の指定に異常があります"},
	{INI_CH_TYPE_ERR		,"INIファイルのCHANNEL種別の指定に異常があります"},
	{INI_CH_IODEF_ERR		,"INIファイルのドライバ定義書式(p1:p2:p3:p4)に異常があります"},
	{FUNC_LOAD_WARNING		,"PlcFunc.RSLの内部構造が異常です"},
	{UFUNC_LOAD_WARNING		,"UserFunc.RSLの内部構造が異常です"},
	{IODRV_LOAD_WARNING_F1	,"IOdriver.RSLのエントリが異常です(install)"},
	{IODRV_LOAD_WARNING_F2	,"IOdriver.RSLのエントリが異常です(init)"},
	{IODRV_LOAD_WARNING_F3	,"IOdriver.RSLのエントリが異常です(read)"},
	{IODRV_LOAD_WARNING_F4	,"IOdriver.RSLのエントリが異常です(write)"},
	{IODRV_LOAD_WARNING_F5	,"IOdriver.RSLのエントリが異常です(open)"},
	{IODRV_LOAD_WARNING_F6	,"IOdriver.RSLのエントリが異常です(close)"},
	{IODRV_LOAD_WARNING_F7	,"IOdriver.RSLのエントリが異常です(cntrl)"},
	{IODRV_LOAD_WARNING_F8	,"IOdriver.RSLのエントリが異常です(info)"},
	{IODRV_LOAD_WARNING		,"IOdriver.RSLの内部構造が異常です"},
	{IODRV_LOAD_ERROR		,"指定のIOdriverが見つかりません"},
	{IODRV_INST_ERROR		,"指定のIOdriverのINSTALL処理がエラーを返しました"},
	{IODRV_INIT_ERROR		,"指定のIOdriverのINIT処理がエラーを返しました"},
	{IODRV_OPEN_ERROR		,"指定のIOdriverのOPEN処理がエラーを返しました"},
	{API_REQUEST_ERR		,"不明なAPIリクエストです"},
	{TRACE_MEM_ERR			,"トレースバッファがメモリ不足です"},
	{INST_STACK_OVER		,"スタック命令オーバーが発生"},
	{INST_STACK_UNDER		,"スタック命令アンダーが発生"},

	{SYS_MEM_EMPTY			,"RTメモリ不足が発生"},
	{TIMEFORMAT_ERR			,"タイム型(T#)の書式が異常です"},
	{TAG_NOTFOUND_ERR		,"エッジタグが未登録です"},
	{FB_NOTFOUND_ERR		,"ファンクションブロックが見つかりません"},
	{UFU_ARG_ERR			,"ユーザファンクションの入力引数が未定義です"},
	{STRING_FORMAT_ERR		,"文字列リテラルの書式が異常です"},
	{MNM_RESERVEDWORD_ERR	,"予約語を使用することはできません"},
	{MNM_DUPLICATE_LABEL_ERR	,"ラベルが多重定義です"},
	{MNM_ENTRYPOINT_NOTFOUND	,"ロジックのエントリーポイントが見つかりません"},
	{PLC_HALT				,"例外によりPLCが停止されました"},
};


/// <summary>
/// ニーモニックのエラーリストに１つ加える
///		mallocを含みます
/// </summary>
void Errorlog_Add(DWORD iline, DWORD icode ,char* msg)
{
	//TODO:エラーが大量に吐き出される場合に備えて、上限管理と、FIFO順で消滅する機構が必要

	struct PLCERR* current;
	// メモリの確保と値の保持
	struct PLCERR* new_node = (struct PLCERR*)Heap_Alloc(sizeof(struct PLCERR), __FUNCTION__);
	new_node->line = iline;
	new_node->code = icode;
	new_node->msg = msg;
	if(msg == NULL)
		new_node->msg = "";
	new_node->next = NULL;
	// 最初のエントリの場合
	if (plcErrList == NULL) {
		plcErrList = new_node;
		plcErrBottom = new_node;
		goto success;
	}
	// ２つ目以降のエントリの場合、末端に加える
	current = plcErrBottom;
	current->next = new_node;
	plcErrBottom = new_node;

success:
	// 本機能の動作状態を更新
	status_errorlog = STATUS_READY;

	// インジケータ更新
	++errors;
	Indicate_ERRORS(errors);
}

/// <summary>
/// ニーモニックのエラーリストをメモリ解放してクリアします
/// </summary>
void Errorlog_Clear(void)
{
	struct PLCERR* current = plcErrList;
	// 全てのエントリメモリを開放します
	while (current != NULL) {
		current = current->next;
		Heap_Free(plcErrList);
		plcErrList = current;
	}

	// リストが空の状態にする
	plcErrList = NULL;
	plcErrBottom = NULL;

	// 本機能の動作状態を更新
	status_errorlog = STATUS_STOP;

	// エラー数クリア
	errors = 0;
}

/// <summary>
/// エラーコードに該当するメッセージを返却します
/// </summary>
/// <param name="code"></param>
/// <returns></returns>
char* Errorlog_Message(DWORD code)
{
	// エラーコードに一致するメッセージのサーチ
	int	lp1;
	for (lp1 = 0; lp1 < sizeof(errormessages) / sizeof(struct ErrorLog_Message); lp1++)
	{
		if (errormessages[lp1].errorcode == code)
		{
			return errormessages[lp1].message;
		}
	}
	return "Unknown error";
}

/// <summary>
/// ニーモニックファイルの事前解釈時に検出されたエラーのリスト表示
/// </summary>
/// <param name="ipath">メッセージ</param>
void Errorlog_Display(char *message)
{
	printf("ErrorLog list\n");
	struct PLCERR* current = plcErrList;
	int Errors = 0;

	// 空の場合
	if (current == NULL) {
		printf("  N/A\n");
		return;
	}

	// リスト終端まですべて表示
	while (current != NULL) {
		printf("  %s(%d)　: ERROR %d %s. %s\n", message, current->line, current->code ,Errorlog_Message(current->code) ,current->msg);

		current = current->next;
		Errors++;
	}
	printf("  %d Error(s)\n", Errors);
}

//TODO:エラーログのファイル掃き出し機能を用意したい

/// <summary>
/// 記録されているエラー個数を返します
/// </summary>
int Errorlog_Count(void)
{
	int		errors = 0;
	struct PLCERR* current = plcErrList;
	while (current != NULL) {
		current = current->next;
		errors++;
	}
	return errors;
}


