---
marp: true
theme: default
paginate: false
title: LLVMの本質（1枚説明）
style: |
  section {
    font-size: 24px;
    padding: 40px 56px;
    line-height: 1.3;
  }
  h1 { font-size: 42px; margin: 0 0 6px 0; }
  h2 { font-size: 24px; margin: 0 0 12px 0; }
  p, li { margin: 4px 0; }
---

# LLVMの本質（1枚説明）
## 「従来コンパイラの一体型」を「LLVM IR中心の分業型」へ

**従来（モノリシック）**  
構文解析 + 最適化 + バイナリ化を1つのコンパイラが内包

⬇

**LLVM（モジュール化）**  
各言語フロントエンド → **LLVM IR (.ll/.bc)** → 共通バックエンド群

- フロントエンド: C/ST/IL → IR（clang / llst / llil）
- 共通IR層: 言語非依存で最適化を共通化
- 実行層: ネイティブ化 / JIT / デバッグ実行

**要点:**  
「`.ll` さえ得られれば」後段は共通基盤として再利用できる。  
最適化・ネイティブ化・JIT・デバッグ実行を横展開しやすい。

