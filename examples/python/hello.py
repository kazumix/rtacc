"""
Hello Python — 通常実行: python hello.py
LLVM / .rta は build_ll.ps1（emit_ll.py が out/hello_python.ll を生成）

RTA 上では Python の print は使えない。コンソール出力と INtime socket 呼び出しは
emit_ll.py 側で LLVM に直接注入して実装する。
TCP/IP スタック（istack）未ロード時は socket() が失敗する（SDK の ENODEV 参照）。
socket 注入を省略するには emit_ll 実行時に RTACC_PYTHON_SOCKET_DEMO=0。
リンク: rtacc は LLVM ターゲットで既定として netlib.lib 等を付ける（project.json の libs に無くてもリンク行に含まれる）。追加の netiff3m.lib は socket 実体用。
"""

from numba import cfunc, types


def main() -> None:
    print("Hello Python")


# INtime / rtacc 向けエントリ（LLVM に C 互換の main 相当を生成）
@cfunc(types.int32(types.int32, types.voidptr))
def main_rta(argc, argv):
    return 0


if __name__ == "__main__":
    main()
