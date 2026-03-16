## llil - IL to LLVM IR トランスレータ（最小サブセット）

`llil` は、PLC などで用いられる IL (Instruction List) 風の **ごく簡易なサブセット** を LLVM IR (`.ll`) に変換するシンプルなコンパイラです。  
姉妹プロジェクト `llst` と同様に、スタンドアロンの `.ll` を出力します。

現状はテストと実験用の **BOOL ロジックのサブセット** のみを対象としています。

### 対応している構文（暫定）

- 変数宣言行（1 行 1 個）
  - `VAR BOOL#Foo`
  - `VAR INT#Counter`
  - `VAR UINT#AddData`
- 命令（論理ネットワーク用の最小サブセット）
  - `LD  VarName`  : アキュムレータに `VarName` の BOOL 値をロード
  - `LDN VarName` : アキュムレータに `NOT VarName` をロード
  - `AND VarName` : `acc := acc AND VarName`
  - `ANDN VarName`: `acc := acc AND (NOT VarName)`
  - `OR  VarName` : `acc := acc OR VarName`
  - `ST  VarName` : `VarName := acc`

それ以外の命令（`ADD`, `GT`, `CAL`, タイマ・カウンタなど）はまだ未対応です（読み込んだ場合はエラーになります）。

### 出力される LLVM IR

- 関数シグネチャ: `define i32 @main() { ... }`
- 各変数
  - `BOOL` : `i1` の `alloca` ＋ `store` による 0 初期化
  - `INT` / `UINT` : `i32` の `alloca` ＋ `store` による 0 初期化
- アキュムレータ `acc` は `i1` で表現
  - `LD/LDN/AND/ANDN/OR/ST` 命令はこのアキュムレータと各変数の `load/store` に展開されます。
- `main` は現在常に `ret i32 0` を返します。

### 使い方

```bash
cargo build --release

.\target\release\llil.exe input.il
.\target\release\llil.exe input.il -o output.ll
```

`output.ll` は `clang` などでオブジェクトファイルや実行ファイルにリンクできます。

```bash
clang output.ll -o a.exe
```

### 注意

- まだごく一部の IL しか対応していません。
- `test.IL` のような IL をすべてコンパイルできるわけではなく、未対応命令が出現するとエラーになります。
- 拡張したい場合は、`src/main.rs` 内の
  - レキサ（`lex`）
  - 構文木 (`Instr` / `IlProgram`)
  - 生成処理（`compile_il_to_llvm_ir`）
を `llst` の実装スタイルを参考に増やしていくことを想定しています。

