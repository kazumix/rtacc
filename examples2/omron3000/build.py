"""
examples/python と同様、Python から rtacc で INtime .rta をビルドする。

RSI-ECAT のパスは project.json の includes / linker_flags の /LIBPATH で指定する
（例: .../0040_RSIECAT.430/include と .../lib）。

任意:
  INTIME / LLVM … rtacc 既定と同じ（未設定時は標準インストールパス）

手順:
  1) python eni_omron_slaves.py RtEcHdr.xml   # ENI 内 Omron 台数の確認（任意）
  2) python build.py                          # out/omron3000.rta
"""

from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


def _rsi_ecat_dirs_from_project(here: Path) -> tuple[Path | None, Path | None]:
    """project.json から include ディレクトリと lib ディレクトリを推定する。"""
    proj_path = here / "project.json"
    with proj_path.open(encoding="utf-8") as f:
        p = json.load(f)
    inc: Path | None = None
    for x in p.get("targets", [{}])[0].get("includes") or []:
        if x and x != ".":
            inc = Path(x)
            break
    lib: Path | None = None
    for flag in p.get("toolsets", {}).get("llvm", {}).get("linker_flags") or []:
        if isinstance(flag, str) and flag.upper().startswith("/LIBPATH:"):
            lib = Path(flag.split(":", 1)[1])
            break
    return inc, lib


def main() -> int:
    here = Path(__file__).resolve().parent
    inc_dir, lib_dir = _rsi_ecat_dirs_from_project(here)
    if inc_dir is None or not (inc_dir / "ehapi.h").is_file():
        print(
            "project.json の includes に ehapi.h があるパスを指定してください。",
            file=sys.stderr,
        )
        if inc_dir is not None:
            print(f"  現在: {inc_dir}", file=sys.stderr)
        return 1
    if lib_dir is not None:
        for need in ("ehapi.lib",):
            if not (lib_dir / need).is_file():
                print(f"警告: {need} が {lib_dir} にありません。", file=sys.stderr)

    proj = here / "project.json"
    repo_root = here.parent.parent

    rtacc = shutil_which("rtacc")
    cmd: list[str]
    if rtacc:
        cmd = [rtacc, str(proj)]
    else:
        go = shutil_which("go")
        if not go:
            print("rtacc も go も PATH にありません。", file=sys.stderr)
            return 1
        cmd = [go, "run", "./cmd/rtacc", str(proj)]

    print("Run:", " ".join(cmd), "(cwd:", repo_root, ")")
    r = subprocess.run(cmd, cwd=str(repo_root))
    return int(r.returncode)


def shutil_which(name: str) -> str | None:
    from shutil import which

    return which(name)


if __name__ == "__main__":
    raise SystemExit(main())
