"""
KPA / EtherCAT ENI (例: RtEcHdr.xml) から VendorId = 131 (Omron) のスレーブ一覧を表示する。
ビルド時の期待件数確認用（ランタイムの EhFindSlaveBySlaveNo とは番号体系が異なる場合がある）。
"""

from __future__ import annotations

import argparse
import sys
import xml.etree.ElementTree as ET
from pathlib import Path


OMRON_VENDOR_DEC = 131  # 0x0083


def main() -> int:
    p = argparse.ArgumentParser(description="List Omron slaves in ENI XML")
    p.add_argument(
        "eni",
        nargs="?",
        default="RtEcHdr.xml",
        help="Path to ENI XML (default: RtEcHdr.xml)",
    )
    args = p.parse_args()
    path = Path(args.eni)
    if not path.is_file():
        print(f"ENI not found: {path.resolve()}", file=sys.stderr)
        return 1

    def local(tag: str) -> str:
        return tag.split("}", 1)[-1] if tag.startswith("{") else tag

    tree = ET.parse(path)
    root = tree.getroot()
    slaves = [e for e in root.iter() if local(e.tag) == "Slave"]
    omron = []
    for sl in slaves:
        info = next((c for c in sl if local(c.tag) == "Info"), None)
        if info is None:
            continue
        def child(name: str):
            return next((c for c in info if local(c.tag) == name), None)

        vid_el = child("VendorId")
        name_el = child("Name")
        phys_el = child("PhysAddr")
        if vid_el is None or vid_el.text is None:
            continue
        try:
            vid = int(vid_el.text.strip(), 10)
        except ValueError:
            continue
        if vid != OMRON_VENDOR_DEC:
            continue
        name = (name_el.text or "").strip() if name_el is not None else ""
        phys = (phys_el.text or "").strip() if phys_el is not None else ""
        alias = sl.get("Alias") or ""
        omron.append((alias, phys, name))

    print(f"Omron (VendorId={OMRON_VENDOR_DEC}) slaves in {path}: {len(omron)}")
    for alias, phys, name in omron:
        print(f"  alias={alias!r} PhysAddr={phys} {name}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
