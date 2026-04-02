#ifndef PLCP_RTEDGE_BRIDGE_H
#define PLCP_RTEDGE_BRIDGE_H

#include "plcp_ton_segment_layout.h"

#include <stddef.h>

/*
 * Rust クレート plcp_rtedge と同じ FFI（C 実装をデフォルトリンク）。
 */
void plcp_rtedge_after_segment(const char *instname, const char *fbname);
void plcp_rtedge_clear_instances(void);

unsigned plcp_rtedge_fb_segment_bytes_by_name(const char *fbname);
int plcp_rtedge_fb_member_offset(const char *fbname, const char *member);
int plcp_rtedge_parse_fb_pin(const char *full, char *inst_out, size_t inst_out_sz, char *member_out,
			     size_t member_out_sz);

/* TON 互換 */
int plcp_rtedge_parse_ton_pin(const char *full, char *inst_out, size_t inst_out_sz, char *member_out,
			      size_t member_out_sz);
int plcp_rtedge_ton_member_offset(const char *member);
unsigned plcp_rtedge_ton_segment_bytes(void);

#endif
