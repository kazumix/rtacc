#include <stdio.h>
#include <errno.h>

// INtime network7 headers
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

#ifdef __INTIME__
#include <rt.h>
#endif

int main(int argc, char* argv[])
{
	(void)argc;
	(void)argv;

	printf("[socket] before socket() call\n");
	fflush(stdout);

#ifdef __INTIME__
	RTHANDLE hNetlib = 0;
	RTHANDLE hU = 0;

	printf("[socket] loading netlib.rsl...\n");
	fflush(stdout);
	hNetlib = LoadRtLibrary("netlib.rsl");
	printf("[socket] LoadRtLibrary(netlib.rsl) handle=%u\n", (unsigned)hNetlib);
	fflush(stdout);

	printf("[socket] loading uastackrt.rsl...\n");
	fflush(stdout);
	hU = LoadRtLibrary("uastackrt.rsl");
	printf("[socket] LoadRtLibrary(uastackrt.rsl) handle=%u\n", (unsigned)hU);
	fflush(stdout);

	// netlib.rsl から GetRtProcAddress で関数ポインタを引く
	typedef int (*socket_fn_t)(int domain, int type, int protocol);
	typedef int (*shutdown_fn_t)(int s, int how);

	socket_fn_t p_socket = (socket_fn_t)GetRtProcAddress(hNetlib, "_socket");
	if (!p_socket) {
		p_socket = (socket_fn_t)GetRtProcAddress(hNetlib, "socket");
	}

	shutdown_fn_t p_shutdown = (shutdown_fn_t)GetRtProcAddress(hNetlib, "_shutdown");
	if (!p_shutdown) {
		p_shutdown = (shutdown_fn_t)GetRtProcAddress(hNetlib, "shutdown");
	}

	printf("[socket] resolved: socket=%p shutdown=%p\n", (void*)p_socket, (void*)p_shutdown);
	fflush(stdout);

	if (!p_socket) {
		printf("[socket] ERROR: could not resolve socket() from netlib.rsl\n");
		return -1;
	}

	errno = 0;
	printf("[socket] after socket()\n");
	fflush(stdout);

	int fd = p_socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
	printf("[socket] after socket() fd=%d errno=%d\n", fd, (int)errno);
	fflush(stdout);

	if (fd >= 0 && p_shutdown) {
		(void)p_shutdown(fd, 2);
	}

	return 0;
#endif

	// 非 INtime ビルド時のダミー（通常は使わない）
	return 0;
}

