from __future__ import annotations

import sys
import traceback
import tkinter as tk
from tkinter import filedialog, messagebox, ttk
from pathlib import Path

_SCRIPT_DIR = Path(__file__).resolve().parent
if str(_SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(_SCRIPT_DIR))

from eni_trim_lib_et import (
    TrimSummary,
    write_trimmed_xml,
    compute_trim_from_path,
    SlaveInfo,
    load_eni as _load_eni,
)


class EnITrimGui(tk.Tk):
    def __init__(self) -> None:
        super().__init__()
        self.title("ENI トリム（スレーブ削除＋Bit再計算）")
        self.geometry("1050x680")

        self.eni_path: Path | None = None
        self.slaves: list[SlaveInfo] = []

        self._build_ui()

    def _build_ui(self) -> None:
        frm_top = ttk.Frame(self, padding=8)
        frm_top.pack(side=tk.TOP, fill=tk.X)

        self.btn_load = ttk.Button(frm_top, text="ENI XML を開く", command=self.on_load)
        self.btn_load.pack(side=tk.LEFT)

        self.lbl_path = ttk.Label(frm_top, text="(未ロード)", width=80)
        self.lbl_path.pack(side=tk.LEFT, padx=10)

        frm_mid = ttk.Frame(self, padding=(8, 0, 8, 8))
        frm_mid.pack(side=tk.TOP, fill=tk.BOTH, expand=True)

        cols = ("phys", "alias", "vendor", "name")
        self.tree = ttk.Treeview(frm_mid, columns=cols, show="headings", selectmode="extended")
        self.tree.heading("phys", text="PhysAddr")
        self.tree.heading("alias", text="Alias")
        self.tree.heading("vendor", text="VendorId")
        self.tree.heading("name", text="Name")
        self.tree.column("phys", width=90, anchor="center")
        self.tree.column("alias", width=70, anchor="center")
        self.tree.column("vendor", width=90, anchor="center")
        self.tree.column("name", width=650, anchor="w")
        self.tree.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

        vsb = ttk.Scrollbar(frm_mid, orient="vertical", command=self.tree.yview)
        self.tree.configure(yscrollcommand=vsb.set)
        vsb.pack(side=tk.RIGHT, fill=tk.Y)

        frm_right = ttk.Frame(self, padding=8)
        frm_right.pack(side=tk.RIGHT, fill=tk.Y)

        self.txt_summary = tk.Text(frm_right, width=38, height=26, wrap="word")
        self.txt_summary.pack(side=tk.TOP, fill=tk.X)
        self.txt_summary.configure(state="disabled")

        frm_actions = ttk.Frame(frm_right)
        frm_actions.pack(side=tk.TOP, fill=tk.X, pady=(8, 0))

        self.btn_preview = ttk.Button(frm_actions, text="プレビュー", command=self.on_preview)
        self.btn_preview.pack(side=tk.TOP, fill=tk.X)

        self.btn_apply = ttk.Button(frm_actions, text="削除して書き出し", command=self.on_apply)
        self.btn_apply.pack(side=tk.TOP, fill=tk.X, pady=(6, 0))

        self.btn_select_all = ttk.Button(frm_actions, text="全選択解除", command=self.on_clear_selection)
        self.btn_select_all.pack(side=tk.TOP, fill=tk.X, pady=(6, 0))

        self.btn_vendor_filter = ttk.Button(frm_actions, text="Vendor=131 (Omron) のみ表示", command=self.on_filter_omron)
        self.btn_vendor_filter.pack(side=tk.TOP, fill=tk.X, pady=(6, 0))

        frm_hint = ttk.Label(
            self,
            text="手順: ENI を開く → 右のリストで削除したいスレーブを選択 → プレビュー → 書き出し",
        )
        frm_hint.pack(side=tk.BOTTOM, fill=tk.X, padx=8, pady=8)

    def _set_summary_text(self, s: str) -> None:
        self.txt_summary.configure(state="normal")
        self.txt_summary.delete("1.0", tk.END)
        self.txt_summary.insert(tk.END, s)
        self.txt_summary.configure(state="disabled")

    def _selected_phys_addrs(self) -> list[int]:
        r: list[int] = []
        for item_id in self.tree.selection():
            phys = self.tree.set(item_id, "phys")
            if phys:
                r.append(int(phys))
        return r

    def _fill_tree(self, slaves: list[SlaveInfo]) -> None:
        for row in self.tree.get_children():
            self.tree.delete(row)
        for s in slaves:
            # Use phys addr as "primary key".
            self.tree.insert("", tk.END, values=(s.phys_addr, s.alias, s.vendor_id, s.name))

    def on_load(self) -> None:
        path = filedialog.askopenfilename(
            title="ENI XML を選択",
            filetypes=[("XML files", "*.xml"), ("All files", "*.*")],
        )
        if not path:
            return
        self.eni_path = Path(path)
        self.lbl_path.configure(text=str(self.eni_path))
        root, self.slaves = _load_eni(self.eni_path)
        self._fill_tree(self.slaves)
        if not self.slaves:
            self._set_summary_text("読み込み完了したが、スレーブを検知できませんでした。ENIの構造/名前空間をご確認ください。")
            messagebox.showwarning("スレーブ0台", "読み込みは完了しましたが、スレーブを検知できませんでした。")
        else:
            self._set_summary_text(f"読み込み完了: スレーブ {len(self.slaves)} 台。削除するスレーブを選択してください。")

    def on_preview(self) -> None:
        if self.eni_path is None:
            messagebox.showwarning("ENI未選択", "まず ENI XML を開いてください。")
            return
        delete_phys = self._selected_phys_addrs()
        if not delete_phys:
            messagebox.showinfo("選択なし", "削除対象を選択してください。")
            return
        try:
            _, summary = compute_trim_from_path(self.eni_path, delete_phys)
        except Exception as e:
            messagebox.showerror("プレビュー失敗", f"{e}")
            return
        self._render_summary(summary)

    def _render_summary(self, summary: TrimSummary) -> None:
        c = summary.cyclic
        text = []
        text.append(f"スレーブ: {summary.original_slave_count} -> {summary.remaining_slave_count}")
        text.append("")
        text.append(f"Inputs: used={summary.inputs_used_bytes}B, reserved={summary.inputs_reserved_bytes}B, ByteSize={summary.new_inputs_byte_size}B")
        text.append(f"Outputs: used={summary.outputs_used_bytes}B, reserved={summary.outputs_reserved_bytes}B, ByteSize={summary.new_outputs_byte_size}B")
        text.append("")
        text.append("Cyclic:")
        text.append(f"  LRD(Input vars): DataLength={c.lrd_data_length}B, Cnt={c.lrd_cnt}")
        text.append(f"    Owners={c.lrd_owner_phys_addrs}")
        text.append(f"  LWR(Output vars): DataLength={c.lwr_data_length}B, Cnt={c.lwr_cnt}")
        text.append(f"    Owners={c.lwr_owner_phys_addrs}")
        text.append(f"  Mailbox state: InputOffs={c.mailbox_input_offs}B, DataLength={c.mailbox_data_length}B, Cnt={c.mailbox_cnt}")
        text.append(f"    Owners={c.mailbox_owner_phys_addrs}")
        text.append(f"  System time: OutputOffs={c.system_time_output_offs}B, DataLength={c.system_time_data_length}B")
        self._set_summary_text("\n".join(text))

    def on_apply(self) -> None:
        if self.eni_path is None:
            messagebox.showwarning("ENI未選択", "まず ENI XML を開いてください。")
            return
        delete_phys = self._selected_phys_addrs()
        if not delete_phys:
            messagebox.showinfo("選択なし", "削除対象を選択してください。")
            return
        out_path = filedialog.asksaveasfilename(
            title="出力先XMLを指定",
            defaultextension=".xml",
            initialfile=self.eni_path.with_suffix("").name + "_trimmed.xml",
            filetypes=[("XML files", "*.xml"), ("All files", "*.*")],
        )
        if not out_path:
            return
        try:
            summary = write_trimmed_xml(self.eni_path, delete_phys, out_path)
        except Exception as e:
            messagebox.showerror("書き出し失敗", f"{e}")
            return
        self._render_summary(summary)
        messagebox.showinfo("書き出し完了", f"出力しました:\n{out_path}")

    def on_clear_selection(self) -> None:
        for item_id in self.tree.selection():
            self.tree.selection_remove(item_id)

    def on_filter_omron(self) -> None:
        # VendorId = 131 (Omron)
        filtered = [s for s in self.slaves if s.vendor_id == 131]
        self._fill_tree(filtered)
        self._set_summary_text("VendorId=131 のみ表示しました。")


def main() -> None:
    try:
        app = EnITrimGui()
        app.mainloop()
    except Exception:
        # pythonw だとコンソールが見えないことがあるため、ログとメッセージで通知する。
        script_dir = Path(__file__).resolve().parent
        log_path = script_dir / "eni_trim_gui_error.log"
        log_path.write_text(traceback.format_exc(), encoding="utf-8")
        try:
            messagebox.showerror("起動エラー", f"起動に失敗しました。\nログ: {log_path}\n\n{traceback.format_exc()}")
        except Exception:
            pass


if __name__ == "__main__":
    main()

