#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// ユーザファンクション管理
DWORD	status_userfunc = STATUS_STOP;


/// <summary>
/// ユーザファンクションのリスト
/// </summary>
struct USERFUNC* plcUserFuncList = NULL;
struct USERFUNC* plcUserFuncBottom = NULL;


/// <summary>
/// ユーザファンクションのリストに追加する
/// </summary>
/// <param name="functionname"></param>
void Userfunction_Add(char* functionname)
{
	struct USERFUNC* current;
	// エントリ用のメモリの確保
	struct USERFUNC* new_node = (struct USERFUNC*)Heap_Alloc(sizeof(struct USERFUNC) ,__FUNCTION__);
	// ユーザファンクション名称文字列用のメモリ確保と格納
	int	namelength = strlen(functionname) + 1;
	new_node->name = (char*)Heap_Alloc(namelength, __FUNCTION__":name");
	strcpy_s(new_node->name, namelength, functionname);
	new_node->next = NULL;
	// 最初のエントリの場合
	if (plcUserFuncList == NULL) {
		plcUserFuncList = new_node;
		plcUserFuncBottom = new_node;
		goto success;
	}
	// ２つ目以降のエントリの場合、末端に加える
	current = plcUserFuncBottom;
	current->next = new_node;
	plcUserFuncBottom = new_node;

success:
	// 本機能の動作状態を更新
	status_userfunc = STATUS_READY;
}

/// <summary>
/// ユーザファンクションの引数リストに項目を追加する
/// </summary>
/// <param name="functionname"></param>
/// <param name="variablename"></param>
BOOL Userfunction_AddArgument(char* functionname, char* variablename)
{
	// ユーザファンクションの引数リスト
	struct USERFUNCVARIABLE* current;
	// ターゲットのユーザファンクションを探す、見つからないならNULL
	struct USERFUNC* targetuserfunc = Userfunction_Search(functionname);
	if (targetuserfunc == NULL)
		return FALSE;
	// 対象の変数名のポインタを探す、見つからないならNULL
	char* variablenamepoint = Variable_SearchName(variablename);
	if (variablenamepoint == NULL)
		return FALSE;
	// 追加するリスト項目のメモリ確保と値の保持
	struct USERFUNCVARIABLE* new_node = (struct USERFUNCVARIABLE*)Heap_Alloc(sizeof(struct USERFUNCVARIABLE), __FUNCTION__);
	new_node->name = variablenamepoint;
	new_node->next = NULL;
	// 最初のエントリの場合
	if (targetuserfunc->variablelist == NULL) {
		targetuserfunc->variablelist = new_node;
		goto success;
	}
	// ２つ目以降のエントリの場合
	current = targetuserfunc->variablelist;
	while (current->next != NULL) {
		current = current->next;
	}
	current->next = new_node;

success:
	return TRUE;
}

/// <summary>
/// ユーザファンクションのリストを開放する
/// </summary>
void Userfunction_Clear(void)
{
	struct USERFUNC* current = plcUserFuncList;
	struct USERFUNCVARIABLE* var;
	// 全てのエントリメモリを開放します
	while (current != NULL) {
		// エントリが持つ引数リストは全て開放する
		var = current->variablelist;
		while (var != NULL)
		{
			// エントリを削除して次のエントリに進める
			var = var->next;
			Heap_Free(current->variablelist);
			current->variablelist = var;
		}

		// ユーザファンクション名称文字列バッファの解放
		Heap_Free(current->name);
		current->name = 0;

		// エントリを削除して次のエントリに進める
		current = current->next;
		Heap_Free(plcUserFuncList);
		plcUserFuncList = current;
	}

	// リストを空にする
	plcUserFuncList = plcUserFuncBottom = NULL;

	// 本機能の動作状態を更新
	status_userfunc = STATUS_STOP;
}

/// <summary>
/// ユーザファンクションのリストをダンプ表示する
/// </summary>
void Userfunction_Display(void)
{
	printf("Userfunction list\n");
	struct USERFUNC* current = plcUserFuncList;
	struct USERFUNCVARIABLE* pin;
	int line = 1;
	int pinno;

	// 空の場合
	if (current == NULL) {
		printf("  N/A\n");
		return;
	}

	// 全てのエントリを表示します
	while (current != NULL)
	{
		// ユーザファンクション名称
		printf("  Userfunc(%03d) %s\n"
			, line
			, current->name	);

		// ユーザファンクション内部ピン
		pin = current->variablelist;
		pinno = 1;
		while (pin != NULL)
		{
			printf("    pin(%d) %s\n"
				, pinno
				, pin->name);

			// 次のエントリに進む
			pin = pin->next;
			pinno++;
		}

		// 次のエントリに進む
		current = current->next;
		line++;
	}
}

/// <summary>
/// ユーザファンクションリストから名称でサーチする
/// </summary>
struct USERFUNC* Userfunction_Search(char* functionname)
{
	struct USERFUNC* current = plcUserFuncList;
	// 全てのエントリメモリを開放します
	while (current != NULL) {
		// 一致するユーザファンクション名をサーチする
		if (strcmp(current->name, functionname) == 0)
			return current;
		// 次の項目へ進む
		current = current->next;
	}
	// 見つからなかった場合NULL
	return NULL;
}

/// <summary>
/// ユーザファンクションが持つ引数の個数を返却します
/// </summary>
/// <param name="func"></param>
/// <returns></returns>
int Userfunction_NumArgument(struct USERFUNC* func)
{
	int		numArgs = 0;
	// ファンクションが持つ引数リストを取得
	struct USERFUNCVARIABLE* var = func->variablelist;
	while (var != NULL)
	{
		// 引数の個数
		numArgs++;
		// 次のエントリに進める
		var = var->next;
	}
	// 引数の個数を返す
	return numArgs;
}

/// <summary>
/// ユーザファンクションコール命令の引数、解析用のワークエリア
/// </summary>
char* context = NULL;

/// <summary>
/// ユーザファンクションコール命令の引数、１つ目の取り出し
/// </summary>
/// <param name="argline"></param>
/// <returns>NULLはないことを示します</returns>
char* _Userfunction_PargeArgumentFirst(char* argline)
{
	char *cArg = strtok_s(argline, ",", &context);
	return cArg;
}

/// <summary>
/// ユーザファンクションコール命令の引数、２つ目以降の順次取り出し
/// </summary>
/// <returns>NULLはこれ以上ないことを示します</returns>
char* _Userfunction_PargeArgumentNext(void)
{
	char *cArg = strtok_s(NULL, ",", &context);
	return cArg;
}

/// <summary>
/// ユーザファンクションコール命令の引数、不要な文字をトリミングします
/// </summary>
/// <param name="argline"></param>
void _Userfunction_TrimArgument(char* argline)
{
	int		len = strlen(argline);
	char*	src = argline;
	char*	dst = argline;
	BOOL	end = FALSE;

	do
	{
		// 不要の文字はカットして詰めていく　
		if( *src == '(' )
			goto skip;
		else if (*src == ')')
			goto skip;
		//else if (*src == ' ')		// 既に処理済みなので不要
		//	goto skip;
		//else if (*src == '\t')	// 既に処理済みなので不要
		//	goto skip;

		// 文字詰め
		if (dst != src)
		{
			*dst = *src;
		}
		dst++;
skip:
		if (*src == '\0')
			end = TRUE;

		src++;
	} while ( ! end );
}

/// <summary>
/// MNM解釈処理の段階で、ユーザファンクションの呼び出し命令にヒットするとここに来ます
/// パラメータ積込みを処理するIL命令を挿入して UFU するようにロジックを置換します
/// ユーザファンクション戻り値は "MyUserFunction.MyUserFunction" に積まれているので、"MyUserFunction" に移し替える命令も挿入される
/// ユーザファンクションコールには以下のケースがあります
/// 
/// 1) LD					param1
///    MyUserFunction							１つの入力の場合、引数の無い状態
/// 
/// 2) LD					Param1
///	   MyUserFunction2		Param2				２つの入力の場合、引数が１つ付きます
/// 
/// 3) LD					Param1
///    MyUserFunction3		(Param2,Param3)		３つ以上の入力の場合、最大256個までカンマ区切りで入力変数順の値が付きます
/// 
/// </summary>
/// <param name="a1"></param>
/// <param name="a2"></param>
/// <param name="a3"></param>
/// <param name="a4"></param>
/// <returns></returns>
P_ANY Userfunction_ReplaceInstruction(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// a1 に文字列でユーザファンクションの引数が届く。ないときはNULLです。
	char*	arg1 = (char*)a1;
	// a2 に文字列でユーザファンクション名の引数が届く。
	char*	ufuncname = (char*)a2;

	// ユーザファンクションが登録済であるはずなので取り出す
	struct USERFUNC*	func = Userfunction_Search(ufuncname);

	// ユーザファンクションが持つ引数リストを取り出します
	struct USERFUNCVARIABLE* var = func->variablelist;
	// ユーザファンクションが持つ引数個数を取り出します
	int nummaxargs = Userfunction_NumArgument(func);

	// ユーザファンクションの入力引数は最低でも１。異常ならばエラーです
	if (nummaxargs < 1)
	{
		Errorlog_Add(0, UFU_ARG_ERR, ufuncname);
		return &VARIANT_EMPTY;
	}

	// 挿入する命令を事前に取り出します
	struct MNMTEMPLATE* ST = Instruction_GetTemplate("ST");
	struct MNMTEMPLATE* LD = Instruction_GetTemplate("LD");
	struct MNMTEMPLATE* UFU = Instruction_GetTemplate("UFU");		// ユーザファンクションコール命令(非IEC)

	// 入力引数1について、ユーザファンクションから入力側引数を１つ取り出して、代入命令を挿入 ( a0 → myFU.in[0] )
	P_ANY	contact;
	P_ANY	pin;
	pin = Variable_Search(var->name);
	Logic_Add(ST, pin, 0, 0);
	// 次の入力ピンに進めます
	var = var->next;

	// ユーザファンクション命令への引数(arg1)があるなら引数解析処理のためにクローンを一時的に作ります
	int		arglength = 0;
	char*	argwork = NULL;
	char*	tokn = NULL;
	if (arg1 != NULL)
	{
		arglength = strlen(arg1) + 1;		// '\0'の分
		argwork = (char*)Heap_Alloc(arglength, __FUNCTION__":work temporary");

		// 作業用のクローンを用意します
		strcpy_s(argwork, arglength, arg1);

		// 不要な文字をトリミングします
		_Userfunction_TrimArgument(argwork);

		// 第二引数コンタクトを取り出します
		tokn = _Userfunction_PargeArgumentFirst(argwork);
	}

	// 入力ピンのリスト全てに引数コンタクトの接続を試みます
	while (var)
	{
		// 積込み先（入力ピン）の変数
		pin = Variable_Search(var->name);

		if (tokn)
		{
			// 積込み元（引数コンタクト）の変数
			contact = Variable_Search(tokn);

			if (contact == 0)
			{
				// ( この位置はユーザファンクションコール引数に指定された
				// 'INT#50' など定数指定の可能性もあるので試みる）
				P_ANY literal = Literal_Compile(tokn);
				if (literal)
					contact = literal;
			}

			// 次の引数コンタクトに進みます
			tokn = _Userfunction_PargeArgumentNext();
		}
		else
		{
			// 積込み元がない（入力を省略している）場合、デフォルト値(ゼロ値)を与える。データ型はピンに合わせる
			contact = Variable_Zero(pin->Type);
		}

		// 変数引き渡し命令の積み込み、contact → pin 
		Logic_Add(LD, contact, 0, 0);
		Logic_Add(ST, pin, 0, 0);

		// 次の入力ピンに進めます
		var = var->next;
	}

	// 一時バッファを（確保したなら）開放します
	if(argwork)
		Heap_Free(argwork);


	//ArgValue3 = &VARIANT_EMPTY;
	//wArgStatus = MnmFile_PargeArgument(cArg1, targetcmd->byArgType1, &ArgValue1);
	//if (wArgStatus != MNM_OK)

	// UFU 命令の挿入(関数ジャンプ先)
	struct PLCLABEL*	label = Label_Search(ufuncname);
	struct PLCLOGIC*	jumpto = label->anchor;
	// ロジックに命令を追加
	Logic_Add(UFU, (P_ANY)jumpto, 0, 0);

	// 戻り値の再代入命令の挿入 (myFU.myFU → myFU)
	int		ufuncInternalAnslen = strlen(ufuncname) *2 +1 +1;		// ユーザファンクション名称 x2 に"."と"\0"を加算下文字長
	// 変数名用の一時バッファを確保
	char*	ufuncInternalAns = (char*)Heap_Alloc(ufuncInternalAnslen, __FUNCTION__":work temporary");
	if(ufuncInternalAns)
	{
		// ユーザファンクション戻り値を格納している変数名を作る "myFU.myFU"
		strcat_s(ufuncInternalAns, ufuncInternalAnslen, ufuncname);
		strcat_s(ufuncInternalAns, ufuncInternalAnslen, ".");
		strcat_s(ufuncInternalAns, ufuncInternalAnslen, ufuncname);
		// ユーザファンクション戻り値変数からのリダイレクション命令
		P_ANY	fuAns1 = Variable_Search(ufuncname);			// myFU
		P_ANY	fuAns2 = Variable_Search(ufuncInternalAns);		// myFU.myFU
		// ロジックに命令を追加
		Logic_Add(LD, fuAns2, 0, 0);
		Logic_Add(ST, fuAns1, 0, 0);
		// 変数名一時バッファの解放
		Heap_Free(ufuncInternalAns);
	}

	// MNM解釈段階で処理される命令なので、実際には必要のない戻り値
	return a1;
}