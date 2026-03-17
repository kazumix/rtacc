# RustRta — INtime RTA: 2 スレッド + 共有メモリ (Rust)

Rust で書いたスレッドエントリを、`rt.h` の **CreateRtThread()** で 2 本起動し、共有メモリ（カウンタ）を触る INtime RTA の例です。

## 構成

- **main.c** … C のエントリ。共有構造体を用意し、`CreateRtThread` で `rust_thread1_entry` / `rust_thread2_entry` を起動。両方の完了を待ってから終了。
- **src/lib.rs** … Rust のライブラリ。2 つのスレッドエントリと、C と共通の `Shared` レイアウト（`repr(C)`）。
- **out/rustrta.ll** … `rustc --emit=llvm-ir` で生成する LLVM IR。llil.exe が .il→.ll するのと同様に、Rust 部分も .ll にして rtacc の C/LL パイプラインでまとめてビルドする。

## ビルド手順（Rust → .ll 方式、推奨）

llil.exe が Rust で .il を .ll にしているのと同じ発想で、Rust 部分をいったん .ll にし、rtacc の既存の .ll→.asm→.obj→リンクに載せます。

### 1. rustup と i686 ターゲット（初回のみ）

**winget の Rust (Rustlang.Rust.MSVC) だけでは i686 ターゲットを追加できません。** rustup でないと `rustup target add i686-pc-windows-msvc` が使えません。

1. https://rustup.rs を開き、表示されるコマンドで rustup をインストール（`%USERPROFILE%\.cargo\bin` に rustc / rustup が入ります）
2. 新しいターミナルで: `rustup target add i686-pc-windows-msvc`

`build_ll.ps1` は **`%USERPROFILE%\.cargo\bin\rustc.exe` があればそれを優先**し、同じ場所の rustup で i686 ターゲットの追加も試します。

### 2. Rust を LLVM IR (.ll) に出力

```powershell
cd examples/RustRta
.\build_ll.ps1
```

別の rustc を指定する場合: `$env:RUSTC = "C:\path\to\rustc.exe"; .\build_ll.ps1`

### 3. rtacc で .rta をビルド

プロジェクトルートから:

```bash
rtacc -C examples/RustRta -o out/app.rta
```

または `examples/RustRta` で:

```bash
rtacc -o out/app.rta
```

- 環境変数 **INTIME** に INtime のパスを設定するか、既定の INtime 配置を使います。
- **LLVM**（clang/lld）のパスが通っている必要があります。

## 別案: Rust → .lib 方式

Rust を静的ライブラリにしてリンクする従来方式も使えます。

```bash
cargo build --release --target i686-pc-windows-msvc
copy target\i686-pc-windows-msvc\release\rustrta.lib out\rustrta.lib
```

その場合は `project.json` の `sources` から `out/rustrta.ll` を外し、`libs` に `["out/rustrta.lib"]` を指定してください。

## 動作

- メインスレッドが `CreateRtThread` で 2 本の RT スレッドを作成し、両方に共有構造体へのポインタを `lpParam` で渡す。
- 各スレッドはカウンタを 5 回ずつインクリメントし、終了時に `done` を 1 増やす。
- メインは `done >= 2` になるまで `RtSleep(100)` で待ち、最後に `shared.counter`（期待値 10）を表示して終了。

## 注意

- `Shared` のレイアウトは C の `shared_t` と Rust の `Shared` で一致させてあります（`#[repr(C)]` と `AtomicI32` のサイズ）。
- スレッド間の同期は `AtomicI32` と `volatile` で行っています。必要に応じて RtEvent 等に置き換え可能です。
