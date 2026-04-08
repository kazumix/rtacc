# Omron SDO 0x3000 RTA をビルド（要: RSIECAT_SDK, rtacc または Go）
$ErrorActionPreference = "Stop"
$Here = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Here

if (-not $env:RSIECAT_SDK) {
    Write-Error "環境変数 RSIECAT_SDK を設定してください (ehapi.h / ehapi.lib があるフォルダ)。"
    exit 1
}

python (Join-Path $Here "build.py")
exit $LASTEXITCODE
