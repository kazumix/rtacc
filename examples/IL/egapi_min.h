/*
 * RTedge EgApi の最小宣言（SDK の egapi.h と同じシグネチャであること）。
 * 実ヘッダは $(RTEDGE)\Library 等。本ファイルはスタブ/単体ビルド用。
 */
#ifndef RTACC_EGAPI_MIN_H
#define RTACC_EGAPI_MIN_H

#include <stdint.h>

#ifndef EDGE_SUCCESS
#define EDGE_SUCCESS 0
#endif

int32_t EgTagCreateEx(char *name, uint16_t tag_type, char *srcaddressinfo, char *commentinfo);

int32_t EgTagCreateSegment(char *name, uint16_t tag_type, uint16_t bufsize,
			   char *srcaddressinfo, char *commentinfo, char *regname,
			   uint16_t regnamesize, uint16_t *islink);

int32_t EgTagWriteSegment(char *name, uint32_t offset, void *buf, uint32_t size);

#endif
