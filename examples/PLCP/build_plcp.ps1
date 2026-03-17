Param(
    [string]$Toolset = "llvm",
    [string]$Configuration = "plcp"
)

$ErrorActionPreference = "Stop"

# スクリプトの場所を基準にする
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

$rtacc = Join-Path $scriptDir "..\..\bin\rtacc.exe"

if (-not (Test-Path $rtacc)) {
    Write-Error "rtacc.exe が見つかりません: $rtacc"
}

Write-Host "rtacc で PLCP をビルドします (toolset=$Toolset)..." -ForegroundColor Cyan

$include = ""
if ($env:RTEDGE) {
    $include = Join-Path $env:RTEDGE "library"
    Write-Host "RTEDGE include: $include" -ForegroundColor DarkCyan
}

if ($include) {
    & $rtacc "project.json" --target $Configuration --toolset $Toolset -I "$include"
} else {
    & $rtacc "project.json" --target $Configuration --toolset $Toolset
}

if ($LASTEXITCODE -ne 0) {
    throw "rtacc ビルドに失敗しました。exit code = $LASTEXITCODE"
}

Write-Host "ビルド成功: out\plcp.rta" -ForegroundColor Green

