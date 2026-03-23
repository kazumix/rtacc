#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPFB.h"

#pragma pack(push,1)

//ファイル入出力 例外コード
#define	FUNC_FIO_PATH			0x0001	// ファイルパス不正(オープン時のみ)
#define	FUNC_FIO_ACSS			0x0002	// ファイルアクセス不可
#define	FUNC_FIO_CAP 			0x0003	// ディスク容量不足
#define	FUNC_FIO_MAX 			0x0004	// ファイル・ディレクトリ数上限(オープン時のみ)
#define	FUNC_FIO_SIZE 			0x0005	// 書込み・読込みサイズ0
#define	FUNC_FIO_STR 			0x0006	// 書込み文字列なし
#define	FUNC_FIO_MEM 			0x0007	// IOメモリ領域不足
#define	FUNC_FIO_BUF 			0x0008	// 読込用バッファNULL
#define	FUNC_FIO_ERR 			0x0009	// その他エラー

// ファイル書込FB用入出力構造体
typedef struct {
	T_BOOL		Execute;	// 入力1:実行信号
	T_STRING	FileName;	// 入力2:書込ファイルパス
	P_ANY		WriteData;	// 入出力3:書込むバイナリデータ
	T_UDINT		Size;		// 入力4:書込Byteサイズ
	T_BOOL		Done;		// 出力1:書込完了信号
	T_BOOL		Busy;		// 出力2:処理中信号
	T_BOOL		Err;		// 出力3:エラー発生信号
	T_UINT		ErrID;		// 出力4:エラーコード
	T_BOOL		_Execute_;	// 内部保持 前回実行信号
	void*		_Work_;		// 内部保持 スレッド処理用ワークエリア

}FW_PIN;
// ファイル読込FB用入出力構造体
typedef struct {
	T_BOOL		Execute;	// 入力1:実行信号
	T_STRING	FileName;	// 入力2:書込ファイルパス
	T_UDINT		Offset;		// 入力3:書込位置オフセット
	T_UDINT		Size;		// 入力5:書込Byteサイズ
	T_BOOL		Done;		// 出力1:書込完了信号
	T_BOOL		Busy;		// 出力2:処理中信号
	T_BOOL		Err;		// 出力3:エラー発生信号
	T_UINT		ErrID;		// 出力4:エラーコード
	P_ANY		ReadData;	// 入出力4:書込むバイナリデータ
	T_BOOL		_Execute_;	// 内部保持 前回実行信号
	void*		_Work_;		// 内部保持 スレッド処理用ワークエリア

}FR_PIN;

// 書込みスレッド作業用ワークエリア構造体
struct WriteWorkArea
{
	char	FilePath[81];			// ファイルパス
	size_t	WriteSize;				// サイズ
	T_TYPE	WriteDataType;			// データ型
	BYTE	WriteDataBody[1024];	// データ本体
	T_BOOL	Done;					// 出力:書込完了信号
	T_BOOL	Busy;					// 出力:処理中信号
	T_BOOL	Err;					// 出力:エラー発生信号
	T_UINT	ErrID;					// 出力:エラーコード
};

// 読込みスレッド作業用ワークエリア構造体
struct ReadWorkArea
{
	char	FilePath[81];			// ファイルパス
	size_t	ReadSize;				// サイズ
	T_UDINT Offset;					// オフセット
	T_TYPE	ReadDataType;			// データ型
	BYTE	ReadDataBody[1024];	// データ本体
	T_BOOL	Done;					// 出力:書込完了信号
	T_BOOL	Busy;					// 出力:処理中信号
	T_BOOL	Err;					// 出力:エラー発生信号
	T_UINT	ErrID;					// 出力:エラーコード
	
};
/*
* ファイル入出力FBのエラーIDを返します(内部関数)
*/
WORD  ReturnErrorID(DWORD ErrorCode)
{
	WORD ret = 0;
	switch (ErrorCode)
	{
	case E_EXIST:				// ファイルパス不正
		ret = FUNC_FIO_PATH;
		break;
	case E_FACCESS:				// アクセス失敗
		ret = FUNC_FIO_ACSS;
		break;
	case E_IOMEM:				// メモリ不足
		ret = FUNC_FIO_MEM;
		break;
	default:					// その他エラー
		ret = FUNC_FIO_ERR;
		break;
	}

	return ret;
}

// データ型に対応するバイトサイズを返します
WORD ReturnDataSize(T_TYPE data)
{
	WORD udiRet = 0;
	switch (data)
	{
	case D_BOOL:
	case D_BYTE:
	case D_SINT:
	case D_USINT:
		udiRet = 1;
		break;
	case D_INT:
	case D_UINT:
	case D_WORD:
		udiRet = 2;
		break;
	case D_DINT:
	case D_UDINT:
	case D_DWORD:
	case D_REAL:
		udiRet = 4;
		break;
	case D_LINT:
	case D_ULINT:
	case D_QWORD:
	case D_LREAL:
		udiRet = 8;
		break;
	case D_STRING:
		udiRet = 83;
		break;
		// D_ARRAY、D_STRUCTについては後ほど実装する
	default:
		udiRet = 0;
		break;
	}
	return udiRet;
}

/**************************************************************************
FUNCTION:            FileWriteThread
* PARAMETERS:                FW_PIN
* RETURNS: 　　　　　　　　　なし
* DESCRIPTION: ファイル書き込みスレッド.
\**************************************************************************/
void    FileWriteThread(LPVOID p)
{
	FW_PIN* pin = (FW_PIN*)p;
	FILE *fp = NULL;
	T_UDINT udiRet = 0;	// 書込んだデータ個数
	DWORD dwErr = 0;
	T_UDINT udiSize = 0;
	T_STRING* pStr;
	struct WriteWorkArea *work = (struct WriteWorkArea*)pin->_Work_;
#ifdef _DEBUG
	printf("FileWriteTread started\n");
#endif

	// ファイルを追記モードでオープン(なければ作成)
	fp = fopen(work->FilePath, "ab");
	if (fp == NULL)	// ファイルオープン失敗
	{
		// エラー処理
		work->Err = TRUE;
		work->Busy = FALSE;
		dwErr = GetLastRtError();			// エラーコード取得
		work->ErrID = ReturnErrorID(dwErr);	// PLPC用ファイル操作エラーIDセット		
	}
	else	// ファイルオープン成功
	{

		udiSize = ReturnDataSize(work->WriteDataType);			// 書き込み型に応じたサイズを取得
		udiSize = (work->WriteSize > udiSize) ? udiSize : pin->Size; // 指定された書込みサイズとデータ型のサイズを比較して、実際の書き込みサイズを判定 
		if (work->WriteDataType == D_STRING)	// 書込み型が文字列の場合
		{
			pStr = (T_STRING*)work->WriteDataBody;
			udiRet = (T_UDINT)fwrite((const void*)pStr->string, udiSize, 1, fp);	// 文字列部分のみファイル書込み
			printf("%s, 0x%x, %d\n", pStr->string, work->WriteDataType, (int)work->WriteSize);
		}
		else  // 数値型の場合
		{
			udiRet = (T_UDINT)fwrite(work->WriteDataBody, udiSize, 1, fp);	// バイト配列として先頭からファイル書込み
		}
		fclose(fp);
		work->Busy = FALSE;	// 状態：書き込み終了をセット
		// 書込み終了時チェック
		if (udiRet == 1) // 書込み正常終了
		{
			work->Done = TRUE;
		}
		else // 書き込みエラー発生
		{
			// エラー処理
			work->Err = TRUE;
			dwErr = GetLastRtError();			// エラーコード取得
			if (dwErr == 0)						// エラーコード取得できなかった場合(ディスク容量オーバーなど)
				dwErr = errno;					// ferror関数のエラーコードをセット
			work->ErrID = ReturnErrorID(dwErr);	// PLPC用ファイル操作エラーIDセット	
		}
	}

#ifdef _DEBUG
	printf("FileWriteTread finished\n");
#endif
}

/**************************************************************************
FUNCTION:            FileReadThread
* PARAMETERS:                FR_PIN
* RETURNS: 　　　　　　　　　なし
* DESCRIPTION: ファイル読込スレッド.
\**************************************************************************/
void    FileReadThread(FR_PIN* pin)
{
	FILE *fp = NULL;
	T_UDINT udiRet = 0;	// 書込んだデータ個数
	DWORD dwErr = 0;
	T_UDINT udiSize = 0;
	T_STRING* pStr;
	struct ReadWorkArea *work = (struct ReadWorkArea*)pin->_Work_;
#ifdef _DEBUG
	printf("FileReadTread started\n");
#endif
	// ファイルを読込モードでオープン
	fp = fopen(work->FilePath, "r");
	if (fp == NULL)	// ファイルオープン失敗
	{
		// エラー処理
		work->Err = TRUE;
		work->Busy = FALSE;
		dwErr = GetLastRtError();			// エラーコード取得
		work->ErrID = ReturnErrorID(dwErr);	// PLPC用ファイル操作エラーIDセット
	}
	else	// ファイルオープン成功
	{
		// ファイルポインタ位置移動
		if (fseek(fp, work->Offset, SEEK_SET) != 0) // ファイルポインタ移動に失敗した場合
		{
			fclose(fp);
			// エラー処理
			work->Err = TRUE;
			work->Busy = FALSE;	// 状態：読み込み終了をセット
			dwErr = GetLastRtError();			// エラーコード取得
			work->ErrID = ReturnErrorID(dwErr);	// PLPC用ファイル操作エラーIDセット
		}
		else // ファイルポインタ移動成功
		{
			udiSize = ReturnDataSize(work->ReadDataType);
			udiSize = (work->ReadSize > udiSize) ? udiSize : pin->Size; // 指定された書込みサイズとデータ型のサイズを比較して、実際の書き込みサイズを判定 
			if (work->ReadDataType == D_STRING)	// 読み込み型が文字列の場合
			{
				pStr = (T_STRING*)work->ReadDataBody;
				udiRet = (T_UDINT)fread(pStr->string, udiSize, 1, fp);	// 文字列のボディにファイル読込みデータをセット
			}
			else
			{
				udiRet = (T_UDINT)fread(work->ReadDataBody, udiSize, 1, fp);	// バイト配列としてファイル読込みデータをセット
			}

			fclose(fp);
			work->Busy = FALSE;	// 状態：読み込み終了をセット
			// 読み込み終了時チェック
			if (udiRet == 1) // 正常終了
			{
				work->Done = TRUE;
			}
			else // エラー発生
			{
				// エラー処理
				work->Err = TRUE;
				dwErr = GetLastRtError();			// エラーコード取得
				work->ErrID = ReturnErrorID(dwErr);	// PLPC用ファイル操作エラーIDセット	
			}
		}
	}

#ifdef _DEBUG
	printf("FileReadTread finished\n");
#endif
}

/*
*	ファイル操作用ラッパー関数
*   mode:1 (書込み) 2(読込み)
*/
void FileOperation(void* pin, T_BYTE mode)
{
	if (mode == 1)
	{
		// ファイル書き込み用スレッド生成
		CreateRtThread(150, FileWriteThread, 4096, (void*)pin);
	}
	else if (mode == 2)
	{
		// ファイル読み込み用スレッド生成
		CreateRtThread(150, FileReadThread, 4096, (void*)pin);
	}
}

/*
*  ファイル書込
*/
PLCPFB_API void FileWrite(PVOID instance)
{
	struct WriteWorkArea* workarea;

	FW_PIN *pin = (FW_PIN*)instance;

	// 初期化作業
	if (pin->_Work_ == NULL)
	{
		size_t		worksize = sizeof(struct WriteWorkArea);
		workarea = (struct WriteWorkArea*)malloc(worksize);	// スレッド処理用ワークエリア確保
		memset(workarea, 0, worksize);	// ゼロクリア
		pin->_Work_ = (void*)workarea; // ワークエリアのアドレスをパラメータにセット
	}
	else
		workarea = (struct WriteWorkArea*)pin->_Work_;	// ワークエリアの取り出し

	// 出力初期化
	if ((pin->Execute == FALSE && pin->Done == TRUE)
		|| (pin->Execute == FALSE && pin->Err == TRUE)) // 実行完了(成否問わず)時にExecuteがOFF
	{
		// 状態の初期化
		pin->ErrID = 0;
		pin->Done = FALSE;
		pin->Err = FALSE;
	}

	// 書込み指令発生
	if (pin->_Execute_ == FALSE
		&& pin->Execute == TRUE
		&& pin->Busy == FALSE)		// 非実行中のExecute立ち上がり検知
	{
		// 関数呼び出し：ファイル書き込み
		pin->Busy = TRUE;	// 状態：書き込み中をセット
		// 入力チェック
		if (pin->FileName.string == NULL)	// ファイルパスがNULL
		{
			// エラー発生
			pin->Err = TRUE;
			pin->Busy = FALSE;
			pin->ErrID = FUNC_FIO_PATH;		// ファイルパス不正
			goto END;
		}
		else if (pin->FileName.string[0] == '\0')// ファイルパスが空
		{
			// エラー発生
			pin->Err = TRUE;
			pin->Busy = FALSE;
			pin->ErrID = FUNC_FIO_PATH;		// ファイルパス不正
			goto END;
		}
		else if (pin->WriteData == NULL)	// 書き込みデータがNULL
		{
			// エラー発生
			pin->Err = TRUE;
			pin->Busy = FALSE;
			pin->ErrID = FUNC_FIO_STR;
			goto END;
		}
		else if (pin->Size == 0)	// 書込みサイズが0
		{
			// エラー発生
			pin->Err = TRUE;
			pin->Busy = FALSE;
			pin->ErrID = FUNC_FIO_SIZE;
			goto END;
		}
		// スレッド処理用パラメータスナップショット取得
		strcpy(workarea->FilePath, pin->FileName.string);	//ファイルパスデータ
		workarea->WriteSize = pin->Size;					//書込みサイズデータ
		workarea->WriteDataType = pin->WriteData->Type;		//データ型
		workarea->Done = FALSE;								//完了出力初期化
		workarea->Busy = TRUE;								//実行中出力初期化
		workarea->Err = FALSE;								//エラー出力初期化
		workarea->ErrID = 0;								//エラーID出力初期化
		size_t datalength = ReturnDataSize(pin->WriteData->Type);			// 書込みデータ本体サイズ取得
		memcpy(workarea->WriteDataBody, pin->WriteData->pVal, datalength);	// 書込みデータ

		FileOperation((void*)pin, 1);	// スレッド生成
	}
	//実行中か？
	else if(pin->Busy == TRUE)
	{
		//スレッドの処理結果(実行完了またはエラー)は出ているか？
		if ((workarea->Done==TRUE) || (workarea->Err == TRUE))
		{
			pin->Busy = FALSE;	//実行中解除

			//正常完了か？
			if (workarea->Done == TRUE)
			{
				pin->Done = TRUE;				//処理完了出力
				pin->Err = FALSE;				//エラー信号出力
				pin->ErrID = 0;					//エラーID出力
			}
			//エラー発生か？
			else
			{
				pin->Done = FALSE;				//処理完了出力
				pin->Err= TRUE;					//エラー信号出力
				pin->ErrID = workarea->ErrID;	//エラーID出力
			}
		}
		else
		{
			//処理完了待ちで何もしない
		}
	}
	

	END:
	//今回の信号を保持
	pin->_Execute_ = pin->Execute;
	
	return;
}

/*
*  ファイル読込
*/
PLCPFB_API void FileRead(PVOID instance)
{
	struct ReadWorkArea* workarea;

	FR_PIN *pin = (FR_PIN*)instance;

	// 初期化作業
	if (pin->_Work_ == NULL)
	{
		size_t		worksize = sizeof(struct ReadWorkArea);
		workarea = (struct ReadWorkArea*)malloc(sizeof(struct ReadWorkArea));	// スレッド処理用ワークエリア確保
		memset(workarea, 0, worksize);											// スレッド処理用ワークエリア初期化
		pin->_Work_ = (void*)workarea;											// ワークエリアのアドレスをパラメータにセット
	}
	else
		workarea = (struct ReadWorkArea*)pin->_Work_;							// ワークエリアの取り出し

	// 実行中に実行要求が落とされその後も継続していた処理が完了したか？
	if ((pin->Execute == FALSE && pin->Done == TRUE)
		|| (pin->Execute == FALSE && pin->Err == TRUE)) // 実行完了(成否問わず)時にExecuteがOFF
	{
		// 状態の初期化
		pin->ErrID = 0;
		pin->Done = FALSE;
		pin->Err = FALSE;
	}

	// 読込実行要求立上り検出したか？
	if (pin->_Execute_ == FALSE
		&& pin->Execute == TRUE
		&& pin->Busy == FALSE)		// 非実行中のExecute立ち上がり検知
	{
		pin->Busy = TRUE;			//Busy出力に実行中をセット

		// 入力チェック
		if (pin->FileName.string == NULL)	// ファイルパスが空
		{
			// エラー発生
			pin->Err = TRUE;
			pin->Busy = FALSE;
			pin->ErrID = FUNC_FIO_PATH;		// ファイルパス不正
			return;
		}
		else if (pin->ReadData->pString == NULL)	// 読込バッファがNULL
		{
			// エラー発生
			pin->Err = TRUE;
			pin->Busy = FALSE;
			pin->ErrID = FUNC_FIO_BUF;
			return;
		}
		else if (pin->Size == 0)	// 読込サイズが0
		{
			// エラー発生
			pin->Err = TRUE;
			pin->Busy = FALSE;
			pin->ErrID = FUNC_FIO_SIZE;
			return;
		}
		// スレッド処理用パラメータスナップショット取得
		strcpy(workarea->FilePath,	pin->FileName.string);	//ファイルパスデータ
		workarea->ReadSize =		pin->Size;				//読込みサイズデータ
		workarea->ReadDataType =	pin->ReadData->Type;	//データ型
		workarea->Done = FALSE;								//完了出力初期化
		workarea->Busy = TRUE;								//実行中出力初期化
		workarea->Err = FALSE;								//エラー出力初期化
		workarea->ErrID = 0;								//エラーID出力初期化
		workarea->Offset =			pin->Offset;			// オフセット
		size_t datalength = ReturnDataSize(pin->ReadData->Type);			// 読込みデータ本体サイズ取得
		memcpy(workarea->ReadDataBody, pin->ReadData->pVal, datalength);	// 読込みデータ

		// 関数呼び出し：ファイル読込
		FileOperation((void*)pin, 2);
	}
	//実行中か？
	else if (pin->Busy == TRUE)
	{
		//スレッドの処理結果(実行完了またはエラー)は出ているか？
		if ((workarea->Done == TRUE) || (workarea->Err == TRUE))
		{
			pin->Busy = FALSE;	//実行中解除

			//正常完了か？
			if (workarea->Done == TRUE)
			{
				pin->Done = TRUE;				//処理完了出力
				pin->Err = FALSE;				//エラー信号出力
				pin->ErrID = 0;					//エラーID出力

				struct ReadWorkArea *work = (struct ReadWorkArea*)pin->_Work_;
				size_t datalength = ReturnDataSize(pin->ReadData->Type);			// 読込みデータ本体サイズ取得
				memcpy(pin->ReadData->pVal,work->ReadDataBody, datalength);
			}
			//エラー発生か？
			else
			{
				pin->Done = FALSE;				//処理完了出力
				pin->Err = TRUE;					//エラー信号出力
				pin->ErrID = workarea->ErrID;	//エラーID出力
			}
		}
		else
		{
			//処理完了待ちで何もしない
		}
	}

	//今回の信号を保持
	pin->_Execute_ = pin->Execute;

	return;
}

#pragma pack(pop)