#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// 命令管理
DWORD	status_instruction = STATUS_STOP;

/// <summary>
/// POU処理中に現れる FU宣言、FB宣言により切り替わります
/// </summary>
BOOL	Instruction_UF = FALSE;
BOOL	Instruction_UFB = FALSE;

/// <summary>
/// 命令ハッシュテーブル
/// </summary>
#define INST_HASHSIZE		0xffff
struct MNMTEMPLATE*	InstructionCatalog[INST_HASHSIZE] = { 0 };


/// <summary>
/// 命令スタック領域(MPS,MPP,MRD命令用)
/// </summary>
#define	INST_STACK		256
BYTE stack[INST_STACK] = { 0 };
int	stackptr = 0;

/// <summary>
/// 信号状態スタック保存操作(MPS,MPP,MRD命令用)
/// </summary>
/// <param name="a1"></param>
/// <returns></returns>
BYTE push(BYTE a1)
{
	// 現在ステートを一時的にスタックへ積む
	stack[stackptr] = a1;
	stackptr++;
	// スタックオーバーの判定
	if (stackptr > INST_STACK)
	{
		Errorlog_Add(0, INST_STACK_OVER, "");
#ifdef __INTIME__
		INtime_Halt("STACKOVER");
#endif
	}
	return a1;
}

/// <summary>
/// 信号状態スタック復元操作(MPS,MPP,MRD命令用)
/// </summary>
/// <returns></returns>
BYTE pop(void)
{
	BYTE		a1;
	// スタックアンダーの判定
	if (stackptr <= 0)
	{
		Errorlog_Add(0, INST_STACK_UNDER, "");
#ifdef __INTIME__
		INtime_Halt("STACKUNDER");
#endif
	}
	// スタックから現在ステートを復元する
	stackptr--;
	a1 = stack[stackptr];
	return a1;
}


/// <summary>
/// 命令処理関数の宣言
/// </summary>
P_ANY NOP(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	return a1;
}

P_ANY LD(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// ANY型からの読出しの場合
	if (a2->Type == D_ANY)
	{
		// ANYの場合、既に隔離されたT_ANYが存在しアドレスが記載されているのでそれを取り出す
		P_ANY	any = (P_ANY)*a2->pDword;
		// 以後a2を差し替えて処理
		a2 = any;
	}

	a1->Type = a2->Type;		// 型の引継ぎ

	WORD	bytesize = Type_GetSize(a2);
	switch (bytesize) {
	case 1:		
		LD_byte(a1->pByte, a2);
		break;
	case 2:		
		LD_word(a1->pWord, a2);
		break;
	case 4:		
		LD_dword(a1->pDword, a2);
		break;
	case 8:		
		LD_qword(a1->pQword, a2);
		break;
	case 83:
		LD_string(a1->pString, a2);
		break;
	}

	// ビットフィールドを使用している場合はビット情報を取り出します
	if (a2->bitfield.use)
	{
		a1->bitfield.use = TRUE;
		a1->bitfield.offset = a2->bitfield.offset;
		a1->bitfield.value = (*a2->pDword >> a2->bitfield.offset) & 0x01;
		// ビットフィールドを使用している場合は型をD_BOOLに変更します
		a1->Type = D_BOOL;
		a1->pBool = &a1->bitfield.value;	
	}	
	return a1;
}

P_ANY LDN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	a1->Type = a2->Type;		// 型の引継ぎ

	WORD	bytesize = Type_GetSize(a2);
	switch (bytesize) {
	case 1:		
		LDN_byte(a1->pByte, a2);
		break;
	case 2:		
		LDN_word(a1->pWord, a2);
		break;
	case 4:		
		LDN_dword(a1->pDword, a2);
		break;
	case 8:		
		LDN_qword(a1->pQword, a2);
		break;
	}

	// ビットフィールドを使用している場合はビット情報を取り出します
	if (a2->bitfield.use)
	{
		a1->bitfield.use = TRUE;
		a1->bitfield.offset = a2->bitfield.offset;
		a1->bitfield.value = INVERT((*a2->pDword >> a2->bitfield.offset) & 0x01);
		// ビットフィールドを使用している場合は型をD_BOOLに変更します
		a1->Type = D_BOOL;
		a1->pBool = &a1->bitfield.value;
	}	
	return a1;
}

P_ANY ST(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// ANY型への格納の場合
	if (a2->Type == D_ANY)
	{
		// ANYの場合、既に隔離されたT_ANYが存在しアドレスが記載されているのでそれを取り出す
		P_ANY	any = (P_ANY)*a2->pDword;
		// 以後a2を差し替えて処理
		a2 = any;
	}

	// ビットフィールドを使用している場合はビット情報を設定します
	if (a2->bitfield.use)
	{
		// a1の値から対象ビットを抽出
		BYTE value = (*a1->pByte & 0x01); // a1の最下位ビットを取得
		
		// a2の該当ビットのみを変更
		*a2->pDword &= ~(1 << a2->bitfield.offset); // 対象ビットをクリア
		*a2->pDword |= (value << a2->bitfield.offset); // 新しい値を設定
		return a1;
	}

	a2->Type = a1->Type;			// 型の引継ぎ

	WORD	bytesize = Type_GetSize(a1);
	switch (bytesize) {
	case 1:		
		ST_byte(a2, a1->pByte);
		break;
	case 2:		
		ST_word(a2, a1->pWord);
		break;
	case 4:		
		ST_dword(a2, a1->pDword);
		break;
	case 8:		
		ST_qword(a2, a1->pQword);
		break;
	case 83:
		// 文字列コピー
		ST_string(a2, a1->pString);
		break;
	}

	return a1;
}

P_ANY STN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// ANY型への格納の場合
	if (a2->Type == D_ANY)
	{
		// ANYの場合、既に隔離されたT_ANYが存在しアドレスが記載されているのでそれを取り出す
		P_ANY	any = (P_ANY)*a2->pDword;
		// 以後a2を差し替えて処理
		a2 = any;
	}

	// ビットフィールドを使用している場合はビット情報を設定します
	if (a2->bitfield.use)
	{
		// a1の値から対象ビットを抽出して反転
		BYTE value = (~(*a1->pByte) & 0x01); // a1の最下位ビットを取得して反転
		
		// a2の該当ビットのみを変更
		*a2->pDword &= ~(1 << a2->bitfield.offset); // 対象ビットをクリア
		*a2->pDword |= (value << a2->bitfield.offset); // 反転した値を設定
		return a1;
	}

	a2->Type = a1->Type;			// 型の引継ぎ

	WORD	bytesize = Type_GetSize(a1);
	switch (bytesize) {
	case 1:		
		STN_byte(a2, a1->pByte);
		break;
	case 2:		
		STN_word(a2, a1->pWord);
		break;
	case 4:		
		STN_dword(a2, a1->pDword);
		break;
	case 8:		
		STN_qword(a2, a1->pQword);
		break;
	}

	return a1;
}
P_ANY S(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// ANY型への格納の場合
	if (a2->Type == D_ANY)
	{
		// ANYの場合、既に隔離されたT_ANYが存在しアドレスが記載されているのでそれを取り出す
		P_ANY	any = (P_ANY)*a2->pDword;
		// 以後a2を差し替えて処理
		a2 = any;
	}

	if (BOOLPOS(*a1->pBool))
	{
		// ビットフィールドを使用している場合はビット情報を設定します
		if (a2->bitfield.use)
		{
			// a2の該当ビットのみを変更
			*a2->pDword |= (1 << a2->bitfield.offset); // ビットを立てる
		}
		else
		{
			a2->Type = D_BOOL;
			*a2->pBool = TRUE;
		}
	}
	return a1;
}
P_ANY SN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// ANY型への格納の場合
	if (a2->Type == D_ANY)
	{
		// ANYの場合、既に隔離されたT_ANYが存在しアドレスが記載されているのでそれを取り出す
		P_ANY	any = (P_ANY)*a2->pDword;
		// 以後a2を差し替えて処理
		a2 = any;
	}

	if (BOOLNEG(*a1->pBool))
	{
		// ビットフィールドを使用している場合はビット情報を設定します
		if (a2->bitfield.use)
		{
			// a2の該当ビットのみを変更
			*a2->pDword |= (1 << a2->bitfield.offset); // ビットを立てる
		}
		else
		{
			a2->Type = D_BOOL;
			*a2->pBool = TRUE;
		}
	}
	return a1;
}
P_ANY R(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// ANY型への格納の場合
	if (a2->Type == D_ANY)
	{
		// ANYの場合、既に隔離されたT_ANYが存在しアドレスが記載されているのでそれを取り出す
		P_ANY	any = (P_ANY)*a2->pDword;
		// 以後a2を差し替えて処理
		a2 = any;
	}

	if (BOOLPOS(*a1->pBool))
	{
		// ビットフィールドを使用している場合はビット情報を設定します
		if (a2->bitfield.use)
		{
			// a2の該当ビットのみを変更
			*a2->pDword &= ~(1 << a2->bitfield.offset); // 対象ビットをクリア
		}
		else
		{
			a2->Type = D_BOOL;
			*a2->pBool = FALSE;
		}
	}
	return a1;
}
P_ANY RN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// ANY型への格納の場合
	if (a2->Type == D_ANY)
	{
		// ANYの場合、既に隔離されたT_ANYが存在しアドレスが記載されているのでそれを取り出す
		P_ANY	any = (P_ANY)*a2->pDword;
		// 以後a2を差し替えて処理
		a2 = any;
	}

	if (BOOLNEG(*a1->pBool))
	{
		// ビットフィールドを使用している場合はビット情報を設定します
		if (a2->bitfield.use)
		{
			// a2の該当ビットのみを変更
			*a2->pDword &= ~(1 << a2->bitfield.offset); // 対象ビットをクリア
		}
		else
		{
			a2->Type = D_BOOL;
			*a2->pBool = FALSE;
		}
	}
	return a1;
}

P_ANY AND(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// a1 : これまでの論理結果 (BOOL)
	// a2 : オペランド
	T_BOOL v1 = Variant_Read_Bool(a1);
	T_BOOL v2 = Variant_Read_Bool(a2);

	T_BOOL result = (BOOLPOS(v1) && BOOLPOS(v2)) ? TRUE : FALSE;

	a1->Type = D_BOOL;
	*a1->pBool = result;
	return a1;
}

P_ANY ANDN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BOOL v1 = Variant_Read_Bool(a1);
	T_BOOL v2 = Variant_Read_Bool(a2);

	T_BOOL result = (BOOLPOS(v1) && BOOLNEG(v2)) ? TRUE : FALSE;

	a1->Type = D_BOOL;
	*a1->pBool = result;
	return a1;
}

P_ANY OR(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BOOL v1 = Variant_Read_Bool(a1);
	T_BOOL v2 = Variant_Read_Bool(a2);

	T_BOOL result = (BOOLPOS(v1) || BOOLPOS(v2)) ? TRUE : FALSE;

	a1->Type = D_BOOL;
	*a1->pBool = result;
	return a1;
}

P_ANY ORN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BOOL v1 = Variant_Read_Bool(a1);
	T_BOOL v2 = Variant_Read_Bool(a2);

	T_BOOL result = (BOOLPOS(v1) || BOOLNEG(v2)) ? TRUE : FALSE;

	a1->Type = D_BOOL;
	*a1->pBool = result;
	return a1;
}

P_ANY NOT(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	T_BOOL v1 = Variant_Read_Bool(a1);

	T_BOOL result = BOOLNEG(v1) ? TRUE : FALSE;

	a1->Type = D_BOOL;
	*a1->pBool = result;
	return a1;
}

P_ANY EQ(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// a1 : これまでの論理結果または左オペランド
	// a2 : 右オペランド
	T_BOOL result = FALSE;

	// BOOL 同士の比較
	if (a1->Type == D_BOOL && a2->Type == D_BOOL)
	{
		T_BOOL v1 = Variant_Read_Bool(a1);
		T_BOOL v2 = Variant_Read_Bool(a2);
		result = (v1 == v2) ? TRUE : FALSE;
	}
	else
	{
		// それ以外は数値として比較（実数に正規化）
		T_LREAL v1 = Variant_Read_Lreal(a1);
		T_LREAL v2 = Variant_Read_Lreal(a2);
		result = (v1 == v2) ? TRUE : FALSE;
	}

	a1->Type = D_BOOL;
	*a1->pBool = result;
	return a1;
}
P_ANY JMP(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	return a1;
}

P_ANY JMPC(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	return a1;
}

P_ANY JMPCN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	return a1;
}

P_ANY CAL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// 第１引数 a1
	// 第２引数 a2 インスタンス(エッジタグarray)のポインタ(PVOID)
	// 第３引数 a3 ファンクションブロックエントリーポイント(P_FUNCTIONBLOCK)

	// ファンクションブロックをコールします
	a3->pFB(a2->pArray);
	
	return a1;
}

P_ANY CALC(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	if (BOOLPOS(*a1->pBool))
	{
		a3->pFB(a2->pArray);
	}
	return a1;
}

P_ANY CALCN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	if (BOOLNEG(*a1->pBool))
	{
		a3->pFB(a2->pArray);
	}
	return a1;
}

P_ANY RET(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// ブレイク指令の挿入
	a1->brk = TRUE;
	return a1;
}

P_ANY RETC(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	if (*a1->pBool == TRUE)
	{
		// ブレイク指令の挿入
		a1->brk = TRUE;
	}
	return a1;
}

P_ANY RETCN(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	if ( *a1->pBool == FALSE)
	{
		// ブレイク指令の挿入
		a1->brk = TRUE;
	}
	return a1;
}

P_ANY CLR(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	return a1;
}

P_ANY END(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// ブレイク指令の挿入
	a1->brk = TRUE;
	return a1;
}

// VAR命令は、"VAR  UINT#abc" のような書式でエッジタグを宣言生成します
// 非IEC命令
// ニーモニック解釈時に処理され、ロジックリストには積まれません
P_ANY VAR(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	BYTE			result;
	// 引数文字列が a1 に届く
	char* string = (char*)a1;

	if (Instruction_IsUFB())
	{
		// スコープ付きの変数名を取得、このバッファは一時的なものなので保管しないように
		char*			scopedvariable;
		scopedvariable = Scope_variable(string);
		// 構造体を作っていく
//		struct FBPINENTRY *new_pin = (struct FBPINENTRY*)Heap_Alloc(sizeof(struct FBPINENTRY),__FUNCTION__"struct member");
//		result = Struct_TagCreateByInstruction(scopedvariable, FALSE);
		//// データ型キーワードを取り除く
		//scopedvariable = strrchr(scopedvariable, '#') + 1;
		//// ユーザファンクションのリストにアーギュメントを順に追加します
		//char*		funcname;
		//funcname = Scope_get();
		//Userfunction_AddArgument(funcname, scopedvariable);
	}
	else
	{
		// スコープ付きの変数名を取得、このバッファは一時的なものなので保管しないように
		char*			scopedvariable;
		scopedvariable = Scope_variable(string);
		// エッジタグの処理をします
		result = Rtedge_TagCreateByInstruction(scopedvariable, FALSE);
		// データ型キーワードを取り除く
		scopedvariable = strrchr(scopedvariable, '#') + 1;
		// ユーザファンクションのリストにアーギュメントを順に追加します
		char*		funcname;
		funcname = Scope_get();
		Userfunction_AddArgument(funcname, scopedvariable);
	}

	return NULL;
}

// 非IEC命令
// ニーモニック解釈時に処理され、ロジックリストには積まれません
P_ANY FU(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	BYTE			result;
	// 引数文字列が a1 に届く
	char* globalvariable = (char*)a1;
	// スコープ付きの変数名を取得、このバッファは一時的なものなので保管しないように
	char*			scopedvariable;
	scopedvariable = Scope_variable(globalvariable);
	// エッジタグの処理をします（スコープ付きの変数名、関数側により戻り値が格納される）
	result = Rtedge_TagCreateByInstruction(scopedvariable, FALSE);
	// エッジタグの処理をします（スコープなしの変数名、関数戻り値を示す）
	result = Rtedge_TagCreateByInstruction(globalvariable, FALSE);

	// ユーザファンクションをリストに追加
	char*		funcname;
	funcname = Scope_get();
	Userfunction_Add(funcname);

	// FU/FB切替フラグを制御します
	Instruction_UF = TRUE;
	Instruction_UFB = FALSE;

	// 戻り値は使われないのでダミーです
	return NULL;
}

// 非IEC命令
// ニーモニック解釈時に処理され、ロジックリストには積まれません
P_ANY FB(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	// 引数文字列ファンクションブロック名が a1 に届く
	char* globalvariable = (char*)a1;
	// スコープ付きの変数名を取得、このバッファは一時的なものなので保管しないように
	char*			scopedvariable;
	scopedvariable = Scope_variable(globalvariable);

	// ユーザファンクションブロックをリストに追加
	char*		funcname;
	funcname = Scope_get();
	UserFB_Add(funcname);

	// FU/FB切替フラグを制御します
	Instruction_UF = FALSE;
	Instruction_UFB = TRUE;

	// 戻り値は使われないのでダミーです
	return NULL;
}

// ラベル位置を示します無処理命令
// 非IEC命令
P_ANY LABEL(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4)
{
	return a1;
}


/// <summary>
/// 全命令リストと命令書式テンプレート
/// </summary>
struct MNMTEMPLATE InstructionTemplate[] =
{
	{"VAR"		,CMD_VAR	,TRUE	,NA				,NA		,NA		,(PLCINSTRUCTION)VAR},			// IEC命令ではない	VAR		INT#Value1
	{"FU"		,CMD_FU		,TRUE	,NA				,NA		,NA		,(PLCINSTRUCTION)FU},			// IEC命令ではない	FU		INT#MyFuncName
	{"FB"		,CMD_FB		,TRUE	,NA				,NA		,NA		,(PLCINSTRUCTION)FB},			// IEC命令ではない	FB		MyFunctionBlockName
	{"UFU"		,CMD_FU		,TRUE	,NA				,NA		,NA		,(PLCINSTRUCTION)Logic_RunPOU},	// IEC命令ではない

	{"LABEL"	,CMD_LABEL	,FALSE	,NA				,NA		,NA		,LABEL},	// IEC命令ではない	ラベル位置を示す無処理
	{"NOP"		,CMD_NOP	,FALSE	,NA				,NA		,NA		,NOP},		// IEC命令ではない	無処理
	{"LD"		,CMD_LD		,FALSE	,D_ANY			,NA		,NA		,LD},
	{"LDN"		,CMD_LDN	,FALSE	,D_ANY			,NA		,NA		,LDN},
	{"ST"		,CMD_ST		,FALSE	,D_ANY			,NA		,NA		,ST},
	{"STN"		,CMD_STN	,FALSE	,D_ANY			,NA		,NA		,STN},
	{"S"		,CMD_S		,FALSE	,D_BOOL			,NA		,NA		,S},
	{"SN"		,CMD_SN		,FALSE	,D_BOOL			,NA		,NA		,SN},
	{"R"		,CMD_R		,FALSE	,D_BOOL			,NA		,NA		,R},
	{"RN"		,CMD_RN		,FALSE	,D_BOOL			,NA		,NA		,RN},
	{"AND"		,CMD_AND	,FALSE	,D_BOOL			,NA		,NA		,AND},
	{"ANDN"		,CMD_ANDN	,FALSE	,D_BOOL			,NA		,NA		,ANDN},
	{"OR"		,CMD_OR		,FALSE	,D_BOOL			,NA		,NA		,OR},
	{"ORN"		,CMD_ORN	,FALSE	,D_BOOL			,NA		,NA		,ORN},
//	{"JMP"		,CMD_JMP	,FALSE	,D_LABEL		,NA		,NA		,JMP},
//	{"JMPC"		,CMD_JMPC	,FALSE	,D_LABEL		,NA		,NA		,JMPC},
//	{"JMPCN"	,CMD_JMPCN	,FALSE	,D_LABEL		,NA		,NA		,JMPCN},
	{"CAL"		,CMD_CAL	,FALSE	,D_NAME			,NA		,NA		,CAL},
	{"CALC"		,CMD_CALC	,FALSE	,D_NAME			,NA		,NA		,CALC},
	{"CALCN"	,CMD_CALCN	,FALSE	,D_NAME			,NA		,NA		,CALCN},
	{"RET"		,CMD_RET	,FALSE	,NA				,NA		,NA		,RET},
	{"RETC"		,CMD_RETC	,FALSE	,NA				,NA		,NA		,RETC},
	{"RETCN"	,CMD_RETCN	,FALSE	,NA				,NA		,NA		,RETCN},
	{"NOT"		,CMD_BASIC_FUNC,FALSE,NA				,NA		,NA		,NOT},
	{"EQ"		,CMD_BASIC_FUNC,FALSE,D_ANY			,D_ANY	,NA		,EQ},
	{"END"		,CMD_END	,FALSE	,NA				,NA		,NA		,END}
};


// 内部
WORD Instruction_CalcHash(char *cmdname)
{
	HASHCODE x;
	WORD	hashindex;
	// 名前からハッシュ値算出
	x = _Hash(cmdname);
	hashindex = x.code2 & INST_HASHSIZE;
	return hashindex;
}

/// <summary>
/// 命令ハッシュテーブルの新規構築
/// </summary>
/// <returns></returns>
int Instruction_CreateCatalog(void)
{
	WORD	hashindex;
	int lp1;
	// ハッシュのゼロクリア
	memset(InstructionCatalog, 0, sizeof(InstructionCatalog));

	// 全命令リストぶん実施する
	for (lp1 = 0; lp1 < sizeof(InstructionTemplate) / sizeof(struct MNMTEMPLATE); lp1++)
	{
		// ハッシュ値算出
		hashindex = Instruction_CalcHash(InstructionTemplate[lp1].name);
		// 通常はあってはならない、既に埋まっていた場合
		if (InstructionCatalog[hashindex] != 0)
		{
			printf("instruction hash conflict! %s. skipped.\n", InstructionTemplate[lp1].name);
			continue;
		}
		// 命令カタログに登録
		InstructionCatalog[hashindex] = &InstructionTemplate[lp1];
	}

	// 本機能の動作状態を更新
	status_instruction = STATUS_READY;
	return 0;
}

/// <summary>
/// 命令ハッシュテーブルにユーザ定義ファンクションを加える
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
int Instruction_CreateUserfunctionCatalog(char* name, struct MNMTEMPLATE* ufdef)
{
	WORD	hashindex;
	// ハッシュ値算出
	hashindex = Instruction_CalcHash(name);
	// 通常はあってはならない、既に埋まっていた場合
	if (InstructionCatalog[hashindex] != 0)
	{
		printf("instruction hash conflict! %s. skipped.\n", name);
	}
	// 命令カタログに登録
	InstructionCatalog[hashindex] = ufdef;

	// 本機能の動作状態を更新
	status_instruction = STATUS_READY;
	return 0;
}

/// <summary>
/// 命令の名前から命令テンプレートの取り出し
///		retrun NULL 存在しない場合
/// </summary>
struct MNMTEMPLATE* Instruction_GetTemplate(char *cmdname)
{
	WORD	hashindex;
	struct MNMTEMPLATE* target;
	// 命令カタログから高速ピックアップ(ハッシュ)
	hashindex = Instruction_CalcHash(cmdname);
	target = InstructionCatalog[hashindex];
	// 一致する命令無し
	if (target == NULL)
		return NULL;
	// 一致する命令無し
	if (target->name == NULL)
		return NULL;
	// 一致する命令無し
	if (strcmp(target->name, cmdname) != 0)
		return NULL;
	// 一致
	return target;
}

/// <summary>
/// FU宣言があったことを示す
/// </summary>
/// <returns></returns>
BOOL Instruction_IsUF(void)
{
	return (Instruction_UF == TRUE);
}

/// <summary>
/// FB宣言があったことを示す
/// </summary>
/// <returns></returns>
BOOL Instruction_IsUFB(void)
{
	return (Instruction_UFB == TRUE);
}

/// <summary>
/// FU宣言 FB宣言をリセットします
/// </summary>
void Instruction_FUFBReset(void)
{
	Instruction_UF = FALSE;
	Instruction_UFB = FALSE;
}