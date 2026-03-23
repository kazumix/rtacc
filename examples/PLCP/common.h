#pragma once

#include <stdio.h>

/// <summary>
/// 暫定的な定義(INtime環境では定義済)
/// </summary>
#ifdef __INTIME__
//INtime構成の場合
#include <rt.h>
#else
#ifndef _NTXH_
// Windows構成の場合
#include <stdint.h>
#include <math.h>
#include <errno.h>
#include <string.h>
typedef void*	LPVOID;
typedef void*	PVOID;
#define PLCPIEC_EXPORTS
#define PLCPFB_EXPORTS
#define strnset		_strnset
#define	GetLastRtError()		errno
typedef unsigned char		BYTE;
typedef unsigned short		WORD;
typedef unsigned long		DWORD;
typedef unsigned long long	QWORD;
typedef unsigned char		BOOL;
typedef	unsigned short		RTHANDLE;
typedef char*		LPSTR;
#define	TRUE		1
#define	FALSE		0
typedef struct
{
	DWORD	PentiumTicksPerUsec;
}SYSINFO;
#define CopyRtSystemInfo
#define CreateRtSemaphore
#define WaitForRtSemaphore
#define ReleaseRtSemaphore
#define GetRtHandleType
#define knRtSleep				
#define UsecsToKticks			
#define	CreateRtThread
#define	AllocateRtMemory
#define	FreeRtMemory
#define	Catalog
#define Fail		
#define		FIFO_QUEUING		0
#define		SEMAPHORE_TYPE		0
#define		NO_WAIT				0
#define		WAIT_FOREVER		0
#define		WAIT_FAILED			0
#define		NULL_RTHANDLE		0
#endif
#endif

// PLCPIEC.RSLのリンク方法指定
// 1 = ダイナミックロードする
// 0 = PLCPIEC を同一イメージにリンク（rtacc -D 等で上書き可）
#ifndef DYNAMIC_LOAD_IEC
#define	DYNAMIC_LOAD_IEC		1
#endif

// PLCPFB.RSLのリンク方法指定
// 1 = ダイナミックロードする
// 0 = PLCPFB を同一イメージにリンク（rtacc -D 等で上書き可）
#ifndef DYNAMIC_LOAD_FB
#define DYNAMIC_LOAD_FB			1
#endif


// 構造体アライメント
#pragma pack(push,1)

/// <summary>
/// バージョン定義
/// </summary>
#define		VERSION_INFO		"VER.05_00_00_00"		//バージョン情報	定格　VER.XX_XX_XX_XX

/// <summary>
/// チャンネルの定義
/// </summary>
#define		BITperCH			16
#define		BYTEperCH			2

/// <summary>
/// ４KBアライメントサイズに加工するマクロ
/// </summary>
#define		ALIGN_4KB(ORGsize)	(((ORGsize) & 0xfffff000) + 0x1000)		// バイトサイズを与えて4KB単位で切り上げたサイズを求める

/// <summary>
/// スレッドプライオリティの定義（ベースオフセット）
/// </summary>
#define		PRI_PULSER				(+0)		// Config.BasePriority()
#define		PRI_ENGINE				(+2)		// Config.BasePriority()
#define		PRI_API					(+4)
#define		PRI_TRIG				(+6)
#define		PRI_NOTIFY				(+8)
#define		PRI_MAIN				(+10)


/// <summary>
/// スレッドスタックサイズの定義
/// </summary>
#define		STACK_PULSER			(8*1024)
#define		STACK_ENGINE			(32*1024)
#define		STACK_API				(8*1024)
#define		STACK_NOTIFY			4096
#define		STACK_TRIG				4096

/// <summary>
/// 設定デフォルト値
/// </summary>
#define		DEFAULT_PRIORITY		140
#define		DEFAULT_SCANFREQ		1000
#define		DEFAULT_INTERVAL		1				// エッジInterval設定(Live and Trigger) [既定 1ms]
#define		DEFAULT_OVERRUN			FALSE
#define		DEFAULT_PRINT			TRUE			// デフォルトはエラーをコンソール出力します
#define		DEFAULT_REMOTE			FALSE
#define		DEFAULT_STEP			FALSE
#define		DEFAULT_TRACE			FALSE
#define		DEFAULT_AUTORUN			TRUE
#define		DEFAULT_RETAININST		"EgRetain_001"

/// <summary>
/// 各種カタログ名の定義
/// </summary>
#define		CATALOG_PROC			"PLC"			// コンテナ名、最後に起動されたPLCエンジンプロセス
#define		CATALOG_MAIN			"Main"
#define		CATALOG_EXITEVENT		"Exit"
#define		CATALOG_TRIG			"Trig"
#define		CATALOG_NOTYFY			"Notify"
#define		CATALOG_PULSER			"PACEMAKER"
#define		CATALOG_PULSE			"PULSE"
#define		CATALOG_ENGINE			"ENGINE"
#define		CATALOG_SQTBL			"SQTBL"
#define		CATALOG_UNPAUSE			"SQSUSP"
#define		CATALOG_STEP			"SQSTEP"
#define		CATALOG_API				"API"
#define		CATALOG_APIREQ			"APIREQ"
#define		CATALOG_APITHREAD		"APITHREAD"
#define		CATALOG_TRACE			"PLC_TRACE"

/// <summary>
/// コマンドの定義
/// </summary>
enum ILCMD
{
	CMD_NOP,
	CMD_VAR,
	CMD_FU,
	CMD_FB,
	CMD_LABEL,
	CMD_LD				,
	CMD_LDB,
	CMD_LDN				,
	CMD_LDNB,
	CMD_ST				,
	CMD_STB,
	CMD_STN				,
	CMD_STNB,
	CMD_S				,
	CMD_SN				,
	CMD_R				,
	CMD_RN				,
	CMD_AND				,
	CMD_ANDB,
	CMD_ANDN			,
	CMD_ANDNB,
	CMD_OR				,
	CMD_ORB,
	CMD_ORN				,
	CMD_ORNB,
	CMD_XOR				,
	CMD_XORB,
	CMD_XORN			,
	CMD_XORNB,
	CMD_JMP				,
	CMD_JMPC			,
	CMD_JMPCN			,
	CMD_CAL				,
	CMD_CALC			,
	CMD_CALCN			,
	CMD_RET				,
	CMD_RETC			,
	CMD_RETCN			,
	CMD_BASIC_FUNC		,
	CMD_END				
};

/// <summary>
/// INIファイル、ニーモニックファイルのエラー定義
/// </summary>
#define	MNM_OK					0x0000	// OK
#define	MNM_DIF_ERR				0x0001	// DIF 数上限エラー
#define	MNM_STACK_ERR			0x0002	// MPS/MPP命令数マッチングエラー
#define	MNM_ARG_ERR				0x0004	// 引数指定エラー
#define	MNM_ARG1_ERR			0x0004	// 引数1指定エラー
#define	MNM_ARG2_ERR			0x0005	// 引数2指定エラー
#define	MNM_ARG3_ERR			0x0006	// 引数3指定エラー
#define	MNM_LD_ERR				0x0008	// LD整合エラー
#define MNM_END_ERR				0x0010	// エンドエラー
#define MNM_FILE_ERR			0x0020	// ファイル構成エラー
#define MNM_STRING_ERR			0x0040	// 不正文字列エラー
#define MNM_INST_ERR			0x0080	// 命令エラー
#define MNM_RESERVEDWORD_ERR	0x0081	// 予約語です
#define MNM_DUPLICATE_LABEL_ERR	0x0082	// ラベルが二重登録です
#define	MNM_ENTRYPOINT_NOTFOUND	0x0083	// ロジックのエントリポイントが見つからない
#define	INI_FILE_ERR			0x0090	// INIファイルが見つからない
#define	INI_TIM_SEC_ERR			0x00a0	// INIにTIMERセクションが見つからない
#define	INI_TIM_NUM_ERR			0x00a1	// INIのTIMER番号別指定が異常
#define	INI_TIM_TYPE_ERR		0x00a2	// INIのTIMER種別指定が異常
#define	INI_TIM_VALU_ERR		0x00a3	// INIのTIMER値指定が異常
#define	INI_CNT_SEC_ERR			0x00b0	// INIにCNT_INIセクションが見つからない
#define	INI_CNT_NUM_ERR			0x00b1	// INIのCOUNTER番号指定が異常
#define	INI_CNT_VALU_ERR		0x00b2	// INIのCOUNTER値指定が異常
#define	INI_CH_SEC_ERR			0x00c0	// INIにCHANNELセクションが見つからない
#define	INI_CH_NUM_ERR			0x00c1	// INIのCHANNEL番号別指定が異常
#define	INI_CH_TYPE_ERR			0x00c2	// INIのCHANNEL種別指定が異常
#define INI_CH_IODEF_ERR		0x00c3	// INIのIOドライバ定義が異常 ドライバ名(p1:p2:p3:p4)でない
#define	FUNC_LOAD_WARNING		0x00d0	// PlcFunc.RSLの構造が正しくない
#define	UFUNC_LOAD_WARNING		0x00d1	// UserFunc.RSLの構造が正しくない
#define	IODRV_LOAD_WARNING_F1	0x00d8	// IOdriver.RSLの構造が正しくない(Func1)
#define	IODRV_LOAD_WARNING_F2	0x00d9	// IOdriver.RSLの構造が正しくない(Func2)
#define	IODRV_LOAD_WARNING_F3	0x00da	// IOdriver.RSLの構造が正しくない(Func3)
#define	IODRV_LOAD_WARNING_F4	0x00db	// IOdriver.RSLの構造が正しくない(Func4)
#define	IODRV_LOAD_WARNING_F5	0x00dc	// IOdriver.RSLの構造が正しくない(Func5)
#define	IODRV_LOAD_WARNING_F6	0x00dd	// IOdriver.RSLの構造が正しくない(Func6)
#define	IODRV_LOAD_WARNING_F7	0x00de	// IOdriver.RSLの構造が正しくない(Func7)
#define	IODRV_LOAD_WARNING_F8	0x00df	// IOdriver.RSLの構造が正しくない(Func8)
#define	IODRV_LOAD_WARNING		0x00e0	// IOdriver.RSLの構造が正しくない
#define	IODRV_LOAD_ERROR		0x00e1	// 指定のIOdriver.RSLが見つからない
#define	IODRV_INST_ERROR		0x00e2	// 指定のIOdriver.RSLのインストールに失敗
#define	IODRV_INIT_ERROR		0x00e3	// 指定のIOdriver.RSLのインストールに失敗
#define	IODRV_OPEN_ERROR		0x00e4	// 指定のIOdriver.RSLのオープンに失敗
#define	API_REQUEST_ERR			0x0100	// 不明なAPIリクエスト
#define	TRACE_MEM_ERR			0x0110	// トレースバッファがメモリ不足
#define	INST_STACK_OVER			0x0120	// スタック命令オーバー
#define	INST_STACK_UNDER		0x0121	// スタック命令アンダー
#define	SYS_MEM_EMPTY			0x2000	// メモリ確保に失敗した
#define	TIMEFORMAT_ERR			0x2001	// 時刻指定の書式がおかしい
#define TAG_NOTFOUND_ERR		0x2002	// エッジタグが実在しない
#define FB_NOTFOUND_ERR			0x2003	// FBが実在しない
#define UFU_ARG_ERR				0x2004	// ユーザファンクションの入力引数が未定義です
#define STRING_FORMAT_ERR		0x2005	// 文字列リテラルの書式がおかしい
#define PLC_HALT				0xffee	// 例外発生によりPLCが停止状態


#define	DL64			0x0003			// データ長を示す(bit0-1) 64 bit size		xxxx xx11
#define	DL32			0x0002			// データ長を示す(bit0-1) 32 bit size		xxxx xx10
#define	DL16			0x0001			// データ長を示す(bit0-1) 16 bit size		xxxx xx01
#define	DL8				0x0000			// データ長を示す(bit0-1) 8 bit size		xxxx xx00

#define	DS0				0x0000			// 符号有無を示す(bit2) unsigned			xxxx x0xx
#define	DS1				0x0004			// 符号有無を示す(bit2) signed			xxxx x1xx

#define	DF0				0x0000			// フローティング有無を示す(bit3)			xxxx 0xxx
#define	DF1				0x0008			// フローティング有無を示す(bit3)			xxxx 1xxx

#define	DX0				0x0000			// ビット扱い可否を示す(bit4)				xxx0 xxxx
#define	DX1				0x0010			// ビット扱い可否を示す(bit4)				xxx1 xxxx

#define	DB(x)			((x) << 8)		// ビット位置0~31を示す(bit15-8)			1111 1111 xxxx xxxx

/// <summary>
/// データ型の識別番号の定義
/// </summary>
#define	NA				0		// オペランドなし
#define D_EMPTY			0		// 空のデータ

#define	D_ANY			0x8001		// 
#define	D_ANY_BIT		0x8002		// 
#define	D_ANY_NUM		0x8003		// 
#define	D_ANY_NUM_BIT	0x8004		// 
#define	D_LABEL			0x8005		// 
#define	D_NAME			0x8006		// 
#define	D_ANY_INT		0x8007		// 
#define	D_ANY_REAL		0x8008		// 
#define	D_ELEMENTARY	0x8009		// 

#define D_QWORD			0x0013		// 				bbbb bbbb xxx1 0011		b= bit number
#define D_DWORD			0x0012		// 				bbbb bbbb xxx1 0010		b= bit number
#define D_WORD			0x0011		// 				bbbb bbbb xxx1 0001		b= bit number
#define D_BYTE			0x0010		// 				bbbb bbbb xxx1 0000		b= bit number

#define D_LINT			0x0107		// 				0000 0000 xxx0 0111
#define D_DINT			0x0106		// 				0000 0000 xxx0 0110
#define D_INT			0x0105		// 				0000 0000 xxx0 0101
#define D_SINT			0x0104		// 				0000 0000 xxx0 0100

#define D_ULINT			0x0203		// 				0000 0000 xxx0 0011
#define D_UDINT			0x0202		// 				0000 0000 xxx0 0010
#define D_UINT			0x0201		// 				0000 0000 xxx0 0001
#define D_USINT			0x0200		// 				0000 0000 xxx0 0000

#define D_LREAL			0x030f		//				0000 0000 xxx0 1111
#define D_REAL			0x030e		//				0000 0000 xxx0 1110

#define D_ARRAY			0x0422		//				nnnn nnnn x010 0010
#define	D_FUNCTION		0x0423		//				ファンクションブロック
#define D_STRUCT		0x0424		//				nnnn nnnn x110 0010

#define D_STRING		0x0542		//				nnnn nnnn x100 0010
#define D_TIME			0x0543		//				0000 0000 xxx0 0010

#define D_BOOL			0x0600		// 				0000 0000 xxx0 0000

#define	D_LITERAL		0x0700		//				リテラル（即値）





/// <summary>
/// データ型の定義
/// </summary>
typedef char				T_BOOL;		// ブール
typedef	char				T_SINT;		// 単精度整数
typedef	short				T_INT;		// 整数
typedef	long 				T_DINT;		// 倍精度整数
typedef	long long			T_LINT;		// 長整数
typedef	unsigned char		T_USINT;	// 符号なし単精度整数
typedef unsigned short		T_UINT;		// 符号なし整数
typedef unsigned long		T_UDINT;	// 符号なし倍精度整数
typedef unsigned long long	T_ULINT;	// 符号なし長整数
typedef	float				T_REAL;		// 実数
typedef	double				T_LREAL;	// ロング実数
typedef	unsigned long		T_TIME;		// 継続時間(ms)
typedef	unsigned char		T_BYTE;
typedef	unsigned short		T_WORD;
typedef	unsigned long		T_DWORD;
typedef	unsigned long long	T_QWORD;
typedef void(*T_FUNCTIONBLOCK)(void*);	// ファンクションブロックインスタンス
typedef	unsigned short		T_TYPE;		// 型

// セキュア文字列関数の簡易ラッパ（INtime 環境で clang + LLVM を使うため）
#ifndef strcpy_s
#define strcpy_s(dst, size, src) strcpy((dst), (src))
#endif
#ifndef strcat_s
#define strcat_s(dst, size, src) strcat((dst), (src))
#endif
#ifndef strtok_s
#define strtok_s(str, delim, ctx) strtok((str), (delim))
#endif
#ifndef memmove_s
#define memmove_s(dst, size, src, count) memmove((dst), (src), (count))
#endif
#ifndef vsprintf_s
#define vsprintf_s(dst, size, fmt, args) vsprintf((dst), (fmt), (args))
#endif
#ifndef fopen_s
#define fopen_s(ppFile, filename, mode) ((*(ppFile) = fopen((filename), (mode))) == NULL)
#endif
#ifndef strncpy_s
#define strncpy_s(dst, size, src, count) strncpy((dst), (src), (count))
#endif
#ifndef strtoll
long long strtoll(const char* nptr, char** endptr, int base);
#endif
#ifndef strtoull
unsigned long long strtoull(const char* nptr, char** endptr, int base);
#endif
#ifndef strtoul
unsigned long strtoul(const char* nptr, char** endptr, int base);
#endif

/// <summary>
/// タグ情報
/// </summary>
#define	EG_MAX_TAGNAME			48		// タグ名最大長
#define	EG_MAX_TAGCOMMENT		48		// タグコメント最大長
#define	EG_MAX_TAGADDRESS		512		// タグアドレス最大長

/// <summary>
/// 共有メモリ情報
/// </summary>
#define EG_SHM_MAX_NODENAME		64		// 共有メモリ登録ノード名最大サイズ(バイト数)
#define EG_SHM_MAX_PROCNAME		12		// 共有メモリ登録プロセス名最大サイズ(バイト数)
#define EG_SHM_MAX_OBJENAME		12		// 共有メモリ登録オブジェクト名最大サイズ(バイト数)

/// <summary>
/// 文字長の最大
/// </summary>
#define		STRING_MAX		80
#define		STRING_BUFFER	sizeof(T_STRING)

/// <summary>
/// 文字列型の定義
/// </summary>
typedef struct STRING
{
	T_WORD			length;					// 保持している文字長(byte)
	char			string[STRING_MAX+1];	// 文字列(終端NULL文字含む)
} T_STRING, *P_STRING;

/// <summary>
/// 配列型の定義
/// </summary>
typedef struct ARRAY
{
	T_WORD			length;					// 保持しているデータ長(byte)
	T_BYTE			array[1];				// 配列
} T_ARRAY, *P_ARRAY;

/// <summary>
/// ラベル型
/// </summary>
typedef struct PLCLOGIC T_LABEL;


/// <summary>
/// 構造はRT-Edgeタグ共有メモリ情報保持用構造体
/// </summary>
typedef struct tSHM_DESC_PLCP {
	char		chSourceUpper[255];			// タグアドレス255文字まで
	char		chNull;						// NULL文字 (以降のデータ破損防止)
	uint32_t	InUse;						// 0:未使用、1:使用中
	uint8_t		_reserved1;					// (予備)
	uint8_t		BitUse;						// Bitオフセットの使用有無
	uint16_t	BitOffset;					// Bitオフセット値
	uint32_t	Offset;						// 共有メモリ先頭からのオフセット値(BYTE単位)
	uint32_t	MapSize;					// 共有メモリそのもののサイズ(BYTE単位)
	char		NodeName[((EG_SHM_MAX_NODENAME + 1 + 3) & ~3)];	// 共有メモリがカタログされているノード名  (64 + NULL文字)
	char		ProcName[((EG_SHM_MAX_PROCNAME + 1 + 3) & ~3)];	// 共有メモリがカタログされているプロセス名(12 + NULL文字)
	char		ObjeName[((EG_SHM_MAX_OBJENAME + 1 + 3) & ~3)];	// カタログされている共有メモリ名(12 + NULL文字)
} SHM_DESC_PLCP;

/// <summary>
/// 構造はRT-Edgeタグデスクリプタに合わせてある
/// </summary>
typedef struct 
{
	BOOL		force;				// ReadOnly属性(Trueの場合は書込み不可)
	BOOL		islink;				// リンクタグを示すフラグ
	uint8_t		cnt;				// タグ書き込み時に値変化があった場合カウントを一つ上げる

	struct {
		struct {
			uint16_t	vt;
			uint16_t	size;
			struct 
			{
				uint32_t		current;				// スピンロック現在
				uint32_t		limit;					// スピンロック制限 (current==limit)はfree
			};
			union ANYVAL {
				union 
				{
					uint64_t	ullVal;
					BOOL		boolVal;
					float		fltVal;
					double		dblVal;
					time_t		date;
					char		cVal;
					int16_t		iVal;
					int32_t		lVal;
					int32_t		intVal;
					int64_t		llVal;
					uint8_t		bVal;
					uint16_t	uiVal;
					uint32_t	ulVal;
					uint32_t	uintVal;
					BOOL		*pboolVal;
					float		*pfltVal;
					double		*pdblVal;
					time_t		*pdate;
					char		*pcVal;
					int16_t		*piVal;
					int32_t		*plVal;
					int32_t		*pintVal;
					int64_t		*pllVal;
					uint8_t		*pbVal;
					uint16_t	*puiVal;
					uint32_t	*pulVal;
					uint32_t	*puintVal;
					uint64_t	*pullVal;
					void		*byref;
//					EGBSTR		*pStr;
					T_STRING	*pStr;
					T_ARRAY		*pArray;
//					struct EgVARIANT		*pvarVal;
					T_LABEL		*pLabel;
				};
				intptr_t	val;
			};
			uint64_t	pSegment;
		};
	};
	char		chName[EG_MAX_TAGNAME + 1];				// タグ名
	char		chComment[EG_MAX_TAGCOMMENT + 1];		// タグコメント
	union {
		char		chSource[EG_MAX_TAGADDRESS + 1];	// タグアドレス
		SHM_DESC_PLCP	SHM;								// 共有メモリ情報保持用構造体
	};
} RTEDGEVARIANT;

/// <summary>
/// ANY小数点型の定義(T+64)
/// </summary>
typedef struct
{
	union {
		T_LREAL		*pLreal;
		T_REAL		*pReal;
	};
	T_TYPE			Type;
	RTEDGEVARIANT	*link;
} T_ANY_REAL;

/// <summary>
/// ANY符号あり整数型の定義(T+64)
/// </summary>
typedef struct
{
	union {
		T_LINT		*pLint;
		T_DINT		*pDint;
		T_INT		*pInt;
		T_SINT		*pSint;
	};
	T_TYPE			Type;
	RTEDGEVARIANT	*link;
} T_ANY_SIGNED;

/// <summary>
/// ANY符号なし整数型の定義(T+64)
/// </summary>
typedef struct
{
	union {
		T_ULINT		*pUlint;
		T_UDINT		*pUdint;
		T_UINT		*pUint;
		T_USINT		*pUsint;
	};
	T_TYPE			Type;
	RTEDGEVARIANT	*link;
} T_ANY_UNSIGNED;

/// <summary>
/// ANY整数型の定義(T+64)
/// </summary>
typedef struct
{
	union {
		T_LINT		*pLint;
		T_DINT		*pDint;
		T_INT		*pInt;
		T_SINT		*pSint;
		T_ULINT		*pUlint;
		T_UDINT		*pUdint;
		T_UINT		*pUint;
		T_USINT		*pUsint;
	};
	T_TYPE			Type;
	RTEDGEVARIANT	*link;
} T_ANY_INT;

/// <summary>
/// ANY数値型の定義(T+64)
/// </summary>
typedef struct
{
	union {
		T_LREAL		*pLreal;
		T_REAL		*pReal;
		T_LINT		*pLint;
		T_DINT		*pDint;
		T_INT		*pInt;
		T_SINT		*pSint;
		T_ULINT		*pUlint;
		T_UDINT		*pUdint;
		T_UINT		*pUint;
		T_USINT		*pUsint;
	};
	T_TYPE			Type;
	RTEDGEVARIANT	*link;
} T_ANY_NUM;

/// <summary>
/// ANYビット型の定義(T+64)
/// </summary>
typedef struct
{
	union {
		T_QWORD		*pQword;
		T_DWORD		*pDword;
		T_WORD		*pWord;
		T_BYTE		*pByte;
		T_BOOL		*pBool;
	};
	T_TYPE			Type;
	RTEDGEVARIANT	*link;
} T_ANY_BIT;

/// <summary>
/// ANY MAGNITUDEの定義
/// </summary>
//typedef union
//{
//	T_ANY_NUM		Anynum;
//	T_TIME			Time;
//} T_ANY_MAGNITUDE;

/// <summary>
/// ANY ELEMENTARY型の定義
/// </summary>
//typedef union
//{
//	T_ANY_MAGNITUDE	Anymagnitude;
//	T_ANY_BIT		Anybit;
//	T_STRING		String;
//} T_ANY_ELEMENTARY;


/// <summary>
/// ビットフィールド型の定義
/// </summary>
typedef struct
{
	BOOL		use;			// ビットフィールド使用フラグ
	BYTE		offset;			// ビットフィールドオフセット
	BYTE		value;			// ビット値(0/1)
} BITFIELD;

/// <summary>
/// ビット処理用マクロ関数
/// </summary>
#define	BOOLPOS(x)		((x) & 0x1)
#define	BOOLNEG(x)		(~(x) & 0x1)
#define INVERT(x)		(~(x))

extern BITFIELD Bitfield_Check(char *argument);

// Bitfield accessor functions
extern void LD_byte(void* result, void* any);
extern void LDN_byte(void* result, void* any);
extern void LD_word(void* result, void* any);
extern void LDN_word(void* result, void* any);
extern void LD_dword(void* result, void* any);
extern void LDN_dword(void* result, void* any);
extern void LD_qword(void* result, void* any);
extern void LDN_qword(void* result, void* any);
extern void LD_string(void* result, void* any);
extern void ST_string(void* any, void* result);
extern void ST_byte(void* any, void* result);
extern void STN_byte(void* any, void* result);
extern void ST_word(void* any, void* result);
extern void STN_word(void* any, void* result);
extern void ST_dword(void* any, void* result);
extern void STN_dword(void* any, void* result);
extern void ST_qword(void* any, void* result);
extern void STN_qword(void* any, void* result);

/// <summary>
/// ANY型の定義(T+64)
/// </summary>
typedef struct
{
	union PANYVAL {
		void				*pVal;
		T_LREAL				*pLreal;
		T_REAL				*pReal;
		T_LINT				*pLint;
		T_DINT				*pDint;
		T_INT				*pInt;
		T_SINT				*pSint;
		T_ULINT				*pUlint;
		T_UDINT				*pUdint;
		T_UINT				*pUint;
		T_USINT				*pUsint;
		T_QWORD				*pQword;
		T_DWORD				*pDword;
		T_WORD				*pWord;
		T_BYTE				*pByte;
		T_BOOL				*pBool;
		T_STRING			*pString;
		T_ARRAY				*pArray;
		T_TIME				*pTime;
		T_FUNCTIONBLOCK		pFB;
	};
	T_TYPE				Type;
	RTEDGEVARIANT		*link;
	BOOL				realonly;
	BOOL				brk;
	BITFIELD			bitfield;			// ビットフィールド
} T_ANY;

/// <summary>
/// ANY型のポインタ
/// </summary>
typedef	T_ANY*			P_ANY;

/// <summary>
/// 空のANY型データ
/// </summary>
extern T_ANY			VARIANT_EMPTY;

/// <summary>
/// データ型の定義テーブル
/// </summary>
struct TYPEMATCH
{
	char*		keyword;
	T_TYPE		iectype;
	int			edgetype;
	int			size;
};

/// <summary>
/// PLC実行モードの定義
/// </summary>
#define	RUNMODE_EXE			0		// コンパイル実行モード
#define RUNMODE_INTERPRIT	1		// インタプリタ実行モード

/// <summary>
/// 各機能動作ステータスの定義
/// </summary>
#define STATUS_STOP		0
#define STATUS_READY	2
#define STATUS_WAIT		4
#define STATUS_RUN		6
#define STATUS_HALT		8

/// <summary>
/// ハッシュ値
/// </summary>
typedef union tHashCode
{
	struct {
		DWORD		code1;					// 第1ハッシュコード(32bit) インデックス用
		DWORD		code2;					// 第2ハッシュコード(32bit) インデックス用
		DWORD		code3;					// 第3ハッシュコード(32bit) インデックス用
		DWORD		code4;					// 第4ハッシュコード(32bit) 衝突チェック用
	};
	BYTE		code[16];					// ハッシュコード(16byte)
}HASHCODE;

/// <summary>
/// SQTBL構造体
/// </summary>
typedef struct _SQTBL {

	char		cExeRtTypeString[16];						// 実行RTAﾓｰﾄﾞ文字列
	char		cVersionInfo[16];							//  バージョン情報
	BYTE		byExe;										//	PLC実行ﾌﾗｸﾞ
	BYTE		byStepExe;									//	PLC実行(STEP)ﾌﾗｸﾞ
	BYTE		byOverflow;									//	ｵｰﾊﾞｰﾌﾛｰﾌﾗｸﾞ
	RTHANDLE	hStepSem;									//	ｽﾃｯﾌﾟ実行ｾﾏﾌｫ
	BYTE		byPrint;									//	printf出力ﾌﾗｸﾞ
	BYTE		byRemote;									//	ﾘﾓｰﾄﾉｰﾄﾞ起動ﾌﾗｸﾞ
	BYTE		bySusExe;									//	ﾀｲﾏ値変更ｻｽﾍﾟﾝﾄﾞﾌﾗｸﾞ
	BYTE		byDoTrace;									//  ﾄﾚｰｽ処理を行なうかどうかを判別
	RTHANDLE	hSuspSem;									//	ﾀｲﾏ値変更完了ｾﾏﾌｫ	
/*-----------------------------------------------------------------------------------------------------------*/
	float		flMinSeq;									//	最小処理時間
	float		flMaxSeq;									//	最大処理時間
	float		flCurSeq;									//  現在処理時間
	float		flAveSeq;									//	平均処理時間
	DWORD		dwCPUSpd;									//  CPUスピード値	MHz	
}SQTBL;

/// <summary>
/// 命令処理関数の型
/// </summary>
typedef P_ANY(*PLCINSTRUCTION)(P_ANY, P_ANY, P_ANY, P_ANY);

/// <summary>
/// ファンクションブロック関数の型
/// </summary>
typedef void(*P_FUNCTIONBLOCK)(PVOID);

/// <summary>
/// 全命令リストと命令書式テンプレート
/// </summary>
struct MNMTEMPLATE {
	char*			name;
	WORD			code;
	BOOL			precode;
	T_TYPE			byArgType1;
	T_TYPE			byArgType2;
	T_TYPE			byArgType3;
	PLCINSTRUCTION	lpMnmInstruct;	// 命令処理関数のエントリポイント
	T_TYPE			byOutType;
};

/// <summary>
/// 予約語リスト定義テンプレート (スタティック)
/// </summary>
struct RESERVEDWORDTEMPLATE {
	char*			name;
	WORD			code;
};

/// <summary>
/// 変数リストのエントリ
/// </summary>
struct VARIABLE
{
	char *				name;		// PLC変数名
	T_ANY				value;		// PLC変数値
	struct VARIABLE *	next;		// 次のエントリ
};

/// <summary>
/// 構造体メンバ定義テンプレート (ファンクションブロックRSLでの静的定義で使用)
/// </summary>
struct STRUCTDEFINE
{
	T_TYPE				type;		// データ型
	char*				name;		// メンバ変数名
	T_INT				direction;	// ピンの方向性(PIN_IN/PIN_OUT/PIN_NONE)
	uint16_t			offset;		// ベースオフセット
};

#define PIN_IN		1
#define	PIN_OUT		2
#define	PIN_NON		3

/// <summary>
/// ファンクションブロック定義テンプレート (ファンクションブロックRSLでの静的定義で使用)
/// </summary>
struct FUNCTIONBLOCKDEFINE
{
	char*						name;				// ファンクションブロック名称
	P_FUNCTIONBLOCK				entry;				// 関数エントリポイント
	struct STRUCTDEFINE			connectors[];		// コネクタリスト
};

/// <summary>
/// ファンクションブロックのピンのリストを構成するエントリ
/// </summary>
struct FBPINENTRY
{
	struct STRUCTDEFINE			pin;				// コネクタ１つの情報
	struct FBPINENTRY			*next;				// 次のエントリ
};

/// <summary>
/// ファンクションブロックのリストを構成するエントリ
/// </summary>
struct FBENTRY
{
	char*						name;				// ファンクションブロック名称
	P_FUNCTIONBLOCK				entry;				// 関数エントリポイント
	size_t						size;				// ファンクションブロックのSegment(ARRAY)バイトサイズ
	struct FBPINENTRY			*ConnectorList;		// コネクタのリスト
	struct FBENTRY				*next;				// 次のエントリ
};

/// <summary>
/// ヒープ情報のエントリ
/// </summary>
struct HEAP
{
	void *			entry;
	size_t			size;
	char *			tag;
	uint32_t		order;
	struct HEAP*	next;
};

/// <summary>
/// 変数スコープの定義
/// </summary>
#define	SCOPE_LOCAL		1
#define	SCOPE_GLOBAL	0

/// <summary>
/// ニーモニック命令バイナリのエントリ
/// </summary>
struct PLCLOGIC {
	struct MNMTEMPLATE*			instruction;	// 命令
	P_ANY						Arg1;			// 引数１
	P_ANY						Arg2;			// 引数２
	P_ANY						Arg3;			// 引数３
	union ANYVAL				laststate;		// 最終の実行結果を保持
	struct PLCLOGIC*			next;			// 次のエントリ
};

/// <summary>
/// ニーモニックラベル管理のエントリ
/// </summary>
struct PLCLABEL {
	char*				name;			// ラベル名
	DWORD				ip;				// 命令ポインタ
	struct PLCLOGIC*	anchor;			// ラベルが示すロジックの位置
	struct PLCLABEL*	next;			// 次のエントリ
};

/// <summary>
/// ニーモニックエラー情報
/// </summary>
struct PLCERR {
	DWORD			line;	// 行番号
	DWORD			code;	// エラーコード
	char*			msg;	// 付随文字列
	struct PLCERR*	next;	// 次のエントリ
};

/// <summary>
/// 強制I/Oのリスト構造
/// </summary>
struct PLCFORCEIO
{
	DWORD				ioaddr;
	BYTE				mode;		// 0=FORCE_RESET / 1=FORCE_SET
	BYTE*				target;
	struct PLCFORCEIO*	next;
};

/// <summary>
/// PLCトレース対象のリスト構造
/// </summary>
struct PLCTRACE
{
	DWORD				ioaddr;
	BYTE*				target;
	struct PLCTRACE*	next;
};

/// <summary>
/// PLCアプリケーションインターフェースのメッセージ構造(約81KB)
/// SQAPIを介してインターフェースされます
/// </summary>
struct PLCAPIMSG
{
	DWORD				command;	// コマンド、応答の識別番号
	DWORD				entry;		// 以下に含まれるdatasの要素数
	DWORD				datas[1];	// コマンドに応じて複数個のDWORDリストが継ぐ来ます
};

/// <summary>
/// アプリケーションインターフェースコマンドおよび応答の定義
/// </summary>
#define API_PLC_STOP			100		// PLC制御 ストップ
#define API_PLC_RESET			101		// PLC制御 リセット
#define API_PLC_START_COLD		110		// PLC制御 コールドスタート
#define API_PLC_START_HOT		111		// PLC制御 ホットスタート
#define API_PLC_DOWNLOAD		120		// PLC制御 プログラムダウンロード
#define API_PLC_HALT			121		// PLC制御ホルト
#define	API_PLC_RETAIN_SAVE		122		// リテインデータ保存
#define	API_PLC_RETAIN_LOAD		123		// リテインデータ復元
#define	API_DUMP_LOG			200		// ログ吐き出し指令
#define	API_DUMP_LOGIC			201		// 逆アセンブリログ吐き出し指令
#define API_STEP_ENABLE			300		// ステップ実行有効
#define API_STEP_DISABLE		301		// ステップ実行無効
#define API_STEP_STEP			302		// ステップ実行トリガ

/// <summary>
/// リテイン保管/復元の完了待機時間の定義
/// </summary>
#define	RETAIN_WAIT_TIME		500	// (msec)

/// <summary>
/// トレース対象チャンネルのリスト
/// </summary>
extern struct PLCTRACE* plcTraceList;

/// <summary>
/// 命令定義への高速アクセス用のハッシュテーブル
/// </summary>
extern struct MNMTEMPLATE*	InstructionCatalog[];

/// <summary>
/// ユーザファンクション引数パラメータエントリ
/// </summary>
struct USERFUNCVARIABLE
{
	char *						name;
	struct USERFUNCVARIABLE *	next;
};

/// <summary>
/// ユーザファンクション管理エントリ 
/// </summary>
struct USERFUNC
{
	char *						name;
	struct USERFUNCVARIABLE*	variablelist;
	struct USERFUNC*			next;
};

/// <summary>
/// SQTBL ラダー動作のメインワークエリア
/// </summary>
extern SQTBL*		sqtbl;

/// <summary>
///  命令管理 instruction.c
/// </summary>
extern int Instruction_CreateCatalog(void);
extern int Instruction_CreateUserfunctionCatalog(char* name, struct MNMTEMPLATE* ufdef);
extern struct MNMTEMPLATE* Instruction_GetTemplate(char *cmdname);
extern WORD Instruction_CalcHash(char *cmdname);
extern BOOL Instruction_IsUFB(void);
extern BOOL Instruction_IsUF(void);
extern void Instruction_FUFBReset(void);

/// <summary>
/// ニーモニックファイル管理 mnmfile.c
/// </summary>
extern int MnmFile_Load(char* cMnmFilePath);
extern WORD MnmFile_PargeArgument(char *argument, T_TYPE byType, P_ANY *result);
extern int MnmFile_BitArgument(char *argument, T_TYPE byType);
extern char* MnmFile_Base(char* cMnmFilePath);

/// <summary>
/// エラーログ管理 errorlog.c
/// </summary>
extern void Errorlog_Clear(void);
extern void Errorlog_Add(DWORD iline, DWORD icode, char* msg);
extern void Errorlog_Display(char *message);
extern int Errorlog_Count(void);
extern char* Errorlog_Message(DWORD code);

/// <summary>
/// ラダーロジック管理 logic.c
/// </summary>
extern void Logic_Clear(void);
extern struct PLCLOGIC* Logic_Add(struct MNMTEMPLATE *cmddef, P_ANY iArg1, P_ANY iArg2, P_ANY iArg3);
extern void Logic_Display(void);
extern void Logic_Convert_To_Clanguage(FILE *fp);
extern void Logic_Scan(void);
extern P_ANY Logic_RunPOU(P_ANY Arg0, P_ANY a2, P_ANY a3, P_ANY a4);
extern void Logic_Begin(void);
extern void Logic_Final(void);
extern void Logic_SetEntrypoint(struct PLCLOGIC* start);
extern void Logic_SetBeginpoint(struct PLCLOGIC* start);
extern void Logic_SetFinalpoint(struct PLCLOGIC* start);
extern void Logic_Swap(void);
extern void Logic_Disasm(void);

/// <summary>
/// 初期化ファイル inifile.c
/// </summary>
extern int IniFile_Load(char* iInifilePath);

/// <summary>
/// ウォッチドック用の初期値の定義
/// </summary>
#define		WATCHDOG_MIN_PROCTIME	0x7FFFFFFF
#define		WATCHDOG_MAX_PROCTIME   -1

/// <summary>
/// ウォッチドック管理 watchdog.c
/// </summary>
extern void Watchdog_Init(void);
extern void Watchdog_Reset(void);
extern void Watchdog_Process(QWORD start, QWORD end);
extern BOOL WatchDog_IsEnable(void);
extern void WatchDog_Action_OverRun(void);
extern QWORD WatchDog_GetPentiumCounter(void);
extern double WatchDog_GetCPUSpeed(void);
extern double Watchdog_Calc(QWORD uiBegin, QWORD uiEnd);

/// <summary>
/// ステップ実行管理 step.c
/// </summary>
extern void Step_Init(void);
extern void Step_WaitTrigger(void);
extern BOOL Step_IsEnable(void);
extern void Step_Enable(void);
extern void Step_Disable(void);
extern void Step_Trigger(void);

/// <summary>
/// リジューム実行管理 resume.c
/// </summary>
extern void Pause_Init(void);
extern void Pause_WaitTrigger(void);
extern void Pause_Enable(void);
extern void Pause_Disable(void);
extern BOOL Pause_IsEnable(void);

/// <summary>
/// SQTBL管理 sqtbl.c
/// </summary>
extern int SQTBL_Create(void);
extern void SQTBL_Initialize(void);

/// <summary>
/// PLCエンジン管理 engine.c
/// </summary>
extern void Engine_Init(void);
extern void Engine_Reset(void);
extern BOOL Engine_Tigger(void);
extern void Engine_WaitTrigger(void);
extern void Engine_Start(void);
extern void Engine_Stop(void);
extern BOOL Engine_IsStart(void);
extern void Engine_PulseThread(void);
extern void Engine_Thread(void);
extern void Engine_WaitStop(void);
extern int plcmain(int argc, char* argv[]);

/// <summary>
/// 内部クロック管理 internalclock.c
/// </summary>
extern void InternalClock_Wait(void);
extern DWORD InternalClock_GetUsecs(void);
extern DWORD InternalClock_IsPlcFireTiming(DWORD clockcounter);

/// <summary>
/// ブルースクリーン管理 bluescreen.c
/// </summary>
extern void BlueScreen_Process(void);

/// <summary>
/// 起動引数管理 argument.c
/// </summary>
extern void Argument_Init(int argc, const char* argv[]);
extern void Argument_Process(int argc, const char* argv[]);
extern void Argument_PathFromFolder(const char* originalpath, char* outputpath, size_t outputpathsize);
extern void Argument_PathFromBase(const char* originalpath, char* outputpath, size_t outputpathsize);
extern void Argument_PouFiles(char* filelist);


/// <summary>
/// 動作設定管理 config.c
/// </summary>
void Config_Init(void);
extern void Config_Set_StepMode(BOOL sw);
extern BOOL Config_Get_StepMode(void);
extern void Config_Set_PrintMode(BOOL sw);
extern BOOL Config_Get_PrintMode(void);
extern void Config_Set_RemoteMode(BOOL sw);
extern BOOL Config_Get_RemoteMode(void);
extern void Config_Set_TraceMode(BOOL sw);
extern BOOL Config_Get_TraceMode(void);
extern void Config_Set_RunMode(BYTE mode);
extern BYTE Config_Get_RunMode(void);
extern void Config_Set_BasePriority(BYTE prio);
extern BYTE Config_Get_BasePriority(void);
extern void Config_Set_ScanFreq(DWORD freq);
extern DWORD Config_Get_ScanFreq(void);
extern void Config_Set_Overrun(DWORD count);
extern DWORD Config_Get_Overrun(void);
extern void Config_Set_WorkFolder(char* string);
extern char* Config_Get_WorkFolder(void);
extern void Config_Set_BaseName(char* string);
extern char* Config_Get_BaseName(void);
extern void Config_Set_RslFolder(char* string);
extern char* Config_Get_RslFolder(void);
extern char* Config_Get_RslFolder_Default(void);
extern void Config_Set_RtaFolder(char* string);
extern char* Config_Get_RtaFolder(void);
extern void Config_Set_RtaFilePath(char* string);
extern char* Config_Get_RtaFilePath(void);
extern void Config_Set_IniFilePath(char* string);
extern char* Config_Get_IniFilePath(void);
extern void Config_Set_MnmFilePath(char* string);
extern char* Config_Get_MnmFilePath(void);
extern void Config_Set_RetainInstName(char* string);
extern char* Config_Get_RetainInstName(void);

/// <summary>
/// ステータス管理 status.c
/// </summary>
extern void Status_Display(void);
extern void Status_DetailDisplay(void);

/// <summary>
/// アプリケーションインターフェース機能 api.c
/// </summary>
extern void Api_Init(void);
extern void Api_Thread(void);
extern void Api_Dispatch(struct PLCAPIMSG* msg);
extern DWORD Api_Request(long RtProcHandle, DWORD command, DWORD *reqparam, DWORD reqparams, DWORD *resparam, DWORD resparams);
extern void Api_DumpLog(void);
extern void Api_PlcStop(void);
extern void Api_PlcReset(void);
extern void Api_PlcStartCold(void);
extern void Api_PlcStartWarm(void);
extern void Api_PlcHalt(DWORD exceptioncode);
extern void Api_PlcDownload(void);
extern void Api_PlcRetainSave(void);
extern void Api_PlcRetainLoad(void);
extern void Api_PlcDisasm(void);
extern void Api_StepEnable(void);
extern void Api_StepDisable(void);
extern void Api_StepStep(void);

/// <summary>
/// INtime utilities 関数 util.c
/// </summary>
#ifdef __INTIME__
extern DWORD			dwKtickInUsecs;

extern void Cleanup(void);
extern void Fail(LPSTR lpszMessage, ...);
extern DWORD UsecsToKticks(DWORD dwUsecs);
extern BOOL Catalog(RTHANDLE hProcess, RTHANDLE hObject, LPSTR lpszName);
extern WORD INtime_CheckDRTOS(void);
extern WORD INtime_WaitIO(void);
extern void INtime_ProcessInitialize(void);
extern void INtime_ProcessFinalize(void);
extern void INtime_ProcessCatalog(void);
extern void INtime_Halt(char *reasonmessage);
extern WORD INtime_RslLoad(char *RslName);
extern HASHCODE _Hash(const char *name);
#endif

/// <summary>
/// PCPLCコンパイル実行用の外部参照
/// </summary>
extern void seq_control(void);

/// <summary>
/// エッジとの連携機能 RTedge.c
/// </summary>
extern BOOL Rtedge_TagIsExist(char* name);
extern T_TYPE Rtedge_TagGetIecType(char* name);
extern T_TYPE Rtedge_ConvertToIecType(uint16_t edgedatatype);
extern uint16_t Rtedge_ConvertToEdgeType(T_TYPE iecdatatype);
extern RTEDGEVARIANT* Rtedge_TagGetPointer(char* name);
extern uint16_t Rtedge_SizeOf(P_ANY val);
extern size_t Rtedge_TypeSize(T_TYPE type);
extern char* Rtedge_GetStructureName(char* instancename);
extern char* Rtedge_GetArrayName(char* instancename);
extern BOOL Rtedge_IsStructure(char* instancename);
extern BOOL Rtedge_IsArray(char* instancename);
extern BOOL Rtedge_TagCreateByInstruction(char* string, BOOL hidden);
extern BOOL Rtedge_TagCreate(char* name, T_TYPE iectype, LPVOID opt1, LPVOID opt2);
extern BOOL Rtedge_TagRead_UInt32(char* name, uint32_t *value);
extern BOOL Rtedge_TagWrite_UInt32(char* name, uint32_t value);
extern P_ANY Rtedge_Compile(char* name);
extern PVOID Rtedge_GetPointer(RTEDGEVARIANT* etag, T_TYPE type);
extern BOOL Rtedge_SetTagDefaultValue(void);

/// <summary>
/// VAriantデータ型機能 variant.c
/// </summary>
extern T_LREAL Variant_Read_Lreal(P_ANY target);
extern T_REAL Variant_Read_Real(P_ANY target);
extern T_LINT Variant_Read_Lint(P_ANY target);
extern T_DINT Variant_Read_Dint(P_ANY target);
extern T_INT Variant_Read_Int(P_ANY target);
extern T_SINT Variant_Read_Sint(P_ANY target);
extern T_ULINT Variant_Read_Ulint(P_ANY target);
extern T_UDINT Variant_Read_Udint(P_ANY target);
extern T_UINT Variant_Read_Uint(P_ANY target);
extern T_USINT Variant_Read_Usint(P_ANY target);
extern T_QWORD Variant_Read_Qword(P_ANY target);
extern T_DWORD Variant_Read_Dword(P_ANY target);
extern T_WORD Variant_Read_Word(P_ANY target);
extern T_BYTE Variant_Read_Byte(P_ANY target);
extern T_BOOL Variant_Read_Bool(P_ANY target);
extern T_STRING Variant_Read_String(P_ANY target);
extern T_ARRAY Variant_Read_Array(P_ANY target);
extern void Variant_Write_Lreal(P_ANY target, T_LREAL val);
extern void Variant_Write_Real(P_ANY target, T_REAL val);
extern void Variant_Write_Lint(P_ANY target, T_LINT val);
extern void Variant_Write_Dint(P_ANY target, T_DINT val);
extern void Variant_Write_Int(P_ANY target, T_INT val);
extern void Variant_Write_Sint(P_ANY target, T_SINT val);
extern void Variant_Write_Ulint(P_ANY target, T_ULINT val);
extern void Variant_Write_Udint(P_ANY target, T_UDINT val);
extern void Variant_Write_Uint(P_ANY target, T_UINT val);
extern void Variant_Write_Usint(P_ANY target, T_USINT val);
extern void Variant_Write_Qword(P_ANY target, T_QWORD val);
extern void Variant_Write_Dword(P_ANY target, T_DWORD val);
extern void Variant_Write_Word(P_ANY target, T_WORD val);
extern void Variant_Write_Byte(P_ANY target, T_BYTE val);
extern void Variant_Write_Bool(P_ANY target, T_BOOL val);
extern void Variant_Write_String(P_ANY target, T_STRING val);
extern void Variant_Write_Array(P_ANY target, T_ARRAY val);
extern void Variant_Write(P_ANY dst, P_ANY src);
extern union ANYVAL Variant_Read(P_ANY src);

/// <summary>
/// リテラル管理 literal.c
/// </summary>
extern P_ANY Literal_Compile(char* string);

/// <summary>
/// 変数管理 variable.c
/// </summary>
extern void Variable_Clear(void);
extern P_ANY Variable_Add(char* name, T_TYPE type);
extern union ANYVAL* Variable_Body(size_t size);
extern P_ANY Variable_Search(char* name);
extern P_ANY Variable_Zero(T_TYPE type);
extern char* Variable_SearchName(char* name);
extern void Variable_Display(void);
extern WORD Variable_GetSize(char* name);
extern T_TYPE Variable_GetType(char* name);
extern union ANYVAL* Variable_LinkBody(P_ANY container, char* edgetag);
extern void Variable_Copy64(union ANYVAL *dst, union ANYVAL *src);
extern void Variable_Reset_All(void);
extern void Variable_Swap(void);


/// <summary>
/// PLCゼロ値定数定義 variable.c
/// </summary>
extern T_STRING _Variable_Zero_Body_String;
extern T_ARRAY _Variable_Zero_Body_Array;
extern union ANYVAL _Variable_Zero_Body;
extern T_ANY _Variable_Zero_BOOL;
extern T_ANY _Variable_Zero_SINT;
extern T_ANY _Variable_Zero_INT;
extern T_ANY _Variable_Zero_DINT;
extern T_ANY _Variable_Zero_LINT;
extern T_ANY _Variable_Zero_USINT;
extern T_ANY _Variable_Zero_UINT;
extern T_ANY _Variable_Zero_UDINT;
extern T_ANY _Variable_Zero_ULINT;
extern T_ANY _Variable_Zero_TIME;
extern T_ANY _Variable_Zero_BYTE;
extern T_ANY _Variable_Zero_WORD;
extern T_ANY _Variable_Zero_DWORD;
extern T_ANY _Variable_Zero_QWORD;
extern T_ANY _Variable_Zero_FUNCTION;
extern T_ANY _Variable_Zero_STRING;
extern T_ANY _Variable_Zero_ARRAY;
extern T_ANY _Variable_Zero_STRUCT;
extern T_ANY _Variable_Zero_ANY;
extern T_ANY _Variable_Zero_REAL;
extern T_ANY _Variable_Zero_LREAL;

/// <summary>
/// 構造体管理 structure.c
/// </summary>
extern P_ANY Structure_Compile(char* string);
extern int Structure_CreateCatalog(char* instancename, struct FBPINENTRY* entryhead);

/// <summary>
/// 基本ファンクション命令管理 genericfunction.c
/// </summary>
extern void Basicfunction_Load(char* RslName);
extern void Basicfunction_Unload(void);
extern int Basicfunction_CreateCatalog(void);
extern void Basicfunction_Display(void);

/// <summary>
/// ファンクションブロック管理 functionblock.c
/// </summary>
extern struct FBENTRY* Functionblock_Add(char* FBname);
extern struct FBENTRY* Functionblock_Search(char* name);
extern void Functionblock_Load(char* RslName);
extern void Functionblock_Unload(void);
extern P_FUNCTIONBLOCK Functionblock_GetEntry(char *instancename);
extern void Functionblock_Register(char* instancename);
extern void Functionblock_Dummy(P_ANY x);
extern size_t Functionblock_GetSize(char* FBname);
extern void Functionblock_Display(void);

/// <summary>
/// 文字列データ型管理 string.c
/// </summary>
extern void String_Clear(P_STRING dst);
extern T_STRING String_Create(char*src);
extern void String_Set(P_STRING dst, char* src);
extern char* String_Get(P_STRING src);
extern void String_Copy(P_STRING dst, P_STRING src);
extern int String_Packing(char* target);
extern int String_Unpacking(char* target);

/// <summary>
/// ヒープ管理 heap.c
/// </summary>
extern void Heap_Clear(void);
extern void* Heap_Alloc(size_t size, char* tag);
extern void Heap_Free(void* entry);
extern void Heap_Display(void);

/// <summary>
/// 予約語管理 reservedword.c
/// </summary>
extern int Reservedword_CreateCatalog(void);
extern BOOL Reservedword_Check(char* string);

/// <summary>
/// ラベル管理 name.c
/// </summary>
extern void Label_Clear(void);
extern struct PLCLABEL* Label_Add(char* name, DWORD ip, struct PLCLOGIC* anchor);
extern struct PLCLABEL* Label_Search(char* name);
extern void Label_SetAnchor(char* name, DWORD ip, struct PLCLOGIC* point);
extern void Label_Display(void);

/// <summary>
/// コメント管理 comment.c
/// </summary>
extern void Comment_ClearNest(void);
extern int Comment_SearchBracket(char *str, char **found);
extern void Comment_ProcessBracket(char *str);

/// <summary>
/// データ型管理 type.c
/// </summary>
extern int Type_GetSize(P_ANY val);
extern char* Type_GetName(T_TYPE type);

/// <summary>
/// POUファイル管理 poufile.c
/// </summary>
extern void Poufile_Clear();
extern struct POUFILE* Poufile_Add(char* filepath);
extern char* Poufile_Next(void);
extern char* Poufile_First(void);
extern struct POUFILE* Poufile_Set_Begin(char* filepath);
extern struct POUFILE* Poufile_Set_Final(char* filepath);
extern char* Poufile_Get_Begin(void);
extern char* Poufile_Get_Final(void);
extern void Poufile_Display(void);

/// <summary>
/// 変数スコープ管理 scope.c
/// </summary>
extern char* Scope_set(char* string);
extern char* Scope_get(void);
extern char* Scope_variable(char* name);

/// <summary>
/// ユーザファンクション管理 userfunc.c
/// </summary>
extern void Userfunction_Clear(void);
extern void Userfunction_Add(char* functionname);
extern BOOL Userfunction_AddArgument(char* functionname, char* variablename);
extern int Userfunction_NumArgument(struct USERFUNC* func);
extern struct USERFUNC* Userfunction_Search(char* functionname);
extern P_ANY Userfunction_ReplaceInstruction(P_ANY a1, P_ANY a2, P_ANY a3, P_ANY a4);
extern void Userfunction_Display(void);

/// <summary>
/// ユーザファンクションブロック管理 userFB.c
/// </summary>
extern void UserFB_Clear(void);
extern void UserFB_Add(char* FBname);
extern void UserFB_AddConnector(struct FBENTRY* target, struct STRUCTDEFINE* pin);
extern struct FBENTRY* UserFB_Search(char* name);
extern struct PLCLOGIC* UserFB_GetEntry(char *instancename);

/// <summary>
/// PLCプロジェクト管理 project.c
/// </summary>
extern void Project_Reset(void);
extern int Project_Load(void);

/// <summary>
/// リテイン管理 retain.c
/// </summary>
extern void Retain_Set_Tagname(char*);
extern BOOL Retain_Save(void);
extern BOOL Retain_Load(void);

/// <summary>
/// PLCコントロール plccontrol.c
/// </summary>
extern void PLCcontrol_Start(void);
extern void PLCcontrol_Stop(void);
extern void PLCcontrol_Reset(void);
extern void PLCcontrol_Halt(DWORD exceptioncode);
extern void PLCcontrol_Download(void);
extern void PLCcontrol_ColdStart(void);
extern void PLCcontrol_HotStart(void);
extern void PLCcontrol_Swap(void);
extern void PLCcontrol_RetainSave(void);
extern void PLCcontrol_RetainLoad(void);
extern void PLCcontrol_StepEnable(void);
extern void PLCcontrol_StepDisable(void);
extern void PLCcontrol_StepStep(void);


/// <summary>
/// コンテナで使用するタグ定義のテーブル型
/// </summary>
struct CONTAINER_TAGS
{
	char*				name;				// エッジタグ名
	enum egTagDataType	type;				// データ型
	union {									// 
		DWORD				defaultval;		// 初期値(1)
		void*				defaultstr;		// 初期値(2) ※文字列の場合は(DWORD)でキャストしてください
	};										// 
	BOOL				create;				// TRUE = エッジタグ存在しなかったら作ります

	BOOL				linked;				// タグの存在確認済
	union ANYVAL		*pvalue;			// タグの値へのポインタ

	char*				source;				// ソース情報
	char*				comment;			// コメントう情報
	void*				index;				// エッジタグのインテックス保管用
};
struct PROPERTY_TAGS
{
	char*				name;				// エッジタグ名
	enum egTagDataType	type;				// データ型
	union {									// 
		DWORD				defaultval;		// 初期値(1)
		void*				defaultstr;		// 初期値(2) ※文字列の場合は(DWORD)でキャストしてください
	};										// 
	BOOL				create;				// TRUE = エッジタグ存在しなかったら作ります
	void(*function)(struct PROPERTY_TAGS*);	// プロパティ設定解釈処理関数
	char*				source;				// ソース情報
	char*				comment;			// コメントう情報
	void*				index;				// エッジタグのインテックス保管用
};

// trigger.c
extern BOOL Trigger_Init(void);

// property.c
extern BOOL Property_Init(void);
extern uint32_t Property_Get_Priority(void);
extern uint32_t Property_Get_Interval(void);
extern BOOL Property_Get_Autorun(void);
extern void Property_Process(void);

// indicate.c
extern BOOL Indicate_Init(void);
extern void Indicate_Status(BYTE statuscode);
extern void Indicate_Error(BOOL error);
extern void Indicate_Run(BOOL running);
extern void Indicate_Live(void);
extern BOOL Indicate_Run_Get(void);
extern void Indicate_STATE_ON(BOOL on);
extern void Indicate_STATE_LOADING(BOOL loading);
extern void Indicate_STATE_STOP(BOOL stop);
extern void Indicate_STATE_RUN(BOOL run);
extern void Indicate_STATE_STEP(BOOL step);
extern void Indicate_STATE_HALT(BOOL halt);
extern void Indicate_TASK_Period_us(uint32_t priod);
extern void Indicate_TASK_Watchdog_us(uint32_t watchdog);
extern void Indicate_TASK_Stack(uint32_t stack);
extern void Indicate_TASK_Prio(uint32_t prio);
extern void Indicate_TASK_MinDuration_ns(uint32_t minduration);
extern void Indicate_TASK_MaxDuration_ns(uint32_t maxduration);
extern void Indicate_TASK_CurDuration_ns(uint32_t curduration);
extern void Indicate_TASK_MinDelay_ns(uint32_t mindelay);
extern void Indicate_TASK_MaxDelay_ns(uint32_t maxdelay);
extern void Indicate_TASK_CurDelay_ns(uint32_t curdelay);
extern void Indicate_DEBUG_FORCE(BOOL debug);
extern void Indicate_DEBUG_BPSET(BOOL bpset);
extern void Indicate_DEBUG_EXCEPTICODE(uint32_t exceptcode);
extern void Indicate_SYSTICK_CNT(uint32_t systickcnt);
extern void Indicate_ERRORS(uint32_t errors);

// container.c
extern void Container_Init(void);
extern void Container_Finish(void);
extern void Container_SetModuleName(char* argv0);
extern char* Container_GetModuleName(void);
extern char* Container_GetTagName(char* tagname);
extern BOOL Container_TagCreate(char* name, enum egTagDataType type, DWORD inival, char* source, char* comment);
extern BOOL Container_TagCheck(char* name);
extern void* Container_TagGetIndex(char* name);
extern void Container_Log$(const char* pServiceName, const char* pMode, const char * _Format, ...);
extern int32_t Container_EgdeMsgHandler(const char* sender, int32_t msgno, void *param);
extern BOOL Container_CreateTagsFromList(struct CONTAINER_TAGS* current);

// container.c  process exit control
extern void ExitEvent_Init(void);
extern void ExitEvent_Wait(void);
extern void ExitEvent_Post(void);
extern void ExitEvent_RtaMsgHandler(void);

// exception.c
extern void Exception_Init(void);
extern void Exception_Set(uint32_t exceptioncode, char* hint, uint32_t line);
extern void Exception_Clear(void);
#define		Exception_Plc(code)		Exception_Set((code),__FUNCTION__,__LINE__)



#pragma pack(pop)
