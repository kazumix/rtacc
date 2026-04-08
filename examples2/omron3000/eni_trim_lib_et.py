from __future__ import annotations

import math
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable
from xml.etree import ElementTree as ET


def _local(tag: str) -> str:
    # ElementTree namespace形式: "{uri}TagName"
    return tag.split("}", 1)[-1] if "}" in tag else tag


def _ceil_div(a: int, b: int) -> int:
    return int(math.ceil(a / b))


def _make_zero_hex(byte_len: int) -> str:
    if byte_len <= 0:
        return ""
    return "0" * (byte_len * 2)


def _find_first_child(parent: ET.Element, name: str) -> ET.Element | None:
    # ElementTreeのfind()はパス指定時は限定されるため、タグ名直下を明示的に見る。
    for ch in parent:
        if _local(ch.tag) == name:
            return ch
    return None


def _find_child_int(parent: ET.Element, child_tag: str) -> int:
    el = _find_first_child(parent, child_tag)
    if el is None or el.text is None:
        raise ValueError(f"Missing int child {child_tag} under <{parent.tag}>")
    return int(el.text.strip(), 10)


def _find_child_text(parent: ET.Element, child_tag: str) -> str:
    el = _find_first_child(parent, child_tag)
    if el is None:
        return ""
    return (el.text or "").strip()


def _get_processdata_send_recv(slave_el: ET.Element) -> tuple[int | None, ET.Element | None, int | None, ET.Element | None]:
    pd = _find_first_child(slave_el, "ProcessData")
    if pd is None:
        return None, None, None, None

    send_el = _find_first_child(pd, "Send")
    recv_el = _find_first_child(pd, "Recv")

    send_bit_length = None
    recv_bit_length = None

    if send_el is not None:
        bl = _find_first_child(send_el, "BitLength")
        if bl is not None and bl.text:
            send_bit_length = int(bl.text.strip(), 10)
    if recv_el is not None:
        bl = _find_first_child(recv_el, "BitLength")
        if bl is not None and bl.text:
            recv_bit_length = int(bl.text.strip(), 10)

    return send_bit_length, send_el, recv_bit_length, recv_el


def _set_child_text_int(parent: ET.Element, child_tag: str, value: int) -> None:
    el = _find_first_child(parent, child_tag)
    if el is None:
        raise ValueError(f"Missing child {child_tag} under <{parent.tag}>")
    el.text = str(int(value))


def _set_bitstart(send_or_recv_el: ET.Element, new_bit_start: int) -> None:
    bs = _find_first_child(send_or_recv_el, "BitStart")
    if bs is None:
        raise ValueError("Missing BitStart")
    bs.text = str(int(new_bit_start))


def _get_slave_info_el(slave_el: ET.Element) -> ET.Element:
    # Slave直下のInfo
    for ch in list(slave_el):
        if _local(ch.tag) == "Info":
            return ch
    raise ValueError("Info not found under Slave")


def _get_slave_phys_addr(slave_el: ET.Element) -> int:
    info_el = _get_slave_info_el(slave_el)
    return _find_child_int(info_el, "PhysAddr")


def _get_slave_auto_inc_addr(slave_el: ET.Element) -> int:
    info_el = _get_slave_info_el(slave_el)
    # ElementTree版では AutoIncAddr が無い場合があり得るためエラーにする
    a = _find_first_child(info_el, "AutoIncAddr")
    if a is None or a.text is None:
        raise ValueError("AutoIncAddr not found under Slave/Info")
    return int(a.text.strip(), 10)


def _update_slave_phys_reindex(
    *,
    remaining_infos: list[tuple[ET.Element, SlaveInfo]],
    base_phys_addr: int,
) -> None:
    """
    削除後の残存スレーブ順に合わせて PhysAddr / AutoIncAddr / Segment を再採番し、
    Slave配下の Adp を old_phys/old_autoinc -> new に置換する。

    注意: Alias / Identification@Value は保持する（KPA の削除後出力に合わせる）。
    """
    for new_idx, (sl_el, _old_info) in enumerate(remaining_infos):
        new_ident = new_idx + 1
        new_phys = base_phys_addr + new_idx
        new_auto = 0 if new_ident == 1 else (65537 - new_ident)

        old_phys = _get_slave_phys_addr(sl_el)
        old_auto = _get_slave_auto_inc_addr(sl_el)

        # Slave attributes（Segment のみ更新）
        sl_el.set("Segment", str(new_ident - 1))

        # Info children
        info_el = _get_slave_info_el(sl_el)
        _set_child_text_int(info_el, "PhysAddr", new_phys)
        _set_child_text_int(info_el, "AutoIncAddr", new_auto)

        # Adp replacements
        for adp_el in sl_el.iter():
            if _local(adp_el.tag) != "Adp":
                continue
            if adp_el.text is None:
                continue
            t = adp_el.text.strip()
            if t == str(old_phys):
                adp_el.text = str(new_phys)
            elif t == str(old_auto):
                adp_el.text = str(new_auto)


def _update_previous_port_phys_addrs(remaining_infos: list[tuple[ET.Element, SlaveInfo]]) -> None:
    """
    削除によりチェーン先行が変わるため、Slave 内の <PreviousPort><PhysAddr> を残存順で更新する。
    """
    if len(remaining_infos) <= 1:
        return
    for i in range(1, len(remaining_infos)):
        sl_el, _info = remaining_infos[i]
        prev_phys = _get_slave_phys_addr(remaining_infos[i - 1][0])
        prev_port_el = None
        for el in sl_el.iter():
            if _local(el.tag) == "PreviousPort":
                prev_port_el = el
                break
        if prev_port_el is None:
            continue
        phys_el = None
        for ch in list(prev_port_el):
            if _local(ch.tag) == "PhysAddr":
                phys_el = ch
                break
        if phys_el is None:
            phys_el = ET.SubElement(prev_port_el, "PhysAddr")
        phys_el.text = str(int(prev_phys))


def _update_master_mailbox_states_count(root: ET.Element, slave_count: int) -> None:
    """
    KPA 等では Master/MailboxStates/Count がスレーブ台数と一致する。
    トリムで台数が変わると未更新だとマスタ側のメールボックス状態領域と不整合になり得る。
    """
    if slave_count < 0:
        return
    for el in root.iter():
        if _local(el.tag) != "MailboxStates":
            continue
        count_el = _find_first_child(el, "Count")
        if count_el is not None:
            count_el.text = str(int(slave_count))
        break


def _update_mailbox_status_bit_addrs(remaining_infos: list[tuple[ET.Element, SlaveInfo]]) -> None:
    """
    削除でスレーブ数/順が変わるため、Mailboxの StatusBitAddr を 0..N-1 に詰め直す。
    """
    for i, (sl_el, _info) in enumerate(remaining_infos):
        for el in sl_el.iter():
            if _local(el.tag) != "StatusBitAddr":
                continue
            el.text = str(i)


def _remove_children_by_tag(parent: ET.Element, tag: str) -> None:
    for ch in list(parent):
        if _local(ch.tag) == tag:
            parent.remove(ch)


@dataclass(frozen=True)
class SlaveInfo:
    phys_addr: int
    alias: str
    vendor_id: int
    name: str
    send_bit_length: int | None
    recv_bit_length: int | None


@dataclass(frozen=True)
class CyclicInfo:
    lrd_data_length: int
    lrd_cnt: int
    lrd_owner_phys_addrs: list[int]
    mailbox_input_offs: int
    mailbox_data_length: int
    mailbox_cnt: int
    mailbox_owner_phys_addrs: list[int]
    lwr_data_length: int
    lwr_cnt: int
    lwr_owner_phys_addrs: list[int]
    system_time_output_offs: int
    system_time_data_length: int


@dataclass(frozen=True)
class TrimSummary:
    original_slave_count: int
    remaining_slave_count: int
    inputs_used_bytes: int
    outputs_used_bytes: int
    inputs_reserved_bytes: int
    outputs_reserved_bytes: int
    new_inputs_byte_size: int
    new_outputs_byte_size: int
    cyclic: CyclicInfo


def load_eni(path: str | Path) -> tuple[ET.Element, list[SlaveInfo]]:
    path = Path(path)
    tree = ET.parse(str(path))
    root = tree.getroot()

    slaves: list[SlaveInfo] = []

    for sl in root.iter():
        if _local(sl.tag) != "Slave":
            continue
        info_el = _find_first_child(sl, "Info")
        if info_el is None:
            continue

        phys_addr = _find_child_int(info_el, "PhysAddr")
        alias = sl.attrib.get("Alias", "")
        vendor_id_el = _find_first_child(info_el, "VendorId")
        vendor_id = int(vendor_id_el.text.strip(), 10) if vendor_id_el is not None and vendor_id_el.text else 0
        name = _find_child_text(info_el, "Name")

        send_bit_length, _, recv_bit_length, _ = _get_processdata_send_recv(sl)

        slaves.append(
            SlaveInfo(
                phys_addr=phys_addr,
                alias=alias,
                vendor_id=vendor_id,
                name=name,
                send_bit_length=send_bit_length,
                recv_bit_length=recv_bit_length,
            )
        )

    return root, slaves


def _get_processimage_containers(root: ET.Element) -> tuple[ET.Element, ET.Element]:
    pi = None
    for el in root.iter():
        if _local(el.tag) == "ProcessImage":
            pi = el
            break
    if pi is None:
        raise ValueError("ProcessImage not found")
    inputs = _find_first_child(pi, "Inputs")
    outputs = _find_first_child(pi, "Outputs")
    if inputs is None or outputs is None:
        raise ValueError("ProcessImage Inputs/Outputs not found")
    return inputs, outputs


def _get_cyclic_frame(root: ET.Element) -> ET.Element:
    # 名前空間の影響を受けないよう local-name で探索
    cyclic = None
    for el in root.iter():
        if _local(el.tag) == "Cyclic":
            cyclic = el
            break
    if cyclic is None:
        raise ValueError("Cyclic not found")
    for el in cyclic.iter():
        if _local(el.tag) == "Frame":
            return el
    raise ValueError("Cyclic/Frame not found")


def _iter_frame_cmds(frame: ET.Element) -> list[ET.Element]:
    """Cyclic/Frame 直下の Cmd（名前空間付きタグでも拾う）。"""
    return [ch for ch in list(frame) if _local(ch.tag) == "Cmd"]


def _get_cmd_by_comment_contains(frame: ET.Element, substr: str) -> ET.Element | None:
    for cmd in _iter_frame_cmds(frame):
        comment_el = _find_first_child(cmd, "Comment")
        comment_text = (comment_el.text if comment_el is not None else "") or ""
        if substr in comment_text:
            return cmd
    return None


def _extract_owner_phys_addrs(cmd_el: ET.Element) -> list[int]:
    r: list[int] = []
    for el in list(cmd_el):
        if _local(el.tag) != "OwnerPhysAddr":
            continue
        if el.text is None:
            continue
        r.append(int(el.text.strip(), 10))
    return r


def _set_owner_phys_addrs(cmd_el: ET.Element, owner_phys_addrs: list[int]) -> None:
    _remove_children_by_tag(cmd_el, "OwnerPhysAddr")
    for addr in owner_phys_addrs:
        el = ET.SubElement(cmd_el, "OwnerPhysAddr")
        el.text = str(int(addr))


def _maybe_set_defaults(cmd_el: ET.Element, data_length_bytes: int, *, input_or_output: str) -> None:
    key_data = f"{input_or_output}DefaultData"
    key_mask = f"{input_or_output}DefaultDataMask"
    data_el = _find_first_child(cmd_el, key_data)
    if data_el is not None:
        data_el.text = _make_zero_hex(data_length_bytes)
    mask_el = _find_first_child(cmd_el, key_mask)
    if mask_el is not None:
        mask_el.text = _make_zero_hex(data_length_bytes)


def _hex_first_uint32_le(data_hex: str) -> int | None:
    """FMMU InitCmd の Data 先頭 4 バイトを uint32 LE として解釈する。"""
    h = data_hex.strip().replace(" ", "")
    if len(h) < 8:
        return None
    try:
        b = bytes.fromhex(h[:8])
    except ValueError:
        return None
    return int.from_bytes(b[0:4], "little")


def _patch_hex_data_first_uint32_le(data_hex: str, new_val: int) -> str:
    h = data_hex.strip().replace(" ", "")
    if len(h) < 8:
        return data_hex
    b = bytearray(bytes.fromhex(h))
    b[0:4] = (new_val & 0xFFFFFFFF).to_bytes(4, "little")
    return b.hex()


def _patch_fmmu_mailbox_status_pair(data_hex: str, status_bit: int) -> str:
    h = data_hex.strip().replace(" ", "")
    if len(h) < 16:
        return data_hex
    b = bytearray(bytes.fromhex(h))
    sb = status_bit & 0xFF
    b[6] = sb
    b[7] = sb
    return b.hex()


def _get_mailbox_recv_status_bit(slave_el: ET.Element) -> int | None:
    mb = _find_first_child(slave_el, "Mailbox")
    if mb is None:
        return None
    recv = _find_first_child(mb, "Recv")
    if recv is None:
        return None
    sb = _find_first_child(recv, "StatusBitAddr")
    if sb is None or sb.text is None or not sb.text.strip():
        return None
    return int(sb.text.strip(), 10)


def _patch_slave_fmmu_init_cmds(
    slave_el: ET.Element,
    *,
    lrd_addr_bits: int,
    lwr_addr_bits: int,
) -> None:
    """
    ProcessData の BitStart/StatusBitAddr と整合するよう、FMMU 設定用 InitCmd の Data を更新する。
    TwinCAT/KPA 生成 ENI では、先頭の LogicalStart（uint32 LE）が Cyclic の Addr + BitStart/8 に一致する。
    mailbox state FMMU の Data には StatusBitAddr が 2 バイト連続で埋め込まれる。
    """
    send_bit_length, send_el, recv_bit_length, recv_el = _get_processdata_send_recv(slave_el)
    recv_bs = 0
    send_bs = 0
    if recv_el is not None and recv_bit_length is not None:
        bs = _find_first_child(recv_el, "BitStart")
        if bs is not None and bs.text:
            recv_bs = int(bs.text.strip(), 10)
    if send_el is not None and send_bit_length is not None:
        bs = _find_first_child(send_el, "BitStart")
        if bs is not None and bs.text:
            send_bs = int(bs.text.strip(), 10)

    status_bit = _get_mailbox_recv_status_bit(slave_el)

    init_cmds_parent = _find_first_child(slave_el, "InitCmds")
    if init_cmds_parent is None:
        return

    for cmd in init_cmds_parent:
        if _local(cmd.tag) != "InitCmd":
            continue
        cmt_el = _find_first_child(cmd, "Comment")
        cmt = (cmt_el.text or "") if cmt_el is not None else ""
        data_el = _find_first_child(cmd, "Data")
        if data_el is None or not data_el.text:
            continue
        hex_str = data_el.text.strip().replace(" ", "")
        if len(hex_str) < 8:
            continue

        if "set fmmu 0 (output)" in cmt and send_el is not None and send_bit_length is not None:
            new_w = (lwr_addr_bits + send_bs // 8) & 0xFFFFFFFF
            data_el.text = _patch_hex_data_first_uint32_le(hex_str, new_w)
        elif "set fmmu 1 (input)" in cmt and recv_el is not None and recv_bit_length is not None:
            new_w = (lrd_addr_bits + recv_bs // 8) & 0xFFFFFFFF
            data_el.text = _patch_hex_data_first_uint32_le(hex_str, new_w)
        elif "set fmmu 2 (mailbox state)" in cmt and status_bit is not None:
            if len(hex_str) >= 16:
                data_el.text = _patch_fmmu_mailbox_status_pair(hex_str, status_bit)


def _validate_slave_fmmu_init_cmds(
    slave_el: ET.Element,
    *,
    lrd_addr_bits: int,
    lwr_addr_bits: int,
    phys_addr: int,
    slave_label: str,
) -> None:
    """
    パッチ後: set fmmu 0/1/2 の Data が Cyclic Addr + ProcessData BitStart/8（および mailbox の StatusBitAddr）と一致するか検証する。
    不一致は PDO ビットずれ・INIT+ERR の典型原因なので ValueError にする。
    """
    send_bit_length, send_el, recv_bit_length, recv_el = _get_processdata_send_recv(slave_el)
    recv_bs = 0
    send_bs = 0
    if recv_el is not None and recv_bit_length is not None:
        bs = _find_first_child(recv_el, "BitStart")
        if bs is not None and bs.text:
            recv_bs = int(bs.text.strip(), 10)
    if send_el is not None and send_bit_length is not None:
        bs = _find_first_child(send_el, "BitStart")
        if bs is not None and bs.text:
            send_bs = int(bs.text.strip(), 10)

    status_bit = _get_mailbox_recv_status_bit(slave_el)
    init_cmds_parent = _find_first_child(slave_el, "InitCmds")
    if init_cmds_parent is None:
        return

    for cmd in init_cmds_parent:
        if _local(cmd.tag) != "InitCmd":
            continue
        cmt_el = _find_first_child(cmd, "Comment")
        cmt = (cmt_el.text or "") if cmt_el is not None else ""
        data_el = _find_first_child(cmd, "Data")
        if data_el is None or not data_el.text:
            continue
        hex_str = data_el.text.strip().replace(" ", "")
        if len(hex_str) < 8:
            continue

        if "set fmmu 0 (output)" in cmt and send_el is not None and send_bit_length is not None:
            exp = (lwr_addr_bits + send_bs // 8) & 0xFFFFFFFF
            got = _hex_first_uint32_le(hex_str)
            if got is None:
                raise ValueError(
                    f"FMMU0 Data parse failed: {slave_label} phys={phys_addr} (need >=4 bytes hex)"
                )
            if got != exp:
                raise ValueError(
                    f"FMMU0 logical start mismatch: {slave_label} phys={phys_addr}: "
                    f"expected first u32 LE = 0x{exp:08X} (LWR Addr + output BitStart/8), "
                    f"got 0x{got:08X} in InitCmd Data"
                )
        elif "set fmmu 1 (input)" in cmt and recv_el is not None and recv_bit_length is not None:
            exp = (lrd_addr_bits + recv_bs // 8) & 0xFFFFFFFF
            got = _hex_first_uint32_le(hex_str)
            if got is None:
                raise ValueError(
                    f"FMMU1 Data parse failed: {slave_label} phys={phys_addr} (need >=4 bytes hex)"
                )
            if got != exp:
                raise ValueError(
                    f"FMMU1 logical start mismatch: {slave_label} phys={phys_addr}: "
                    f"expected first u32 LE = 0x{exp:08X} (LRD Addr + input BitStart/8), "
                    f"got 0x{got:08X} in InitCmd Data"
                )
        elif "set fmmu 2 (mailbox state)" in cmt and status_bit is not None:
            if len(hex_str) < 16:
                raise ValueError(
                    f"FMMU2 Data too short: {slave_label} phys={phys_addr} (need >=8 bytes for mailbox FMMU)"
                )
            try:
                raw = bytes.fromhex(hex_str)
            except ValueError as e:
                raise ValueError(f"FMMU2 Data hex invalid: {slave_label} phys={phys_addr}: {e}") from e
            sb = status_bit & 0xFF
            if len(raw) < 8 or raw[6] != sb or raw[7] != sb:
                raise ValueError(
                    f"FMMU2 mailbox StatusBitAddr embed mismatch: {slave_label} phys={phys_addr}: "
                    f"expected bytes[6]=bytes[7]=0x{sb:02X}, got [6]=0x{raw[6]:02X} [7]=0x{raw[7]:02X}"
                )


def _repack_processimage_direction(
    *,
    container_el: ET.Element,
    remaining_slave_names: set[str],
    delete_slave_names: set[str],
    get_slave_start,
    bitoff_tag: str = "BitOffs",
) -> None:
    variables = list(container_el.findall("Variable"))

    # Remove deleted slave variables.
    for v in variables:
        sname = v.attrib.get("slave_name") or ""
        if sname in delete_slave_names:
            container_el.remove(v)

    # Repack remaining slaves based on existing Variable ordering.
    variables_after = list(container_el.findall("Variable"))
    by_slave: dict[str, list[ET.Element]] = {}
    order: list[str] = []

    for v in variables_after:
        sname = v.attrib.get("slave_name") or ""
        if sname not in remaining_slave_names:
            continue
        if sname not in by_slave:
            by_slave[sname] = []
            order.append(sname)
        by_slave[sname].append(v)

    for sname in order:
        base = int(get_slave_start(sname))
        bit_offs = 0
        for v in by_slave[sname]:
            bs_el = _find_first_child(v, "BitSize")
            if bs_el is None or bs_el.text is None:
                raise ValueError("BitSize not found in Variable")
            bit_size = int(bs_el.text.strip(), 10)
            bo_el = _find_first_child(v, bitoff_tag)
            if bo_el is None:
                raise ValueError("BitOffs not found in Variable")
            bo_el.text = str(base + bit_offs)
            bit_offs += bit_size


def compute_trim_from_path(
    path: str | Path,
    delete_phys_addrs: Iterable[int],
    *,
    reindex_phys_addrs: bool = True,
    phys_base: int = 1001,
    verify_fmmu: bool = True,
) -> tuple[ET.Element, TrimSummary]:
    """
    物理アドレス指定でスレーブを削除し、ProcessImage / Cyclic / FMMU を再計算する。
    verify_fmmu=True（既定）では、各スレーブの set fmmu 0/1/2 の Data が
    Cyclic LRD/LWR の Addr + ProcessData BitStart/8（および mailbox の StatusBitAddr）と一致するか検証する。
    """
    path = Path(path)
    root, slaves = load_eni(path)
    delete_set = {int(x) for x in delete_phys_addrs}

    remaining_slaves = [s for s in slaves if s.phys_addr not in delete_set]
    if not remaining_slaves:
        raise ValueError("削除後にスレーブが0台になります（空のENIは出力できません）")

    # Collect slave phys->info and names.
    all_by_phys = {s.phys_addr: s for s in slaves}
    delete_slave_names = {all_by_phys[p].name for p in delete_set if p in all_by_phys}
    remaining_slave_names = {s.name for s in remaining_slaves}
    remaining_phys_order = {s.phys_addr: s for s in remaining_slaves}

    # ProcessImage reserved size inference
    inputs_el, outputs_el = _get_processimage_containers(root)
    original_inputs_byte_size = int(_find_child_text(inputs_el, "ByteSize") or inputs_el.findtext("ByteSize") or "0")
    original_outputs_byte_size = int(_find_child_text(outputs_el, "ByteSize") or outputs_el.findtext("ByteSize") or "0")

    original_used_inputs_bits = sum((s.recv_bit_length or 0) for s in slaves if s.recv_bit_length is not None)
    original_used_outputs_bits = sum((s.send_bit_length or 0) for s in slaves if s.send_bit_length is not None)

    original_used_inputs_bytes = _ceil_div(original_used_inputs_bits, 8)
    original_used_outputs_bytes = _ceil_div(original_used_outputs_bits, 8)
    inputs_reserved_bytes = original_inputs_byte_size - original_used_inputs_bytes
    outputs_reserved_bytes = original_outputs_byte_size - original_used_outputs_bytes
    if inputs_reserved_bytes < 0 or outputs_reserved_bytes < 0:
        raise ValueError("Reserved bytes inference failed (ByteSize smaller than used area).")

    # Remove Slave elements by phys addr.
    for parent in list(root.iter()):
        for sl in list(parent):
            if _local(sl.tag) != "Slave":
                continue
            info_el = _find_first_child(sl, "Info")
            if info_el is None:
                continue
            phys_el = _find_first_child(info_el, "PhysAddr")
            if phys_el is None or phys_el.text is None:
                continue
            phys = int(phys_el.text.strip(), 10)
            if phys in delete_set:
                parent.remove(sl)

    # Collect remaining slave elements in document order.
    remaining_slave_els = [el for el in root.iter() if _local(el.tag) == "Slave"]
    remaining_infos: list[tuple[ET.Element, SlaveInfo]] = []
    for sl_el in remaining_slave_els:
        info_el = _find_first_child(sl_el, "Info")
        if info_el is None:
            continue
        phys_el = _find_first_child(info_el, "PhysAddr")
        if phys_el is None or phys_el.text is None:
            continue
        phys = int(phys_el.text.strip(), 10)
        if phys not in remaining_phys_order:
            continue
        remaining_infos.append((sl_el, remaining_phys_order[phys]))

    base_phys: int | None = None
    if reindex_phys_addrs:
        # 配置アドレスの詰め直し:
        # - EtherCAT では先頭スレーブの PhysAddr は多くの場合 1001（KPA Studio の削除後 ENI も同様）。
        # - 旧実装は min(残存) を基準にしており、先頭を 1–4 削除しただけだと 1005 からのままになり
        #   Cyclic の OwnerPhysAddr / マスタ期待とずれることがある。
        if phys_base < 1:
            raise ValueError("phys_base must be >= 1")
        base_phys = int(phys_base)
        _update_slave_phys_reindex(remaining_infos=remaining_infos, base_phys_addr=base_phys)

    # 削除によりチェーン先行が変わるため、PreviousPort PhysAddr を更新する（再採番後のPhysAddrを使用）
    _update_previous_port_phys_addrs(remaining_infos)

    # 削除でメールボックス状態のビット割り当てがズレるため StatusBitAddr を再採番
    _update_mailbox_status_bit_addrs(remaining_infos)

    # Recompute BitStart for each remaining slave's ProcessData.
    cum_send_bits = 0
    cum_recv_bits = 0
    new_slave_send_start: dict[str, int] = {}
    new_slave_recv_start: dict[str, int] = {}

    for sl_el, info in remaining_infos:
        send_bit_length, send_el, recv_bit_length, recv_el = _get_processdata_send_recv(sl_el)
        if recv_el is not None and recv_bit_length is not None:
            _set_bitstart(recv_el, cum_recv_bits)
            new_slave_recv_start[info.name] = cum_recv_bits
            cum_recv_bits += recv_bit_length
        if send_el is not None and send_bit_length is not None:
            _set_bitstart(send_el, cum_send_bits)
            new_slave_send_start[info.name] = cum_send_bits
            cum_send_bits += send_bit_length

    new_inputs_used_bytes = _ceil_div(cum_recv_bits, 8)
    new_outputs_used_bytes = _ceil_div(cum_send_bits, 8)

    # Update ProcessImage variables.
    inputs_byte_size_new = new_inputs_used_bytes + inputs_reserved_bytes
    outputs_byte_size_new = new_outputs_used_bytes + outputs_reserved_bytes

    _repack_processimage_direction(
        container_el=inputs_el,
        remaining_slave_names=remaining_slave_names,
        delete_slave_names=delete_slave_names,
        get_slave_start=lambda sname: new_slave_recv_start[sname],
    )
    _repack_processimage_direction(
        container_el=outputs_el,
        remaining_slave_names=remaining_slave_names,
        delete_slave_names=delete_slave_names,
        get_slave_start=lambda sname: new_slave_send_start[sname],
    )

    # Update ByteSize
    bs_in = _find_first_child(inputs_el, "ByteSize")
    if bs_in is not None:
        bs_in.text = str(int(inputs_byte_size_new))
    bs_out = _find_first_child(outputs_el, "ByteSize")
    if bs_out is not None:
        bs_out.text = str(int(outputs_byte_size_new))

    # Update Cyclic frame.
    frame = _get_cyclic_frame(root)
    lrd_cmd = _get_cmd_by_comment_contains(frame, "LRD cmd")
    lwr_cmd = _get_cmd_by_comment_contains(frame, "LWR cmd")
    mailbox_cmd = _get_cmd_by_comment_contains(frame, "Read mailbox state")
    # TwinCAT 等は「Read System Time …」、KPA の Cyclic には無いことがある（省略可）
    system_time_cmd = _get_cmd_by_comment_contains(frame, "Read System Time")
    if lrd_cmd is None or lwr_cmd is None or mailbox_cmd is None:
        raise ValueError("Cyclic Frame commands not found (need LRD cmd, LWR cmd, Read mailbox state).")

    lrd_owners = [
        _get_slave_phys_addr(sl_el) for (sl_el, info) in remaining_infos if info.recv_bit_length is not None
    ]
    lwr_owners = [
        _get_slave_phys_addr(sl_el) for (sl_el, info) in remaining_infos if info.send_bit_length is not None
    ]
    mailbox_owners = [_get_slave_phys_addr(sl_el) for (sl_el, _info) in remaining_infos]

    # LRD/Input
    _set_child_text_int(lrd_cmd, "InputOffs", 0)
    _set_child_text_int(lrd_cmd, "DataLength", new_inputs_used_bytes)
    _set_child_text_int(lrd_cmd, "Cnt", len(lrd_owners))
    _set_owner_phys_addrs(lrd_cmd, lrd_owners)
    _maybe_set_defaults(lrd_cmd, new_inputs_used_bytes, input_or_output="Input")

    # LWR/Output
    _set_child_text_int(lwr_cmd, "OutputOffs", 0)
    _set_child_text_int(lwr_cmd, "DataLength", new_outputs_used_bytes)
    _set_child_text_int(lwr_cmd, "Cnt", len(lwr_owners))
    _set_owner_phys_addrs(lwr_cmd, lwr_owners)
    _maybe_set_defaults(lwr_cmd, new_outputs_used_bytes, input_or_output="Output")

    # Mailbox state (input reserved)
    _set_child_text_int(mailbox_cmd, "InputOffs", new_inputs_used_bytes)
    _set_child_text_int(mailbox_cmd, "DataLength", inputs_reserved_bytes)
    _set_child_text_int(mailbox_cmd, "Cnt", len(mailbox_owners))
    _set_owner_phys_addrs(mailbox_cmd, mailbox_owners)
    _maybe_set_defaults(mailbox_cmd, inputs_reserved_bytes, input_or_output="Input")

    # System time (output reserved) — 無い ENI はスキップ
    if system_time_cmd is not None:
        _set_child_text_int(system_time_cmd, "OutputOffs", new_outputs_used_bytes)
        _set_child_text_int(system_time_cmd, "DataLength", outputs_reserved_bytes)
        _maybe_set_defaults(system_time_cmd, outputs_reserved_bytes, input_or_output="Output")

    _update_master_mailbox_states_count(root, len(remaining_infos))

    # FMMU InitCmd（set fmmu 0/1/2）の Data を ProcessData / StatusBitAddr と同期（未更新だと OP で PDO と不整合）
    lrd_addr_bits = _find_child_int(lrd_cmd, "Addr")
    lwr_addr_bits = _find_child_int(lwr_cmd, "Addr")
    for sl_el, _info in remaining_infos:
        _patch_slave_fmmu_init_cmds(sl_el, lrd_addr_bits=lrd_addr_bits, lwr_addr_bits=lwr_addr_bits)

    if verify_fmmu:
        for sl_el, info in remaining_infos:
            pa = _get_slave_phys_addr(sl_el)
            label = f"name={info.name!r}"
            _validate_slave_fmmu_init_cmds(
                sl_el,
                lrd_addr_bits=lrd_addr_bits,
                lwr_addr_bits=lwr_addr_bits,
                phys_addr=pa,
                slave_label=label,
            )

    cyclic_summary = CyclicInfo(
        lrd_data_length=new_inputs_used_bytes,
        lrd_cnt=len(lrd_owners),
        lrd_owner_phys_addrs=lrd_owners,
        mailbox_input_offs=new_inputs_used_bytes,
        mailbox_data_length=inputs_reserved_bytes,
        mailbox_cnt=len(mailbox_owners),
        mailbox_owner_phys_addrs=mailbox_owners,
        lwr_data_length=new_outputs_used_bytes,
        lwr_cnt=len(lwr_owners),
        lwr_owner_phys_addrs=lwr_owners,
        system_time_output_offs=new_outputs_used_bytes,
        system_time_data_length=outputs_reserved_bytes,
    )

    summary = TrimSummary(
        original_slave_count=len(slaves),
        remaining_slave_count=len(remaining_infos),
        inputs_used_bytes=new_inputs_used_bytes,
        outputs_used_bytes=new_outputs_used_bytes,
        inputs_reserved_bytes=inputs_reserved_bytes,
        outputs_reserved_bytes=outputs_reserved_bytes,
        new_inputs_byte_size=inputs_byte_size_new,
        new_outputs_byte_size=outputs_byte_size_new,
        cyclic=cyclic_summary,
    )

    # 最低限の整合チェック（詰め/連動漏れ検知）
    if base_phys is not None:
        _validate_packed_structure(remaining_infos=remaining_infos, base_phys=base_phys)
    _validate_statusbitaddr_range(root, remaining_slave_count=len(remaining_infos))

    return root, summary


def _validate_packed_structure(
    *,
    remaining_infos: list[tuple[ET.Element, SlaveInfo]],
    base_phys: int,
) -> None:
    """
    Aつめの整合（Slave/PreviousPort/値域）を最小限チェックする。
    ここで落ちれば「更新もれ」がかなり濃厚。
    """
    if len(remaining_infos) == 0:
        return

    for idx, (sl_el, _old_info) in enumerate(remaining_infos):
        expected_ident = idx + 1
        expected_phys = base_phys + idx
        expected_auto = 0 if expected_ident == 1 else (65537 - expected_ident)

        info_el = _get_slave_info_el(sl_el)
        phys_now = _find_child_int(info_el, "PhysAddr")
        auto_now = _find_child_int(info_el, "AutoIncAddr")

        seg_now = sl_el.attrib.get("Segment", "")
        seg_int = int(seg_now, 10) if seg_now else None

        if phys_now != expected_phys:
            raise ValueError(f"PhysAddr packed mismatch: idx={idx} expected={expected_phys} actual={phys_now}")
        if auto_now != expected_auto:
            raise ValueError(f"AutoIncAddr packed mismatch: idx={idx} expected={expected_auto} actual={auto_now}")
        if seg_int is not None and seg_int != (expected_ident - 1):
            raise ValueError(
                f"Slave@Segment mismatch: idx={idx} expected={expected_ident - 1} actual={seg_int}"
            )

        if idx > 0:
            prev_expected_phys = base_phys + (idx - 1)
            prev_phys_now = None
            for el in sl_el.iter():
                if _local(el.tag) == "PreviousPort":
                    for ch in list(el):
                        if _local(ch.tag) == "PhysAddr":
                            prev_phys_now = int((ch.text or "0").strip(), 10)
                            break
                    break
            if prev_phys_now is None:
                raise ValueError("PreviousPort/PhysAddr not found (validation)")
            if prev_phys_now != prev_expected_phys:
                raise ValueError(
                    f"PreviousPort PhysAddr mismatch: idx={idx} expected={prev_expected_phys} actual={prev_phys_now}"
                )


def _validate_statusbitaddr_range(root: ET.Element, *, remaining_slave_count: int) -> None:
    status_vals: set[int] = set()
    for el in root.iter():
        if _local(el.tag) != "StatusBitAddr":
            continue
        if el.text is None:
            continue
        t = el.text.strip()
        if not t:
            continue
        try:
            status_vals.add(int(t, 10))
        except ValueError:
            continue

    if not status_vals:
        raise ValueError("StatusBitAddr not found (validation)")

    mn = min(status_vals)
    mx = max(status_vals)
    expected_mn = 0
    expected_mx = remaining_slave_count - 1
    if mn != expected_mn or mx != expected_mx:
        raise ValueError(
            f"StatusBitAddr range mismatch: min={mn} max={mx} expected {expected_mn}..{expected_mx}"
        )


def write_trimmed_xml(
    path: str | Path,
    delete_phys_addrs: Iterable[int],
    out_path: str | Path,
    *,
    phys_base: int = 1001,
    verify_fmmu: bool = True,
) -> TrimSummary:
    out_path = Path(out_path)
    root, summary = compute_trim_from_path(path, delete_phys_addrs, phys_base=phys_base, verify_fmmu=verify_fmmu)
    tree = ET.ElementTree(root)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    tree.write(str(out_path), encoding="utf-8", xml_declaration=True)
    return summary


__all__ = [
    "SlaveInfo",
    "TrimSummary",
    "write_trimmed_xml",
    "compute_trim_from_path",
]

