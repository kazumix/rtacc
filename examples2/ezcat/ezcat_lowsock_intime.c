#include "ezcat_lowsock.h"

/* INtime: sys/time.h と stdlib.h の strtoul 等が #ifdef __C99__ 内にある */
#ifndef __C99__
#define __C99__ 1
#endif

#include <errno.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <sys/types.h>
#include <sys/time.h> /* before net/if.h: struct timeval */
#include <sys/socket.h>
#include <sys/sockio.h>
#include <ifaddrs.h>
#include <sys/filio.h>

#include <netinet/in.h>
#include <net/if.h>
#include <net/if_types.h>
#include <net/ethernet.h>
#include <net/if_dl.h>

#include <rt.h>

typedef int (*ez_socket_t)(int domain, int type, int protocol);
typedef int (*ez_bind_t)(int s, const struct sockaddr *addr, socklen_t len);
typedef ssize_t (*ez_send_t)(int s, const void *buf, size_t len, int flags);
typedef ssize_t (*ez_recv_t)(int s, void *buf, size_t len, int flags);
typedef int (*ez_ioctl_t)(int s, unsigned long req, char *arg);
typedef int (*ez_close_t)(int s);
typedef int (*ez_getifaddrs_t)(struct ifaddrs **out);
typedef void (*ez_freeifaddrs_t)(struct ifaddrs *ifp);
typedef unsigned int (*ez_if_nametoindex_t)(const char *);

static RTHANDLE s_netlib;
static RTHANDLE s_clib;
static ez_socket_t s_socket;
static ez_bind_t s_bind;
static ez_send_t s_send;
static ez_recv_t s_recv;
static ez_ioctl_t s_ioctl;
static ez_close_t s_close;
static ez_getifaddrs_t s_getifaddrs;
static ez_freeifaddrs_t s_freeifaddrs;
static ez_if_nametoindex_t s_if_nametoindex;

static int s_open_errno;
static int s_open_detail;

static void ez_trim_dir_sep(char *path) {
  size_t n;
  if (!path) {
    return;
  }
  n = strlen(path);
  while (n > 0 && (path[n - 1] == '\\' || path[n - 1] == '/')) {
    path[--n] = '\0';
  }
}

/* out = dir + '\\' + tail （cap バイト以内） */
static int ez_path_join(char *out, size_t cap, const char *dir, const char *tail) {
  size_t dlen;
  size_t tlen;
  size_t need;
  if (!out || cap < 8 || !dir || !tail) {
    return -1;
  }
  dlen = strlen(dir);
  tlen = strlen(tail);
  need = dlen + 1u + tlen + 1u;
  if (need > cap) {
    return -1;
  }
  memcpy(out, dir, dlen);
  if (dlen > 0 && dir[dlen - 1] != '\\' && dir[dlen - 1] != '/') {
    out[dlen++] = '\\';
  }
  memcpy(out + dlen, tail, tlen + 1u);
  return 0;
}

static int ez_try_load_rsl(RTHANDLE *out, const char *path) {
  RTHANDLE h;
  if (!out || !path || !path[0]) {
    return -1;
  }
  h = LoadRtLibrary(path);
  if (h == 0) {
    return -1;
  }
  *out = h;
  return 0;
}

/* 環境変数値の前後空白と二重引用符を除いて dst に格納 */
static int ez_copy_env_trim(char *dst, size_t cap, const char *src) {
  size_t n;
  if (!dst || cap < 2 || !src) {
    return -1;
  }
  while (*src == ' ' || *src == '\t') {
    src++;
  }
  n = strlen(src);
  while (n > 0 && (src[n - 1] == ' ' || src[n - 1] == '\t')) {
    n--;
  }
  if (n >= 2 && src[0] == '"' && src[n - 1] == '"') {
    src++;
    n -= 2u;
  }
  if (n + 1u > cap) {
    return -1;
  }
  memcpy(dst, src, n);
  dst[n] = '\0';
  return 0;
}

/*
 * TenAsys 標準: %INTIME%\\bin\\netlib.rsl / clib.rsl
 * 1) INTIME / intime / Intime
 * 2) 既定の Program Files 系（環境変数未設定の RT ノード向け）
 * 3) 互換で RT\\bin 等
 */
static int ez_load_rsl_under_intime(RTHANDLE *out, const char *rsl_name) {
  static const char *const env_intime[] = {"INTIME", "intime", "Intime", NULL};
  static const char *const roots_fallback[] = {"C:\\Program Files (x86)\\INtime",
                                                "C:\\Program Files\\INtime", NULL};
  static const char *const subdirs[] = {"bin", "RT\\bin", "rt\\bin", "Bin", NULL};
  char root[280];
  char mid[300];
  char full[320];
  unsigned si;
  int ri;

  for (ri = 0; env_intime[ri] != NULL; ri++) {
    const char *e = getenv(env_intime[ri]);
    if (!e || !e[0]) {
      continue;
    }
    if (ez_copy_env_trim(root, sizeof(root), e) != 0 || !root[0]) {
      continue;
    }
    ez_trim_dir_sep(root);
    for (si = 0; subdirs[si] != NULL; si++) {
      if (ez_path_join(mid, sizeof(mid), root, subdirs[si]) != 0) {
        continue;
      }
      if (ez_path_join(full, sizeof(full), mid, rsl_name) != 0) {
        continue;
      }
      if (ez_try_load_rsl(out, full) == 0) {
        return 0;
      }
    }
  }

  for (ri = 0; roots_fallback[ri] != NULL; ri++) {
    size_t fl = strlen(roots_fallback[ri]);
    if (fl >= sizeof(root)) {
      continue;
    }
    memcpy(root, roots_fallback[ri], fl + 1u);
    ez_trim_dir_sep(root);
    for (si = 0; subdirs[si] != NULL; si++) {
      if (ez_path_join(mid, sizeof(mid), root, subdirs[si]) != 0) {
        continue;
      }
      if (ez_path_join(full, sizeof(full), mid, rsl_name) != 0) {
        continue;
      }
      if (ez_try_load_rsl(out, full) == 0) {
        return 0;
      }
    }
  }

  return -1;
}

static int ez_load_netlib(void) {
  const char *e;

  if (s_netlib != 0) {
    return 0;
  }

  e = getenv("EZCAT_NETLIB");
  if (e && e[0] && ez_try_load_rsl(&s_netlib, e) == 0) {
    return 0;
  }

  if (ez_load_rsl_under_intime(&s_netlib, "netlib.rsl") == 0) {
    return 0;
  }

  if (ez_try_load_rsl(&s_netlib, "netlib.rsl") == 0) {
    return 0;
  }

  return -1;
}

static int ez_load_clib(void) {
  const char *e;

  if (s_clib != 0) {
    return 0;
  }

  e = getenv("EZCAT_CLIB");
  if (e && e[0] && ez_try_load_rsl(&s_clib, e) == 0) {
    return 0;
  }

  if (ez_load_rsl_under_intime(&s_clib, "clib.rsl") == 0) {
    return 0;
  }

  if (ez_try_load_rsl(&s_clib, "clib.rsl") == 0) {
    return 0;
  }

  return -1;
}

/* netlib.rsl のエクスポート名は socket / bind 等（先頭 _ なし）。ioctl / close は clib.rsl 側。 */
static void *ez_rsl_proc(RTHANDLE h, const char *underscore, const char *plain) {
  void *p;
  if (h == 0) {
    return NULL;
  }
  if (underscore) {
    p = GetRtProcAddress(h, underscore);
    if (p) {
      return p;
    }
  }
  if (plain) {
    p = GetRtProcAddress(h, plain);
    if (p) {
      return p;
    }
  }
  return NULL;
}

static void *ez_net_resolve(const char *underscore, const char *plain) {
  return ez_rsl_proc(s_netlib, underscore, plain);
}

static int ez_net_ensure(void) {
  if (s_socket) {
    return 0;
  }
  if (ez_load_netlib() != 0) {
    return -1;
  }
  /* ソケット API は netlib.rsl */
  s_socket = (ez_socket_t)ez_net_resolve("_socket", "socket");
  s_bind = (ez_bind_t)ez_net_resolve("_bind", "bind");
  s_send = (ez_send_t)ez_net_resolve("_send", "send");
  s_recv = (ez_recv_t)ez_net_resolve("_recv", "recv");
  s_getifaddrs = (ez_getifaddrs_t)ez_net_resolve("_getifaddrs", "getifaddrs");
  s_freeifaddrs = (ez_freeifaddrs_t)ez_net_resolve("_freeifaddrs", "freeifaddrs");
  s_if_nametoindex = (ez_if_nametoindex_t)ez_net_resolve("_if_nametoindex", "if_nametoindex");

  /* ioctl / close は netlib に無い — clib.rsl 必須 */
  if (ez_load_clib() != 0) {
    return -1;
  }
  s_ioctl = (ez_ioctl_t)ez_rsl_proc(s_clib, "_ioctl", "ioctl");
  s_close = (ez_close_t)ez_rsl_proc(s_clib, "_close", "close");

  if (!s_getifaddrs || !s_freeifaddrs) {
    if (!s_getifaddrs) {
      s_getifaddrs = (ez_getifaddrs_t)ez_rsl_proc(s_clib, "_getifaddrs", "getifaddrs");
    }
    if (!s_freeifaddrs) {
      s_freeifaddrs = (ez_freeifaddrs_t)ez_rsl_proc(s_clib, "_freeifaddrs", "freeifaddrs");
    }
  }

  if (!s_socket || !s_bind || !s_send || !s_recv || !s_ioctl || !s_close) {
    return -1;
  }
  if (!s_getifaddrs || !s_freeifaddrs) {
    return -1;
  }
  return 0;
}

int ezcat_lowsock_last_open_errno(void) {
  return s_open_errno;
}

int ezcat_lowsock_last_open_detail(void) {
  return s_open_detail;
}

const char *ezcat_lowsock_last_io_msg(void) {
  return "";
}

void ezcat_lowsock_list_devices(void) {
  /* open 失敗時に EZCAT_LISTIF=1 で getifaddrs 経由の一覧は main が案内 */
}

static int ez_ifname_eq_ci(const char *a, const char *b) {
  if (!a || !b) {
    return 0;
  }
  for (; *a != '\0' && *b != '\0'; a++, b++) {
    unsigned char ca = (unsigned char)*a;
    unsigned char cb = (unsigned char)*b;
    if (ca >= 'A' && ca <= 'Z') {
      ca = (unsigned char)(ca + (unsigned)('a' - 'A'));
    }
    if (cb >= 'A' && cb <= 'Z') {
      cb = (unsigned char)(cb + (unsigned)('a' - 'A'));
    }
    if (ca != cb) {
      return 0;
    }
  }
  return *a == *b;
}

static int ez_name_matches_if(const char *want, const char *ifa_name) {
  if (!want || !ifa_name) {
    return 0;
  }
  if (strcmp(ifa_name, want) == 0) {
    return 1;
  }
  return ez_ifname_eq_ci(ifa_name, want);
}

#define EZCAT_SDL_MAX 256u

static int ez_try_copy_sdl(struct sockaddr_dl *sdl, struct sockaddr_dl *out_sdl, size_t outmax,
                           uint8_t mac[6]) {
  if (!sdl || !out_sdl || !mac) {
    return -1;
  }
  if (sdl->sdl_alen < 6) {
    return -1;
  }
  if ((size_t)sdl->sdl_len == 0u || (size_t)sdl->sdl_len > outmax) {
    return -1;
  }
  memcpy(mac, LLADDR(sdl), 6);
  memcpy(out_sdl, sdl, (size_t)sdl->sdl_len);
  return 0;
}

/* getifaddrs が AF_LINK+MAC を返さないドライバ向けに常に出力 */
static void ez_print_ifaddrs_diag(const struct ifaddrs *ifa) {
  const struct ifaddrs *p;

  printf("ezcat: getifaddrs (name / sa_family / AF_LINK alen):\n");
  for (p = ifa; p != NULL; p = p->ifa_next) {
    unsigned fam = 0;
    unsigned alen = 0;
    unsigned idx = 0;
    if (!p->ifa_name) {
      continue;
    }
    if (p->ifa_addr) {
      fam = (unsigned)p->ifa_addr->sa_family;
      if (fam == AF_LINK) {
        const struct sockaddr_dl *sdl = (const struct sockaddr_dl *)p->ifa_addr;
        alen = (unsigned)sdl->sdl_alen;
        idx = (unsigned)sdl->sdl_index;
      }
    }
    printf("ezcat:   %-16s  family=%u", p->ifa_name, fam);
    if (fam == AF_LINK) {
      printf("  link_alen=%u  index=%u", alen, idx);
    }
    printf("\n");
  }
}

/* SIOCGHWADDR を優先（INtime sockio）。ダメなら SIOCGIFADDR。 */
static int ez_sdl_from_ioctl_lladdr(const char *ifname, struct sockaddr_dl *out_sdl, size_t outmax,
                                    uint8_t mac[6]) {
  struct ifreq ifr;
  int fd;
  int rc;
  int attempt;
  unsigned long cmds[2];

  if (!s_socket || !s_ioctl || !s_close || !ifname || outmax < 64u) {
    return -1;
  }

  cmds[0] = SIOCGHWADDR;
  cmds[1] = SIOCGIFADDR;

  fd = s_socket(AF_INET, SOCK_DGRAM, 0);
  if (fd < 0) {
    return -1;
  }

  for (attempt = 0; attempt < 2; attempt++) {
    memset(&ifr, 0, sizeof(ifr));
    strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
    ifr.ifr_name[IFNAMSIZ - 1] = '\0';

    rc = s_ioctl(fd, cmds[attempt], (char *)&ifr);
    if (rc != 0) {
      continue;
    }
    if (ifr.ifr_addr.sa_family == AF_LINK) {
      if (ez_try_copy_sdl((struct sockaddr_dl *)&ifr.ifr_addr, out_sdl, outmax, mac) == 0) {
        s_close(fd);
        return 0;
      }
    }
  }

  s_close(fd);
  return -1;
}

static int ez_parse_mac_str(const char *s, uint8_t mac[6]) {
  int i;

  if (!s || !mac) {
    return -1;
  }
  for (i = 0; i < 6; i++) {
    char *end = NULL;
    unsigned long v;

    while (*s == ' ' || *s == '\t') {
      s++;
    }
    if (*s == '\0') {
      return -1;
    }
    v = strtoul(s, &end, 16);
    if (end == s || v > 255ul) {
      return -1;
    }
    mac[i] = (uint8_t)v;
    s = end;
    if (i < 5) {
      if (*s != ':' && *s != '-') {
        return -1;
      }
      s++;
    } else {
      while (*s == ' ' || *s == '\t') {
        s++;
      }
      if (*s != '\0') {
        return -1;
      }
    }
  }
  return 0;
}

static int ez_build_sdl_manual(const char *ifname, const uint8_t mac[6], struct sockaddr_dl *out,
                               size_t outmax) {
  size_t nlen;
  unsigned int idx;
  size_t need;
  unsigned sdl_len_v;

  if (!ifname || !out || outmax < 64u) {
    return -1;
  }

  nlen = strlen(ifname);
  if (nlen >= (size_t)IFNAMSIZ) {
    nlen = (size_t)IFNAMSIZ - 1u;
  }

  idx = 0u;
  if (s_if_nametoindex != NULL) {
    idx = s_if_nametoindex(ifname);
  }

  need = offsetof(struct sockaddr_dl, sdl_data) + nlen + 6u;
  if (need > outmax || need > 255u) {
    return -1;
  }
  sdl_len_v = (unsigned)need;

  memset(out, 0, outmax);
  out->sdl_len = (u_char)sdl_len_v;
  out->sdl_family = AF_LINK;
  out->sdl_index = (u_short)((idx > 0xffffu) ? 0xffffu : idx);
  out->sdl_type = IFT_ETHER;
  out->sdl_nlen = (u_char)nlen;
  out->sdl_alen = 6;
  out->sdl_slen = 0;
  memcpy(out->sdl_data, ifname, nlen);
  memcpy(LLADDR(out), mac, 6);
  return 0;
}

static int ez_find_link_sdl(const char *ifname, struct sockaddr_dl *out_sdl, size_t outmax,
                              uint8_t mac[6]) {
  struct ifaddrs *ifa = NULL;
  struct ifaddrs *p;
  unsigned int want_idx = 0;
  const char *emac;

  if (outmax < EZCAT_SDL_MAX) {
    return -1;
  }

  if (s_getifaddrs(&ifa) != 0) {
    return -1;
  }

  for (p = ifa; p != NULL; p = p->ifa_next) {
    struct sockaddr_dl *sdl;
    if (!p->ifa_name || !ez_name_matches_if(ifname, p->ifa_name)) {
      continue;
    }
    if (!p->ifa_addr || p->ifa_addr->sa_family != AF_LINK) {
      continue;
    }
    sdl = (struct sockaddr_dl *)p->ifa_addr;
    if (ez_try_copy_sdl(sdl, out_sdl, outmax, mac) == 0) {
      s_freeifaddrs(ifa);
      return 0;
    }
  }

  if (s_if_nametoindex != NULL) {
    want_idx = s_if_nametoindex(ifname);
    if (want_idx != 0u) {
      for (p = ifa; p != NULL; p = p->ifa_next) {
        struct sockaddr_dl *sdl;
        if (!p->ifa_addr || p->ifa_addr->sa_family != AF_LINK) {
          continue;
        }
        sdl = (struct sockaddr_dl *)p->ifa_addr;
        if ((unsigned int)sdl->sdl_index != want_idx) {
          continue;
        }
        if (ez_try_copy_sdl(sdl, out_sdl, outmax, mac) == 0) {
          s_freeifaddrs(ifa);
          return 0;
        }
      }
    }
  }

#if EZCAT_DEBUG_ALL
  ez_print_ifaddrs_diag(ifa);
#endif
  s_freeifaddrs(ifa);

  if (ez_sdl_from_ioctl_lladdr(ifname, out_sdl, outmax, mac) == 0) {
    return 0;
  }

  emac = getenv("EZCAT_MAC");
  if (emac && emac[0] && ez_parse_mac_str(emac, mac) == 0) {
    if (ez_build_sdl_manual(ifname, mac, out_sdl, outmax) == 0) {
#if EZCAT_DEBUG_ALL
      printf("ezcat: using EZCAT_MAC for link addr (getifaddrs had no MAC)\n");
#endif
      return 0;
    }
  }

  return -1;
}

int ezcat_lowsock_open(ezcat_lowsock_t *ls, const char *ifname) {
  int proto;
  int fd;

  s_open_errno = 0;
  s_open_detail = EZCAT_OPEN_DETAIL_NONE;

  if (!ls || !ifname || !ifname[0]) {
    return -1;
  }
  memset(ls, 0, sizeof(*ls));
  ls->handle = -1;

  if (ez_net_ensure() != 0) {
    if (s_netlib == 0) {
      s_open_detail = EZCAT_OPEN_NETLIB_NOT_FOUND;
    } else if (s_clib == 0) {
      s_open_detail = EZCAT_OPEN_CLIB_NOT_FOUND;
    } else if (!s_socket || !s_bind || !s_send || !s_recv || !s_ioctl || !s_close) {
      s_open_detail = EZCAT_OPEN_NETLIB_SYMBOL;
    } else {
      s_open_detail = EZCAT_OPEN_CLIB_GETIFADDRS;
    }
    return -1;
  }

  {
    unsigned char sdl_buf[256];
    struct sockaddr_dl *psdl = (struct sockaddr_dl *)sdl_buf;

    memset(sdl_buf, 0, sizeof(sdl_buf));
    if (ez_find_link_sdl(ifname, psdl, sizeof(sdl_buf), ls->mac) != 0) {
      s_open_detail = EZCAT_OPEN_NO_IFACE;
      s_open_errno = ENXIO;
      return -1;
    }

    proto = (int)ETHERTYPE_ETHERCAT;
    fd = s_socket(PF_LINK, SOCK_RAW, proto);
    if (fd < 0) {
      s_open_detail = EZCAT_OPEN_SOCKET_FAIL;
      s_open_errno = errno;
      return -1;
    }

    if (s_bind(fd, (struct sockaddr *)psdl, (socklen_t)psdl->sdl_len) != 0) {
      s_open_detail = EZCAT_OPEN_BIND_FAIL;
      s_open_errno = errno;
      s_close(fd);
      return -1;
    }

    ls->handle = (intptr_t)fd;
    strncpy(ls->dev_name, ifname, sizeof(ls->dev_name) - 1u);
    ls->dev_name[sizeof(ls->dev_name) - 1u] = '\0';
  }
  return 0;
}

void ezcat_lowsock_close(ezcat_lowsock_t *ls) {
  if (!ls) {
    return;
  }
  if (ls->handle >= 0 && s_close) {
    s_close((int)ls->handle);
    ls->handle = -1;
  }
}

int ezcat_lowsock_send(ezcat_lowsock_t *ls, uint8_t *frame, int tx_len) {
  ssize_t n;
  if (!ls || ls->handle < 0 || !frame || tx_len <= 0) {
    return -1;
  }
  n = s_send((int)ls->handle, (const void *)frame, (size_t)tx_len, 0);
  if (n != (ssize_t)tx_len) {
    return -1;
  }
  return 0;
}

int ezcat_lowsock_recv_ecat(ezcat_lowsock_t *ls, uint8_t *frame, int rx_max, unsigned timeout_ms) {
  ssize_t n;
  unsigned waited = 0;
  int nb = 1;
  int was_nb = 0;

  if (!ls || ls->handle < 0 || !frame || rx_max < 14) {
    return -1;
  }

  if (s_ioctl((int)ls->handle, FIONBIO, (char *)&nb) == 0) {
    was_nb = 1;
  }

  while (waited < timeout_ms) {
    n = s_recv((int)ls->handle, (void *)frame, (size_t)rx_max, 0);
    if (n < 0) {
      if (errno == EWOULDBLOCK || errno == EAGAIN) {
        RtSleep(1);
        waited += 1u;
        continue;
      }
      if (was_nb) {
        nb = 0;
        (void)s_ioctl((int)ls->handle, FIONBIO, (char *)&nb);
      }
      return -1;
    }
    if (n >= 14) {
      if (ezcat_frame_is_ecat((unsigned)n, frame)) {
        if (was_nb) {
          nb = 0;
          (void)s_ioctl((int)ls->handle, FIONBIO, (char *)&nb);
        }
        return (int)n;
      }
    }
    RtSleep(1);
    waited += 1u;
  }

  if (was_nb) {
    nb = 0;
    (void)s_ioctl((int)ls->handle, FIONBIO, (char *)&nb);
  }
  return -2;
}

int ezcat_lowsock_txrx(ezcat_lowsock_t *ls, uint8_t *frame, int tx_len, int rx_max,
                       unsigned timeout_ms) {
  if (!ls || ls->handle < 0 || !frame || tx_len <= 0 || rx_max < tx_len) {
    return -1;
  }
  if (ezcat_lowsock_send(ls, frame, tx_len) != 0) {
    return -1;
  }
  return ezcat_lowsock_recv_ecat(ls, frame, rx_max, timeout_ms);
}
