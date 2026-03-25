# Rust を LLVM IR (.ll) に出力 → rtacc で .rta を生成（エントリは Rust の _main）
$ErrorActionPreference = "Stop"
$CargoRustc = Join-Path $env:USERPROFILE ".cargo\bin\rustc.exe"
$CargoRustup = Join-Path $env:USERPROFILE ".cargo\bin\rustup.exe"
if ($env:RUSTC) {
    $Rustc = $env:RUSTC
} elseif (Test-Path $CargoRustc) {
    $Rustc = $CargoRustc
    $Rustup = $CargoRustup
} else {
    $Rustc = "rustc.exe"
}
if (-not $Rustup) { $Rustup = Join-Path (Split-Path -Parent $Rustc) "rustup.exe" }
$OutDir = "out"
$OutLl = "$OutDir/rust_rt_mailbox.ll"
$Target = "i686-pc-windows-msvc"

if (-not (Test-Path $OutDir)) { New-Item -ItemType Directory -Path $OutDir | Out-Null }

if (Test-Path $Rustup) {
    & $Rustup target add $Target 2>&1 | Out-Null
}

# main.rs が #[path = "INtime.rs"] mod intime; で INtime.rs を取り込む
& $Rustc --crate-type lib -C panic=abort --emit=llvm-ir --target $Target -C opt-level=2 main.rs -o $OutLl
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "--- i686 ターゲットには rustup が必要です ---"
    Write-Host "  rustup target add $Target"
    exit 1
}
Write-Host "Generated: $OutLl"
