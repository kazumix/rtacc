#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"
#include "egapi.h"


/// <summary>
/// データ型の定義テーブルの参照 type.c
/// </summary>
extern struct TYPEMATCH typematch[];

/// <summary>
/// 名前でRTedgeタグを作ります
/// </summary>
/// <param name="name">タグ名</param>
/// <param name="type">IECデータ型</param>
/// <param name="opt1">オプションデータ1</param>
/// <param name="opt2">オプションデータ2</param>
/// <returns></returns>
BOOL Rtedge_TagCreate(char* name, T_TYPE iectype, LPVOID opt1, LPVOID opt2)
{
	int32_t		result;
	T_TYPE		tag_type;

	// これらはアレイデータです
	BOOL		array_data = ((iectype == D_ARRAY) || (iectype == D_STRUCT) || (iectype == D_FUNCTION) || (iectype == D_STRING));

	// 指定名のタグの存在を確認
	result = Rtedge_TagIsExist(name);
	if (result == TRUE)
	{
		// 同名が存在する場合はタイプを取得する
		tag_type = Rtedge_TagGetIecType(name);

		if ((iectype == tag_type) || (array_data && (tag_type == D_ARRAY)))
		{
			// 目的の型と同一であればOK。D_ARRAYはD_STRUCT、D_FUNCTIONを示すこともある
			return TRUE;
		}
	}

	// エッジタグ型に型コンバートする
	tag_type = Rtedge_ConvertToEdgeType(iectype);

	char*	srcaddressinfo;
	char*	commentinfo;

	// 指定名のアレイ型でないエッジタグを生成する
	if (!array_data)
	{
		// エッジタグのコメント情報を選択します
		commentinfo = (opt1 != 0) ? (char*)opt1 : "";

		// エッジタグのアドレス情報を選択します
		srcaddressinfo = (opt2 != 0) ? (char*)opt2 : "";
		
		result = EgTagCreateEx(name, tag_type, srcaddressinfo, commentinfo);
		return (result == EDGE_SUCCESS);
	}
	else
	{
		// アレイ型のデータの場合はセグメントタグを生成します
		//		"opt1" にアレイデータバイトサイズ
		//		"opt2" に"ファンクション名称"、"構造体名称"、"配列データ型名称"
		//	それぞれ指定すること
		// 文字列型D_STRINGの場合
		char regname[EG_MAX_TAGNAME+1];
		uint16_t regnamesize = sizeof(regname);
		uint16_t islink;
		uint16_t bufsize;

		// バイト配列サイズを確定します
		bufsize = (opt1 != 0) ? (uint16_t)opt1 : 1;

		// エッジタグのコメント情報のバッファサイズ
		commentinfo = "";

		// エッジタグのアドレス情報を選択します
		srcaddressinfo = (opt2 != 0) ? (char*)opt2 : "";

		if (iectype == D_STRING)
		{
			// 文字列は固定サイズなので引数指定は無視
			bufsize = sizeof(T_STRING);
			srcaddressinfo = "STRING#";
		}
		// エッジタグを生成します
		result = EgTagCreateSegment(name, tag_type, bufsize, srcaddressinfo, commentinfo, regname, regnamesize, &islink);

		if (result == EDGE_SUCCESS)
		{
			// 書き込みのための一時バッファ（ゼロクリア済）
			BYTE *buf = (BYTE*)Heap_Alloc(bufsize, __FUNCTION__":zero clear temporary");
			if (buf)
			{
				// ゼロを書き込む
				EgTagWriteSegment(name, 0, buf, bufsize);
				// 書き込みのための一時バッファを解放します
				Heap_Free(buf);
			}
		}
		return (result == EDGE_SUCCESS);
	}
}

/// <summary>
/// IL命令書式でエッジタグを作ります
/// </summary>
/// <param name="string"></param>
/// <param name="hidden">TRUEのとき非公開タグ(内部メモリ管理)になります</param>
/// <returns></returns>
BOOL Rtedge_TagCreateByInstruction(char* string ,BOOL hidden)
{
	BYTE			result = FALSE;
	size_t			keywordlength;
	size_t			stringlength;
	char*			source;
	char*			instname;
	char*			FBname;
	T_TYPE			type;
	LPVOID			opt1 = 0;
	LPVOID			opt2 = 0;
	// 空の文字列だったら終了
	if (string == NULL)
		return FALSE;
	// もらった文字長(NULL含む)を取得します
	stringlength = strlen(string) + 1;
	// データ型定義キーワード一致をサーチします ("INT#"など)
	struct TYPEMATCH *current = typematch;
	while (current->keyword)
	{
		// キーワード文字長を取得します
		keywordlength = strlen(current->keyword);
		// キーワードにマッチしたら
		if (strncmp(string, current->keyword, keywordlength) == 0)
		{
			// 作業用にバッファを作ってオリジナル文字列をコピーします
			source = Heap_Alloc(stringlength, __FUNCTION__":clone temporary");
			strcpy_s(source, stringlength, string);
			// エッジタグデータ型を取り出します
			type = current->iectype;

			// ファンクション FUNCTION# の場合
			// このような書式になります "FUNCTION#TON#TON_1"	ファンクション名 # インスタンス名
			if (type == D_FUNCTION)
			{
				// エッジタグのソースプロパティに与える文字列("FUNCTION#name") source を作る 最後の#で区切ります
				instname = strrchr(source, '#');
				*instname = '\0';

				// インスタンス名(エッジタグ名) instname を取り出します
				instname += 1;
				// ファンクション名 FBname を取り出します
				FBname = (source + keywordlength);

				// Segmentのバイトサイズはファンクションブロックごとの構造体サイスになる
				opt1 = (LPVOID)Functionblock_GetSize( FBname );

				// Sourceは固定 ("FUNCTION#name")
				opt2 = (LPVOID)source;

				// インスタンス名でエッジタグを生成します
				result = Rtedge_TagCreate(instname, type, opt1, opt2);

				// ファンクションブロックのインスタンスのコネクタ(CTU_1.INなど)を準備します
				// Functionblock_load()でファンクションブロック構造体定義を読み込んだ後でなければなりません
				// これらはエッジタグのSegment内オフセットを加味された位置に直結されるもので、エッジタグがさらに生成されるものではありません
				//
				// この関数により、構造体インスタンスの各メンバ(CTU_1.INなど)はPLC変数として登録されます
				Functionblock_Register(instname);
			}
			else if (type == D_STRING)
			{
				// エッジタグ名を取り出します
				instname = (source + keywordlength);
				// PLC変数として既に存在するか
				P_ANY	entry;
				entry = Variable_Search(instname);
				if (entry == NULL)
				{
					// PLC変数として新規登録します
					entry = Variable_Add(instname, type);
				}

				// Segmentのバイトサイズはファンクションブロックごとの構造体サイスになる
				opt1 = (LPVOID)sizeof(T_STRING);

				// Sourceは固定
				opt2 = (LPVOID)"STRING#";

				// エッジタグとして見えるか
				if (!hidden)
				{
					// エッジタグを生成します
					result = Rtedge_TagCreate(instname, type, opt1, opt2);
					// エッジタグとリンクします
					Variable_LinkBody(entry, instname);
				}
				else
				{
					// 非公開タグ扱い（ローカル変数）として生成します
					union ANYVAL* body = Variable_Body(sizeof(T_STRING));
					entry->pVal = body;
				}
			}
			else
			{
				// エッジタグ名を取り出します
				instname = (source + keywordlength);
				// PLC変数として既に存在するか
				P_ANY	entry;
				entry = Variable_Search(instname);
				if (entry == NULL)
				{
					// PLC変数として新規登録します
					entry = Variable_Add(instname, type);
				}

				// エッジタグとして見えるか
				if (! hidden)
				{
					// エッジタグを生成します
					result = Rtedge_TagCreate(instname, type, opt1, opt2);	// D_ARRAY(string,array)の固定サイズはまだしも、,function,structの再帰的なサイズ算出がむずい
					// エッジタグとリンクします
					Variable_LinkBody(entry, instname);
				}
				else
				{
					// 非公開タグ扱い（ローカル変数）として生成します
					union ANYVAL* body = Variable_Body(sizeof(union ANYVAL));
					entry->pVal = body;
				}
			}
			// 作業用バッファを開放します
			Heap_Free(source);
			// マッチしたので終了
			break;
		}
		// 次のエントリ
		current++;
	}
	return result;
}

/// <summary>
/// 存在するエッジタグからデータ型を入手する
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
T_TYPE Rtedge_TagGetIecType(char* name)
{
	// タグの存在確認
	int32_t		result;
	uint16_t	tagtype;
	result = EgTagGetProperty(name, "Type", &tagtype, sizeof(tagtype));

	// データ型番号を変換して返す
	T_TYPE		type;
	type = Rtedge_ConvertToIecType(tagtype);

	// 正式データ型名宣言(Source)の存在を確認します
	static char		source[600];		// スタティックなバッファを使用します
	int				length;
	// エッジタグのソース（データ型強制定義）を確認します
	result = EgTagGetProperty(name, "Source", source, sizeof(source));
	if (result == EDGE_SUCCESS)
	{
		struct TYPEMATCH *current = typematch;
		while (current->keyword)
		{
			// キーワードと一致するかを判定します
			length = strlen(current->keyword);
			if (strncmp(source, current->keyword, length) == 0)
			{
				// 一致したのでデータ型を強制します
				type = current->iectype;
				// サーチをブレイクします
				break;
			}
			// 次のキーワードエントリへ進める
			current++;
		}

		return type;
	}
	else
	{
		// ソース（データ型強制定義）が存在しなかったので、エッジデータ型を頼りにする

		// ※但しD_ARRAY が返るとき以下を含んでおり、判別できません
		//		D_STRING
		//		D_STRUCT
		//		D_FUNCTION	

		// D_SINT,D_WORD,D_DWORD,D_QWORD,D_TIMEもエッジタグデータ型に存在しないので判別できません
		return type;
	}
}

/// <summary>
/// 名前でエッジタグの存在を確認
/// </summary>
/// <param name="name"></param>
/// <param name="type"></param>
/// <returns></returns>
BOOL Rtedge_TagIsExist(char* name)
{
	// 空白は無視
	if (name == 0)
	{
		return FALSE;
	}
	// タグの存在確認（エッジデータ型が取得できるなら存在と判断）
	int32_t		result;
	uint16_t	tagtype;
	result = EgTagGetProperty(name, "Type", &tagtype, sizeof(tagtype));
	return (result == EDGE_SUCCESS);
}

/// <summary>
/// エッジタグのデータポインタ(TagsDesc *Entry)を入手
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
RTEDGEVARIANT* Rtedge_TagGetPointer(char* name)
{
	int32_t		result;
	RTEDGEVARIANT	*tagdescriptor = 0;
	// タグのデータポインタを返します
	result = EgTagGetProperty(name, "Entry", &tagdescriptor, sizeof(tagdescriptor));

	if (result == EDGE_SUCCESS)
		return tagdescriptor;
	else
		return NULL;
}

/// <summary>
/// エッジデータ型番号をIECデータ型番号に変換
/// </summary>
/// <param name="edgedatatype"></param>
/// <returns></returns>
T_TYPE Rtedge_ConvertToIecType(uint16_t edgedatatype)
{
	struct TYPEMATCH *current = typematch;
	while (current->keyword)
	{
		// テーブルから一致するエッジデータ型をサーチ
		if (edgedatatype == current->edgetype)
		{
			// 一致したのでIECデータ型を返す
			return current->iectype;
		}
		// 次のキーワードエントリへ進める
		current++;
	}
	// 一致しなかったので無効な値を返す
	return D_EMPTY;
}

/// <summary>
/// IECデータ型番号をエッジデータ型番号に変換
/// </summary>
/// <param name="iecdatatype"></param>
/// <returns></returns>
uint16_t Rtedge_ConvertToEdgeType(T_TYPE iecdatatype)
{
	struct TYPEMATCH *current = typematch;
	while (current->keyword)
	{
		// テーブルから一致するIEC型をサーチ
		if (iecdatatype == current->iectype)
		{
			// 一致したのでエッジデータ型を返す
			return current->edgetype;
		}
		// 次のキーワードエントリへ進める
		current++;
	}
	// 一致しなかったので無効な値を返す
	return EgVtNull;
}

/// <summary>
/// データ型からバイトサイズを得る
/// </summary>
/// <param name="type"></param>
/// <returns></returns>
size_t Rtedge_TypeSize(T_TYPE type)
{
	int			bytes;
	struct TYPEMATCH *current = typematch;
	while (current->keyword)
	{
		// テーブルから一致するIEC型をサーチ
		if (type == current->iectype)
		{
			// 一致したのでデータサイズを取得します
			bytes = current->size;
			// マイナス値の場合はエッジタグへのリンクをたどってサイズを取得します
			if (bytes == -1)
			{
				// 算出できないARRAY型
				bytes = 0;
				// 見つかったのでサーチを終了
				break;
			}
			// 一致したのでデータバイト数を返却
			return (uint16_t)bytes;
		}
		// 次のキーワードエントリへ進める
		current++;
	}

	return 0;						// サイズが不明である(異常)
}

/// /// <summary>
/// ANY型からバイトサイズを得る
/// </summary>
/// <param name="val"></param>
/// <returns></returns>
uint16_t Rtedge_SizeOf(P_ANY val)
{
	T_TYPE		type = val->Type;
	int			bytes;

	struct TYPEMATCH *current = typematch;
	while (current->keyword)
	{
		// テーブルから一致するIEC型をサーチ
		if (type == current->iectype)
		{
			// 一致したのでデータサイズを取得します
			bytes = current->size;
			// マイナス値の場合はエッジタグへのリンクをたどってサイズを取得します
			if (bytes == -1)
			{
				// エッジタグへのリンクをたどります
				if (val->link)
					bytes = (int)val->link->size;
				else
					bytes = 0;					// エッジタグへのリンクがない（異常）
			}
			// 一致したのでデータバイト数を返却
			return (uint16_t)bytes;
		}
		// 次のキーワードエントリへ進める
		current++;
	}

	return 0;						// サイズが不明である(異常)
}

/// <summary>
/// 指定したインスタンス名からオリジナル構造体名を取得します
/// ファンクションはコネクションを示す"構造体"として扱われるので、構造体と同等です
/// </summary>
/// <param name="instancename"></param>
/// <returns>文字列ポインタが返りますが、すぐに複製してそちらを使用するようにしてください。（壊れます）</returns>
char* Rtedge_GetStructureName(char* instancename)
{
	// タグの存在確認
	int32_t			result;
	static char		name[600];		// スタティックなバッファを使用します
	char			tag1[] = "STRUCT#";
	char			tag2[] = "FUNCTION#";
	size_t			length1 = strlen(tag1);
	size_t			length2 = strlen(tag2);
	// ソース情報の確認
	result = EgTagGetProperty(instancename, "Source", name, sizeof(name));
	if (result == EDGE_SUCCESS)
	{
		// 構造体"STRUCT:"と一致するか判定する
		if (strncmp(name, tag1, length1) == 0)
		{
			// オリジナル名の位置を取り出して返す
			return name + length1;
		}
		// ファンクション"FUNCTION:"と一致するか判定する
		if (strncmp(name, tag2, length2) == 0)
		{
			// オリジナル名の位置を取り出して返す
			return name + length2;
		}
	}
	// 正しく取り出せなかった。構造体ではない
	return NULL;
}

/// <summary>
/// 構造体のエッジタグ（インスタンス）であるか判定する
/// </summary>
/// <param name="instancename"></param>
/// <returns></returns>
BOOL Rtedge_IsStructure(char* instancename)
{
	return (Rtedge_GetStructureName(instancename) != NULL);
}

/// <summary>
/// 指定したインスタンス名から配列名を取得します
/// </summary>
/// <param name="instancename"></param>
/// <returns>文字列ポインタが返りますが、すぐに複製してそちらを使用するようにしてください。（壊れます）</returns>
char* Rtedge_GetArrayName(char* instancename)
{
	// タグの存在確認
	int32_t			result;
	static char		name[600];		// スタティックなバッファを使用します
	char			tag[] = "ARRAY#";
	size_t			length = strlen(tag);
	// ソース情報の確認
	result = EgTagGetProperty(instancename, "Source", name, sizeof(name));
	if (result == EDGE_SUCCESS)
	{
		// 配列"ARRAY:"と一致するか判定する
		if (strncmp(name, tag, length) == 0)
		{
			// オリジナル名の位置を取り出して返す
			return name + length;
		}
	}
	// 正しく取り出せなかった。配列ではない
	return NULL;
}

/// <summary>
/// 配列のエッジタグであるか判定する
/// </summary>
/// <param name="instancename"></param>
/// <returns></returns>
BOOL Rtedge_IsArray(char* instancename)
{
	return (Rtedge_GetArrayName(instancename) != NULL);
}

/// <summary>
/// エッジタグと一致するか照合する
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
P_ANY Rtedge_Compile(char* name)
{
	BOOL			success;
	T_TYPE			type;
	RTEDGEVARIANT	*etag;

	success = Rtedge_TagIsExist(name);
	if (success)
	{
		type = Rtedge_TagGetIecType(name);
		etag = Rtedge_TagGetPointer(name);

		P_ANY	lpValue = Variable_Add( name ,type );
		lpValue->Type = type;
		lpValue->link = etag;
		lpValue->pVal = Rtedge_GetPointer(etag, type);

		return lpValue;
	}
	return NULL;
}

/// <summary>
/// エッジタグ Uint32型 を読み込みます
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
BOOL Rtedge_TagRead_UInt32(char* name, uint32_t *value)
{
	int32_t			result;
	result = EgTagRead(name, value, sizeof(value));
	return (result == EDGE_SUCCESS);
}

/// <summary>
/// エッジタグ Uint32型　を書き込みます
/// </summary>
/// <param name="name"></param>
/// <param name="value"></param>
/// <returns></returns>
BOOL Rtedge_TagWrite_UInt32(char* name, uint32_t value)
{
	int32_t			result;
	result = EgTagWrite(name, &value, sizeof(value));
	return (result == EDGE_SUCCESS);
}

/// <summary>
/// エッジタグの共有メモリタグ判定
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
BOOL Rtedge_IsDirectMemory(RTEDGEVARIANT*	etag)
{
	//共有メモリを使用しているか？
	if(etag->SHM.InUse == 1)
		return TRUE;
	else
		return FALSE;
}

/// <summary>
/// 
/// </summary>
/// <param name="name"></param>
/// <returns></returns>
PVOID Rtedge_GetPointer(RTEDGEVARIANT*	etag, T_TYPE type)
{
	PVOID	pointer;

	if (((type == D_STRING) || (type == D_ARRAY) || (type == D_FUNCTION)) || Rtedge_IsDirectMemory(etag))
	{
		pointer = (void*)etag->pSegment;
	}
	else
	{
		pointer = &etag->val;
	}

	return pointer;
}

/// <summary>
/// タグに初期値を設定します。
/// </summary>
/// <param name="name">(なし)</param>
/// <returns>TRUE: 成功 FALSE: 失敗</returns>
BOOL Rtedge_SetTagDefaultValue(void)
{
	int32_t result;
	
	result = EgTagSetDefaultValue();

	return (result == EDGE_SUCCESS);
}