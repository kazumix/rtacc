#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"


T_ANY		VARIANT_EMPTY = { 0 };


/// <summary>
/// —LŒø‚È•Ï”‚©”»’f‚·‚é
/// </summary>
/// <param name="test"></param>
/// <returns></returns>
BOOL Variant_IsEmpty(P_ANY target)
{
	return (target->Type != D_EMPTY);
}

/// <summary>
/// ‘‚«‚İ‹Ö~‘®«‚©‚ğ”»’f‚·‚é
/// </summary>
/// <param name="target"></param>
/// <returns></returns>
BOOL Variant_IsWriteable(P_ANY target)
{
	return (target->link->force);
}

T_LREAL Variant_Read_Lreal(P_ANY target)
{
	return *target->pLreal;
}

T_REAL Variant_Read_Real(P_ANY target)
{
	return *target->pReal;
}

T_LINT Variant_Read_Lint(P_ANY target)
{
	return *target->pLint;
}

T_DINT Variant_Read_Dint(P_ANY target)
{
	return *target->pDint;
}

T_INT Variant_Read_Int(P_ANY target)
{
	return *target->pInt;
}

T_SINT Variant_Read_Sint(P_ANY target)
{
	return *target->pSint;
}

T_ULINT Variant_Read_Ulint(P_ANY target)
{
	return *target->pUlint;
}

T_UDINT Variant_Read_Udint(P_ANY target)
{
	return *target->pUdint;
}

T_UINT Variant_Read_Uint(P_ANY target)
{
	return *target->pUint;
}

T_USINT Variant_Read_Usint(P_ANY target)
{
	return *target->pUsint;
}

T_QWORD Variant_Read_Qword(P_ANY target)
{
	return *target->pQword;
}

T_DWORD Variant_Read_Dword(P_ANY target)
{
	return *target->pDword;
}

T_WORD Variant_Read_Word(P_ANY target)
{
	return *target->pWord;
}

T_BYTE Variant_Read_Byte(P_ANY target)
{
	return *target->pByte;
}

T_BOOL Variant_Read_Bool(P_ANY target)
{
	return *target->pBool;
}

T_STRING Variant_Read_String(P_ANY target)
{
	return *target->pString;
}

T_ARRAY Variant_Read_Array(P_ANY target)
{
	return *target->pArray;
}

void Variant_Write_Lreal(P_ANY target ,T_LREAL val)
{
	target->Type = D_LREAL;
	if (Variant_IsWriteable(target))
		*target->pLreal = val;
}

void Variant_Write_Real(P_ANY target, T_REAL val)
{
	target->Type = D_REAL;
	if (Variant_IsWriteable(target))
		*target->pReal = val;
}

void Variant_Write_Lint(P_ANY target, T_LINT val)
{
	target->Type = D_LINT;
	if (Variant_IsWriteable(target))
		*target->pLint = val;
}

void Variant_Write_Dint(P_ANY target, T_DINT val)
{
	target->Type = D_DINT;
	if (Variant_IsWriteable(target))
		*target->pDint = val;
}

void Variant_Write_Int(P_ANY target, T_INT val)
{
	target->Type = D_INT;
	if (Variant_IsWriteable(target))
		*target->pInt = val;
}

void Variant_Write_Sint(P_ANY target, T_SINT val)
{
	target->Type = D_SINT;
	if (Variant_IsWriteable(target))
		*target->pSint = val;
}

void Variant_Write_Ulint(P_ANY target, T_ULINT val)
{
	target->Type = D_ULINT;
	if (Variant_IsWriteable(target))
		*target->pUlint = val;
}

void Variant_Write_Udint(P_ANY target, T_UDINT val)
{
	target->Type = D_UDINT;
	if (Variant_IsWriteable(target))
		*target->pUdint = val;
}

void Variant_Write_Uint(P_ANY target, T_UINT val)
{
	target->Type = D_UINT;
	if (Variant_IsWriteable(target))
		*target->pUint = val;
}

void Variant_Write_Usint(P_ANY target, T_USINT val)
{
	target->Type = D_USINT;
	if (Variant_IsWriteable(target))
		*target->pUsint = val;
}

void Variant_Write_Qword(P_ANY target, T_QWORD val)
{
	target->Type = D_QWORD;
	if (Variant_IsWriteable(target))
		*target->pQword = val;
}

void Variant_Write_Dword(P_ANY target, T_DWORD val)
{
	target->Type = D_DWORD;
	if (Variant_IsWriteable(target))
		*target->pDword = val;
}

void Variant_Write_Word(P_ANY target, T_WORD val)
{
	target->Type = D_WORD;
	if (Variant_IsWriteable(target))
		*target->pWord = val;
}

void Variant_Write_Byte(P_ANY target, T_BYTE val)
{
	target->Type = D_BYTE;
	if (Variant_IsWriteable(target))
		*target->pByte = val;
}

void Variant_Write_Bool(P_ANY target, T_BOOL val)
{
	target->Type = D_BOOL;
	if (Variant_IsWriteable(target))
		*target->pBool = val;
}

void Variant_Write_String(P_ANY target, T_STRING val)
{
	target->Type = D_STRING;
	if (Variant_IsWriteable(target))
		*target->pString = val;
}

void Variant_Write_Array(P_ANY target, T_ARRAY val)
{
	target->Type = D_ARRAY;
	if (Variant_IsWriteable(target))
		*target->pArray = val;
}

void Variant_Write(P_ANY dst, P_ANY src)
{
	dst->Type = src->Type;
	if( Variant_IsWriteable(dst) )
		*dst->pQword = *src->pQword;
}

union ANYVAL Variant_Read(P_ANY src)
{
	union ANYVAL	dst = { 0 };
	switch (src->Type)
	{
	case D_QWORD:	dst.ullVal = *src->pQword;			break;
	case D_DWORD:	dst.ulVal = *src->pDword;			break;
	case D_WORD:	dst.uiVal = *src->pWord;			break;
	case D_BYTE:	dst.bVal = *src->pByte;				break;
	case D_LINT:	dst.llVal = *src->pLint;			break;
	case D_DINT:	dst.lVal = *src->pDint;				break;
	case D_INT:		dst.iVal = *src->pInt;				break;
	case D_SINT:	dst.cVal = *src->pSint;				break;
	case D_ULINT:	dst.ullVal = *src->pUlint;			break;
	case D_UDINT:	dst.ulVal = *src->pUdint;			break;
	case D_UINT:	dst.uiVal = *src->pUint;			break;
	case D_USINT:	dst.bVal = *src->pUsint;			break;
	case D_LREAL:	dst.dblVal = *src->pLreal;			break;
	case D_REAL:	dst.fltVal = *src->pReal;			break;
	case D_STRING:	dst.pStr = src->pString;			break;
	case D_ARRAY:	dst.pArray = src->pArray;			break;
	case D_STRUCT:	dst.pArray = src->pArray;			break;
	case D_TIME:	dst.date = *src->pTime;				break;
	case D_BOOL:	dst.boolVal = *src->pBool;			break;
	}
	return dst;
}