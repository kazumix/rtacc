# 外部クレート込みで LLVM IR (.ll) を出力 → rtacc で .rta を生成（エントリは Rust の main）
# rustup の rustc を PATH 先頭に置く（Program Files の単体 Rust に i686 の rustlib が無い環境がある）
$ErrorActionPreference = "Stop"
$env:PATH = "$env:USERPROFILE\.cargo\bin;$env:PATH"

$OutDir = "out"
$OutLl = "$OutDir/rust_rt_algorithms.ll"
$Target = "i686-pc-windows-msvc"

if (-not (Test-Path $OutDir)) { New-Item -ItemType Directory -Path $OutDir | Out-Null }

$Rustup = Join-Path $env:USERPROFILE ".cargo\bin\rustup.exe"
if (Test-Path $Rustup) {
    & $Rustup target add $Target 2>&1 | Out-Null
}

cargo rustc --release -- --emit=llvm-ir
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

$ll = Get-ChildItem "target\$Target\release\deps\rust_rt_algorithms-*.ll" -ErrorAction SilentlyContinue |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1
if (-not $ll) {
    Write-Error "No rust_rt_algorithms-*.ll under target/$Target/release/deps"
    exit 1
}
Copy-Item $ll.FullName $OutLl -Force
Write-Host "Generated: $OutLl"
