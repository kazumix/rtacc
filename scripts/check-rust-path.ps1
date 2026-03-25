# rustup の rustc が先に来るか、sysroot と rust-src の有無を確認する
# Usage: .\scripts\check-rust-path.ps1  （プロジェクトルートから）
$ErrorActionPreference = "Continue"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function Show-RustcInfo {
    param([string]$Label)
    Write-Host "=== $Label ==="
    $all = Get-Command rustc -All -ErrorAction SilentlyContinue
    if (-not $all) {
        Write-Host "rustc not found"
        return
    }
    $i = 0
    foreach ($c in $all) {
        $i++
        Write-Host ("  [{0}] {1}" -f $i, $c.Source)
    }
    $first = $all | Select-Object -First 1
    Write-Host ("  (first) {0}" -f $first.Source)
    & $first.Source --version
    $sysroot = & $first.Source --print sysroot
    Write-Host ("  sysroot: {0}" -f $sysroot)
    $src = Join-Path $sysroot "lib\rustlib\src\rust\library"
    Write-Host ("  rust-src library path exists: {0}" -f (Test-Path $src))
}

Show-RustcInfo "Current PATH (shell default)"

$prepend = Join-Path $env:USERPROFILE ".cargo\bin"
if (Test-Path $prepend) {
    $env:Path = "$prepend;$env:Path"
    Show-RustcInfo "After prepend $prepend (same as .vscode rust-analyzer / terminal)"
}

Write-Host "=== rustup ==="
$rustup = Join-Path $env:USERPROFILE ".cargo\bin\rustup.exe"
if (Test-Path $rustup) {
    & $rustup show
    & $rustup component list --installed 2>$null | Select-String "rust-src"
} else {
    Write-Host "rustup not found: $rustup"
}
