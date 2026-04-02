/*
 * PLCP Functionblock_Register / Structure_CreateCatalog（オフセット）相当。
 * 数値は plcp_rtedge/src/fb_layout.rs / plcp_ton_segment_layout.h と一致させること。
 */
#include "plcp_rtedge_bridge.h"

#include <stddef.h>
#include <stdint.h>
#include <string.h>

#define PLCP_MAX_FB 256

static char g_fb_inst[PLCP_MAX_FB][80];
static char g_fb_family[PLCP_MAX_FB][32];
static unsigned g_fb_count;

static int fb_index(const char *inst)
{
	unsigned i;

	for (i = 0; i < g_fb_count; i++) {
		if (strcmp(g_fb_inst[i], inst) == 0)
			return (int)i;
	}
	return -1;
}

void plcp_rtedge_clear_instances(void)
{
	g_fb_count = 0;
}

void plcp_rtedge_after_segment(const char *instname, const char *fbname)
{
	if (instname == NULL || fbname == NULL)
		return;
	if (g_fb_count >= PLCP_MAX_FB)
		return;
	if (fb_index(instname) >= 0)
		return;
	strncpy(g_fb_inst[g_fb_count], instname, sizeof(g_fb_inst[0]) - 1);
	g_fb_inst[g_fb_count][sizeof(g_fb_inst[0]) - 1] = '\0';
	strncpy(g_fb_family[g_fb_count], fbname, sizeof(g_fb_family[0]) - 1);
	g_fb_family[g_fb_count][sizeof(g_fb_family[0]) - 1] = '\0';
	g_fb_count++;
}

static const char *family_for_inst(const char *inst)
{
	int i = fb_index(inst);

	if (i < 0)
		return NULL;
	return g_fb_family[(unsigned)i];
}

/* plcp_rtedge fb_layout.rs family_is_type_conversion_en と一致 */
static int family_is_type_conversion_en(const char *fbname)
{
	if (fbname == NULL)
		return 0;
	return strncmp(fbname, "WORD_TO_", 8) == 0 || strncmp(fbname, "DWORD_TO_", 9) == 0
	    || strncmp(fbname, "UDINT_TO_", 9) == 0 || strncmp(fbname, "INT_TO_", 7) == 0
	    || strncmp(fbname, "REAL_TO_", 8) == 0 || strncmp(fbname, "LREAL_TO_", 9) == 0
	    || strncmp(fbname, "BOOL_TO_", 8) == 0 || strncmp(fbname, "BYTE_TO_", 8) == 0
	    || strncmp(fbname, "SINT_TO_", 8) == 0 || strncmp(fbname, "UINT_TO_", 8) == 0
	    || strncmp(fbname, "USINT_TO_", 9) == 0;
}

unsigned plcp_rtedge_fb_segment_bytes_by_name(const char *fbname)
{
	if (fbname == NULL)
		return 0;
	if (family_is_type_conversion_en(fbname))
		return 16;
	if (strncmp(fbname, "R_TRIG", 6) == 0 || strncmp(fbname, "F_TRIG", 6) == 0)
		return 12;
	if (strncmp(fbname, "TON", 3) == 0 || strncmp(fbname, "TOF", 3) == 0)
		return PLCP_TON_SEGMENT_BYTES;
	if (strncmp(fbname, "TP", 2) == 0)
		return 40;
	if (strncmp(fbname, "CTUD", 4) == 0)
		return 48;
	if (strncmp(fbname, "CTU", 3) == 0 || strncmp(fbname, "CTD", 3) == 0)
		return 32;
	if (strncmp(fbname, "ADD", 3) == 0 || strncmp(fbname, "SUB", 3) == 0 || strncmp(fbname, "MUL", 3) == 0
	    || strncmp(fbname, "DIV", 3) == 0 || strncmp(fbname, "MOD", 3) == 0)
		return 16;
	/* LogicOpe_EN LOGIC_OPE_PIN / EQ_EN EQ_PIN — ADD_PIN と同型 16B（未登録時は il_fb が 64 になるのを防ぐ） */
	if (strcmp(fbname, "AND") == 0 || strcmp(fbname, "OR") == 0 || strcmp(fbname, "XOR") == 0
	    || strcmp(fbname, "ANDN") == 0 || strcmp(fbname, "ORN") == 0 || strcmp(fbname, "XORN") == 0)
		return 16;
	if (strcmp(fbname, "EQ") == 0 || strcmp(fbname, "NE") == 0 || strcmp(fbname, "GT") == 0
	    || strcmp(fbname, "GE") == 0 || strcmp(fbname, "LT") == 0 || strcmp(fbname, "LE") == 0)
		return 16;
	if (strcmp(fbname, "NOT") == 0)
		return 16;
	if (strcmp(fbname, "MOVE") == 0 || strcmp(fbname, "LN") == 0 || strcmp(fbname, "LOG") == 0
	    || strcmp(fbname, "EXP") == 0 || strcmp(fbname, "EXPT") == 0)
		return 16;
	if (strcmp(fbname, "SHR") == 0 || strcmp(fbname, "SHL") == 0 || strcmp(fbname, "ROL") == 0
	    || strcmp(fbname, "BIT_TEST") == 0)
		return 16;
	return 0;
}

static int arith_member_offset(const char *m)
{
	if (strcmp(m, "EN") == 0)
		return 0;
	if (strcmp(m, "IN1") == 0)
		return 1;
	if (strcmp(m, "IN2") == 0)
		return 5;
	if (strcmp(m, "ENO") == 0)
		return 9;
	if (strcmp(m, "OUT") == 0)
		return 10;
	return -1;
}

static int not_en_member_offset(const char *m)
{
	if (strcmp(m, "EN") == 0)
		return 0;
	if (strcmp(m, "IN") == 0)
		return 1;
	if (strcmp(m, "ENO") == 0)
		return 5;
	if (strcmp(m, "OUT") == 0)
		return 6;
	return -1;
}

static int ton_like_offset(const char *m)
{
	if (strcmp(m, "EN") == 0)
		return PLCP_TON_OFS_EN;
	if (strcmp(m, "IN") == 0)
		return PLCP_TON_OFS_IN;
	if (strcmp(m, "PT") == 0)
		return PLCP_TON_OFS_PT;
	if (strcmp(m, "ET") == 0)
		return PLCP_TON_OFS_ET;
	if (strcmp(m, "Q") == 0)
		return PLCP_TON_OFS_Q;
	if (strcmp(m, "_IN_") == 0)
		return PLCP_TON_OFS__IN_;
	if (strcmp(m, "_STTIME_") == 0)
		return PLCP_TON_OFS__STTIME_;
	return -1;
}

static int trig_edge_member_offset(const char *m)
{
	if (strcmp(m, "CLK") == 0)
		return 0;
	if (strcmp(m, "Q") == 0)
		return 1;
	if (strcmp(m, "_prev_clk") == 0 || strcmp(m, "_PREV_CLK") == 0)
		return 2;
	return -1;
}

int plcp_rtedge_fb_member_offset(const char *fbname, const char *member)
{
	if (fbname == NULL || member == NULL)
		return -1;
	if (family_is_type_conversion_en(fbname))
		return not_en_member_offset(member);
	if (strncmp(fbname, "R_TRIG", 6) == 0 || strncmp(fbname, "F_TRIG", 6) == 0)
		return trig_edge_member_offset(member);
	if (strcmp(fbname, "MOVE") == 0 || strcmp(fbname, "LN") == 0 || strcmp(fbname, "LOG") == 0
	    || strcmp(fbname, "EXP") == 0)
		return not_en_member_offset(member);
	if (strcmp(fbname, "EXPT") == 0 || strcmp(fbname, "SHR") == 0 || strcmp(fbname, "SHL") == 0
	    || strcmp(fbname, "ROL") == 0 || strcmp(fbname, "BIT_TEST") == 0)
		return arith_member_offset(member);
	if (strncmp(fbname, "TON", 3) == 0 || strncmp(fbname, "TOF", 3) == 0)
		return ton_like_offset(member);
	if (strncmp(fbname, "TP", 2) == 0)
		return ton_like_offset(member);
	if (strncmp(fbname, "CTUD", 4) == 0) {
		if (strcmp(member, "CU") == 0)
			return 0;
		if (strcmp(member, "CD") == 0)
			return 1;
		if (strcmp(member, "RESET") == 0)
			return 2;
		if (strcmp(member, "LOAD") == 0)
			return 3;
		if (strcmp(member, "PV") == 0)
			return 4;
		if (strcmp(member, "QU") == 0)
			return 6;
		if (strcmp(member, "QD") == 0)
			return 7;
		if (strcmp(member, "CV") == 0)
			return 8;
		if (strcmp(member, "_CU_") == 0 || strcmp(member, "_prev_cu") == 0)
			return 10;
		if (strcmp(member, "_CD_") == 0 || strcmp(member, "_prev_cd") == 0)
			return 11;
		return -1;
	}
	if (strncmp(fbname, "CTU", 3) == 0) {
		if (strcmp(member, "CU") == 0)
			return 0;
		if (strcmp(member, "RESET") == 0)
			return 1;
		if (strcmp(member, "PV") == 0)
			return 2;
		if (strcmp(member, "Q") == 0)
			return 4;
		if (strcmp(member, "CV") == 0)
			return 5;
		if (strcmp(member, "_CU_") == 0 || strcmp(member, "_prev_cu") == 0)
			return 7;
		return -1;
	}
	if (strncmp(fbname, "CTD", 3) == 0) {
		if (strcmp(member, "CD") == 0)
			return 0;
		if (strcmp(member, "LOAD") == 0)
			return 1;
		if (strcmp(member, "PV") == 0)
			return 2;
		if (strcmp(member, "Q") == 0)
			return 4;
		if (strcmp(member, "CV") == 0)
			return 5;
		if (strcmp(member, "_CD_") == 0 || strcmp(member, "_prev_cd") == 0)
			return 7;
		return -1;
	}
	if (strncmp(fbname, "ADD", 3) == 0 || strncmp(fbname, "SUB", 3) == 0 || strncmp(fbname, "MUL", 3) == 0
	    || strncmp(fbname, "DIV", 3) == 0 || strncmp(fbname, "MOD", 3) == 0)
		return arith_member_offset(member);
	if (strcmp(fbname, "AND") == 0 || strcmp(fbname, "OR") == 0 || strcmp(fbname, "XOR") == 0
	    || strcmp(fbname, "ANDN") == 0 || strcmp(fbname, "ORN") == 0 || strcmp(fbname, "XORN") == 0)
		return arith_member_offset(member);
	if (strcmp(fbname, "EQ") == 0 || strcmp(fbname, "NE") == 0 || strcmp(fbname, "GT") == 0
	    || strcmp(fbname, "GE") == 0 || strcmp(fbname, "LT") == 0 || strcmp(fbname, "LE") == 0)
		return arith_member_offset(member);
	if (strcmp(fbname, "NOT") == 0)
		return not_en_member_offset(member);
	return -1;
}

int plcp_rtedge_ton_member_offset(const char *member)
{
	return plcp_rtedge_fb_member_offset("TON", member);
}

unsigned plcp_rtedge_ton_segment_bytes(void)
{
	return PLCP_TON_SEGMENT_BYTES;
}

int plcp_rtedge_parse_fb_pin(const char *full, char *inst_out, size_t inst_out_sz, char *member_out,
			     size_t member_out_sz)
{
	const char *dot;
	size_t ilen;
	const char *fam;

	if (full == NULL || inst_out == NULL || member_out == NULL || inst_out_sz == 0 || member_out_sz == 0)
		return 0;
	dot = strrchr(full, '.');
	if (dot == NULL || dot == full)
		return 0;
	ilen = (size_t)(dot - full);
	if (ilen >= inst_out_sz)
		return 0;
	memcpy(inst_out, full, ilen);
	inst_out[ilen] = '\0';
	fam = family_for_inst(inst_out);
	if (fam == NULL)
		return 0;
	strncpy(member_out, dot + 1, member_out_sz - 1);
	member_out[member_out_sz - 1] = '\0';
	if (plcp_rtedge_fb_member_offset(fam, member_out) < 0)
		return 0;
	return 1;
}

int plcp_rtedge_parse_ton_pin(const char *full, char *inst_out, size_t inst_out_sz, char *member_out,
			      size_t member_out_sz)
{
	return plcp_rtedge_parse_fb_pin(full, inst_out, inst_out_sz, member_out, member_out_sz);
}
