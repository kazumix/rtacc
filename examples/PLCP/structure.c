#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

// 構造体管理
DWORD	status_structure = STATUS_STOP;


/// <summary>
/// 構造体メンバと一致するか照合する
/// </summary>
/// <param name="string"></param>
/// <returns></returns>
P_ANY Structure_Compile(char* string)
{
	// 構造体メンバ参照
	// CTU_1.Q
	// CTU_1.VC

	char	*dot;

	// 空白なら無処理
	if (string == 0)
	{
		// マッチしませんでした
		return (P_ANY)NULL;
	}

	// 構造体メンバを示すためのピリオドが含まれないなら一致しようがないので終了
	dot = strchr(string, '.');
	if (dot == 0)
	{
		// マッチしませんでした
		return (P_ANY)NULL;
	}

	T_ANY			val = { 0 };
	BOOL			matchliteral = FALSE;
	P_ANY			refer;

	// まだ構造体メンバをカタログしていない可能性があるので
	// ピリオド以下のメンバを取り外して構造体かどうかを判断します

	// 作業用にアーギュメント文字列をクローンします
	char			instancename[80];
	strcpy(instancename, string);

	// 既に存在すると分かっている最初のドット位置でトリムしてインスタンス名(の候補)を取り出す
	dot = strrchr(instancename, '.');
	*dot = '\0';

	//存在する構造体インスタンス名かどうかを調べる
	if (!Rtedge_IsStructure(instancename))
	{
		// どうやら構造体ではないようです
		return (P_ANY)NULL;
	}

	// まだ登録されていない構造体メンバといえるので、
	// ファンクションブロックのコネクタ(CTU_1.INなど)を準備します
	// これらはエッジタグとして生成されるわけではなくPLCエンジン内部的なものです
	// Functionblock_load()で構造体定義を読み込んだ後でなければなりません
	Functionblock_Register(instancename);

	// 構造体メンバ登録が終わったので、構造体メンバカタログと照合をリトライさせます
	// メンバ名さえ間違っていなければ成功するはずです
	refer = Variable_Search(string);
	if (refer)
	{
		// マッチしました
		return refer;
	}

	// 一致する構造体メンバは存在しなかった（コーディングミスだろう）
	return (P_ANY)NULL;
}

/// <summary>
/// インスタンス名と構造体メンバリストを使ってハッシュテーブルの新規構築
/// </summary>
/// <returns></returns>
int Structure_CreateCatalog(char* instancename ,struct FBPINENTRY* entry)
{
	P_ANY						literal;
	char						instancemembername[80];
	RTEDGEVARIANT*				link;
	WORD						offset = 0;
	BOOL						valid;
	char*						structurename;
	// 構造体であるかどうかを判定する
	valid = Rtedge_IsStructure(instancename);
	if (!valid)
	{
		Errorlog_Add(0, TAG_NOTFOUND_ERR, "structure tag not found.");
		return 0;
	}
	// エッジタグのリンクを取得する
	link = Rtedge_TagGetPointer(instancename);

	// インスタンス名のPLC変数が存在しないならPLC変数を作る必要がある
	if (Variable_Search(instancename) == NULL)
	{
		// インスタンス名でPLC変数を作ります。内容は関数エントリーポイントを示す
		P_ANY fnentry = Variable_Add(instancename, D_FUNCTION);
		fnentry->link = link;
		fnentry->pVal = (BYTE*)link->pSegment;
		// 書換はできる(ARRAYを持っているため)
	}

	// 構造体のオリジナル名を取得します（関数が返却するバッファは一時的なものです。次回のコールで壊れます）
	structurename = Rtedge_GetStructureName(instancename);		
	// 構造体メンバリスト終端マークまで実施する
	while(entry)
	{
		// インスタンス名と構造体メンバー名をドットを挟んで合成します　instancemembername
		strcpy_s(instancemembername, sizeof(instancemembername), instancename);
		strcat_s(instancemembername, sizeof(instancemembername), ".");
		strcat_s(instancemembername, sizeof(instancemembername), entry->pin.name);

		// PLC変数として登録します
		literal = Variable_Add(instancemembername ,entry->pin.type);
		literal->link = link;
		// 値の実体（エッジタグ）へのリンク
		literal->pVal = (BYTE*)link->pSegment + offset;

		// PINが D_ANY だった場合は格納容器をこの段階で割り当てておく
		if (literal->Type == D_ANY)
		{
			// ANY用容器を作ってポインタを割り当てておく
			P_ANY	any = (P_ANY)Heap_Alloc(sizeof(T_ANY), __FUNCTION__":D_ANY pin");
			// ANY用容器のボディ(最大サイズにあたる文字列型にしておく)
			any->pString = (P_STRING)Heap_Alloc(sizeof(T_STRING), __FUNCTION__":D_ANY pin (body)");

			*literal->pDword = (DWORD)any;
		}

		// 次メンバためののバイトオフセットを算出します
		offset += Rtedge_SizeOf( literal );

		// 次のエントリに進める
		entry = entry->next;
	}

	// 本機能の動作状態を更新
	status_structure = STATUS_READY;
	return 0;
}

int Structure_GetSize(char* instancename)
{
	return 0;
}
