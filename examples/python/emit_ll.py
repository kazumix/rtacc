"""

hello.py の Numba cfunc から LLVM IR を out/hello_python.ll に書き出す。

cfunc のラッパー名をリンカ向けに @main に置き換え、triple を i686 に揃える。



INtime の BSD socket() は TCP/IP スタック（istack 等）がロード済みでないと

TenAsys ドキュメントどおり ENODEV になり、環境によっては例外・サスペンドになる。

socket 呼び出しを LLVM に含めない場合は環境変数:

  RTACC_PYTHON_SOCKET_DEMO=0

で emit_ll 実行時に省略できる。

"""



from __future__ import annotations



import os

import re

from pathlib import Path



import hello



OUT_DIR = Path(__file__).resolve().parent / "out"

OUT_LL = OUT_DIR / "hello_python.ll"



# examples/rust/rtacc_algorithms の .ll と同系（rtacc / clang が i386 でビルド）

TARGET_TRIPLE = 'target triple = "i686-pc-windows-msvc"'

TARGET_DATALAYOUT = (

    'target datalayout = "e-m:x-p:32:32-p270:32:32-p271:32:32-p272:64:64'

    '-i64:64-i128:128-f80:128-n8:16:32-a:0:32-S32"'

)



# 共通: clib printf + SDK ヒント（スタック未ロード時は ENODEV。istack / netload 参照）

IR_CORE = """

@msg_hello_python = private unnamed_addr constant [14 x i8] c"Hello Python\\0A\\00"

declare i32 @printf(ptr noundef, ...)

@dbg_sdk_hint = private unnamed_addr constant [92 x i8] c"[dbg] SDK: Load TCP/IP stack (istack/netload). socket() returns ENODEV if stack not ready.\\0A\\00"

@dbg_socket_demo_off = private unnamed_addr constant [57 x i8] c"[dbg] socket demo disabled (RTACC_PYTHON_SOCKET_DEMO=0)\\0A\\00"

"""



# socket デモ用（netiff3m / netlib リンク前提）

IR_SOCKET = """

@msg_socket_ip = private unnamed_addr constant [34 x i8] c"default-route local ip (udp): %s\\0A\\00"

@msg_ip_na = private unnamed_addr constant [4 x i8] c"N/A\\00"

@dbg_enter = private unnamed_addr constant [29 x i8] c"[dbg] enter socket sequence\\0A\\00"

@dbg_before_socket = private unnamed_addr constant [28 x i8] c"[dbg] before socket() call\\0A\\00"

@dbg_about_socket = private unnamed_addr constant [80 x i8] c"[dbg] About to call socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP=17); hang=>no stack.\\0A\\00"

@dbg_after_socket = private unnamed_addr constant [32 x i8] c"[dbg] socket rc=%d (expect>=0)\\0A\\00"

@dbg_before_connect = private unnamed_addr constant [22 x i8] c"[dbg] before connect\\0A\\00"

@dbg_after_connect = private unnamed_addr constant [21 x i8] c"[dbg] connect rc=%d\\0A\\00"

@dbg_before_getsockname = private unnamed_addr constant [26 x i8] c"[dbg] before getsockname\\0A\\00"

@dbg_after_getsockname = private unnamed_addr constant [25 x i8] c"[dbg] getsockname rc=%d\\0A\\00"

@dbg_before_inet_ntoa = private unnamed_addr constant [24 x i8] c"[dbg] before inet_ntoa\\0A\\00"

@dbg_after_shutdown = private unnamed_addr constant [22 x i8] c"[dbg] shutdown rc=%d\\0A\\00"

@dbg_done = private unnamed_addr constant [21 x i8] c"[dbg] sequence done\\0A\\00"



; INtime / BSD socket 系（LLVM→COFF で '_' が付く前提なので、ここでは先頭 '_' を付けない）

%struct.sockaddr_in = type { i16, i16, i32, [8 x i8] }

declare i32 @socket(i32, i32, i32)

declare i32 @connect(i32, ptr, i32)

declare i32 @getsockname(i32, ptr, ptr)

declare ptr @inet_ntoa(i32)

declare i32 @shutdown(i32, i32)



"""





def socket_demo_enabled() -> bool:

    v = os.environ.get("RTACC_PYTHON_SOCKET_DEMO", "1").strip().lower()

    return v not in ("0", "false", "no", "off")





def patch_llvm(llvm: str) -> str:

    # Numba が付ける cfunc ラッパーをリンカ向けに @main に

    llvm = re.sub(

        r"define i32 @(cfunc\.[^\s(]+)\(",

        r"define i32 @main(",

        llvm,

        count=1,

    )

    if "define i32 @main(" not in llvm:

        raise RuntimeError("cfunc ラッパーが見つからず @main を定義できません")



    llvm = re.sub(

        r'target triple = "[^"]+"',

        TARGET_TRIPLE,

        llvm,

        count=1,

    )

    llvm = re.sub(

        r'target datalayout = "[^"]+"',

        TARGET_DATALAYOUT,

        llvm,

        count=1,

    )

    return llvm





def inject_printf_and_socket_ip_into_main(llvm: str, *, socket_demo: bool) -> str:

    """@main の先頭で printf。オプションで INtime BSD socket でローカルIP表示。"""

    triple_line = 'target triple = "i686-pc-windows-msvc"'

    pos = llvm.find(triple_line)

    if pos < 0:

        raise RuntimeError(f"missing {triple_line!r}")

    insert_at = pos + len(triple_line)

    if llvm[insert_at : insert_at + 1] not in ("\n", "\r"):

        raise RuntimeError("unexpected triple line ending")

    while insert_at < len(llvm) and llvm[insert_at] in "\r\n":

        insert_at += 1

    prefix = IR_CORE + (IR_SOCKET if socket_demo else "")

    llvm = llvm[:insert_at] + prefix + llvm[insert_at:]



    main_def = "define i32 @main("

    m_start = llvm.find(main_def)

    if m_start < 0:

        raise RuntimeError("define i32 @main not found")

    brace = llvm.find("{", m_start)

    if brace < 0:

        raise RuntimeError("main body not found")

    entry = llvm.find("entry:", brace, brace + 800)

    if entry < 0:

        raise RuntimeError("entry: in main not found")

    after_entry = entry + len("entry:")

    while after_entry < len(llvm) and llvm[after_entry] in " \t":

        after_entry += 1

    if llvm[after_entry : after_entry + 1] != "\n":

        raise RuntimeError("expected newline after entry:")

    after_entry += 1



    if not socket_demo:

        lines = (

            "  call i32 (ptr, ...) @printf(ptr @msg_hello_python)\n"

            "  call i32 (ptr, ...) @printf(ptr @dbg_sdk_hint)\n"

            "  call i32 (ptr, ...) @printf(ptr @dbg_socket_demo_off)\n"

        )

        return llvm[:after_entry] + lines + llvm[after_entry:]



    # 外向きルートのローカルIP取得（UDP + connect トリック）

    # 1) socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)  ※ protocol 0 だとスタック実装で落ちる例あり

    # 2) connect(8.8.8.8:80)

    # 3) getsockname() -> inet_ntoa() -> printf("%s")

    lines = (

        "  call i32 (ptr, ...) @printf(ptr @msg_hello_python)\n"

        "  call i32 (ptr, ...) @printf(ptr @dbg_sdk_hint)\n"

        "  call i32 (ptr, ...) @printf(ptr @dbg_enter)\n"

        "  call i32 (ptr, ...) @printf(ptr @dbg_before_socket)\n"

        "  call i32 (ptr, ...) @printf(ptr @dbg_about_socket)\n"

        "  %fd = call i32 @socket(i32 2, i32 2, i32 17)\n"

        "  call i32 (ptr, ...) @printf(ptr @dbg_after_socket, i32 %fd)\n"

        "  %fd_bad = icmp slt i32 %fd, 0\n"

        "  %fd_safe = select i1 %fd_bad, i32 0, i32 %fd\n"

        "  %sin = alloca %struct.sockaddr_in, align 4\n"

        "  %family_ptr = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 0\n"

        "  store i16 2, ptr %family_ptr, align 2\n"

        "  %port_ptr = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 1\n"

        "  store i16 20480, ptr %port_ptr, align 2 ; htons(80) 相当(0x5000)\n"

        "  %addr_ptr = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 2\n"

        "  store i32 0, ptr %addr_ptr, align 4\n"

        "  %z0 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 0\n"

        "  store i8 0, ptr %z0, align 1\n"

        "  %z1 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 1\n"

        "  store i8 0, ptr %z1, align 1\n"

        "  %z2 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 2\n"

        "  store i8 0, ptr %z2, align 1\n"

        "  %z3 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 3\n"

        "  store i8 0, ptr %z3, align 1\n"

        "  %z4 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 4\n"

        "  store i8 0, ptr %z4, align 1\n"

        "  %z5 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 5\n"

        "  store i8 0, ptr %z5, align 1\n"

        "  %z6 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 6\n"

        "  store i8 0, ptr %z6, align 1\n"

        "  %z7 = getelementptr inbounds %struct.sockaddr_in, ptr %sin, i32 0, i32 3, i32 7\n"

        "  store i8 0, ptr %z7, align 1\n"

        "  %peer = alloca %struct.sockaddr_in, align 4\n"

        "  %peer_family_ptr = getelementptr inbounds %struct.sockaddr_in, ptr %peer, i32 0, i32 0\n"

        "  store i16 2, ptr %peer_family_ptr, align 2\n"

        "  %peer_port_ptr = getelementptr inbounds %struct.sockaddr_in, ptr %peer, i32 0, i32 1\n"

        "  store i16 20480, ptr %peer_port_ptr, align 2\n"

        "  %peer_addr_ptr = getelementptr inbounds %struct.sockaddr_in, ptr %peer, i32 0, i32 2\n"

        "  store i32 134744072, ptr %peer_addr_ptr, align 4\n"

        "  call i32 (ptr, ...) @printf(ptr @dbg_before_connect)\n"

        "  %connect_rc = call i32 @connect(i32 %fd_safe, ptr %peer, i32 16)\n"

        "  call i32 (ptr, ...) @printf(ptr @dbg_after_connect, i32 %connect_rc)\n"

        "  %len = alloca i32, align 4\n"

        "  store i32 16, ptr %len, align 4\n"

        "  call i32 (ptr, ...) @printf(ptr @dbg_before_getsockname)\n"

        "  %getsockname_rc = call i32 @getsockname(i32 %fd_safe, ptr %sin, ptr %len)\n"

        "  call i32 (ptr, ...) @printf(ptr @dbg_after_getsockname, i32 %getsockname_rc)\n"

        "  %addr = load i32, ptr %addr_ptr, align 4\n"

        "  call i32 (ptr, ...) @printf(ptr @dbg_before_inet_ntoa)\n"

        "  %ipstr = call ptr @inet_ntoa(i32 %addr)\n"

        "  %is_null_ip = icmp eq ptr %ipstr, null\n"

        "  %na_ptr = getelementptr inbounds [4 x i8], ptr @msg_ip_na, i32 0, i32 0\n"

        "  %safe_ip = select i1 %is_null_ip, ptr %na_ptr, ptr %ipstr\n"

        "  call i32 (ptr, ...) @printf(ptr @msg_socket_ip, ptr %safe_ip)\n"

        "  %shutdown_rc = call i32 @shutdown(i32 %fd_safe, i32 2)\n"

        "  call i32 (ptr, ...) @printf(ptr @dbg_after_shutdown, i32 %shutdown_rc)\n"

        "  call i32 (ptr, ...) @printf(ptr @dbg_done)\n"

    )

    return llvm[:after_entry] + lines + llvm[after_entry:]





def main() -> None:

    demo = socket_demo_enabled()

    hello.main_rta.compile()

    raw = hello.main_rta.inspect_llvm()

    patched = patch_llvm(raw)

    patched = inject_printf_and_socket_ip_into_main(patched, socket_demo=demo)

    OUT_DIR.mkdir(parents=True, exist_ok=True)

    OUT_LL.write_text(patched, encoding="utf-8")

    print(f"Generated: {OUT_LL} (RTACC_PYTHON_SOCKET_DEMO={'1' if demo else '0'})")





if __name__ == "__main__":

    main()
