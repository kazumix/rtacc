# Go 環境セットアップ（Windows）

rtacc.exe をビルドするために Go をインストールします。

---

## 方法 1: winget（推奨）

PowerShell または「Windows ターミナル」を**管理者で開き**、次を実行します。

```powershell
winget install -e --id GoLang.Go
```

- インストール先の目安: `C:\Program Files\Go`
- インストーラーが **PATH に自動追加**するため、多くの環境ではそのまま使えます。

---

## 方法 2: 公式インストーラー

1. **https://go.dev/dl/** を開く
2. **Windows** 用の `.msi`（例: `go1.22.x.windows-amd64.msi`）をダウンロード
3. ダブルクリックで実行し、手順に従ってインストール
4. 既定では `C:\Program Files\Go` にインストールされ、PATH に追加されます

---

## インストール後の確認

**新しいターミナル**を開き、次を実行します。

```powershell
go version
```

例: `go version go1.22.4 windows/amd64` のように表示されれば OK です。

---

## PATH に Go が含まれていない場合

`go` が認識されないときは、PATH を確認・追加します。

1. **現在のセッションだけ**試す場合:

   ```powershell
   $env:Path += ";C:\Program Files\Go\bin"
   go version
   ```

2. **永続的に**追加する場合:
   - 「設定」→「システム」→「バージョン情報」→「システムの詳細設定」→「環境変数」
   - ユーザーまたはシステムの **Path** に次を追加:
     - `C:\Program Files\Go\bin`

---

## rtacc.exe のビルド

Go が使える状態で、プロジェクトルートで実行します。

```powershell
cd D:\work\rtacc
go build -o rtacc.exe .\cmd\rtacc
```

`rtacc.exe` ができていればセットアップ完了です。
