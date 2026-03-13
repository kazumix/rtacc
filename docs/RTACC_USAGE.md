## rtacc 使い方まとめ

`rtacc.exe` は INtime RTA 用のビルドドライバです。  
JSON プロジェクト・ファイルと CLI の両方から、同じ項目を指定できます（CLI 指定は JSON より優先）。

---

## 1. 基本イメージ

- **JSON モード**  
  `rtacc project.json [-target name] [--toolset llvm|vs2017] [...]`
- **CLI モード**  
  `rtacc main.c [-c] -o app.rta [--toolset llvm|vs2017] [...]`

ソースは `.c` / `.obj` / `.o` / `.lib` を混在して並べられます。

---

## 2. CLI オプション

```text
rtacc main.c [-c] -o app.rta
rtacc main.c util.c foo.obj -o app.rta --libs "a.lib;b.lib"
```

- **必須・基本**
  - `sources...` : `.c` / `.obj` / `.o` / `.lib` をスペース区切りで並べる
  - `-o file` : 出力ファイル名（通常は `.rta` / `.rsl`）
- **主なオプション**
  - `-toolset llvm|vs2017` : ツールセット選択（省略時は JSON / さらに無ければ `llvm`）
  - `-output-dir dir` : 中間・出力ディレクトリ
  - `-O 0|1|2|3|s|z` : 最適化レベル
  - `-I "inc1;inc2"` : 追加インクルードパス（`;` 区切り）
  - `-D "MACRO1;MACRO2"` : 定義（`;` 区切り）
  - `-libs "a.lib;b.lib"` : 追加でリンクする lib（`;` 区切り）
  - `-flags "flag1;flag2"` : ターゲット固有フラグ（`;` 区切り）
  - `-compiler-flags "cflag1;cflag2"` : コンパイラオプション（`;` 区切り）
  - `-linker-flags "lflag1;lflag2"` : リンカオプション（`;` 区切り）
  - `-c` : **コンパイルのみ（.obj まで。リンクしない）**

### 2.1 `-c`（コンパイルのみ）

- `.c` が入力に含まれる場合  
  `.c → .ll → .asm → .obj` まで生成し、**リンクを行わず終了**します。
- `.obj` / `.o` のみを指定した場合  
  既存 `.obj` / `.o` を検出して **そのまま出力として列挙**し、リンクは行いません。
- `-o` は **通常どおり `.rta/.rsl` 用の名前**として扱われ、`-c` のときでも `.obj` ファイル名には使いません（`.obj` 名はソース名ベースです）。

---

## 3. JSON プロジェクト（`project.json`）

```json
{
  "toolsets": {
    "llvm":   { "compiler": "clang", "linker": "lld" },
    "vs2017": { "compiler": "cl",    "linker": "link",
                "compiler_flags": ["/W3", "/nologo"] }
  },
  "targets": [
    {
      "name": "app",
      "toolset": "llvm",
      "output_dir": "out",
      "output": "app.rta",
      "optimize": "2",
      "compile_only": false,
      "includes": ["include"],
      "sources": ["main.c", "util.obj"],
      "libs": ["mylib.lib"],
      "defines": ["FOO=1"],
      "flags": []
    }
  ]
}
```

### 3.1 Target フィールド一覧

- `name` : ターゲット名
- `toolset` : `"llvm"` / `"vs2017"` などツールセット名
- `output_dir` : 出力ディレクトリ（空ならカレント）
- `output` : 出力ファイル名（通常は `.rta` / `.rsl`）
- `optimize` : `"0"|"1"|"2"|"3"|"s"|"z"`
- `compile_only` : **true なら `.obj` まで（リンクしない）**
- `includes` : 追加インクルードディレクトリ
- `sources` : `.c` / `.obj` / `.o` / `.lib` のパス
- `libs` : 追加でリンクする lib
- `defines` : プリプロセッサ定義
- `flags` : ターゲット固有の追加コンパイルフラグ

### 3.2 CLI と JSON の関係

- JSON に書ける項目は、原則すべて CLI からも指定可能です。
- **CLI で指定した値が JSON の設定より優先**されます。
  - 例: `project.json` に `optimize: "1"` とあっても、`rtacc project.json --optimize 3` なら `"3"` が使われます。
  - `compile_only` が `true` でも、CLI の `-c` を付けない限りリンクまで行います（CLI 側で `-c` を付けると JSON の値に関わらず「コンパイルのみ」になります）。

---

## 4. .c / .obj / .o / .lib の扱い

- `.c` :  
  - LLVM ツールセットでは `.c → .ll → .asm → .obj` を生成  
  - VS ツールセットでは `cl` で直接 `.obj` を生成
- `.obj` / `.o` :  
  - コンパイルは行わず、そのままリンク入力として使用
- `.lib` :  
  - `sources` / `libs` に列挙すれば、リンカ入力として渡されます

`compile_only` / `-c` が **false** のときだけリンクフェーズまで進みます。

---

## 5. INtime 既定ライブラリ（vshelper の自動選択）

LLVM / VS いずれのツールセットでも、rtacc は INtime の標準ライブラリを自動でリンクします。

- LLVM ツールセット:
  - `pcibus.lib`, `netlib.lib`, `vshelper22.lib` または `vshelper17.lib`, `clib.lib`, `rt.lib`
  - `RT\LIB` 内に `vshelper22.lib` が無い場合、`vshelper17.lib` が存在すればそれを使用
- VS ツールセット:
  - ツールセット名に `2017/2015/2013/2012` を含む場合は `vshelper17.lib`、それ以外は `vshelper22.lib` を選択

`libs` / `--libs` で追加した lib は、この既定ライブラリ列のあとに渡されます。

