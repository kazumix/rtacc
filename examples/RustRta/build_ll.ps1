# Rust を LLVM IR (.ll) に出力。この後に rtacc で .rta をビルドする。
# i686 ターゲットは rustup でしか追加できないため、rustup 管理の rustc を優先する。
$ErrorActionPreference = "Stop"
$CargoRustc = Join-Path $env:USERPROFILE ".cargo\bin\rustc.exe"
$CargoRustup = Join-Path $env:USERPROFILE ".cargo\bin\rustup.exe"
if ($env:RUSTC) {
    $Rustc = $env:RUSTC
} elseif (Test-Path $CargoRustc) {
    $Rustc = $CargoRustc
    $Rustup = $CargoRustup
} else {
    $Rustc = "C:\Program Files\Rust stable MSVC 1.93\bin\rustc.exe"
}
$RustBin = Split-Path -Parent $Rustc
if (-not $Rustup) { $Rustup = Join-Path $RustBin "rustup.exe" }
$OutDir = "out"
$OutLl = "$OutDir/rustrta.ll"
$Target = "i686-pc-windows-msvc"

if (-not (Test-Path $OutDir)) { New-Item -ItemType Directory -Path $OutDir | Out-Null }

if (Test-Path $Rustup) {
    & $Rustup target add $Target 2>&1 | Out-Null
}

& $Rustc --crate-type lib -C panic=abort --emit=llvm-ir --target $Target -C opt-level=2 src/lib.rs -o $OutLl
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "--- i686 ターゲットには rustup が必要です ---"
    Write-Host "  1. https://rustup.rs で rustup をインストール"
    Write-Host "  2. 新しいターミナルで、次のコマンドをそのまま1行だけ実行:"
    Write-Host ""
    Write-Host "rustup target add $Target"
    Write-Host ""
    Write-Host "  3. その後 .\build_ll.ps1 を再実行"
    exit 1
}
Write-Host "Generated: $OutLl"
