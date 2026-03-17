Param(
    [string]$Toolset = "llvm",
    [string]$Configuration = "sqint"
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

$rtacc = Join-Path $scriptDir "..\..\bin\rtacc.exe"

if (-not (Test-Path $rtacc)) {
    Write-Error "rtacc.exe が見つかりません: $rtacc"
}

Write-Host "rtacc で SQINT (PLCP 組み込み) をビルドします (toolset=$Toolset)..." -ForegroundColor Cyan

$args = @("project.json", "--target", $Configuration, "--toolset", $Toolset)

if ($env:RTEDGE) {
    $rtedgeLibDir = Join-Path $env:RTEDGE "Library\Rt"
    Write-Host "RTEDGE lib dir: $rtedgeLibDir" -ForegroundColor DarkCyan
    $args += @("--linker-flags", "/LIBPATH:$rtedgeLibDir")
}

# eghgapi.lib を明示リンク
$args += @("--libs", "eghgapi.lib")

& $rtacc @args

if ($LASTEXITCODE -ne 0) {
    throw "rtacc ビルドに失敗しました。exit code = $LASTEXITCODE"
}

Write-Host "ビルド成功: out\PLC.rta" -ForegroundColor Green

