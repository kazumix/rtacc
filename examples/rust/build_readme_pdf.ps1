# README_INtime_Rust_RTA.md を PDF にする
# 1) Pandoc + LaTeX/wkhtmltopdf があればその PDF
# 2) 無ければ HTML を生成し、Microsoft Edge ヘッドレスで印刷 PDF（LaTeX 不要）
$ErrorActionPreference = "Stop"
$Here = $PSScriptRoot
$Md = Join-Path $Here "README_INtime_Rust_RTA.md"
$Pdf = Join-Path $Here "README_INtime_Rust_RTA.pdf"
$Html = Join-Path $Here "README_INtime_Rust_RTA.html"

if (-not (Test-Path $Md)) {
    Write-Error "見つかりません: $Md"
    exit 1
}

$pandoc = Get-Command pandoc -ErrorAction SilentlyContinue
if (-not $pandoc) {
    Write-Host "Pandoc が PATH にありません。" -ForegroundColor Yellow
    Write-Host "  winget install --id JohnMacFarlane.Pandoc" -ForegroundColor Gray
    exit 1
}

function Export-Html {
    & pandoc $Md -o $Html -s --metadata title="INtime 向け Rust と RTA ビルド" `
        -c https://cdn.jsdelivr.net/npm/github-markdown-css@5/github-markdown.min.css
    if ($LASTEXITCODE -ne 0) { throw "pandoc HTML 生成に失敗しました" }
}

function Find-Edge {
    $candidates = @(
        (Join-Path ${env:ProgramFiles(x86)} "Microsoft\Edge\Application\msedge.exe"),
        (Join-Path $env:ProgramFiles "Microsoft\Edge\Application\msedge.exe")
    )
    foreach ($p in $candidates) {
        if ($p -and (Test-Path $p)) { return $p }
    }
    $cmd = Get-Command msedge -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
    return $null
}

function Export-PdfViaEdge {
    param([string]$EdgeExe, [string]$HtmlPath, [string]$PdfPath)
    $absHtml = (Resolve-Path $HtmlPath).Path
    $uri = "file:///" + ($absHtml -replace '\\', '/')
    if (Test-Path $PdfPath) { Remove-Item $PdfPath -Force }
    & $EdgeExe --headless --disable-gpu --no-pdf-header-footer --print-to-pdf="$PdfPath" $uri 2>&1 | Out-Null
    # Edge は成功しても終了コードが 0 以外になることがあるため、ファイル実体で判定する
    if (-not (Test-Path $PdfPath)) { return $false }
    return (Get-Item $PdfPath).Length -gt 1024
}

function Try-PdfEngine {
    param([string]$Engine)
    $pdfArgs = @(
        $Md,
        "-o", $Pdf,
        "-V", "geometry:margin=20mm",
        "-V", "documentclass=article",
        "--pdf-engine=$Engine"
    )
    & pandoc @pdfArgs 2>&1
    return ($LASTEXITCODE -eq 0) -and (Test-Path $Pdf)
}

Write-Host "Pandoc で PDF を試行（LaTeX / wkhtmltopdf）: $Pdf" -ForegroundColor Cyan
$ok = $false
foreach ($eng in @("xelatex", "lualatex", "pdflatex", "wkhtmltopdf")) {
    if (Get-Command $eng -ErrorAction SilentlyContinue) {
        if (Try-PdfEngine $eng) {
            Write-Host "生成しました: $Pdf (engine=$eng)" -ForegroundColor Green
            $ok = $true
            break
        }
    }
}

if (-not $ok) {
    Write-Host "HTML を生成し、Microsoft Edge で PDF に変換します…" -ForegroundColor Cyan
    Export-Html
    $edge = Find-Edge
    if (-not $edge) {
        Write-Host "Edge が見つかりません。手元のブラウザで次を開き、印刷から PDF 保存してください:" -ForegroundColor Yellow
        Write-Host "  $Html" -ForegroundColor Gray
        exit 0
    }
    if (Test-Path $Pdf) { Remove-Item $Pdf -Force }
    if (-not (Export-PdfViaEdge -EdgeExe $edge -HtmlPath $Html -PdfPath $Pdf)) {
        Write-Host "Edge による PDF 変換に失敗しました。HTML を開いて印刷してください: $Html" -ForegroundColor Yellow
        exit 1
    }
    Write-Host "生成しました: $Pdf (Microsoft Edge ヘッドレス印刷)" -ForegroundColor Green
    Write-Host "（中間 HTML: $Html）" -ForegroundColor Gray
}

exit 0
