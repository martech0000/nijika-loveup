param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^https?://')]
    [string]$Url
)

$indexPath = Join-Path $PSScriptRoot 'index.html'
$html = Get-Content -Raw -LiteralPath $indexPath
$pattern = '(<a class="cta-hit[^\"]*" href=")[^\"]*(")'
$updated = [regex]::Replace($html, $pattern, {
    param($match)
    $match.Groups[1].Value + $Url + $match.Groups[2].Value
})

if ($updated -eq $html) {
    throw 'CTAリンクが見つかりませんでした。index.htmlを確認してください。'
}

[System.IO.File]::WriteAllText($indexPath, $updated, [System.Text.UTF8Encoding]::new($false))
Write-Host "CTAリンクを更新しました: $Url"
