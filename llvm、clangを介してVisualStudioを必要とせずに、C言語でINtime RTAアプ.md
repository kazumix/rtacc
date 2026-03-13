<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# llvm、clangを介してVisualStudioを必要とせずに、C言語でINtime RTAアプリを作る方法を確立した。この手法、現在はps1スクリプトにすぎないが、これを独自コンパイラ、ビルダみたいなexeにしようと思います、なんという手法、なんというexeだろうか。考えて

まず方向性としては、「INtime向けのクロスコンパイラ＋ビルドドライバ」という扱いにして、名前・手法ともに“コンパイラフロントエンド／ビルドシステム”寄りにすると筋がいいです。[^1_1][^1_2]

## 手法としてなんと呼ぶか

ps1 を exe 化して「独自コンパイラ／ビルダ」にする場合、やっていることは以下の組み合わせになります。

- LLVM/Clang をバックエンドにした **カスタムコンパイラフロントエンド**（INtime RTA 向け）[^1_1]
- INtime RTA 用に特化した **クロスコンパイルツールチェーン**[^1_3][^1_4]
- C プロジェクト全体を面倒見る **ミニビルドシステム**（make や CMake の極小版）[^1_5]

なので、技術用語としては：

- 「INtime 向け独自コンパイラフロントエンド」
- 「INtime RTA 専用クロスコンパイラツールチェーン」
- 「INtime RTA 向けミニビルドシステム」

あたりが、外に説明するときにしっくり来ると思います。[^1_3][^1_5][^1_1]

## exe の名前の方向性

INtime・RTA・LLVM/Clang を連想させつつ、実際は“ビルドドライバ”であることが伝わると扱いやすいです。

例（日本語説明用）：

- 「`intime-clang`」
    - Clang ライクな名前で、“INtime 向け clang ドライバ”という位置づけにしやすい。[^1_1]
- 「`rta-cc`」
    - “RTA C Compiler”のニュアンスで、gcc/clang の仲間感がある。[^1_1]
- 「`rtabuild`」
    - `.rta` を吐くビルドツールと明示できる。
- 「`intime-build`」「`intime-cc`」
    - INtime 専用ツールと一目でわかる。[^1_3]

日本語で説明するなら：

- 「INtime RTA アプリ専用コンパイラ `rta-cc.exe`」
- 「INtime RTA ビルドツール `rtabuild.exe`」
- 「LLVM/Clang ベース INtime コンパイラフロントエンド `intime-clang.exe`」

のように、「INtime」「RTA」「clang/cc」「build」のどれかを必ず含めると、後から自分でも用途がすぐ思い出せます。[^1_3][^1_1]

## ランチャ／ラッパとしての整理

内部的には ps1 がやっている：

- clang/llc/リンカの呼び出し順序を隠蔽する
- INtime 用の include/lib パス、リンカオプションを自動付与する
- 出力拡張子を `.rta` に固定する[^1_3]

という「ラッパ／ドライバ」なので、ドキュメントでは「INtime RTA 用 clang ドライバ（`intime-clang.exe`）」のように“ドライバ”を名乗るのも LLVM の世界観に合います。[^1_1]

***

もし「もっと遊び心ある名前」を付けたいなら、「rtforge」「intime-smith」みたいな“鍛冶屋・工房”系もアリですが、まずは上のような機能そのまま系の名前で固めておくと運用しやすいと思います。[^1_6]
<span style="display:none">[^1_10][^1_7][^1_8][^1_9]</span>

<div align="center">⁂</div>

[^1_1]: https://clang.llvm.org/docs/UsersManual.html

[^1_2]: https://llvm.org/docs/CodingStandards.html

[^1_3]: https://community.rti.com/static/documentation/connext-dds/6.0.1/doc/manuals/connext_dds/getting_started_extras/RTI_ConnextDDS_CoreLibraries_GettingStarted_INtimeAddendum.pdf

[^1_4]: https://device.report/m/a1f5468825a410f6c58b0a25cba7cfe9a21e54bd50b1972f447b870c06138ad9.pdf

[^1_5]: https://www.reddit.com/r/cpp/comments/jm8k2q/if_i_wanted_to_create_a_new_build_system_what/

[^1_6]: https://namefatso.com/blog/pc-builder-business-name-ideas

[^1_7]: https://b.hatena.ne.jp/tyru/search.data

[^1_8]: https://bcain-llvm.readthedocs.io/projects/llvm/en/latest/CodingStandards/

[^1_9]: https://rocm.docs.amd.com/projects/llvm-project/en/docs-7.1.1/LLVM/clang/html/UsersManual.html

[^1_10]: https://rocm.docs.amd.com/projects/llvm-project/en/latest/LLVM/llvm/html/CodingStandards.html


---

# llvmは表に出さなくてもいい。.c ,obj ,libのファイルを列挙するとrtaにしてくれるというわけ

LLVMを表に出さず、入力ファイル（.c/.obj/.lib）を列挙するだけでINtime RTA（.rta）を出力するexeは、シンプルで実用的な「RTAビルドドライバ」としてぴったりです。[^2_1][^2_2]

## 手法の名前付け

この機能は、LLVM/Clangを隠蔽した「INtime RTA専用リンカ／ビルドツール」になります。

- **INtime RTA リンクドライバ**：入力オブジェクトをINtime特化リンカオプションで.rtaにまとめる。[^2_2]
- **RTAビルドマネージャ**：複数ファイルを自動処理し、VSなしで.rta生成。[^2_1]
- **クロスリンクツール**：INtime向けに.obj/.libをリンクする専用ツール。[^2_3]

内部でclang/llcを呼びつつユーザには見せないので、「ブラックボックスビルダ」としても説明OKです。[^2_4]

## おすすめexe名

コマンドラインで使いやすいものを優先。


| 名前例 | 理由・使い方例 | イメージ |
| :-- | :-- | :-- |
| `rta-link.exe` | リンカっぽく、gccのldみたい。`rta-link *.c *.obj -o app.rta`[^2_2] | 標準的リンカ |
| `rtamake.exe` | makeの仲間感、`rtamake files.txt`でリスト処理[^2_1] | ビルドツール |
| `intime-link.exe` | INtime専用感強い、`intime-link obj/ -o app.rta`[^2_4] | ブランドツール |
| `rta.exe` | シンプルに、出力と同じ拡張子で`rta *.c`[^2_2] | 超直感的 |

`rta-link.exe` が一番バランスいいです。ドキュメントで「INtime RTA用ファイルリンクツール」と書けば完璧。[^2_2][^2_1]

## 実装のポイント

ps1をexe化（PowerShell to EXEツールやRustでラッパ作成）して：

- 引数：ファイルリスト（ワイルドカードOK）＋オプション（-o出力名、-debugなど）
- 内部：clangで.cを.objに変換→全ファイルをINtime libパス付きでリンク→.rta出力。[^2_3]
- 例：`rta-link main.c lib/*.lib -o myapp.rta` で一発。[^2_1]

これでVS不要の完全独立ツール完成です。[^2_2]
<span style="display:none">[^2_10][^2_5][^2_6][^2_7][^2_8][^2_9]</span>

<div align="center">⁂</div>

[^2_1]: https://support.tenasys.com/7-1/Using_Develop

[^2_2]: https://manuals.plus/m/c37473cc337fa9826d19966ac85cee52d1448958da8c900dd7aec9aaf67ef310

[^2_3]: https://model-realtime.hcldoc.com/help/topic/com.ibm.xtools.rsarte.webdoc/Newsletters/Using Clang with Model RealTime.html

[^2_4]: https://community.rti.com/static/documentation/connext-dds/6.0.1/doc/manuals/connext_dds/getting_started_extras/RTI_ConnextDDS_CoreLibraries_GettingStarted_INtimeAddendum.pdf

[^2_5]: https://community.rti.com/static/documentation/connext-dds/6.1.1/doc/manuals/connext_dds_professional/getting_started_platforms/intime_systems_addendum/RTI_ConnextDDS_CoreLibraries_GettingStarted_INtimeSystemsAddendum.pdf

[^2_6]: https://support.tenasys.com/7-0/Using_Update_DRTOS

[^2_7]: https://docs.plunify.com/intime/latest/quickstart.html

[^2_8]: https://www.intelnect.com/wp-content/uploads/2024/06/INtime_SDK_DataSheet_2021-11.pdf

[^2_9]: https://community.rti.com/static/documentation/connext-dds/6.0.0/doc/manuals/connext_dds/getting_started_extras/RTI_ConnextDDS_CoreLibraries_GettingStarted_INtimeAddendum.pdf

[^2_10]: https://cursor.com


---

# リンクだけじゃなく出コンパイルもしてるじゃん

はい、.c からコンパイル（clang呼び出し）して.obj生成し、それを.obj/.libと一緒にリンクして.rta出力するフルサイクルツールですね。リンク専用じゃなく「コンパイル＋リンクの統合ドライバ」として扱います。[^3_1][^3_2]

## 手法の名前付け

LLVM/Clangを隠蔽した完全フロントエンドとして：

- **INtime RTA 専用コンパイラ**（cc/clang のINtime版）。[^3_1]
- **RTAクロスコンパイラツールチェーン**（ソースから.rtaまで一気通貫）。[^3_2]
- **INtime RTA ビルドコンパイラ**（ビルドとコンパイルを兼ねる）。[^3_3]

gcc/clang のように「`コマンド files -o output.rta`」で終わるツールなので、「カスタムクロスコンパイラ」が最適です。[^3_1]

## おすすめexe名

コンパイラ名風に統一。


| 名前例 | 使い方例 | 理由 |
| :-- | :-- | :-- |
| `rta-cc.exe` | `rta-cc main.c lib/*.lib -o app.rta` | “RTA C Compiler”、gcc/cc互換で直感的[^3_1] |
| `intime-cc.exe` | `intime-cc *.c -o app.rta` | INtimeブランド強め、専用感[^3_2] |
| `rta-clang.exe` | `rta-clang sources/ -o app.rta` | Clangベースを匂わせつつ隠蔽[^3_1] |
| `rtac.exe` | `rtac main.c -rta app.rta` | 短く覚えやすい（RTA Compiler） |

`rta-cc.exe` が鉄板。gcc使ってる人なら違和感ゼロで、「INtime RTA用ccコンパイラ」と説明できます。[^3_2][^3_1]

## 内部フロー例

exe内でps1のロジックをC\#/Rust/Goで実装：

1. .cファイルを検知→`clang -c -target x86_64-intime ... input.c -o temp.o`（INtime include/libパス自動）。[^3_2]
2. 全.obj/.lib集約→`clang temp.o/*.obj lib/*.lib -fuse-ld=lld -o app.rta`（INtimeリンカオプション）。[^3_1]
3. クリーンアップ→.rta吐き出し。[^3_3]

これで「ソース列挙→rta一発生成」のブラックボックス完成。VS完全不要。[^3_4]
<span style="display:none">[^3_10][^3_11][^3_12][^3_5][^3_6][^3_7][^3_8][^3_9]</span>

<div align="center">⁂</div>

[^3_1]: https://clang.llvm.org/docs/UsersManual.html

[^3_2]: https://public.acontis.com/manuals/EC-Master/3.2/html/ec-master-class-b/os_intime.html

[^3_3]: https://support.tenasys.com/7-1/Using_Develop

[^3_4]: https://manuals.plus/m/c37473cc337fa9826d19966ac85cee52d1448958da8c900dd7aec9aaf67ef310

[^3_5]: https://qiita.com/sukimaengineer/items/674b8ea7189fb7fe5a20

[^3_6]: https://aras-p.info/blog/2019/01/12/Investigating-compile-times-and-Clang-ftime-report/

[^3_7]: https://discourse.llvm.org/t/improve-autolinking-of-compiler-rt-and-libc-on-windows-with-lld-link/71392

[^3_8]: https://support.tenasys.com/6-2/ref_upgrade_vs_cpp_projects

[^3_9]: https://fuchsia.googlesource.com/fuchsia/+/682a3d28766c/docs/development/build/toolchain.md

[^3_10]: https://www.driveridentifier.com/scan/intime-serial-driver/driver-detail/A169B40DE23B4A63BFE5DE4AAD0D79D3/4630268/2854078df09eeb03956b5458bb5e4679/395030318/PCI-CC_0C80

[^3_11]: https://fuchsia.dev/fuchsia-src/development/build/toolchain?hl=zh-cn

[^3_12]: https://www.intel.com/content/www/us/en/partner/showcase/offering/a5b3b000000Tfe7AAC/intime-distributed-rtos--realtime-os-for-pcplatforms.html


---

# lldb的なデバッガも考えてるのでそれを考慮したexeの名前

LLDB的なデバッガも含めたツールスイートなら、exe名を「ツールチェーン全体のブランド名」にして統一感を出しましょう。Clang+LLDBのLLVMエコシステムに倣った命名が自然です。[^4_1][^4_2]

## ツールスイートの全体名

- **RTA開発ツールチェーン**（rta-cc + rta-lldb など）。[^4_3]
- **INtime LLVMツールスイート**（intime-clang + intime-lldb）。[^4_1]
- **RTDebugger Suite**（RTA向けコンパイラ＋デバッガ）。[^4_4][^4_3]

LLDB統合を意識して「Clang-LLDBペア」風にすると、INtime RTAの「VS不要フル環境」として魅力的に見えます。[^4_1]

## exe名の提案（デバッガ考慮）

コンパイラexeとデバッガexeをセットで名付ける。


| コンパイラexe | デバッガexe | 理由・使い方 |
| :-- | :-- | :-- |
| `rta-cc.exe` | `rta-lldb.exe` | LLVM風（clang/lldb互換）。`rta-cc main.c -g -o app.rta` → `rta-lldb app.rta` でシームレス[^4_1] |
| `intime-cc.exe` | `intime-lldb.exe` | INtimeブランド統一。INtime公式ツール（intex.exe）と並ぶ感じ[^4_3] |
| `rtac.exe` | `rtadb.exe` | 短縮形（RTA Compiler / RTA Debugger）。ツールスイート感強い[^4_4] |
| `rta-cl.exe` | `rta-lldb.exe` | cl（MSVC風）+lldb。`-g`でDWARF出力→LLDBネイティブデバッグ[^4_1] |

**推奨：`rta-cc.exe` + `rta-lldb.exe`**

- 理由：Clang（cc）+LLDBのペアを模倣、INtime RTA特化を「rta-」で明示。[^4_2][^4_1]
- ドキュメント例：「RTA Toolchain: rta-cc でコンパイル、rta-lldb でデバッグ（VS不要）」。[^4_3]


## 統合の利点

- コンパイラ：`-g`オプションでDWARFデバッグ情報自動埋め込み。[^4_1]
- デバッガ：INtime GDBサーバー（WinNtxProxy）とLLDB互換でRTAステップ実行。[^4_3]
- スイート展開：`rta-suite.zip` にまとめ、READMEで「rta-cc app.c -g -o app.rta \&\& rta-lldb app.rta」。[^4_4]

これでLLVM/Clang/LLDBを隠蔽しつつ、プロ級のINtime RTA開発環境が完成します。[^4_3][^4_1]
<span style="display:none">[^4_10][^4_11][^4_5][^4_6][^4_7][^4_8][^4_9]</span>

<div align="center">⁂</div>

[^4_1]: https://lldb.llvm.org

[^4_2]: https://clang.llvm.org/docs/UsersManual.html

[^4_3]: https://support.tenasys.com/7-0/Using_Debugging

[^4_4]: https://www.acoutronic.se/pdf/embedded_systems/Tenasys_DS_irntime.pdf

[^4_5]: https://github.com/rustymagnet3000/lldb_debugger/blob/master/README.md

[^4_6]: https://lldb.llvm.org/resources/debugging.html

[^4_7]: https://docs.redhat.com/en/documentation/red_hat_developer_tools/1/html/using_llvm_18.1.8_toolset/assembly_the-lldb-debugger_using-llvm-toolset

[^4_8]: https://aras-p.info/blog/2019/01/12/Investigating-compile-times-and-Clang-ftime-report/

[^4_9]: https://www.intelnect.com/wp-content/uploads/2024/06/INtime_SDK_DataSheet_2021-11.pdf

[^4_10]: https://packages.msys2.org/packages/mingw-w64-clang-aarch64-lldb?repo=clangarm64

[^4_11]: http://www.ampliconbenelux.com/data/INtime4WinDSweb.pdf


---

# rtac.exe、rtadb.exeにしたいと思います。makefileのように構成内容をやや調整できるようになるか？.c/.obj/libやoutput指定。コマンド引数指定の場合とmakefile的な指定とどちらでも行ける。json形式がよさげ、.rsl(DLLに相当)を作るモードも考えてる

rtac.exe（コンパイラ）とrtadb.exe（デバッガ）の決定、素晴らしいです！ Makefileライクな柔軟性（.c/.obj/.lib列挙、出力指定）とJSON config対応、.rsl（INtimeのDLL相当）モードも追加で、プロ級ツールスイートになります。[^5_1][^5_2]

## JSON config形式の提案

Makefileの代替としてJSONが軽量・解析しやすいので最適。rtac.exeが`rtac project.json`で読み込む形。

```json
{
  "mode": "rta",  // "rta" or "rsl"
  "output": "app.rta",  // 出力ファイル（.rsl時はapp.rsl）
  "includes": ["include/", "intime-sdk/include/"],
  "libs": ["intime-sdk/lib/rtclass.lib", "mylib.lib"],
  "defines": ["DEBUG", "INTIME_TARGET"],
  "sources": [
    "main.c",
    "utils.obj",
    "module.lib"
  ],
  "flags": ["-O2", "-g"]  // コンパイルフラグ
}
```

- **コマンドライン併用**：`rtac main.c utils.obj -o app.rta -I include/ -D DEBUG` で即席ビルド。[^5_3]
- **JSON優先**：`rtac project.json` でconfig読み込み（コマンドラインで上書き可）。[^5_4]
- **.rslモード**：`"mode": "rsl"` で共有ライブラリ出力（INtime RSL、DLL相当）。[^5_2][^5_1]


## 使用例

**即席ビルド（CLI）**：

```
rtac main.c utils.obj mylib.lib -o app.rta -g -I intime/include/
```

**プロジェクトビルド（JSON）**：

```
rtac myproject.json  # → app.rta 生成
rtadb app.rta        # デバッグ開始
```

**RSLビルド**：

```json
{ "mode": "rsl", "output": "mylib.rsl", "sources": ["libsrc.c"] }
```

`rtac lib.json` → mylib.rsl（RTAから動的ロード可能）。[^5_5][^5_2]

## 実装のポイント

rtac.exe（Go/Rust/C\#推奨）で：

- 引数解析：第1引数が.jsonなら読み込み、なければCLIモード。[^5_4]
- .c検知→clang -c ... →.obj生成。
- 全ファイル→clangリンク（rta/rsl分岐：-shared for rsl）。[^5_1]
- エラー出力：JSONのsources順にログ。[^5_6]

これでMakefile並みの構成調整が可能になり、rtac/rtadbの“RTA Tool Suite”が本格化します。JSONスキーマ検証も追加で完璧。[^5_2][^5_4]
<span style="display:none">[^5_10][^5_11][^5_12][^5_7][^5_8][^5_9]</span>

<div align="center">⁂</div>

[^5_1]: https://tenasys.com/wp-content/uploads/2016/08/INtimeforWindows40UsersGuide.pdf

[^5_2]: https://support.tenasys.com/7-2/ovw_rsl

[^5_3]: https://clang.llvm.org/docs/UsersManual.html

[^5_4]: https://devblogs.microsoft.com/cppblog/makefile-tools-december-2021-update-problem-matchers-and-compilation-database-generation/

[^5_5]: https://www.mnc.co.jp/INtime/i_rsl.htm

[^5_6]: https://support.tenasys.com/7-0/Using_Debugging

[^5_7]: https://support.tenasys.com/6-2/Using_Loading

[^5_8]: https://www.mnc.co.jp/INtime/USERFAQ.htm

[^5_9]: https://www.mnc.co.jp/KBUPDATE/KBUPDATE_INtime.html

[^5_10]: https://device.report/m/a1f5468825a410f6c58b0a25cba7cfe9a21e54bd50b1972f447b870c06138ad9.pdf

[^5_11]: https://docs.infinitime.io/en/latest/build-flash-and-debug/index.html

[^5_12]: https://tenasys.com/wp-content/uploads/2021/08/intime-7-quick-start-guide.pdf


---

# リンカバージョン指定、ヒープ指定、最適化レベル指定、Windows境変数使える

完璧です。rtac.exeにリンカバージョン（lld/link.exe選択）、ヒープ指定、最適化レベル、Windows環境変数（%INTIME%など）対応を追加すると、Makefile超えの柔軟性になります。JSON/CLI両対応で実装しましょう。[^6_1][^6_2]

## 拡張JSON config例

```json
{
  "mode": "rta",  // rta / rsl
  "output": "app.rta",
  "optimize": "2",  // 0/1/2/3/s (clang -O)
  "linker": "lld",  // lld / link / clang
  "heap_size": "4M",  // INtimeヒープ指定 (--heap-size相当)
  "env_vars": {
    "INTIME_ROOT": "%INTIME%",
    "CUSTOM_PATH": "%USERPROFILE%/libs"
  },
  "includes": ["%INTIME%/include/"],
  "sources": ["main.c", "utils.obj"],
  "libs": ["rtclass.lib"],
  "flags": ["-g"]
}
```


## CLI例（環境変数展開自動）

```
rtac main.c -o app.rta -O 2 --linker lld --heap 4M -D DEBUG --env INTIME_ROOT=%INTIME%
```


## 新機能の実装詳細

| 機能 | JSON/CLI指定 | 内部処理（rtac.exe内） |
| :-- | :-- | :-- |
| **リンカバージョン** | `"linker": "lld"` / `--linker lld` | `clang -fuse-ld=lld` or `link.exe` 分岐[^6_3]。lld高速推奨。 |
| **最適化レベル** | `"optimize": "s"` / `-O s` | `clang -O$level`（0-3/s）。デフォルト2[^6_4]。 |
| **ヒープ指定** | `"heap_size": "8M"` / `--heap 8M` | リンカに`-Wl,--heap-size=8M` or INtime特化オプション[^6_5]。 |
| **Windows env変数** | `"env_vars": {"PATH": "%INTIME%/bin"}` | `%VAR%`を`os.ExpandEnv`で展開→include/libパスに注入[^6_1]。例：`%INTIME%/include/`自動解決。 |

- **優先順位**：JSON > CLI > デフォルト（env展開は全般適用）。[^6_1]
- **RSL時**：`--linker lld` + `-shared` で.rsl出力。[^6_2]
- **エラー時**：`rtac: error: Heap size must be power of 2 (e.g. 4M)` などMakefile風ログ。


## 使用フロー

1. `set INTIME_ROOT=C:\INtime`（Windows env）。[^6_1]
2. `rtac project.json --linker lld -O s` → 高速最適化rta生成。
3. `rtadb app.rta` でデバッグ（-g必須）。[^6_6]

これで環境構築ゼロ、Makefile並みの調整力がrtac/rtadbに宿ります。次はexe実装言語（Rust推奨）決めましょうか？。[^6_7]
<span style="display:none">[^6_10][^6_11][^6_12][^6_13][^6_14][^6_15][^6_16][^6_8][^6_9]</span>

<div align="center">⁂</div>

[^6_1]: https://support.tenasys.com/7-1/ovw_environment

[^6_2]: https://support.tenasys.com/7-2/ovw_rsl

[^6_3]: https://clang.llvm.org/docs/UsersManual.html

[^6_4]: https://aras-p.info/blog/2019/01/12/Investigating-compile-times-and-Clang-ftime-report/

[^6_5]: https://tenasys.com/wp-content/uploads/2016/08/INtimeforWindows40UsersGuide.pdf

[^6_6]: https://lldb.llvm.org

[^6_7]: https://devblogs.microsoft.com/cppblog/makefile-tools-december-2021-update-problem-matchers-and-compilation-database-generation/

[^6_8]: https://www.sakthifinance.com/wp-content/uploads/2024/01/SFL_Change-in-RTA_Ack-Link-Intime-Ack.pdf

[^6_9]: https://support.tenasys.com/7-1/ref_dir

[^6_10]: https://support.tenasys.com/7-1/Using_Develop

[^6_11]: https://community.rti.com/static/documentation/connext-dds/6.1.1/doc/manuals/connext_dds_professional/getting_started_platforms/intime_systems_addendum/RTI_ConnextDDS_CoreLibraries_GettingStarted_INtimeSystemsAddendum.pdf

[^6_12]: https://public.acontis.com/manuals/EC-Simulator/3.1/html/ec-simulator/os_intime.html

[^6_13]: https://support.tenasys.com/7-0/webindex

[^6_14]: https://docs.plunify.com/intime/latest/analyze.html

[^6_15]: https://community.rti.com/static/documentation/connext-dds/6.0.0/doc/manuals/connext_dds/getting_started_extras/RTI_ConnextDDS_CoreLibraries_GettingStarted_INtimeAddendum.pdf

[^6_16]: https://support.tenasys.com/7-0/istack


---

# コンパイラ指定"cl"(visualstudio)も使えるように共通パラメータで考えてほしい。"env_vars"はいらない

rtac.exeにVisual Studioの`cl.exe`もコンパイラとして選択可能にします！ `"compiler": "cl"` でcl/clang/clang-clを共通パラメータで切り替え、env_vars不要でWindows展開を自動化（Developer Command Prompt前提）。[^7_1][^7_2]

## 拡張JSON config（cl対応）

```json
{
  "mode": "rta",
  "output": "app.rta",
  "compiler": "cl",  // cl / clang / clang-cl
  "linker": "link",  // link / lld / clang
  "optimize": "2",
  "heap_size": "4M",
  "includes": ["$(INTIME)/include/"],
  "sources": ["main.c", "utils.obj"],
  "libs": ["rtclass.lib"],
  "flags": ["/Zi"]  // cl: /Zi (debug), clang: -g
}
```


## CLI例

```
rtac main.c -o app.rta --compiler cl --linker link --heap 4M /I "$(INTIME)\include"
```


## コンパイラ/リンカ対応表

| 指定 | コンパイルコマンド例 | リンカコマンド例 | 注意 |
| :-- | :-- | :-- | :-- |
| `cl` + `link` | `cl /c /Zi main.c` | `link main.obj rtclass.lib /OUT:app.rta /HEAP:4M` [^7_1] | VS必須、INtime libパス自動 |
| `clang` + `lld` | `clang -c -O2 -g main.c` | `clang main.o rtclass.lib -fuse-ld=lld -o app.rta` [^7_2] | VS不要 |
| `clang-cl` + `link` | `clang-cl /c /Zi main.c` | `link main.obj rtclass.lib /OUT:app.rta` [^7_3] | cl互換+高速 |

- **自動変換**：flagsをcompilerごとにマップ（`/Zi`→`-g`、`/O2`→`-O2`）。[^7_2]
- **パス展開**：`$(INTIME)`を自動`%INTIME%`に変換（env不要）。[^7_4]
- **デフォルト**：`clang` + `lld`（VS不要最優先）。[^7_5]


## RSL/ヒープ/最適化統合

- **RSL**：`"mode": "rsl"` → `/DLL` (cl/link) or `-shared` (clang)。[^7_6]
- **ヒープ**：`--heap 4M` → `/HEAP:4194304` (link) or `-Wl,--heap-size=4M`。[^7_1]
- **最適化**：`"optimize": "2"` → `/O2` (cl) / `-O2` (clang)。[^7_7]


## 使用フロー（VSあり/なし両対応）

**VS環境**：

```
rtac project.json --compiler cl  # cl + link.exeでINtime互換rta
```

**VSなし**：

```
rtac project.json --compiler clang  # 独立動作
```

これでcl/clang/clang-clの3択＋共通パラメータで、どんな環境でもrtac.exeが動きます。rtadb.exeもDWARF/PDB両対応に。[^7_2][^7_1]
<span style="display:none">[^7_10][^7_11][^7_12][^7_13][^7_14][^7_8][^7_9]</span>

<div align="center">⁂</div>

[^7_1]: https://support.tenasys.com/7-2/Using_Develop

[^7_2]: https://discourse.llvm.org/t/whats-the-difference-between-clang-cl-exe-vs-clang-exe-on-windows/56409

[^7_3]: https://github.com/conan-io/conan/issues/12424

[^7_4]: https://support.tenasys.com/7-1/ovw_environment

[^7_5]: https://clang.llvm.org/docs/UsersManual.html

[^7_6]: https://support.tenasys.com/7-2/ovw_rsl

[^7_7]: https://aras-p.info/blog/2019/01/12/Investigating-compile-times-and-Clang-ftime-report/

[^7_8]: https://support.tenasys.com/7-0/webindex

[^7_9]: https://support.tenasys.com/7-2/webtoc

[^7_10]: https://hemeroteca-pdf.bn.gov.br/093718/per093718_1931_00268.pdf

[^7_11]: https://support.tenasys.com/7-1/Using_Develop

[^7_12]: https://support.tenasys.com/7-2/ref_upgrade_vs_cpp_projects

[^7_13]: https://support.tenasys.com/7-1/intro_new

[^7_14]: https://johnnysswlab.com/link-time-optimizations-new-way-to-do-compiler-optimizations/


---

# "mode"は"outputの拡張子で判断できるかも

はい、完璧なアイデア！ `"output"`拡張子で自動判断（.rta→実行ファイル、.rsl→共有ライブラリ）すればJSONがシンプルになり、Makefileの-O/-sharedフラグ並みに直感的です。[^8_1][^8_2]

## 簡略化JSON config（mode削除）

```json
{
  "output": "app.rta",  // .rta or .rsl でモード自動判断
  "compiler": "cl",     // cl/clang/clang-cl
  "linker": "link",
  "optimize": "2",
  "heap_size": "4M",
  "includes": ["$(INTIME)/include/"],
  "sources": ["main.c", "utils.obj"],
  "libs": ["rtclass.lib"],
  "flags": ["/Zi"]
}
```

- **.rta**：実行ファイルモード（通常リンク）。[^8_1]
- **.rsl**：共有ライブラリモード（/DLL or -shared）。[^8_3][^8_2]
例：`"output": "mylib.rsl"` → 自動RSL生成。


## CLIも拡張子判断

```
rtac main.c -o app.rta     # RTA実行ファイル
rtac lib.c -o mylib.rsl    # RSL共有ライブラリ
rtac main.c -o app.rta --compiler cl --heap 4M
```


## 内部ロジック

rtac.exeで：

```pseudocode
output_ext = path.splitext(output)[^8_1]
if output_ext == ".rsl":
    flags += ["-shared", "/DLL"]  # compilerに応じて
else:  # .rta
    flags += []  # 通常実行ファイル
clang_or_cl(sources, flags...) + linker(output)
```

- **ヒープ**：.rta時のみ有効（RSL不要）。[^8_4]
- **cl互換**：`"output": "app.rta"` → `cl ... /link /OUT:app.rta /DLL?no`。[^8_4]


## 利点

- JSON短縮：mode不要で1行減。[^8_5]
- 直感的：出力名で用途即判別（Makefileの-fPIC感覚）。
- エラー防止：`"output": "app.exe"` →警告「.rta/.rslのみサポート」。[^8_1]

これでrtac.exeのconfigが洗練され、cl/clang両対応＋拡張子自動モードで究極の使いやすさです。rtadb.exeも.rslデバッグ対応で完璧。[^8_2][^8_6]
<span style="display:none">[^8_10][^8_11][^8_12][^8_13][^8_14][^8_7][^8_8][^8_9]</span>

<div align="center">⁂</div>

[^8_1]: https://support.tenasys.com/7-2/ref_dir

[^8_2]: https://support.tenasys.com/7-2/ovw_rsl

[^8_3]: https://www.mnc.co.jp/INtime/i_rsl.htm

[^8_4]: https://support.tenasys.com/7-2/Using_Develop

[^8_5]: https://devblogs.microsoft.com/cppblog/makefile-tools-december-2021-update-problem-matchers-and-compilation-database-generation/

[^8_6]: https://lldb.llvm.org

[^8_7]: https://www.mnc.co.jp/KBUPDATE/KBUPDATE_INtime.html

[^8_8]: https://monoist.itmedia.co.jp/mn/articles/0910/09/news091_2.html

[^8_9]: https://www2.algosystem.co.jp/dl/download/51_4A_AI3/4A_AI3_201906/intime/general/intime_dounyu_it2001a.pdf

[^8_10]: https://support.tenasys.com/7-0/Using_Update_DRTOS

[^8_11]: https://docs.plunify.com/intime/latest/export_results_FPGA.html

[^8_12]: https://file.org/extension/rta

[^8_13]: https://www.acoutronic.se/pdf/embedded_systems/Tenasys_DS_irntime.pdf

[^8_14]: https://www.intelnect.com/wp-content/uploads/2024/06/INtime_SDK_DataSheet_2021-11.pdf


---

# VisualStudioのコンパイラリンカ、LLVMのコンパイラリンカでツールセット分岐するので、ツールセットのセクションとターゲットコンポーネントの２セクションに分けたほうが

素晴らしい提案です！ VSツールセット（cl+link）とLLVMツールセット（clang+lld）を分岐しやすくするため、JSONを**toolsets**（ツールセット定義）と**targets**（ビルドターゲット）の2セクションに分けます。CMakeのtoolchain file風で拡張性抜群。[^9_1][^9_2]

## 新JSON config構造

```json
{
  "toolsets": {
    "vs": {
      "compiler": "cl",
      "linker": "link"
    },
    "llvm": {
      "compiler": "clang",
      "linker": "lld"
    }
  },
  "targets": [
    {
      "name": "app",
      "toolset": "vs",  // vs / llvm 選択
      "output": "app.rta",
      "optimize": "2",
      "heap_size": "4M",
      "includes": ["$(INTIME)/include/"],
      "sources": ["main.c"],
      "libs": ["rtclass.lib"],
      "flags": ["/Zi"]
    },
    {
      "name": "mylib",
      "toolset": "llvm",
      "output": "mylib.rsl",
      "optimize": "s",
      "sources": ["lib.c"]
    }
  ]
}
```


## CLI対応

```
rtac project.json --target app --toolset llvm  # ターゲット+ツールセット上書き
rtac main.c -o app.rta --toolset vs           # 即席ターゲット
```


## 利点と動作

| セクション | 役割 | 例 |
| :-- | :-- | :-- |
| **toolsets** | ツールセット定義（再利用） | VS/LLVMのプリセット。追加可能（arm-gccなど）[^9_1]。 |
| **targets** | ビルドターゲット（複数可） | 1ファイルでrta+rsl同時生成。`--target mylib`で単独ビルド[^9_2]。 |

- **拡張子判断**：.rta/.rslでリンクモード自動（/DLL/-shared）。[^9_3]
- **分岐**：toolsetでcompiler/linker自動選択、flags自動変換（/O2→-O2）。[^9_4]
- **デフォルト**：toolsets "llvm"、targets第1つ。[^9_2]
- **複数ターゲット**：`rtac project.json --target all` で全ビルド。


## 使用フロー

```
rtac project.json          # app.rta + mylib.rsl 生成（VS+LLVM混在）
rtac project.json --target app --toolset llvm  # LLVMでapp再ビルド
rtadb app.rta             # デバッグ
```

これでVS/LLVMハイブリッド開発がJSON1つで完結。rtac.exeの“ミニCMake”化で将来性も◎です。[^9_1][^9_2]
<span style="display:none">[^9_10][^9_11][^9_12][^9_5][^9_6][^9_7][^9_8][^9_9]</span>

<div align="center">⁂</div>

[^9_1]: https://docs.conan.io/2/reference/tools/cmake/cmaketoolchain.html

[^9_2]: https://www.vinnie.work/blog/2020-11-17-cmake-eval

[^9_3]: https://support.tenasys.com/7-2/ovw_rsl

[^9_4]: https://discourse.llvm.org/t/whats-the-difference-between-clang-cl-exe-vs-clang-exe-on-windows/56409

[^9_5]: https://docs.python.org/ja/3.13/library/json.html

[^9_6]: https://chromium.googlesource.com/chromium/src/+/900b6ac5c70b28efafd3a605f73179ec5bd7bd9b/build/vs_toolchain.py

[^9_7]: https://github.com/jcoreio/toolchains

[^9_8]: https://chromium.googlesource.com/aosp/platform/external/libchrome/+/master/build/vs_toolchain.py

[^9_9]: https://fekir.info/post/toolchain-file-in-cmake/

[^9_10]: https://github.com/saikojosh/Config-Ninja

[^9_11]: https://forum.qt.io/topic/136541/error-no-toolchain-version-defined-in-json-file

[^9_12]: https://www.npmjs.com/package/config-ninja


---

# 出力先ディレクトリ、"heap_size"不要、その他コンパイラオプション、リンカオプションtoolsetの指定できるよう

はい、出力ディレクトリ追加、heap_size削除、**toolsetごとにコンパイラ/リンカオプション指定**でさらに洗練。JSON構造を維持しつつ柔軟性を強化します。[^10_1][^10_2]

## 更新JSON config

```json
{
  "toolsets": {
    "vs": {
      "compiler": "cl",
      "linker": "link",
      "compiler_flags": ["/W3", "/Zi"],
      "linker_flags": ["/HEAP:4194304"]  // heap_sizeをこちらへ
    },
    "llvm": {
      "compiler": "clang",
      "linker": "lld",
      "compiler_flags": ["-Wall", "-g"],
      "linker_flags": ["-Wl,--heap-size=4M"]
    }
  },
  "targets": [
    {
      "name": "app",
      "toolset": "vs",
      "output_dir": "build/vs/",  // 出力ディレクトリ（相対/絶対）
      "output": "app.rta",
      "optimize": "2",
      "includes": ["$(INTIME)/include/"],
      "sources": ["main.c", "utils.obj"],
      "libs": ["rtclass.lib"],
      "flags": ["/DDEBUG"]  // ターゲット固有flags（toolsetと追加）
    }
  ]
}
```


## CLI拡張

```
rtac project.json --target app --output-dir build/llvm/
rtac main.c -o build/app.rta --toolset vs --compiler-flags "/W4"
```


## 新機能詳細

| 項目 | 場所 | 詳細 |
| :-- | :-- | :-- |
| **出力ディレクトリ** | `output_dir`（target） | `"build/vs/"` → `build/vs/app.rta` 生成。相対pathはJSONからの相対[^10_1]。 |
| **heap_size削除** | `linker_flags`へ移動 | VS: `/HEAP:4194304`、LLVM: `-Wl,--heap-size=4M`[^10_3]。 |
| **コンパイラオプション** | `compiler_flags`（toolset） | VS: `/W3 /Zi`、LLVM: `-Wall -g`。ターゲットflagsとマージ[^10_4]。 |
| **リンカオプション** | `linker_flags`（toolset） | ヒープ/スタック/エントリーポイントなど。拡張子でrta/rsl分岐[^10_5]。 |

- **出力解決**：`output_dir + output`（ディレクトリ自動mkdir）。[^10_6]
- **flags統合**：toolset.flags + target.flags（後勝ち）。[^10_2]
- **デフォルト**：output_dir=""（カレント）、toolset "llvm"。[^10_7]


## 動作例

**VSビルド**：

```
rtac project.json  # → build/vs/app.rta (/HEAP自動)
```

**LLVM高速ビルド**：

```
rtac project.json --toolset llvm --output-dir build/fast/ --optimize s
```

これでtoolsetプリセット＋ターゲットカスタムが完璧。出力整理され、VS/LLVMの違いをflagsで吸収します。rtac.exeのJSONパーサーが本格化！[^10_1][^10_2]
<span style="display:none">[^10_10][^10_11][^10_12][^10_13][^10_14][^10_15][^10_8][^10_9]</span>

<div align="center">⁂</div>

[^10_1]: https://stackoverflow.com/questions/65299043/how-to-change-cmake-build-directory-in-cmake-kits-json-or-cmake-variants-json/70230971

[^10_2]: https://docs.conan.io/2/reference/tools/cmake/cmaketoolchain.html

[^10_3]: https://support.tenasys.com/7-2/Using_Develop

[^10_4]: https://discourse.llvm.org/t/whats-the-difference-between-clang-cl-exe-vs-clang-exe-on-windows/56409

[^10_5]: https://support.tenasys.com/7-2/ovw_rsl

[^10_6]: https://discourse.cmake.org/t/changing-output-directories/8829

[^10_7]: https://www.vinnie.work/blog/2020-11-17-cmake-eval

[^10_8]: https://cmake.org/cmake/help/latest/variable/CMAKE_EXPORT_COMPILE_COMMANDS.html

[^10_9]: https://joshtronic.com/2024/01/14/cmake-compile-commands-json/

[^10_10]: https://www.reddit.com/r/cpp_questions/comments/1lzqshc/setting_output_directories_in_cmake/

[^10_11]: https://dub.pm/dub-guide/recipe/

[^10_12]: https://stackoverflow.com/questions/52022717/how-to-make-cmake-output-to-the-build-directory

[^10_13]: https://gitlab.kitware.com/cmake/cmake/-/issues/26040

[^10_14]: https://gitlab.kitware.com/cmake/cmake/-/issues/25986

[^10_15]: https://stackoverflow.com/questions/73602939/how-to-set-linker-flags-at-build-time-with-cmake


---

# -VERSION:xxx:xxもあったよね

はい、INtimeリンクオプションの **`-VERSION:xxx:xx`**（バージョン文字列埋め込み）を追加しましょう！ toolsetの`linker_flags`に自然に収まり、RTA/.rslにバージョン情報を刻印できます。[^11_1][^11_2]

## 更新JSON（-VERSION対応）

```json
{
  "toolsets": {
    "vs": {
      "compiler": "cl",
      "linker": "link",
      "compiler_flags": ["/W3"],
      "linker_flags": ["/VERSION:1.0.0", "/HEAP:4194304"]  // -VERSION相当
    },
    "llvm": {
      "compiler": "clang",
      "linker": "lld",
      "compiler_flags": ["-Wall"],
      "linker_flags": ["-Wl,--version=1.0.0"]  // lld版VERSION
    }
  },
  "targets": [
    {
      "name": "app",
      "toolset": "vs",
      "output_dir": "build/vs/",
      "output": "app.rta",
      "optimize": "2",
      "includes": ["$(INTIME)/include/"],
      "sources": ["main.c"],
      "libs": ["rtclass.lib"]
    }
  ]
}
```


## CLI例

```
rtac project.json --linker-flags "/VERSION:1.2.3"
rtac main.c -o app.rta --toolset llvm --linker-flags "-Wl,--version=1.2.3"
```


## -VERSIONオプション詳細

| ツールセット | linker_flags例 | 効果 |
| :-- | :-- | :-- |
| **VS (link.exe)** | `"/VERSION:1.0.0"` | RTAにバージョン文字列埋め込み（INtime標準）[^11_2]。 |
| **LLVM (lld)** | `"-Wl,--version=1.0.0"` | lldのメタデータ版（互換性確保）[^11_3]。 |

- **自動処理**：rtac.exeでtoolsetに応じてフラグ変換（`/VERSION:xxx` or `-Wl,--version=xxx`）。[^11_4]
- **CLI上書き**：`--linker-flags`で追加/置換。[^11_5]
- **デバッグ確認**：rtadb.exeで`info version`表示予定。[^11_6]
- **RSL対応**：.rsl出力時もVERSION有効。[^11_1]


## 完全フロー例

```
rtac project.json  # build/vs/app.rta (VERSION:1.0.0 + HEAP:4M)
rtadb build/vs/app.rta  # バージョン確認可能
```

これでrtac.exeがINtimeリンクの全貌（VERSION/HEAP/出力dir）をカバー。VS/LLVM完全分岐でプロユースツール完成です。[^11_2][^11_1]
<span style="display:none">[^11_10][^11_11][^11_12][^11_13][^11_14][^11_15][^11_16][^11_7][^11_8][^11_9]</span>

<div align="center">⁂</div>

[^11_1]: https://support.tenasys.com/7-2/ovw_rsl

[^11_2]: https://support.tenasys.com/7-2/Using_Develop

[^11_3]: https://clang.llvm.org/docs/UsersManual.html

[^11_4]: https://discourse.llvm.org/t/whats-the-difference-between-clang-cl-exe-vs-clang-exe-on-windows/56409

[^11_5]: https://docs.conan.io/2/reference/tools/cmake/cmaketoolchain.html

[^11_6]: https://lldb.llvm.org

[^11_7]: https://www.db.hivertec.net/CPD500IT/CPD500_GS_SP_INTIME_1_02J.pdf

[^11_8]: https://static08.jockey.in/uploads/investordocuments/annualgrowth/69373eac-0032-4528-90fb-2fb18e974749/annual_report_202324.pdf

[^11_9]: https://fairchem.in/investor-relations/Annual-Reports/Annual-Report-FY-15-16.pdf

[^11_10]: https://www.piramalpharma.com/Assets/download/AnnualReports/2024-25/Annual Report FY 2024 - 25.pdf

[^11_11]: https://arclorganics.com/wp-content/uploads/2024/11/Annual Report 2024-2025.pdf

[^11_12]: https://community.roboticsys.com/t/is-it-possible-to-check-the-intime-version/298

[^11_13]: https://git.raptorcs.com/git/bcm5719-llvm/commit/lld/Common?id=04661e1084cc76bc6b88e5d13d7c91f4b1044f27

[^11_14]: https://www.valoremadvisors.com/assets/admin/annualreport_file/1752213547_Page_Ind_Annual_Report_-_FY25.pdf

[^11_15]: https://support.tenasys.com/7-0/Using_Installation_SDK_and_INtime_for_Windows

[^11_16]: https://blog.llvm.net.cn/2019/11/deterministic-builds-with-clang-and-lld.html

