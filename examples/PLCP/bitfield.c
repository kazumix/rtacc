#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

/// <summary>
/// ビットフィールド指定の有無をチェックします
/// </summary>
/// <param name="argument">引数文字列</param>
/// <returns>ビットフィールド情報</returns>
BITFIELD Bitfield_Check(char *argument)
{
    BITFIELD bitfield = {0};
    
    // アーギュメントなしはスキップ
    if (argument == NULL)
        return bitfield;

    // アーギュメント文字列の末尾が ".X16" のように、".X"と数値(0~63)で指定される場合
    // ビット指定子と判断できる
    char* rchr;
    int bitpos = -1;
    int numscan;
    
    // アーギュメント中の最後のピリオドを探します
    rchr = strrchr(argument, '.');
    if (rchr != NULL)
    {
        // ピリオドがあったのでビット位置数値の取得を試みる
        numscan = sscanf(rchr, ".X%d", &bitpos);
        if ((numscan == 1) && (bitpos >= 0) && (bitpos <= 63))
        {
            // 妥当なビット位置ならばビットフィールド情報を設定
            bitfield.use = TRUE;
            bitfield.offset = (BYTE)bitpos;
            bitfield.value = 0;
        }
    }

    return bitfield;
} 

/// <summary>
/// ビットフィールドを考慮したLD命令/ST命令
/// </summary>

void LD_byte(void* result, void* any)
{
	P_ANY a = (P_ANY)any;
	if (a->bitfield.use)
	{
		*(BYTE*)result = BOOLPOS(*a->pByte >> a->bitfield.offset) & 0x01;
	}
	else
	{
		*(BYTE*)result = (a->Type == D_BOOL) ? BOOLPOS(*a->pBool) : *a->pByte;
	}
}

void LDN_byte(void* result, void* any)
{
	P_ANY a = (P_ANY)any;
	if (a->bitfield.use)
	{
		*(BYTE*)result = BOOLNEG(*a->pByte >> a->bitfield.offset) & 0x01;
	}
	else
	{
		*(BYTE*)result = (a->Type == D_BOOL) ? BOOLNEG(*a->pBool) : INVERT(*a->pByte);
	}
}

void LD_word(void* result, void* any)
{
	P_ANY a = (P_ANY)any;
	if (a->bitfield.use)
	{
		*(WORD*)result = (*a->pWord >> a->bitfield.offset) & 0x01;
	}
	else
	{
		*(WORD*)result = *a->pWord;
	}
}

void LDN_word(void* result, void* any)
{
	P_ANY a = (P_ANY)any;
	if (a->bitfield.use)
	{
		*(WORD*)result = INVERT(*a->pWord >> a->bitfield.offset) & 0x01;
	}
	else
	{
		*(WORD*)result = INVERT(*a->pWord);
	}
}

void LD_dword(void* result, void* any)
{
	P_ANY a = (P_ANY)any;
	if (a->bitfield.use)
	{
		*(DWORD*)result = (*a->pDword >> a->bitfield.offset) & 0x01;
	}
	else
	{
		*(DWORD*)result = *a->pDword;
	}
}

void LDN_dword(void* result, void* any)
{
	P_ANY a = (P_ANY)any;
	if (a->bitfield.use)
	{
		*(DWORD*)result = INVERT(*a->pDword >> a->bitfield.offset) & 0x01;
	}
	else
	{
		*(DWORD*)result = INVERT(*a->pDword);
	}
}

void LD_qword(void* result, void* any)
{
	P_ANY a = (P_ANY)any;
	Variable_Copy64((union ANYVAL*)result, (union ANYVAL*)a->pQword);
}

void LDN_qword(void* result, void* any)
{
	P_ANY a = (P_ANY)any;
	Variable_Copy64((union ANYVAL*)result, (union ANYVAL*)INVERT(*a->pQword));
}

void LD_string(void* result, void* any)
{
	P_ANY a = (P_ANY)any;
	String_Copy((P_STRING)result, (P_STRING)a->pString);
}

void ST_string(void* any, void* result)
{
	P_ANY a = (P_ANY)any;
	String_Copy((P_STRING)a->pString, (P_STRING)result);
}

void ST_byte(void* any, void* result)
{
	P_ANY a = (P_ANY)any;
	if (a->bitfield.use)
	{
		*a->pByte &= ~(1 << a->bitfield.offset);
		*a->pByte |= ((*(BYTE*)result & 0x01) << a->bitfield.offset);
	}
	else
	{
		*a->pByte = *(BYTE*)result;
	}
}

void STN_byte(void* any, void* result)
{
	P_ANY a = (P_ANY)any;
	if (a->bitfield.use)
	{
		*a->pByte &= ~(1 << a->bitfield.offset);
		*a->pByte |= ((~(*(BYTE*)result) & 0x01) << a->bitfield.offset);
	}
	else
	{
		*a->pByte = ~(*(BYTE*)result);
	}
}

void ST_word(void* any, void* result)
{
	P_ANY a = (P_ANY)any;
	if (a->bitfield.use)
	{
		*a->pWord &= ~(1 << a->bitfield.offset);
		*a->pWord |= ((*(WORD*)result & 0x01) << a->bitfield.offset);
	}
	else
	{
		*a->pWord = *(WORD*)result;
	}
}

void STN_word(void* any, void* result)
{
	P_ANY a = (P_ANY)any;
	if (a->bitfield.use)
	{
		*a->pWord &= ~(1 << a->bitfield.offset);
		*a->pWord |= ((~(*(WORD*)result) & 0x01) << a->bitfield.offset);
	}
	else
	{
		*a->pWord = ~(*(WORD*)result);
	}
}

void ST_dword(void* any, void* result)
{
	P_ANY a = (P_ANY)any;
	if (a->bitfield.use)
	{
		*a->pDword &= ~(1 << a->bitfield.offset);
		*a->pDword |= ((*(DWORD*)result & 0x01) << a->bitfield.offset);
	}
	else
	{
		*a->pDword = *(DWORD*)result;
	}
}

void STN_dword(void* any, void* result)
{
	P_ANY a = (P_ANY)any;
	if (a->bitfield.use)
	{
		*a->pDword &= ~(1 << a->bitfield.offset);
		*a->pDword |= ((~(*(DWORD*)result) & 0x01) << a->bitfield.offset);
	}
	else
	{
		*a->pDword = ~(*(DWORD*)result);
	}
}

void ST_qword(void* any, void* result)
{
	P_ANY a = (P_ANY)any;
	Variable_Copy64((union ANYVAL*)a->pQword, (union ANYVAL*)result);
}

void STN_qword(void* any, void* result)
{
	P_ANY a = (P_ANY)any;
	QWORD inverted = ~(*(QWORD*)result);
	Variable_Copy64((union ANYVAL*)a->pQword, (union ANYVAL*)&inverted);
}
