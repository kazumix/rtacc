# rtacc 一式のビルド: rtacc.exe, llil.exe, llst.exe を bin/ に出力する。
# llil/llst は毎回クリーンビルドする。
# 使い方: .\build.ps1
# 前提: Go と Rust (cargo) が PATH に入っていること。

$ErrorActionPreference = "Stop"
$Root = $PSScriptRoot
$Bin = Join-Path $Root "bin"

if (-not (Get-Command go -ErrorAction SilentlyContinue)) {
    Write-Error "go が見つかりません。Go をインストールし PATH に追加してください。"
}
if (-not (Get-Command cargo -ErrorAction SilentlyContinue)) {
    Write-Error "cargo が見つかりません。Rust をインストールし PATH に追加してください。"
}

New-Item -ItemType Directory -Force -Path $Bin | Out-Null

Write-Host "Building rtacc.exe ..."
Push-Location $Root
try {
    go build -o (Join-Path $Bin "rtacc.exe") ./cmd/rtacc
    if (-not $?) { throw "go build failed" }
} finally {
    Pop-Location
}

Write-Host "Building llil.exe ..."
Push-Location (Join-Path $Root "llil")
try {
    cargo clean | Out-Null
    cargo build --release
    if (-not $?) { throw "cargo build llil failed" }
    $llilDest = Join-Path $Bin "llil.exe"
    Copy-Item -Path "target\release\llil.exe" -Destination $llilDest -Force
    (Get-Item $llilDest).LastWriteTime = Get-Date
} finally {
    Pop-Location
}

Write-Host "Building llst.exe ..."
Push-Location (Join-Path $Root "llst")
try {
    cargo clean | Out-Null
    cargo build --release
    if (-not $?) { throw "cargo build llst failed" }
    $llstDest = Join-Path $Bin "llst.exe"
    Copy-Item -Path "target\release\llst.exe" -Destination $llstDest -Force
    (Get-Item $llstDest).LastWriteTime = Get-Date
} finally {
    Pop-Location
}

# bin/ 内の exe の更新日時を揃える
(Get-Item (Join-Path $Bin "rtacc.exe")).LastWriteTime = Get-Date

Write-Host "Done. Output: $Bin"
Write-Host "  rtacc.exe, llil.exe, llst.exe"
Write-Host ""
Write-Host "【推奨】bin フォルダを PATH に追加すると、どのウィンドウ・IDE からでも llil/llst が使えます。"
Write-Host "  設定 → システム → バージョン情報 → システムの詳細設定 → 環境変数 → Path に追加: $Bin"
Write-Host ""
Write-Host "このセッションだけ使う場合:"
Write-Host "  CMD:       set PATH=$Bin;%PATH%"
Write-Host "  PowerShell: `$env:Path = `"$Bin;`" + `$env:Path"
