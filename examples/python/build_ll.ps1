# Python (Numba) → LLVM IR (.ll) → rtacc で app.rta
$ErrorActionPreference = "Stop"
$Here = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Here

$OutDir = Join-Path $Here "out"
if (-not (Test-Path $OutDir)) {
    New-Item -ItemType Directory -Path $OutDir | Out-Null
}

python -m pip install -r (Join-Path $Here "requirements.txt") -q
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

python (Join-Path $Here "emit_ll.py")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$RepoRoot = Resolve-Path (Join-Path $Here "..\..")
$Proj = Join-Path $Here "project.json"
$RtaccExe = Get-Command rtacc -ErrorAction SilentlyContinue
if ($RtaccExe) {
    & rtacc $Proj
    exit $LASTEXITCODE
}
$Go = Get-Command go -ErrorAction SilentlyContinue
if ($Go) {
    Push-Location $RepoRoot
    try {
        go run ./cmd/rtacc $Proj
        exit $LASTEXITCODE
    } finally {
        Pop-Location
    }
}
Write-Error "rtacc も go も見つかりません。rtacc を PATH に入れるか、Go でリポジトリルートから go run ./cmd/rtacc を実行してください。"
exit 1
