/// <summary>
/// PLC plus IEC Function + EN / ENO
/// 
/// Ç±ÇÃÉÇÉWÉÖÅ[ÉãÇÕÅAÇ±ÇÃÉâÉCÉuÉâÉäÇ™ä‹ÇﬁÉtÉ@ÉìÉNÉVÉáÉì
/// ÇÉeÅ[ÉuÉãÇ≈íËã`ÇµÇ‹Ç∑
/// </summary>

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "common.h"
#include "PLCPEN.h"

// Ç±ÇÃÉÇÉWÉÖÅ[ÉãÇÃç\ë¢ëÃíËã`ÇÕ1ÉoÉCÉgÉAÉâÉCÉìÇ™ïKóvÇ≈Ç∑
#pragma pack(push,1)

/// <summary>
/// EN/ENOÇ¬Ç´ÉtÉ@ÉìÉNÉVÉáÉì 
/// </summary>
//ò_óùââéZ
PLCPEN_API void AND_EN(PVOID instance);	    // ò_óùêœ
PLCPEN_API void NOT_EN(PVOID instance);	    // ò_óùî€íË
PLCPEN_API void OR_EN(PVOID instance);	    // ò_óùòa
PLCPEN_API void XOR_EN(PVOID instance);	    // îrëºìIò_óùòa
PLCPEN_API void ANDN_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùêœ
PLCPEN_API void ORN_EN(PVOID instance);	    // IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùòa
PLCPEN_API void XORN_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃîrëºìIò_óùòa
PLCPEN_API void AND_BOOL_EN(PVOID instance);	// ò_óùêœ
PLCPEN_API void AND_BYTE_EN(PVOID instance);	// ò_óùêœ
PLCPEN_API void AND_WORD_EN(PVOID instance);	// ò_óùêœ
PLCPEN_API void AND_DWORD_EN(PVOID instance);	// ò_óùêœ
PLCPEN_API void ANDN_BOOL_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùêœ
PLCPEN_API void ANDN_BYTE_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùêœ
PLCPEN_API void ANDN_WORD_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùêœ
PLCPEN_API void ANDN_DWORD_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùêœ
PLCPEN_API void NOT_BOOL_EN(PVOID instance);	// ò_óùî€íË
PLCPEN_API void NOT_BYTE_EN(PVOID instance);	// ò_óùî€íË
PLCPEN_API void NOT_WORD_EN(PVOID instance);	// ò_óùî€íË
PLCPEN_API void NOT_DWORD_EN(PVOID instance);	// ò_óùî€íË
PLCPEN_API void OR_BOOL_EN(PVOID instance);	    // ò_óùòa
PLCPEN_API void OR_BYTE_EN(PVOID instance);	    // ò_óùòa
PLCPEN_API void OR_WORD_EN(PVOID instance);	    // ò_óùòa
PLCPEN_API void OR_DWORD_EN(PVOID instance);	// ò_óùòa
PLCPEN_API void ORN_BOOL_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùòa
PLCPEN_API void ORN_BYTE_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùòa
PLCPEN_API void ORN_WORD_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùòa
PLCPEN_API void ORN_DWORD_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùòa
PLCPEN_API void XOR_BOOL_EN(PVOID instance);	// îrëºìIò_óùòa
PLCPEN_API void XOR_BYTE_EN(PVOID instance);	// îrëºìIò_óùòa
PLCPEN_API void XOR_WORD_EN(PVOID instance);	// îrëºìIò_óùòa
PLCPEN_API void XOR_DWORD_EN(PVOID instance);	// îrëºìIò_óùòa
PLCPEN_API void XORN_BOOL_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃîrëºìIò_óùòa
PLCPEN_API void XORN_BYTE_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃîrëºìIò_óùòa
PLCPEN_API void XORN_WORD_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃîrëºìIò_óùòa
PLCPEN_API void XORN_DWORD_EN(PVOID instance);	// IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃîrëºìIò_óùòa
//å^ïœä∑
PLCPEN_API void BOOL_TO_BYTE_EN(PVOID instance);	// BOOLå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
PLCPEN_API void BOOL_TO_WORD_EN(PVOID instance);	// BOOLå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void BOOL_TO_DWORD_EN(PVOID instance);	// BOOLå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void BOOL_TO_SINT_EN(PVOID instance);	// BOOLå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BOOL_TO_INT_EN(PVOID instance);	    // BOOLå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BOOL_TO_DINT_EN(PVOID instance);	// BOOLå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BOOL_TO_USINT_EN(PVOID instance);	// BOOLå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BOOL_TO_UINT_EN(PVOID instance);	// BOOLå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BOOL_TO_UDINT_EN(PVOID instance);	// BOOLå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BOOL_TO_REAL_EN(PVOID instance);	// BOOLå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
PLCPEN_API void BOOL_TO_LREAL_EN(PVOID instance);	// BOOLå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
PLCPEN_API void BOOL_TO_LINT_EN(PVOID instance);	// BOOLå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BYTE_TO_BOOL_EN(PVOID instance);	// BYTEå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
PLCPEN_API void BYTE_TO_WORD_EN(PVOID instance);	// BYTEå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void BYTE_TO_DWORD_EN(PVOID instance);	// BYTEå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void BYTE_TO_SINT_EN(PVOID instance);	// BYTEå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BYTE_TO_INT_EN(PVOID instance);	    // BYTEå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BYTE_TO_DINT_EN(PVOID instance);	// BYTEå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BYTE_TO_USINT_EN(PVOID instance);	// BYTEå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BYTE_TO_UINT_EN(PVOID instance);	// BYTEå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BYTE_TO_UDINT_EN(PVOID instance);	// BYTEå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BYTE_TO_LREAL_EN(PVOID instance);	// BYTEå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
PLCPEN_API void BYTE_TO_LINT_EN(PVOID instance);	// BYTEå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void BYTE_TO_REAL_EN(PVOID instance);	// BYTEå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_BOOL_EN(PVOID instance);	// WORDå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_BYTE_EN(PVOID instance);	// WORDå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_DWORD_EN(PVOID instance);	// WORDå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_SINT_EN(PVOID instance);	// WORDå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_INT_EN(PVOID instance);	    // WORDå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_DINT_EN(PVOID instance);	// WORDå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_USINT_EN(PVOID instance);	// WORDå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_UINT_EN(PVOID instance);	// WORDå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_UDINT_EN(PVOID instance);	// WORDå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_REAL_EN(PVOID instance);	// WORDå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_LREAL_EN(PVOID instance);	// WORDå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_LINT_EN(PVOID instance);	// WORDå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_BOOL_EN(PVOID instance);	// DWORDå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_BYTE_EN(PVOID instance);	// DWORDå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_WORD_EN(PVOID instance);	// DWORDå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_SINT_EN(PVOID instance);	// DWORDå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_INT_EN(PVOID instance);	// DWORDå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_DINT_EN(PVOID instance);	// DWORDå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_USINT_EN(PVOID instance);	// DWORDå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_UINT_EN(PVOID instance);	// DWORDå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_UDINT_EN(PVOID instance);	// DWORDå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_REAL_EN(PVOID instance);	// DWORDå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_LREAL_EN(PVOID instance);	// DWORDå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_LINT_EN(PVOID instance);	// DWORDå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_BOOL_EN(PVOID instance);	// SINTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_BYTE_EN(PVOID instance);	// SINTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_WORD_EN(PVOID instance);	// SINTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_DWORD_EN(PVOID instance);	// SINTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_INT_EN(PVOID instance);	    // SINTå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_DINT_EN(PVOID instance);	// SINTå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_USINT_EN(PVOID instance);	// SINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_UINT_EN(PVOID instance);	// SINTå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_UDINT_EN(PVOID instance);	// SINTå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_REAL_EN(PVOID instance);	// SINTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_LREAL_EN(PVOID instance);	// SINTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_B_BCD_EN(PVOID instance);	// SINTå^Ç©ÇÁB_BCDå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_W_BCD_EN(PVOID instance);	// SINTå^Ç©ÇÁW_BCDå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_D_BCD_EN(PVOID instance);	// SINTå^Ç©ÇÁD_BCDå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_LINT_EN(PVOID instance);	// SINTå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_BOOL_EN(PVOID instance);	    // INTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_BYTE_EN(PVOID instance);	    // INTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_WORD_EN(PVOID instance);	    // INTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_DWORD_EN(PVOID instance);	// INTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_SINT_EN(PVOID instance);	    // INTå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_DINT_EN(PVOID instance);	    // INTå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_UINT_EN(PVOID instance);	    // INTå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_USINT_EN(PVOID instance);	// INTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_UDINT_EN(PVOID instance);	// INTå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_REAL_EN(PVOID instance);	    // INTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_LREAL_EN(PVOID instance);	// INTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_B_BCD_EN(PVOID instance);	// INTå^Ç©ÇÁB_BCDå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_W_BCD_EN(PVOID instance);	// INTå^Ç©ÇÁW_BCDå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_D_BCD_EN(PVOID instance);	// INTå^Ç©ÇÁD_BCDå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_LINT_EN(PVOID instance);	    // INTå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_BOOL_EN(PVOID instance);	// DINTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_BYTE_EN(PVOID instance);	// DINTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_WORD_EN(PVOID instance);    // DINTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_DWORD_EN(PVOID instance);	// DINTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_SINT_EN(PVOID instance);    // DINTå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_INT_EN(PVOID instance);	    // DINTå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_UINT_EN(PVOID instance);    // DINTå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_USINT_EN(PVOID instance);	// DINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_UDINT_EN(PVOID instance);	// DINTå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_REAL_EN(PVOID instance);	// DINTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_LREAL_EN(PVOID instance);	// DINTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_B_BCD_EN(PVOID instance);	// DINTå^Ç©ÇÁB_BCDå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_W_BCD_EN(PVOID instance);	// DINTå^Ç©ÇÁW_BCDå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_D_BCD_EN(PVOID instance);	// DINTå^Ç©ÇÁD_BCDå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_LINT_EN(PVOID instance);	// DINTå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_TIME_EN(PVOID instance);	// DINTå^Ç©ÇÁTIMEå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_BOOL_EN(PVOID instance);	// USINTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_BYTE_EN(PVOID instance);	// USINTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_WORD_EN(PVOID instance);   // USINTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_DWORD_EN(PVOID instance);	// USINTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_SINT_EN(PVOID instance);   // USINTå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_INT_EN(PVOID instance);	// USINTå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_UINT_EN(PVOID instance);   // USINTå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_DINT_EN(PVOID instance);	// USINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_UDINT_EN(PVOID instance);	// USINTå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_REAL_EN(PVOID instance);	// USINTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_LREAL_EN(PVOID instance);	// USINTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_LINT_EN(PVOID instance);	// USINTå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_BOOL_EN(PVOID instance);	// UINTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_BYTE_EN(PVOID instance);	// UINTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_WORD_EN(PVOID instance);    // UINTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_DWORD_EN(PVOID instance);	// UINTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_SINT_EN(PVOID instance);    // UINTå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_INT_EN(PVOID instance);	    // UINTå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_USINT_EN(PVOID instance);   // UINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_DINT_EN(PVOID instance);	// UINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_UDINT_EN(PVOID instance);	// UINTå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_REAL_EN(PVOID instance);	// UINTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_LREAL_EN(PVOID instance);	// UINTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_LINT_EN(PVOID instance);	// UINTå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_BOOL_EN(PVOID instance);	// UDINTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_BYTE_EN(PVOID instance);	// UDINTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_WORD_EN(PVOID instance);   // UDINTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_DWORD_EN(PVOID instance);	// UDINTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_SINT_EN(PVOID instance);   // UDINTå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_INT_EN(PVOID instance);	// UDINTå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_USINT_EN(PVOID instance);  // UDINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_DINT_EN(PVOID instance);	// UDINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_UINT_EN(PVOID instance);	// UDINTå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_REAL_EN(PVOID instance);	// UDINTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_LREAL_EN(PVOID instance);	// UDINTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_LINT_EN(PVOID instance);	// UDINTå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_BOOL_EN(PVOID instance);	// REALå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_BYTE_EN(PVOID instance);	// REALå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_WORD_EN(PVOID instance);	// REALå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_DWORD_EN(PVOID instance);	// REALå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_SINT_EN(PVOID instance);	// REALå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_INT_EN(PVOID instance);	    // REALå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_DINT_EN(PVOID instance);	// REALå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_LINT_EN(PVOID instance);	// REALå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_USINT_EN(PVOID instance);	// REALå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_UINT_EN(PVOID instance);	// REALå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_UDINT_EN(PVOID instance);	// REALå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_LREAL_EN(PVOID instance);	// REALå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_BOOL_EN(PVOID instance);	// LREALå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_BYTE_EN(PVOID instance);	// LREALå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_WORD_EN(PVOID instance);	// LREALå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_DWORD_EN(PVOID instance);	// LREALå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_SINT_EN(PVOID instance);	// LREALå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_INT_EN(PVOID instance);	// LREALå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_DINT_EN(PVOID instance);	// LREALå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_LINT_EN(PVOID instance);	// LREALå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_USINT_EN(PVOID instance);	// LREALå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_UINT_EN(PVOID instance);	// LREALå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_UDINT_EN(PVOID instance);	// LREALå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_REAL_EN(PVOID instance);	// LREALå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_BOOL_EN(PVOID instance);	// LINTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_BYTE_EN(PVOID instance);	// LINTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_WORD_EN(PVOID instance);    // LINTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_DWORD_EN(PVOID instance);	// LINTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_SINT_EN(PVOID instance);    // LINTå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_INT_EN(PVOID instance);	    // LINTå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_UINT_EN(PVOID instance);    // LINTå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_USINT_EN(PVOID instance);	// LINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_UDINT_EN(PVOID instance);	// LINTå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_B_BCD_EN(PVOID instance);	// LINTå^Ç©ÇÁB_BCDå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_W_BCD_EN(PVOID instance);	// LINTå^Ç©ÇÁW_BCDå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_D_BCD_EN(PVOID instance);	// LINTå^Ç©ÇÁD_BCDå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_DINT_EN(PVOID instance);	// LINTå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_REAL_EN(PVOID instance);	// LINTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_LREAL_EN(PVOID instance);	// LINTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
PLCPEN_API void B_BCD_TO_SINT_EN(PVOID instance);	// B_BCDå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void B_BCD_TO_INT_EN(PVOID instance);	// B_BCDå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void B_BCD_TO_DINT_EN(PVOID instance);	// B_BCDå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void B_BCD_TO_LINT_EN(PVOID instance);	// B_BCDå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void W_BCD_TO_SINT_EN(PVOID instance);	// W_BCDå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void W_BCD_TO_INT_EN(PVOID instance);	// W_BCDå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void W_BCD_TO_DINT_EN(PVOID instance);	// W_BCDå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void W_BCD_TO_LINT_EN(PVOID instance);	// W_BCDå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void D_BCD_TO_SINT_EN(PVOID instance);	// D_BCDå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
PLCPEN_API void D_BCD_TO_INT_EN(PVOID instance);	// D_BCDå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
PLCPEN_API void D_BCD_TO_DINT_EN(PVOID instance);	// D_BCDå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
PLCPEN_API void D_BCD_TO_LINT_EN(PVOID instance);	// D_BCDå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
PLCPEN_API void TIME_TO_DINT_EN(PVOID instance);	// TIMEå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//ï∂éöóÒëÄçÏ
PLCPEN_API void EQ_STRING_EN(PVOID instance);	    // ï∂éöóÒî‰är(ìôÇµÇ¢Ç©)
PLCPEN_API void NE_STRING_EN(PVOID instance);	    // ï∂éöóÒî‰är(ìôÇµÇ≠Ç»Ç¢Ç©)
PLCPEN_API void GT_STRING_EN(PVOID instance);	    // ï∂éöóÒî‰är(ëÂÇ´Ç¢Ç©)
PLCPEN_API void GE_STRING_EN(PVOID instance);	    // ï∂éöóÒî‰är(ìôÇµÇ¢Ç©Ç‹ÇΩÇÕëÂÇ´Ç¢Ç©)
PLCPEN_API void LT_STRING_EN(PVOID instance);	    // ï∂éöóÒî‰är(è¨Ç≥Ç¢Ç©)
PLCPEN_API void LE_STRING_EN(PVOID instance);	    // ï∂éöóÒî‰är(ìôÇµÇ¢Ç©Ç‹ÇΩÇÕè¨Ç≥Ç¢Ç©)
PLCPEN_API void BYTE_TO_STRING_EN(PVOID instance);	// BYTEå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void WORD_TO_STRING_EN(PVOID instance);	// WORDå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void DWORD_TO_STRING_EN(PVOID instance);	// DWORDå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void SINT_TO_STRING_EN(PVOID instance);	// SINTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void INT_TO_STRING_EN(PVOID instance);	// INTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void DINT_TO_STRING_EN(PVOID instance);	// DINTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void LINT_TO_STRING_EN(PVOID instance);	// LINTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void USINT_TO_STRING_EN(PVOID instance);	// USINTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void UINT_TO_STRING_EN(PVOID instance);	// UINTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void UDINT_TO_STRING_EN(PVOID instance);	// UDINTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void REAL_TO_STRING_EN(PVOID instance);	// REALå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void LREAL_TO_STRING_EN(PVOID instance);	// LREALå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void TIME_TO_STRING_EN(PVOID instance);	// TIMEå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
PLCPEN_API void CONCAT_EN(PVOID instance);	        // ï∂éöóÒòAåã
PLCPEN_API void DELETE_STR_EN(PVOID instance);	    // ï∂éöóÒçÌèú
PLCPEN_API void INSERT_EN(PVOID instance);	        // ï∂éöóÒë}ì¸
PLCPEN_API void MID_EN(PVOID instance);             // ï∂éöóÒÉRÉsÅ[(íÜâõ)
PLCPEN_API void LEFT_EN(PVOID instance);            // ï∂éöóÒÉRÉsÅ[(ç∂)
PLCPEN_API void RIGHT_EN(PVOID instance);           // ï∂éöóÒÉRÉsÅ[(âE)
PLCPEN_API void FIND_EN(PVOID instance);            // ï∂éöóÒåüçı
PLCPEN_API void LEN_EN(PVOID instance);             // ï∂éöóÒí∑Ç≥
PLCPEN_API void REPLACE_EN(PVOID instance);             // ï∂éöóÒíuä∑
//ëIë
PLCPEN_API void MAX_EN(PVOID instance);	            // ëÂÇ´Ç¢ÇŸÇ§ÇèoóÕ
PLCPEN_API void MAX_SINT_EN(PVOID instance);	    // ëÂÇ´Ç¢ÇŸÇ§ÇèoóÕ(SINT)
PLCPEN_API void MAX_INT_EN(PVOID instance);	        // ëÂÇ´Ç¢ÇŸÇ§ÇèoóÕ(INT)
PLCPEN_API void MAX_DINT_EN(PVOID instance);	    // ëÂÇ´Ç¢ÇŸÇ§ÇèoóÕ(DINT)
PLCPEN_API void MAX_LINT_EN(PVOID instance);	    // ëÂÇ´Ç¢ÇŸÇ§ÇèoóÕ(LINT)
PLCPEN_API void MAX_REAL_EN(PVOID instance);	    // ëÂÇ´Ç¢ÇŸÇ§ÇèoóÕ(REAL)
PLCPEN_API void MAX_LREAL_EN(PVOID instance);	    // ëÂÇ´Ç¢ÇŸÇ§ÇèoóÕ(LREAL)
PLCPEN_API void MAX_STR_EN(PVOID instance);	        // ëÂÇ´Ç¢ÇŸÇ§ÇèoóÕ(STRING)
PLCPEN_API void MIN_EN(PVOID instance);	            // è¨Ç≥Ç¢ÇŸÇ§ÇèoóÕ
PLCPEN_API void MIN_SINT_EN(PVOID instance);	    // è¨Ç≥Ç¢ÇŸÇ§ÇèoóÕ(SINT)
PLCPEN_API void MIN_INT_EN(PVOID instance);	        // è¨Ç≥Ç¢ÇŸÇ§ÇèoóÕ(INT)
PLCPEN_API void MIN_DINT_EN(PVOID instance);	    // è¨Ç≥Ç¢ÇŸÇ§ÇèoóÕ(DINT)
PLCPEN_API void MIN_LINT_EN(PVOID instance);	    // è¨Ç≥Ç¢ÇŸÇ§ÇèoóÕ(LINT)
PLCPEN_API void MIN_REAL_EN(PVOID instance);	    // è¨Ç≥Ç¢ÇŸÇ§ÇèoóÕ(REAL)
PLCPEN_API void MIN_LREAL_EN(PVOID instance);	    // è¨Ç≥Ç¢ÇŸÇ§ÇèoóÕ(LREAL)
PLCPEN_API void MIN_STR_EN(PVOID instance);	        // è¨Ç≥Ç¢ÇŸÇ§ÇèoóÕ(STRING)
PLCPEN_API void SEL_EN(PVOID instance);	            // èoóÕëIë
PLCPEN_API void SEL_BOOL_EN(PVOID instance);	    // èoóÕëIë(BOOL)
PLCPEN_API void SEL_BYTE_EN(PVOID instance);	    // èoóÕëIë(BYTE)
PLCPEN_API void SEL_WORD_EN(PVOID instance);	    // èoóÕëIë(WORD)
PLCPEN_API void SEL_DWORD_EN(PVOID instance);	    // èoóÕëIë(DWORD)
PLCPEN_API void SEL_TIME_EN(PVOID instance);	    // èoóÕëIë(TIME)
PLCPEN_API void SEL_SINT_EN(PVOID instance);	    // èoóÕëIë(SINT)
PLCPEN_API void SEL_INT_EN(PVOID instance);	        // èoóÕëIë(INT)
PLCPEN_API void SEL_DINT_EN(PVOID instance);	    // èoóÕëIë(DINT)
PLCPEN_API void SEL_LINT_EN(PVOID instance);	    // èoóÕëIë(LINT)
PLCPEN_API void SEL_REAL_EN(PVOID instance);	    // èoóÕëIë(REAL)
PLCPEN_API void SEL_LREAL_EN(PVOID instance);	    // èoóÕëIë(LREAL)
PLCPEN_API void SEL_STRING_EN(PVOID instance);	    // èoóÕëIë(STRING)
PLCPEN_API void LIMIT_EN(PVOID instance);	        // ç≈è¨ílÅ`ç≈ëÂílèoóÕ
PLCPEN_API void LIMIT_SINT_EN(PVOID instance);	        // ç≈è¨ílÅ`ç≈ëÂílèoóÕ(SINT)
PLCPEN_API void LIMIT_INT_EN(PVOID instance);	        // ç≈è¨ílÅ`ç≈ëÂílèoóÕ(INT)
PLCPEN_API void LIMIT_DINT_EN(PVOID instance);	        // ç≈è¨ílÅ`ç≈ëÂílèoóÕ(DINT)
PLCPEN_API void LIMIT_LINT_EN(PVOID instance);	        // ç≈è¨ílÅ`ç≈ëÂílèoóÕ(LINT)
PLCPEN_API void LIMIT_REAL_EN(PVOID instance);	        // ç≈è¨ílÅ`ç≈ëÂílèoóÕ(REAL)
PLCPEN_API void LIMIT_LREAL_EN(PVOID instance);	        // ç≈è¨ílÅ`ç≈ëÂílèoóÕ(LREAL)
PLCPEN_API void LIMIT_STRING_EN(PVOID instance);	    // ç≈è¨ílÅ`ç≈ëÂílèoóÕ(STRING)
//ÉçÅ[ÉeÅ[ÉVÉáÉìÉVÉtÉg
PLCPEN_API void SHR_EN(PVOID instance);	            // âEÉVÉtÉg
PLCPEN_API void SHR_BYTE_EN(PVOID instance);	    // âEÉVÉtÉg(BYTE)
PLCPEN_API void SHR_WORD_EN(PVOID instance);	    // âEÉVÉtÉg(WORD)
PLCPEN_API void SHR_DWORD_EN(PVOID instance);	    // âEÉVÉtÉg(DWORD)
PLCPEN_API void SHL_EN(PVOID instance);	            // ç∂ÉVÉtÉg
PLCPEN_API void SHL_BYTE_EN(PVOID instance);	    // ç∂ÉVÉtÉg(BYTE)
PLCPEN_API void SHL_WORD_EN(PVOID instance);	    // ç∂ÉVÉtÉg(WORD)
PLCPEN_API void SHL_DWORD_EN(PVOID instance);	    // ç∂ÉVÉtÉg(DWORD)
PLCPEN_API void ROR_EN(PVOID instance);	            // âEÉçÅ[ÉeÅ[ÉVÉáÉì
PLCPEN_API void ROR_BYTE_EN(PVOID instance);	    // âEÉçÅ[ÉeÅ[ÉVÉáÉì(BYTE)
PLCPEN_API void ROR_WORD_EN(PVOID instance);	    // âEÉçÅ[ÉeÅ[ÉVÉáÉì(WORD)
PLCPEN_API void ROR_DWORD_EN(PVOID instance);	    // âEÉçÅ[ÉeÅ[ÉVÉáÉì(DWORD)
PLCPEN_API void ROL_EN(PVOID instance);	            // ç∂ÉçÅ[ÉeÅ[ÉVÉáÉì
PLCPEN_API void ROL_BYTE_EN(PVOID instance);	    // ç∂ÉçÅ[ÉeÅ[ÉVÉáÉì(BYTE)
PLCPEN_API void ROL_WORD_EN(PVOID instance);	    // ç∂ÉçÅ[ÉeÅ[ÉVÉáÉì(WORD)
PLCPEN_API void ROL_DWORD_EN(PVOID instance);	    // ç∂ÉçÅ[ÉeÅ[ÉVÉáÉì(DWORD)
PLCPEN_API void SIZEOF_EN(PVOID instance);	    // ì¸óÕÇÃå^ÇÃÉTÉCÉYÇèoóÕ
// éZèpââéZ
PLCPEN_API void ADD_EN(PVOID instance);	    // â¡éZ
PLCPEN_API void SUB_EN(PVOID instance);	    // å∏éZ
PLCPEN_API void MUL_EN(PVOID instance);	    // èÊéZ
PLCPEN_API void DIV_EN(PVOID instance);	    // èúéZ
PLCPEN_API void ADD_T_T_EN(PVOID instance);	    // â¡éZ(TIMEå^)
PLCPEN_API void SUB_T_T_EN(PVOID instance);	    // å∏éZ(TIMEå^)
PLCPEN_API void MUL_T_AI_EN(PVOID instance);	    // èÊéZ(TIMEå^*ANY_INTå^)
PLCPEN_API void MUL_T_AN_EN(PVOID instance);	    // èÊéZ(TIMEå^*ANY_NUMBERå^)
PLCPEN_API void MUL_T_R_EN(PVOID instance);	        // èÊéZ(TIMEå^*REALå^)
PLCPEN_API void DIV_T_AI_EN(PVOID instance);	    // èúéZ(TIMEå^/ANY_INTå^)
PLCPEN_API void DIV_T_AN_EN(PVOID instance);	    // èúéZ(TIMEå^/ANY_NUMBERå^)
PLCPEN_API void DIV_T_R_EN(PVOID instance);	        // èúéZ(TIMEå^/REALå^)
PLCPEN_API void MOD_EN(PVOID instance);	        // èËó]éZ
PLCPEN_API void MOVE_EN(PVOID instance);	    // ë„ì¸ 
PLCPEN_API void MOVE_BOOL_EN(PVOID instance);	// ë„ì¸(BOOLå^) 
PLCPEN_API void MOVE_REAL_EN(PVOID instance);	// ë„ì¸(REALå^)
PLCPEN_API void MOVE_LREAL_EN(PVOID instance);	// ë„ì¸(LREALå^)
PLCPEN_API void MOVE_SINT_EN(PVOID instance);	// ë„ì¸(SINTå^)
PLCPEN_API void MOVE_DINT_EN(PVOID instance);	// ë„ì¸(DINTå^)
PLCPEN_API void MOVE_INT_EN(PVOID instance);	// ë„ì¸(INTå^)
PLCPEN_API void MOVE_LINT_EN(PVOID instance);	// ë„ì¸(LINTå^)
PLCPEN_API void MOVE_UDINT_EN(PVOID instance);	// ë„ì¸(UDINTå^)
PLCPEN_API void MOVE_UINT_EN(PVOID instance);	// ë„ì¸(UINTå^)
PLCPEN_API void MOVE_USINT_EN(PVOID instance);	// ë„ì¸(USINTå^)
PLCPEN_API void MOVE_ULINT_EN(PVOID instance);	// ë„ì¸(ULINTå^)
PLCPEN_API void MOVE_TIME_EN(PVOID instance);	// ë„ì¸(TIMEå^)
PLCPEN_API void MOVE_DWORD_EN(PVOID instance);	// ë„ì¸(DWORDå^)
PLCPEN_API void MOVE_WORD_EN(PVOID instance);	// ë„ì¸(WORDå^)
PLCPEN_API void MOVE_BYTE_EN(PVOID instance);	// ë„ì¸(BYTEå^)
PLCPEN_API void MOVE_STRING_EN(PVOID instance);	// ë„ì¸(STRINGå^)
PLCPEN_API void EXPT_EN(PVOID instance);	// Ç◊Ç´èÊ
PLCPEN_API void NEG_EN(PVOID instance);	    // 2ÇÃï‚êî
//êîílëÄçÏ
PLCPEN_API void ABS_EN(PVOID instance);	// ê‚ëŒílââéZ
PLCPEN_API void SIN_EN(PVOID instance);	// ê≥å∑ââéZ
PLCPEN_API void COS_EN(PVOID instance);	// ó]å∑ââéZ
PLCPEN_API void TAN_EN(PVOID instance);	// ê≥ê⁄ââéZ
PLCPEN_API void ASIN_EN(PVOID instance);	// ãtê≥å∑ââéZ
PLCPEN_API void ACOS_EN(PVOID instance);	// ãtó]å∑ââéZ
PLCPEN_API void ATAN_EN(PVOID instance);	// ãtê≥ê⁄ââéZ
PLCPEN_API void EXP_EN(PVOID instance);	// é©ëRéwêîââéZ
PLCPEN_API void LN_EN(PVOID instance);	// é©ëRëŒêîââéZ
PLCPEN_API void LOG_EN(PVOID instance);	// èÌópëŒêîââéZ
PLCPEN_API void SQRT_EN(PVOID instance);	// ïΩï˚ç™ââéZ
// î‰är
PLCPEN_API void EQ_EN(PVOID instance);		// ìôÇµÇ¢
PLCPEN_API void NE_EN(PVOID instance);		// ìôÇµÇ≠Ç»Ç¢
PLCPEN_API void GT_EN(PVOID instance);		// ëÂÇ´Ç¢
PLCPEN_API void GE_EN(PVOID instance);		// ëÂÇ´Ç¢Ç©ìôÇµÇ¢
PLCPEN_API void LT_EN(PVOID instance);		// è¨Ç≥Ç¢
PLCPEN_API void LE_EN(PVOID instance);		// è¨Ç≥Ç¢Ç©ìôÇµÇ¢
//è¨êîà çÌèú
PLCPEN_API void TRUNC_SINT_EN(PVOID instance);		// è¨êîà çÌèúÇµÇƒSINTÇ…ïœä∑
PLCPEN_API void TRUNC_INT_EN(PVOID instance);		// è¨êîà çÌèúÇµÇƒINTÇ…ïœä∑
PLCPEN_API void TRUNC_DINT_EN(PVOID instance);		// è¨êîà çÌèúÇµÇƒDINTÇ…ïœä∑
PLCPEN_API void TRUNC_LINT_EN(PVOID instance);		// è¨êîà çÌèúÇµÇƒLINTÇ…ïœä∑
//ÉrÉbÉgëÄçÏ
PLCPEN_API void BIT_TEST_EN(PVOID instance);		// ÉrÉbÉgóÒÇ©ÇÁéwíËà íuÇÃÉrÉbÉgílì«éÊ

//-----------------------------------
//ë„ì¸
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Move = {
	"MOVE",
	MOVE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_Bool = {
	"MOVE_BOOL",
	MOVE_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_Real = {
	"MOVE_REAL",
	MOVE_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_LReal = {
	"MOVE_LREAL",
	MOVE_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_SInt = {
	"MOVE_SINT",
	MOVE_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_DInt = {
	"MOVE_DINT",
	MOVE_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_Int = {
	"MOVE_INT",
	MOVE_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_LInt = {
	"MOVE_LINT",
	MOVE_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_UDInt = {
	"MOVE_UDINT",
	MOVE_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_UInt = {
	"MOVE_UINT",
	MOVE_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_USInt = {
	"MOVE_USINT",
	MOVE_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_ULInt = {
	"MOVE_ULINT",
	MOVE_ULINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_Time = {
	"MOVE_TIME",
	MOVE_TIME_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_DWord = {
	"MOVE_DWORD",
	MOVE_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_Word = {
	"MOVE_WORD",
	MOVE_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_Byte = {
	"MOVE_BYTE",
	MOVE_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(84Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(84Byte)
		{0}
	}
};

struct FUNCTIONBLOCKDEFINE Move_String = {
	"MOVE_STRING",
	MOVE_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"			,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùêœ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE And = {
	"AND",
	AND_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùî€íË
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Not = {
	"NOT",
	NOT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)		
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Or = {
	"OR",
	OR_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//îrëºìIò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE XOr = {
	"XOR",
	XOR_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùêœ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE AndN = {
	"ANDN",
	ANDN_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE OrN = {
	"ORN",
	ORN_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃîrëºìIò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE XOrN = {
	"XORN",
	XORN_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BOOLå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BoolToByte = {
	"BOOL_TO_BYTE",
	BOOL_TO_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BOOLå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BoolToWord = {
	"BOOL_TO_WORD",
	BOOL_TO_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BOOLå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BoolToDWord = {
	"BOOL_TO_DWORD",
	BOOL_TO_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BOOLå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BoolToSInt = {
	"BOOL_TO_SINT",
	BOOL_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BOOLå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BoolToInt = {
	"BOOL_TO_INT",
	BOOL_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BOOLå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BoolToDInt = {
	"BOOL_TO_DINT",
	BOOL_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BOOLå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BoolToUSInt = {
	"BOOL_TO_USINT",
	BOOL_TO_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BOOLå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BoolToUInt = {
	"BOOL_TO_UINT",
	BOOL_TO_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BOOLå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BoolToUDInt = {
	"BOOL_TO_UDINT",
	BOOL_TO_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BOOLå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BoolToReal = {
	"BOOL_TO_REAL",
	BOOL_TO_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BOOLå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BoolToLReal = {
	"BOOL_TO_LREAL",
	BOOL_TO_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BOOLå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BoolToLInt = {
	"BOOL_TO_LINT",
	BOOL_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToBool = {
	"BYTE_TO_BOOL",
	BYTE_TO_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToWord = {
	"BYTE_TO_WORD",
	BYTE_TO_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁDBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToDWord = {
	"BYTE_TO_DWORD",
	BYTE_TO_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToSInt = {
	"BYTE_TO_SINT",
	BYTE_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToInt = {
	"BYTE_TO_INT",
	BYTE_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToDInt = {
	"BYTE_TO_DINT",
	BYTE_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToUSInt = {
	"BYTE_TO_USINT",
	BYTE_TO_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToUInt = {
	"BYTE_TO_UINT",
	BYTE_TO_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁUDIntå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToUDInt = {
	"BYTE_TO_UDINT",
	BYTE_TO_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToReal = {
	"BYTE_TO_REAL",
	BYTE_TO_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToLReal = {
	"BYTE_TO_LREAL",
	BYTE_TO_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToLInt = {
	"BYTE_TO_LINT",
	BYTE_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToBool = {
	"WORD_TO_BOOL",
	WORD_TO_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToByte = {
	"WORD_TO_BYTE",
	WORD_TO_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToDWord = {
	"WORD_TO_DWORD",
	WORD_TO_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToSInt = {
	"WORD_TO_SINT",
	WORD_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToInt = {
	"WORD_TO_INT",
	WORD_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToDInt = {
	"WORD_TO_DINT",
	WORD_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToUSInt = {
	"WORD_TO_USINT",
	WORD_TO_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToUInt = {
	"WORD_TO_UINT",
	WORD_TO_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToUDInt = {
	"WORD_TO_UDINT",
	WORD_TO_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToReal = {
	"WORD_TO_REAL",
	WORD_TO_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToLReal = {
	"WORD_TO_LREAL",
	WORD_TO_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToLInt = {
	"WORD_TO_LINT",
	WORD_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToBool = {
	"DWORD_TO_BOOL",
	DWORD_TO_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToByte = {
	"DWORD_TO_BYTE",
	DWORD_TO_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToWord = {
	"DWORD_TO_WORD",
	DWORD_TO_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToSInt = {
	"DWORD_TO_SINT",
	DWORD_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToInt = {
	"DWORD_TO_INT",
	DWORD_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToDInt = {
	"DWORD_TO_DINT",
	DWORD_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToUSInt = {
	"DWORD_TO_USINT",
	DWORD_TO_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToUInt = {
	"DWORD_TO_UINT",
	DWORD_TO_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToUDInt = {
	"DWORD_TO_UDINT",
	DWORD_TO_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToReal = {
	"DWORD_TO_REAL",
	DWORD_TO_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToLReal = {
	"DWORD_TO_LREAL",
	DWORD_TO_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToLInt = {
	"DWORD_TO_LINT",
	DWORD_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToBool = {
	"SINT_TO_BOOL",
	SINT_TO_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToByte = {
	"SINT_TO_BYTE",
	SINT_TO_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToWord = {
	"SINT_TO_WORD",
	SINT_TO_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToDWord = {
	"SINT_TO_DWORD",
	SINT_TO_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToInt = {
	"SINT_TO_INT",
	SINT_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToDInt = {
	"SINT_TO_DINT",
	SINT_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToUSInt = {
	"SINT_TO_USINT",
	SINT_TO_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToUInt = {
	"SINT_TO_UINT",
	SINT_TO_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToUDInt = {
	"SINT_TO_UDINT",
	SINT_TO_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToReal = {
	"SINT_TO_REAL",
	SINT_TO_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToLReal = {
	"SINT_TO_LREAL",
	SINT_TO_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁB_BCDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToBBCD = {
	"SINT_TO_B_BCD",
	SINT_TO_B_BCD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁW_BCDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToWBCD = {
	"SINT_TO_W_BCD",
	SINT_TO_W_BCD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁD_BCDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToDBCD = {
	"SINT_TO_D_BCD",
	SINT_TO_D_BCD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToLInt = {
	"SINT_TO_LINT",
	SINT_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToBool = {
	"INT_TO_BOOL",
	INT_TO_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToByte = {
	"INT_TO_BYTE",
	INT_TO_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToWord = {
	"INT_TO_WORD",
	INT_TO_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToDWord = {
	"INT_TO_DWORD",
	INT_TO_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToSInt = {
	"INT_TO_SINT",
	INT_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToDInt = {
	"INT_TO_DINT",
	INT_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToUSInt = {
	"INT_TO_USINT",
	INT_TO_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToUInt = {
	"INT_TO_UINT",
	INT_TO_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToUDInt = {
	"INT_TO_UDINT",
	INT_TO_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToReal = {
	"INT_TO_REAL",
	INT_TO_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToLReal = {
	"INT_TO_LREAL",
	INT_TO_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁB_BCDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToBBCD = {
	"INT_TO_B_BCD",
	INT_TO_B_BCD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁW_BCDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToWBCD = {
	"INT_TO_W_BCD",
	INT_TO_W_BCD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁD_BCDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToDBCD = {
	"INT_TO_D_BCD",
	INT_TO_D_BCD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToLInt = {
	"INT_TO_LINT",
	INT_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToBool = {
	"DINT_TO_BOOL",
	DINT_TO_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToByte = {
	"DINT_TO_BYTE",
	DINT_TO_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToWord = {
	"DINT_TO_WORD",
	DINT_TO_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToDWord = {
	"DINT_TO_DWORD",
	DINT_TO_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToSInt = {
	"DINT_TO_SINT",
	DINT_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToInt = {
	"DINT_TO_INT",
	DINT_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToUSInt = {
	"DINT_TO_USINT",
	DINT_TO_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToUInt = {
	"DINT_TO_UINT",
	DINT_TO_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToUDInt = {
	"DINT_TO_UDINT",
	DINT_TO_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToReal = {
	"DINT_TO_REAL",
	DINT_TO_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToLReal = {
	"DINT_TO_LREAL",
	DINT_TO_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁB_BCDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToBBCD = {
	"DINT_TO_B_BCD",
	DINT_TO_B_BCD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁW_BCDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToWBCD = {
	"DINT_TO_W_BCD",
	DINT_TO_W_BCD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁD_BCDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToDBCD = {
	"DINT_TO_D_BCD",
	DINT_TO_D_BCD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToLInt = {
	"DINT_TO_LINT",
	DINT_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁTIMEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToTime = {
	"DINT_TO_TIME",
	DINT_TO_TIME_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToBool = {
	"USINT_TO_BOOL",
	USINT_TO_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToByte = {
	"USINT_TO_BYTE",
	USINT_TO_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToWord = {
	"USINT_TO_WORD",
	USINT_TO_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToDWord = {
	"USINT_TO_DWORD",
	USINT_TO_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToSInt = {
	"USINT_TO_SINT",
	USINT_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToInt = {
	"USINT_TO_INT",
	USINT_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToDInt = {
	"USINT_TO_DINT",
	USINT_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToUInt = {
	"USINT_TO_UINT",
	USINT_TO_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToUDInt = {
	"USINT_TO_UDINT",
	USINT_TO_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToReal = {
	"USINT_TO_REAL",
	USINT_TO_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToLReal = {
	"USINT_TO_LREAL",
	USINT_TO_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToLInt = {
	"USINT_TO_LINT",
	USINT_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

//-----------------------------------
//UINTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToBool = {
	"UINT_TO_BOOL",
	UINT_TO_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UINTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToByte = {
	"UINT_TO_BYTE",
	UINT_TO_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UINTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToWord = {
	"UINT_TO_WORD",
	UINT_TO_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UINTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToDWord = {
	"UINT_TO_DWORD",
	UINT_TO_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UINTå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToSInt = {
	"UINT_TO_SINT",
	UINT_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UINTå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToInt = {
	"UINT_TO_INT",
	UINT_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UINTå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToDInt = {
	"UINT_TO_DINT",
	UINT_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToUSInt = {
	"UINT_TO_USINT",
	UINT_TO_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UINTå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToUDInt = {
	"UINT_TO_UDINT",
	UINT_TO_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UINTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToReal = {
	"UINT_TO_REAL",
	UINT_TO_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UINTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToLReal = {
	"UINT_TO_LREAL",
	UINT_TO_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UINTå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToLInt = {
	"UINT_TO_LINT",
	UINT_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToBool = {
	"UDINT_TO_BOOL",
	UDINT_TO_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToByte = {
	"UDINT_TO_BYTE",
	UDINT_TO_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToWord = {
	"UDINT_TO_WORD",
	UINT_TO_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToDWord = {
	"UDINT_TO_DWORD",
	UDINT_TO_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToSInt = {
	"UDINT_TO_SINT",
	UDINT_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToInt = {
	"UDINT_TO_INT",
	UDINT_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToDInt = {
	"UDINT_TO_DINT",
	UDINT_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToUSInt = {
	"UDINT_TO_USINT",
	UDINT_TO_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToUInt = {
	"UDINT_TO_UINT",
	UDINT_TO_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToReal = {
	"UDINT_TO_REAL",
	UDINT_TO_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToLReal = {
	"UDINT_TO_LREAL",
	UDINT_TO_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToLInt = {
	"UDINT_TO_LINT",
	UDINT_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToBool = {
	"REAL_TO_BOOL",
	REAL_TO_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToByte = {
	"REAL_TO_BYTE",
	REAL_TO_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToWord = {
	"REAL_TO_WORD",
	REAL_TO_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToDWord = {
	"REAL_TO_DWORD",
	REAL_TO_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToSInt = {
	"REAL_TO_SINT",
	REAL_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToInt = {
	"REAL_TO_INT",
	REAL_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToDInt = {
	"REAL_TO_DINT",
	REAL_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToLInt = {
	"REAL_TO_LINT",
	REAL_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToUSInt = {
	"REAL_TO_USINT",
	REAL_TO_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToUInt = {
	"REAL_TO_UINT",
	REAL_TO_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToUDInt = {
	"REAL_TO_UDINT",
	REAL_TO_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToLReal = {
	"REAL_TO_LREAL",
	REAL_TO_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToBool = {
	"LREAL_TO_BOOL",
	LREAL_TO_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToByte = {
	"LREAL_TO_BYTE",
	LREAL_TO_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToWord = {
	"LREAL_TO_WORD",
	LREAL_TO_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToDWord = {
	"LREAL_TO_DWORD",
	LREAL_TO_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToSInt = {
	"LREAL_TO_SINT",
	LREAL_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToInt = {
	"LREAL_TO_INT",
	LREAL_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToDInt = {
	"LREAL_TO_DINT",
	LREAL_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToLInt = {
	"LREAL_TO_LINT",
	LREAL_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToUSInt = {
	"LREAL_TO_USINT",
	LREAL_TO_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToUInt = {
	"LREAL_TO_UINT",
	LREAL_TO_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToUDInt = {
	"LREAL_TO_UDINT",
	LREAL_TO_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToReal = {
	"LREAL_TO_REAL",
	LREAL_TO_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//B_BCDå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BbcdToSInt = {
	"B_BCD_TO_SINT",
	B_BCD_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//B_BCDå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BbcdToInt = {
	"B_BCD_TO_INT",
	B_BCD_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//B_BCDå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BbcdToDInt = {
	"B_BCD_TO_DINT",
	B_BCD_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//B_BCDå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BbcdToLInt = {
	"B_BCD_TO_LINT",
	B_BCD_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//W_BCDå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WbcdToSInt = {
	"W_BCD_TO_SINT",
	W_BCD_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//W_BCDå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WbcdToInt = {
	"W_BCD_TO_INT",
	W_BCD_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//W_BCDå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WbcdToDInt = {
	"W_BCD_TO_DINT",
	W_BCD_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//W_BCDå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WbcdToLInt = {
	"W_BCD_TO_LINT",
	W_BCD_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//D_BCDå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DbcdToSInt = {
	"D_BCD_TO_SINT",
	D_BCD_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//D_BCDå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DbcdToInt = {
	"D_BCD_TO_INT",
	D_BCD_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//D_BCDå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DbcdToDInt = {
	"D_BCD_TO_DINT",
	D_BCD_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//D_BCDå^Ç©ÇÁLINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DbcdToLInt = {
	"D_BCD_TO_LINT",
	D_BCD_TO_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//TIMEå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE TimeToDInt = {
	"TIME_TO_DINT",
	TIME_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùêœ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE AndBool = {
	"AND_BOOL",
	AND_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùêœ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE AndByte = {
	"AND_BYTE",
	AND_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùêœ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE AndWord = {
	"AND_WORD",
	AND_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùêœ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE AndDWord = {
	"AND_DWORD",
	AND_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùî€íË
//-----------------------------------
struct FUNCTIONBLOCKDEFINE NotBool = {
	"NOT_BOOL",
	NOT_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)		
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùî€íË
//-----------------------------------
struct FUNCTIONBLOCKDEFINE NotByte = {
	"NOT_BYTE",
	NOT_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)		
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùî€íË
//-----------------------------------
struct FUNCTIONBLOCKDEFINE NotWord = {
	"NOT_WORD",
	NOT_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)		
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùî€íË
//-----------------------------------
struct FUNCTIONBLOCKDEFINE NotDWord = {
	"NOT_DWORD",
	NOT_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)		
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE OrBool = {
	"OR_BOOL",
	OR_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE OrByte = {
	"OR_BYTE",
	OR_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE OrWord = {
	"OR_WORD",
	OR_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE OrDWord = {
	"OR_DWORD",
	OR_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//îrëºìIò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE XOrBool = {
	"XOR_BOOL",
	XOR_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//îrëºìIò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE XOrByte = {
	"XOR_BYTE",
	XOR_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//îrëºìIò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE XOrWord = {
	"XOR_WORD",
	XOR_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//îrëºìIò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE XOrDWord = {
	"XOR_DWORD",
	XOR_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùêœ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE AndNBool = {
	"ANDN_BOOL",
	ANDN_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùêœ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE AndNByte = {
	"ANDN_BYTE",
	ANDN_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùêœ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE AndNWord = {
	"ANDN_WORD",
	ANDN_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùêœ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE AndNDWord = {
	"ANDN_DWORD",
	ANDN_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE OrNBool = {
	"ORN_BOOL",
	ORN_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE OrNByte = {
	"ORN_BYTE",
	ORN_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE OrNWord = {
	"ORN_WORD",
	ORN_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE OrNDWord = {
	"ORN_DWORD",
	ORN_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃîrëºìIò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE XOrNBool = {
	"XORN_BOOL",
	XORN_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃîrëºìIò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE XOrNByte = {
	"XORN_BYTE",
	XORN_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃîrëºìIò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE XOrNWord = {
	"XORN_WORD",
	XORN_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//IN1 Ç∆ IN2ÇÃî€íËíl Ç∆ÇÃîrëºìIò_óùòa
//-----------------------------------
struct FUNCTIONBLOCKDEFINE XOrNDWord = {
	"XORN_DWORD",
	XORN_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁBOOLå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToBool = {
	"LINT_TO_BOOL",
	LINT_TO_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁBYTEå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToByte = {
	"LINT_TO_BYTE",
	LINT_TO_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToWord = {
	"LINT_TO_WORD",
	LINT_TO_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁDWORDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToDWord = {
	"LINT_TO_DWORD",
	LINT_TO_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToSInt = {
	"LINT_TO_SINT",
	LINT_TO_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToInt = {
	"LINT_TO_INT",
	LINT_TO_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁUSINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToUSInt = {
	"LINT_TO_USINT",
	LINT_TO_USINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁUINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToUInt = {
	"LINT_TO_UINT",
	LINT_TO_UINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁUDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToUDInt = {
	"LINT_TO_UDINT",
	LINT_TO_UDINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁB_BCDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToBBCD = {
	"LINT_TO_B_BCD",
	LINT_TO_B_BCD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁW_BCDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToWBCD = {
	"LINT_TO_W_BCD",
	LINT_TO_W_BCD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁD_BCDå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToDBCD = {
	"LINT_TO_D_BCD",
	LINT_TO_D_BCD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁDINTå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToDInt = {
	"LINT_TO_DINT",
	LINT_TO_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToReal = {
	"LINT_TO_REAL",
	LINT_TO_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁLREALå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToLReal = {
	"LINT_TO_LREAL",
	LINT_TO_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒÇÃî‰är(ìôÇµÇ¢Ç©)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE EQString = {
	"EQ_STRING",
	EQ_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒÇÃî‰är(ìôÇµÇ≠Ç»Ç¢Ç©)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE NEString = {
	"NE_STRING",
	NE_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒÇÃî‰är(ëÂÇ´Ç¢Ç©)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE GTString = {
	"GT_STRING",
	GT_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒÇÃî‰är(ìôÇµÇ¢Ç©Ç‹ÇΩÇÕëÂÇ´Ç¢Ç©)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE GEString = {
	"GE_STRING",
	GE_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒÇÃî‰är(è¨Ç≥Ç¢Ç©)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LTString = {
	"LT_STRING",
	LT_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒÇÃî‰är(ìôÇµÇ¢Ç©Ç‹ÇΩÇÕè¨Ç≥Ç¢Ç©)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LEString = {
	"LE_STRING",
	LE_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//BYTEå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ByteToString = {
	"BYTE_TO_STRING",
	BYTE_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//WORDå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE WordToString = {
	"WORD_TO_STRING",
	WORD_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//DWORDå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DWordToString = {
	"DWORD_TO_STRING",
	DWORD_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//SINTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SIntToString = {
	"SINT_TO_STRING",
	SINT_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//INTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE IntToString = {
	"INT_TO_STRING",
	INT_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//DINTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE DIntToString = {
	"DINT_TO_STRING",
	DINT_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//LINTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LIntToString = {
	"LINT_TO_STRING",
	LINT_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//USINTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE USIntToString = {
	"USINT_TO_STRING",
	USINT_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//UINTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UIntToString = {
	"UINT_TO_STRING",
	UINT_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//UDINTå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE UDIntToString = {
	"UDINT_TO_STRING",
	UDINT_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//REALå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RealToString = {
	"REAL_TO_STRING",
	REAL_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//LREALå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LRealToString = {
	"LREAL_TO_STRING",
	LREAL_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//TIMEå^Ç©ÇÁSTRINGå^Ç÷ÇÃïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE TimeToString = {
	"TIME_TO_STRING",
	TIME_TO_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒòAåã
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Concat = {
	"CONCAT",
	CONCAT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒçÌèú
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Delete = {
	"DELETE",
	DELETE_STR_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒë}ì¸
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Insert = {
	"INSERT",
	INSERT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒÉRÉsÅ[(íÜâõ)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mid = {
	"MID",
	MID_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒÉRÉsÅ[(ç∂)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Left = {
	"LEFT",
	LEFT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒÉRÉsÅ[(âE)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Right = {
	"RIGHT",
	RIGHT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)		
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒåüçı
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Find = {
	"FIND",
	FIND_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)		
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒí∑Ç≥
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Len = {
	"LEN",
	LEN_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)	
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ï∂éöóÒíuä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Replace = {
	"REPLACE",
	REPLACE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)	
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)	
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)	
		{D_ANY		,"IN4"		    ,PIN_IN},		//			(4Byte)	
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY	    ,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ëÂÇ´Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Max = {
	"MAX",
	MAX_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ëÂÇ´Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(SINT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MaxSInt = {
	"MAX_SINT",
	MAX_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ëÂÇ´Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(INT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MaxInt = {
	"MAX_INT",
	MAX_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ëÂÇ´Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(DINT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MaxDInt = {
	"MAX_DINT",
	MAX_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ëÂÇ´Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(LINT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MaxLInt = {
	"MAX_LINT",
	MAX_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ëÂÇ´Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(REAL)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MaxReal = {
	"MAX_REAL",
	MAX_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ëÂÇ´Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(LREAL)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MaxLReal = {
	"MAX_LREAL",
	MAX_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ëÂÇ´Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(STRING)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MaxString = {
	"MAX_STRING",
	MAX_STR_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//è¨Ç≥Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Min = {
	"MIN",
	MIN_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//è¨Ç≥Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(SINT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MinSInt = {
	"MIN_SINT",
	MIN_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//è¨Ç≥Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(INT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MinInt = {
	"MIN_INT",
	MIN_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//è¨Ç≥Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(DINT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MinDInt = {
	"MIN_DINT",
	MIN_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//è¨Ç≥Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(LINT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MinLInt = {
	"MIN_LINT",
	MIN_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//è¨Ç≥Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(REAL)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MinReal = {
	"MIN_REAL",
	MIN_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//è¨Ç≥Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(LREAL)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MinLReal = {
	"MIN_LREAL",
	MIN_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//è¨Ç≥Ç¢ÇŸÇ§ÇÃì¸óÕÇèoóÕ(STRING)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE MinString = {
	"MIN_STRING",
	MIN_STR_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Sel = {
	"SEL",
	SEL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë(BOOL)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SelBool = {
	"SEL_BOOL",
	SEL_BOOL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë(BYTE)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SelByte = {
	"SEL_BYTE",
	SEL_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë(WORD)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SelWord = {
	"SEL_WORD",
	SEL_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë(DWORD)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SelDWord = {
	"SEL_DWORD",
	SEL_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë(TIME)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SelTime = {
	"SEL_TIME",
	SEL_TIME_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë(SINT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SelSInt = {
	"SEL_SINT",
	SEL_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë(INT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SelInt = {
	"SEL_INT",
	SEL_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë(DINT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SelDInt = {
	"SEL_DINT",
	SEL_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë(LINT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SelLInt = {
	"SEL_LINT",
	SEL_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë(REAL)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SelReal = {
	"SEL_REAL",
	SEL_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë(LREAL)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SelLReal = {
	"SEL_LREAL",
	SEL_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èoóÕëIë(STRING)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SelString = {
	"SEL_STRING",
	SEL_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç≈è¨ílÅ`ç≈ëÂílèoóÕ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Limit = {
	"LIMIT",
	LIMIT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç≈è¨ílÅ`ç≈ëÂílèoóÕ(SINT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LimitSInt = {
	"LIMIT_SINT",
	LIMIT_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç≈è¨ílÅ`ç≈ëÂílèoóÕ(INT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LimitInt = {
	"LIMIT_INT",
	LIMIT_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç≈è¨ílÅ`ç≈ëÂílèoóÕ(DINT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LimitDInt = {
	"LIMIT_DINT",
	LIMIT_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç≈è¨ílÅ`ç≈ëÂílèoóÕ(LINT)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LimitLInt = {
	"LIMIT_LINT",
	LIMIT_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç≈è¨ílÅ`ç≈ëÂílèoóÕ(REAL)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LimitReal = {
	"LIMIT_REAL",
	LIMIT_REAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç≈è¨ílÅ`ç≈ëÂílèoóÕ(LREAL)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LimitLReal = {
	"LIMIT_LREAL",
	LIMIT_LREAL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç≈è¨ílÅ`ç≈ëÂílèoóÕ(STRING)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE LimitString = {
	"LIMIT_STRING",
	LIMIT_STRING_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN3"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//âEÉVÉtÉg
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ShR = {
	"SHR",
	SHR_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//âEÉVÉtÉg(BYTE)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ShRByte = {
	"SHR_BYTE",
	SHR_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//âEÉVÉtÉg(WORD)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ShRWord = {
	"SHR_WORD",
	SHR_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//âEÉVÉtÉg(DWORD)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ShRDWord = {
	"SHR_DWORD",
	SHR_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç∂ÉVÉtÉg
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ShL = {
	"SHL",
	SHL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç∂ÉVÉtÉg(BYTE)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ShLByte = {
	"SHL_BYTE",
	SHL_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç∂ÉVÉtÉg(WORD)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ShLWord = {
	"SHL_WORD",
	SHL_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç∂ÉVÉtÉg(DWORD)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ShLDWord = {
	"SHL_DWORD",
	SHL_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//âEÉçÅ[ÉeÅ[ÉVÉáÉì
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RoR = {
	"ROR",
	ROR_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//âEÉçÅ[ÉeÅ[ÉVÉáÉì(BYTE)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RoRByte = {
	"ROR_BYTE",
	ROR_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//âEÉçÅ[ÉeÅ[ÉVÉáÉì(WORD)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RoRWord = {
	"ROR_WORD",
	ROR_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//âEÉçÅ[ÉeÅ[ÉVÉáÉì(DWORD)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RoRDWord = {
	"ROR_DWORD",
	ROR_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç∂ÉçÅ[ÉeÅ[ÉVÉáÉì
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RoL = {
	"ROL",
	ROL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç∂ÉçÅ[ÉeÅ[ÉVÉáÉì(BYTE)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RoLByte = {
	"ROL_BYTE",
	ROL_BYTE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç∂ÉçÅ[ÉeÅ[ÉVÉáÉì(WORD)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RoLWord = {
	"ROL_WORD",
	ROL_WORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ç∂ÉçÅ[ÉeÅ[ÉVÉáÉì(DWORD)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE RoLDWord = {
	"ROL_DWORD",
	ROL_DWORD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ì¸óÕÇÃå^ÇÃÉTÉCÉYÇèoóÕ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE SizeOf = {
	"SIZEOF",
	SIZEOF_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//â¡éZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Add = {
	"ADD",
	ADD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//å∏éZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Sub = {
	"SUB",
	SUB_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èÊéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mul = {
	"MUL",
	MUL_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èúéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Div = {
	"DIV",
	DIV_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//â¡éZ(TIMEå^)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Add_T_T = {
	"ADD_T_T",
	ADD_T_T_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//å∏éZ(TIMEå^)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Sub_T_T = {
	"SUB_T_T",
	SUB_T_T_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èÊéZ(TIMEå^*ANY_INTå^)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mul_T_AI = {
	"MUL_T_AI",
	MUL_T_AI_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èÊéZ(TIMEå^*ANY_NUMBERå^)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mul_T_AN = {
	"MUL_T_AN",
	MUL_T_AN_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èÊéZ(TIMEå^*REALå^)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mul_T_R = {
	"MUL_T_R",
	MUL_T_R_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èúéZ(TIMEå^/ANY_INTå^)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Div_T_AI = {
	"DIV_T_AI",
	DIV_T_AI_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èúéZ(TIMEå^/ANY_NUMBERå^)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Div_T_AN = {
	"DIV_T_AN",
	DIV_T_AN_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èúéZ(TIMEå^/REALå^)
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Div_T_R = {
	"DIV_T_R",
	DIV_T_R_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èËó]éZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Mod = {
	"MOD",
	MOD_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//Ç◊Ç´èÊ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Expt = {
	"EXPT",
	EXPT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//2ÇÃï‚êî
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Neg = {
	"NEG",
	NEG_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ê‚ëŒílââéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Abs = {
	"ABS",
	ABS_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ê≥å∑ââéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Sin = {
	"SIN",
	SIN_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ó]å∑ââéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Cos = {
	"COS",
	COS_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ê≥ê⁄ââéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Tan = {
	"TAN",
	TAN_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ãtê≥å∑ââéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ASin = {
	"ASIN",
	ASIN_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ãtó]å∑ââéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ACos = {
	"ACOS",
	ACOS_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ãtê≥ê⁄ââéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE ATan = {
	"ATAN",
	ATAN_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//é©ëRéwêîââéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Exp = {
	"EXP",
	EXP_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//é©ëRëŒêîââéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Ln = {
	"LN",
	LN_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//èÌópëŒêîââéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Log = {
	"LOG",
	LOG_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ïΩï˚ç™ââéZ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Sqrt = {
	"SQRT",
	SQRT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};
//-----------------------------------
//ìôÇµÇ¢
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Eq = {
	"EQ",
	EQ_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ìôÇµÇ≠Ç»Ç¢
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Ne = {
	"NE",
	NE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ëÂÇ´Ç¢Ç©ìôÇµÇ¢
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Ge = {
	"GE",
	GE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//ëÂÇ´Ç¢
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Gt = {
	"GT",
	GT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//è¨Ç≥Ç¢Ç©ìôÇµÇ¢
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Le = {
	"LE",
	LE_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//è¨Ç≥Ç¢
//-----------------------------------
struct FUNCTIONBLOCKDEFINE Lt = {
	"LT",
	LT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(4Byte)
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//è¨êîà ÇêÿÇËéÃÇƒÇƒSINTÇ…ïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE TruncSInt = {
	"TRUNC_SINT",
	TRUNC_SINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)		
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//è¨êîà ÇêÿÇËéÃÇƒÇƒINTÇ…ïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE TruncInt = {
	"TRUNC_INT",
	TRUNC_INT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)		
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//è¨êîà ÇêÿÇËéÃÇƒÇƒDINTÇ…ïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE TruncDInt = {
	"TRUNC_DINT",
	TRUNC_DINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)		
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};
//-----------------------------------
//è¨êîà ÇêÿÇËéÃÇƒÇƒLINTÇ…ïœä∑
//-----------------------------------
struct FUNCTIONBLOCKDEFINE TruncLInt = {
	"TRUNC_LINT",
	TRUNC_LINT_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN"		    ,PIN_IN},		//			(4Byte)		
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(1Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(1Byte)
		{0}
	}
};

//-----------------------------------
//ÉrÉbÉgóÒÇÃéwíËà íuÇÃÉrÉbÉgílì«éÊ
//-----------------------------------
struct FUNCTIONBLOCKDEFINE BitTest = {
	"BIT_TEST",
	BIT_TEST_EN,
	{
		{D_BOOL		,"EN"			,PIN_IN},		//			(1Byte)
		{D_ANY		,"IN1"		    ,PIN_IN},		//			(4Byte)		
		{D_ANY		,"IN2"		    ,PIN_IN},		//			(1Byte)		
		{D_BOOL		,"ENO"			,PIN_OUT},		//			(4Byte)
		{D_ANY		,"OUT"			,PIN_OUT},		//			(4Byte)
		{0}
	}
};

/// <summary>
/// ÉtÉ@ÉìÉNÉVÉáÉìÉuÉçÉbÉNÉäÉXÉg
/// äOïîéQè∆êÈåæ"__dllexport"ÇéÊÇËïtÇØÇƒÇ≠ÇæÇ≥Ç¢
/// </summary>
PLCPEN_API struct FUNCTIONBLOCKDEFINE		*FunctionBlocks[] =
{
	&And,
	&Not,
	&Or,
	&XOr,

	&BoolToByte,
	&BoolToWord,
	&BoolToDWord,
	&BoolToSInt,
	&BoolToInt,
	&BoolToDInt,
	&BoolToLInt,
	&BoolToUSInt,
	&BoolToUInt,
	&BoolToUDInt,
	&BoolToReal,
	&BoolToLReal,

	&ByteToBool,
	&ByteToWord,
	&ByteToDWord,
	&ByteToSInt,
	&ByteToInt,
	&ByteToDInt,
	&ByteToLInt,
	&ByteToUSInt,
	&ByteToUInt,
	&ByteToUDInt,
	&ByteToReal,
	&ByteToLReal,

	&WordToBool,
	&WordToByte,
	&WordToDWord,
	&WordToSInt,
	&WordToInt,
	&WordToDInt,
	&WordToLInt,
	&WordToUSInt,
	&WordToUInt,
	&WordToUDInt,
	&WordToReal,
	&WordToLReal,

	&DWordToBool,
	&DWordToByte,
	&DWordToWord,
	&DWordToSInt,
	&DWordToInt,
	&DWordToDInt,
	&DWordToLInt,
	&DWordToUSInt,
	&DWordToUInt,
	&DWordToUDInt,
	&DWordToReal,
	&DWordToLReal,

	&SIntToBool,
	&SIntToByte,
	&SIntToWord,
	&SIntToDWord,
	&SIntToInt,
	&SIntToDInt,
	&SIntToLInt,
	&SIntToUSInt,
	&SIntToUInt,
	&SIntToUDInt,
	&SIntToReal,
	&SIntToLReal,
	&SIntToBBCD,
	&SIntToWBCD,
	&SIntToDBCD,

	&IntToBool,
	&IntToByte,
	&IntToWord,
	&IntToDWord,
	&IntToSInt,
	&IntToDInt,
	&IntToLInt,
	&IntToUSInt,
	&IntToUInt,
	&IntToUDInt,
	&IntToReal,
	&IntToLReal,
	&IntToBBCD,
	&IntToWBCD,
	&IntToDBCD,

	&DIntToBool,
	&DIntToByte,
	&DIntToWord,
	&DIntToDWord,
	&DIntToSInt,
	&DIntToInt,
	&DIntToLInt,
	&DIntToUSInt,
	&DIntToUInt,
	&DIntToUDInt,
	&DIntToReal,
	&DIntToLReal,
	&DIntToBBCD,
	&DIntToWBCD,
	&DIntToDBCD,
	&DIntToTime,

	&LIntToBool,
	&LIntToByte,
	&LIntToWord,
	&LIntToDWord,
	&LIntToSInt,
	&LIntToInt,
	&LIntToDInt,
	&LIntToUSInt,
	&LIntToUInt,
	&LIntToUDInt,
	&LIntToReal,
	&LIntToLReal,
	&LIntToBBCD,
	&LIntToWBCD,
	&LIntToDBCD,

	&USIntToBool,
	&USIntToByte,
	&USIntToWord,
	&USIntToDWord,
	&USIntToSInt,
	&USIntToInt,
	&USIntToDInt,
	&USIntToLInt,
	&USIntToUInt,
	&USIntToUDInt,
	&USIntToReal,
	&USIntToLReal,

	&UIntToBool,
	&UIntToByte,
	&UIntToWord,
	&UIntToDWord,
	&UIntToSInt,
	&UIntToInt,
	&UIntToDInt,
	&UIntToLInt,
	&UIntToUSInt,
	&UIntToUDInt,
	&UIntToReal,
	&UIntToLReal,

	&UDIntToBool,
	&UDIntToByte,
	&UDIntToWord,
	&UDIntToDWord,
	&UDIntToSInt,
	&UDIntToInt,
	&UDIntToDInt,
	&UDIntToLInt,
	&UDIntToUSInt,
	&UDIntToUInt,
	&UDIntToReal,
	&UDIntToLReal,

	&RealToBool,
	&RealToByte,
	&RealToWord,
	&RealToDWord,
	&RealToSInt,
	&RealToInt,
	&RealToDInt,
	&RealToLInt,
	&RealToUSInt,
	&RealToUInt,
	&RealToUDInt,
	&RealToLReal,

	&LRealToBool,
	&LRealToByte,
	&LRealToWord,
	&LRealToDWord,
	&LRealToSInt,
	&LRealToInt,
	&LRealToDInt,
	&LRealToLInt,
	&LRealToUSInt,
	&LRealToUInt,
	&LRealToUDInt,
	&LRealToReal,

	&BbcdToSInt,
	&BbcdToInt,
	&BbcdToDInt,
	&BbcdToLInt,

	&WbcdToSInt,
	&WbcdToInt,
	&WbcdToDInt,
	&WbcdToLInt,
	
	&DbcdToSInt,
	&DbcdToInt,
	&DbcdToDInt,
	&DbcdToLInt,

	&TimeToDInt,
	
	&EQString,
	&NEString,
	&GTString,
	&GEString,
	&LTString,
	&LEString,

	&ByteToString,
	&WordToString,
	&DWordToString,
	&SIntToString,
	&IntToString,
	&DIntToString,
	&LIntToString,
	&USIntToString,
	&UIntToString,
	&UDIntToString,
	&RealToString,
	&LRealToString,
	&TimeToString,

	&Concat,
	&Delete,
	&Find,
	&Insert,
	&Replace,
	&Len,
	&Mid,
	&Left,
	&Right,

	&Max,
	&MaxSInt,
	&MaxInt,
	&MaxDInt,
	&MaxLInt,
	&MaxReal,
	&MaxLReal,
	&MaxString,

	&Min,
	&MinSInt,
	&MinInt,
	&MinDInt,
	&MinLInt,
	&MinReal,
	&MinLReal,
	&MinString,

	&Sel,
	&SelBool,
	&SelByte,
	&SelWord,
	&SelDWord,
	&SelTime,
	&SelSInt,
	&SelInt,
	&SelDInt,
	&SelLInt,
	&SelReal,
	&SelLReal,
	&SelString,

	&Limit,
	&LimitSInt,
	&LimitInt,
	&LimitDInt,
	&LimitLInt,
	&LimitReal,
	&LimitLReal,
	&LimitString,

	&Move,

	&ShR,
	&ShRByte,
	&ShRWord,
	&ShRDWord,
	&ShL,
	&ShLByte,
	&ShLWord,
	&ShLDWord,
	&RoR,
	&RoRByte,
	&RoRWord,
	&RoRDWord,
	&RoL,
	&RoLByte,
	&RoLWord,
	&RoLDWord,

	&SizeOf,
	
	&Add,
	&Sub,
	&Mul,
	&Div,
	&Add_T_T,
	&Sub_T_T,
	&Mul_T_AI,
	&Mul_T_AN,
	&Mul_T_R,
	&Div_T_AI,
	&Div_T_AN,
	&Div_T_R,

	&Mod,
	&Neg,
	&Abs,
	&Sin,
	&Cos,
	&Tan,
	&ASin,
	&ACos,
	&ATan,
	&Exp,
	&Expt,
	&Ln,
	&Log,
	&Sqrt,

	&Eq,
	&Ge,
	&Gt,
	&Le,
	&Lt,
	&Ne,

	&TruncSInt,
	&TruncInt,
	&TruncDInt,
	&TruncLInt,

	&BitTest
};

/// <summary>
/// ÉGÉìÉgÉäÅ[ÇÃå¬êî
/// äOïîéQè∆êÈåæ"__dllexport"ÇéÊÇËïtÇØÇƒÇ≠ÇæÇ≥Ç¢
/// </summary>
PLCPEN_API WORD NumFunctionBlocks = sizeof(FunctionBlocks) / sizeof(struct FUNCTIONBLOCKDEFINE*);


// Ç±ÇÃÉÇÉWÉÖÅ[ÉãÇÃç\ë¢ëÃíËã`ÇÕ1ÉoÉCÉgÉAÉâÉCÉìÇ™ïKóvÇ≈Ç∑
#pragma pack(pop)