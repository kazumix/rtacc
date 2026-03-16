# llst - ST to LLVM IR トランスレータ

`llst` は、IEC 61131-3 の Structured Text (ST) 風の **ごく簡易なサブセット** を LLVM IR (`.ll`) に変換するシンプルなコンパイラです。

## 対応している ST サブセット

- `VAR ... END_VAR` ブロックでの `INT` 変数宣言
  - `a : INT;`
  - `b : INT := 1 + 2;`
- 代入文
  - `a := 1;`
  - `b := a + 3 * 4;`
- `RETURN` 文
  - `RETURN a;`
- 式
  - 整数リテラル
  - 変数参照
  - `+`, `-`, `*`, `/`
  - 括弧 `(` `)`

### サンプル

```text
VAR
    a : INT := 1;
    b : INT := 2;
END_VAR

a := a + b * 3;
RETURN a;
```

上の ST を `input.st` とすると、次のように変換できます。

```bash
cargo build --release
.\target\release\llst.exe input.st output.ll
```

もしくは標準出力に出す場合:

```bash
.\target\release\llst.exe input.st
```

生成された `output.ll` は `clang` などでオブジェクトファイルや実行ファイルにリンクできます。

```bash
clang output.ll -o a.exe
```

## ビルド方法

1. Rust (1.70 以降程度) をインストール
2. このディレクトリで:

```bash
cargo build --release
```

`target/release/llst.exe` が生成されます。

