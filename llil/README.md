## llil — IL 風言語から LLVM IR へのトランスレータ

`llil` は、PLC の IL (Instruction List) に近い記法を **LLVM IR（`.ll`）** に変換するコンパイラです。姉妹ツールの `llst`（Structured Text）と同様、単体の `.ll` を出力し、`clang` 経由でオブジェクト化して `rtacc` の C パイプラインとリンクできます。

初期は BOOL 論理のみでしたが、整数演算・比較・ビットアクセス・`SEL`・**CTU / TP** などが追加されています。未対応の IEC 命令や FB はすべてが実装されているわけではありません。

---

### 対応している主な構文

#### コメント

- `(* ... *)`（複数行可）

#### 変数宣言（1 行 1 個）

`VAR <型>#<名前>` 形式。

| 型 | LLVM 上のイメージ |
|----|-------------------|
| `BOOL` | `i1` |
| `BYTE` | `i8` |
| `WORD` | `i16` |
| `INT` / `UINT` / `DWORD` | `i32`（符号付き演算は `INT` 想定） |

`VAR FUNCTION#...` など未対応の型行は **宣言ごとスキップ**されます。

命令中にだけ現れる名前は、使用箇所から **型推論**されます（`TIME` 相当のメンバ `.PT` など）。

#### 命令

**論理（BOOL アキュムレータ `acc`）**

| 命令 | 意味（概略） |
|------|----------------|
| `LD  op` | `acc :=` オペランドの BOOL 値（ビット・BOOL 変数・即値の扱いは実装参照） |
| `LDN op` | `acc := NOT` … |
| `AND` / `ANDN` / `OR` | `acc` とオペランドの論理演算 |
| `ST  Var` | `Var := acc`（BOOL またはビット書き込み） |

**整数アキュムレータ `int_acc`（`i32`）**

- `LD` / `LDN` で `INT#n`・`UINT#n`・`TIME#...` 即値を読むと `int_acc` に載ります。
- `ADD` / `GT` / `GE` / `EQ` は `int_acc` と右辺オペランドを組み合わせます（詳細は `src/main.rs` の各命令生成）。

**多値選択**

- `SEL cond a b dst` — 同一行に 4 オペランド。`cond` が真なら `a`、偽なら `b` を `dst` に（整数系）。

**ファンクションブロック（`CAL`）**

- `CAL CTU_xxx` — カウンタ `ctu_step`。次の名前を **`VAR` で宣言するか**、命令から暗黙に生成されます。  
  - `CTU_xxx.CU`, `.RESET`, `.PV`, `.Q`, `.CV`, `._prev_cu`
- `CAL TP_xxx` — パルスタイマ `tp_step`。  
  - `TP_xxx.IN`, `.PT`, `.Q`, `._elapsed`, `._running`  
  - **挙動は簡易実装**（`IN` が真の間の経過など。IEC 標準の TP とは完全一致しません）

#### ビットアクセス

- `DWORD#foo` など整数型変数に対し **`foo.Xn`**（`n` は 10 進）でビット読み書き。  
- `LD dw1.X1` のように **ドット付きオペランド**が使えます（型ごとのビット幅内であること）。

#### 即値

- `INT#5` / `UINT#100`
- `TIME#1s` / `TIME#500ms` など — 内部では **ミリ秒の `i32`**（例: `1s` → 1000）

---

### 出力される LLVM IR

- **エントリ関数名**: 入力ファイルの **ベース名**（拡張子を除く）をサニタイズした `define i32 @<名前>() { ... }`。  
  - 固定の `@main` ではありません（例: `scan.il` → `define i32 @scan()`）。
- **戻り値**: 現状 **`ret i32 0` 固定**。
- **変数メモリ**: `--memory` により次のいずれか。
  - **`stack`（既定）**: グローバル `@il_mem_*` と `@il_slot_*`（スロットは常に `@il_mem_*` を指す）。
  - **`rtedge`**: `@il_slot_*` は初期 `null`。`define void @<名前>_slots_init()` でスロットに `@il_mem_*` を格納（将来のタグ解決用の足場）。
- **補助関数**: `@ctu_step`, `@tp_step` が生成されます（`CAL` 使用時）。

`target datalayout` / `target triple` は `clang` が C から出す `.ll` と揃えてあり、`llvm-link` しやすいようにしています。

---

### 使い方

```bash
cargo build --release

# 標準出力へ .ll
.\target\release\llil.exe input.il

# ファイルへ
.\target\release\llil.exe input.il -o output.ll

# 変数スロットモデル（stack | rtedge）
.\target\release\llil.exe input.il -o output.ll --memory=rtedge
```

`--memory=rtedge` かつ `-o foo.ll` のとき、同じディレクトリに **`foo_rtedge_glue.c`** も出力します（`IlRtedgeTags_Init` / `IlRtedgeSlots_BindEgEntry` と `@il_slot_*` の Eg Entry バインド表。VAR 由来のスロットは IL から自動生成）。

生成した `output.ll` は `clang` で `.asm` / `.obj` にできます（`rtacc` のプロジェクトや `examples/ex` などを参照）。

```bash
clang -c -m32 -target i386-pc-windows-msvc output.ll -o output.obj
```

---

### 注意・制限

- **対応していない命令行**は、パーサが認識できない行頭トークンとして **行単位で読み飛ばす**場合があります。エラーにならず黙って無視されることがあるため、意図した IL かどうかは生成 `.ll` で確認してください。
- **TP / CTU** は教育・実験向けの簡易セマンティクスです。製品 PLC の FB と同一とは限りません。
- 拡張する場合は `src/main.rs` のレキサ（`lex`）、構文木（`Instr` / `IlProgram`）、`compile_il_to_llvm_ir` 周りを編集します。`llst` の実装も参考になります。
