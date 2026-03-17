# 社内中間報告スライド

## ファイル

- **rtacc_中間報告_スライド.md** … 中間報告用のスライド原稿（Marp 形式）

## PDF スライドの出力方法

### 方法1: Marp for VS Code / Cursor（推奨）

1. [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode) 拡張をインストール
2. `rtacc_中間報告_スライド.md` を開く
3. エディタ右上の「プレビュー」または「Export Slide Deck」から **PDF** を選択してエクスポート

### 方法2: Marp CLI

```bash
cd D:\work\rtacc\docs\Review
npx @marp-team/marp-cli rtacc_中間報告_スライド.md --pdf -o rtacc_中間報告.pdf --no-stdin
```

※ PDF 出力には Chromium が使われるため、初回は自動でダウンロードされる場合があります。

## 内容のポイント

- LLVM 技術とその活用により見えてきた可能性（もともとは PLCplus 将来改造の検討で、その枠に収まらない可能性が見えてきた）
- 可能性の共有と、もう少し研究する時間をいただきたい旨
- 今後の研究予定と成果イメージ（PLCplus 性能比較、lldb.rta、IL→LL 高速化、IEC/RT-Edge の LL 化）
- Visual Studio Community の商用制限と rtacc.exe の役割
- rtacc.exe の多言語対応（C / ST / IL）とコマンド例

必要に応じてスライドの文言や順序を編集してください。
