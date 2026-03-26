; ModuleID = 'main_rta'
source_filename = "<string>"
target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"
target triple = "i686-pc-windows-msvc"



@msg_hello_python = private unnamed_addr constant [14 x i8] c"Hello Python\0A\00"

declare i32 @printf(ptr noundef, ...)

@dbg_sdk_hint = private unnamed_addr constant [92 x i8] c"[dbg] SDK: Load TCP/IP stack (istack/netload). socket() returns ENODEV if stack not ready.\0A\00"

@dbg_socket_demo_off = private unnamed_addr constant [57 x i8] c"[dbg] socket demo disabled (RTACC_PYTHON_SOCKET_DEMO=0)\0A\00"



@msg_socket_ip = private unnamed_addr constant [34 x i8] c"default-route local ip (udp): %s\0A\00"

@msg_ip_na = private unnamed_addr constant [4 x i8] c"N/A\00"

@dbg_enter = private unnamed_addr constant [29 x i8] c"[dbg] enter socket sequence\0A\00"

@dbg_before_socket = private unnamed_addr constant [28 x i8] c"[dbg] before socket() call\0A\00"

@dbg_about_socket = private unnamed_addr constant [80 x i8] c"[dbg] About to call socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP=17); hang=>no stack.\0A\00"

@dbg_after_socket = private unnamed_addr constant [32 x i8] c"[dbg] socket rc=%d (expect>=0)\0A\00"

@dbg_before_connect = private unnamed_addr constant [22 x i8] c"[dbg] before connect\0A\00"

@dbg_after_connect = private unnamed_addr constant [21 x i8] c"[dbg] connect rc=%d\0A\00"

@dbg_before_getsockname = private unnamed_addr constant [26 x i8] c"[dbg] before getsockname\0A\00"

@dbg_after_getsockname = private unnamed_addr constant [25 x i8] c"[dbg] getsockname rc=%d\0A\00"

@dbg_before_inet_ntoa = private unnamed_addr constant [24 x i8] c"[dbg] before inet_ntoa\0A\00"

@dbg_after_shutdown = private unnamed_addr constant [22 x i8] c"[dbg] shutdown rc=%d\0A\00"

@dbg_done = private unnamed_addr constant [21 x i8] c"[dbg] sequence done\0A\00"



; INtime / BSD socket 系（LLVM→COFF で '_' が付く前提なので、ここでは先頭 '_' を付けない）

%struct.sockaddr_in = type { i16, i16, i32, [8 x i8] }

declare i32 @socket(i32, i32, i32)

declare i32 @connect(i32, ptr, i32)

declare i32 @getsockname(i32, ptr, ptr)

declare ptr @inet_ntoa(i32)

declare i32 @shutdown(i32, i32)



@_ZN08NumbaEnv5hello8main_rtaB2v2B52c8tJTIeFIjxB2IKSgI4CrvQClUYkACQB1EiFSRRB9GgCAA_3d_3dEi7void_2a = common local_unnamed_addr global ptr null

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define noundef i32 @_ZN5hello8main_rtaB2v2B52c8tJTIeFIjxB2IKSgI4CrvQClUYkACQB1EiFSRRB9GgCAA_3d_3dEi7void_2a(ptr noalias nocapture writeonly initializes((0, 4)) %retptr, ptr noalias nocapture readnone %excinfo, i32 %arg.argc, ptr nocapture readnone %arg.argv) local_unnamed_addr #0 {
B0:
  store i32 0, ptr %retptr, align 4
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define i32 @main(i32 %.1, ptr nocapture readnone %.2) local_unnamed_addr #0 {
entry:
  call i32 (ptr, ...) @printf(ptr @msg_hello_python)
  call i32 (ptr, ...) @printf(ptr @dbg_sdk_hint)
  call i32 (ptr, ...) @printf(ptr @dbg_enter)
  call i32 (ptr, ...) @printf(ptr @dbg_before_socket)
  call i32 (ptr, ...) @printf(ptr @dbg_about_socket)
  %fd = call i32 @socket(i32 2, i32 2, i32 17)
  call i32 (ptr, ...) @printf(ptr @dbg_after_socket, i32 %fd)
  %fd_bad = icmp slt i32 %fd, 0
  %fd_safe = select i1 %fd_bad, i32 0, i32 %fd
  %sin = alloca %struct.sockaddr_in, align 4
  %family_ptr = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 0
  store i16 2, ptr %family_ptr, align 2
  %port_ptr = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 1
  store i16 20480, ptr %port_ptr, align 2 ; htons(80) 相当(0x5000)
  %addr_ptr = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 2
  store i32 0, ptr %addr_ptr, align 4
  %z0 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 0
  store i8 0, ptr %z0, align 1
  %z1 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 1
  store i8 0, ptr %z1, align 1
  %z2 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 2
  store i8 0, ptr %z2, align 1
  %z3 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 3
  store i8 0, ptr %z3, align 1
  %z4 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 4
  store i8 0, ptr %z4, align 1
  %z5 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 5
  store i8 0, ptr %z5, align 1
  %z6 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 6
  store i8 0, ptr %z6, align 1
  %z7 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 7
  store i8 0, ptr %z7, align 1
  %peer = alloca %struct.sockaddr_in, align 4
  %peer_family_ptr = getelementptr inbounds %struct.sockaddr_in, ptr %peer, i32 0, i32 0
  store i16 2, ptr %peer_family_ptr, align 2
  %peer_port_ptr = getelementptr inbounds %struct.sockaddr_in, ptr %peer, i32 0, i32 1
  store i16 20480, ptr %peer_port_ptr, align 2
  %peer_addr_ptr = getelementptr inbounds %struct.sockaddr_in, ptr %peer, i32 0, i32 2
  store i32 134744072, ptr %peer_addr_ptr, align 4
  call i32 (ptr, ...) @printf(ptr @dbg_before_connect)
  %connect_rc = call i32 @connect(i32 %fd_safe, ptr %peer, i32 16)
  call i32 (ptr, ...) @printf(ptr @dbg_after_connect, i32 %connect_rc)
  %len = alloca i32, align 4
  store i32 16, ptr %len, align 4
  call i32 (ptr, ...) @printf(ptr @dbg_before_getsockname)
  %getsockname_rc = call i32 @getsockname(i32 %fd_safe, ptr %sin, ptr %len)
  call i32 (ptr, ...) @printf(ptr @dbg_after_getsockname, i32 %getsockname_rc)
  %addr = load i32, ptr %addr_ptr, align 4
  call i32 (ptr, ...) @printf(ptr @dbg_before_inet_ntoa)
  %ipstr = call ptr @inet_ntoa(i32 %addr)
  %is_null_ip = icmp eq ptr %ipstr, null
  %na_ptr = getelementptr inbounds [4 x i8], ptr @msg_ip_na, i32 0, i32 0
  %safe_ip = select i1 %is_null_ip, ptr %na_ptr, ptr %ipstr
  call i32 (ptr, ...) @printf(ptr @msg_socket_ip, ptr %safe_ip)
  %shutdown_rc = call i32 @shutdown(i32 %fd_safe, i32 2)
  call i32 (ptr, ...) @printf(ptr @dbg_after_shutdown, i32 %shutdown_rc)
  call i32 (ptr, ...) @printf(ptr @dbg_done)
  %.4 = alloca i32, align 4
  %.8 = call i32 @_ZN5hello8main_rtaB2v2B52c8tJTIeFIjxB2IKSgI4CrvQClUYkACQB1EiFSRRB9GgCAA_3d_3dEi7void_2a(ptr nonnull %.4, ptr nonnull poison, i32 poison, ptr poison) #1
  %.18 = load i32, ptr %.4, align 4
  ret i32 %.18
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { noinline }
