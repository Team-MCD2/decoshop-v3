# One-shot cache-bust script: appends ?v=2 to app.js and styles.css references
# in all HTML files so browsers immediately refetch the new assets.
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$utf8 = New-Object System.Text.UTF8Encoding $false

$version = 'v=2'

$files = Get-ChildItem -Path $root -Recurse -Include *.html
foreach ($f in $files) {
  $c = [System.IO.File]::ReadAllText($f.FullName, $utf8)
  $n = $c
  # Idempotent: don't re-append if already versioned
  $n = [System.Text.RegularExpressions.Regex]::Replace($n, 'app\.js(\?v=\d+)?"', "app.js?$version`"")
  $n = [System.Text.RegularExpressions.Regex]::Replace($n, 'styles\.css(\?v=\d+)?"', "styles.css?$version`"")
  if ($c -ne $n) {
    [System.IO.File]::WriteAllText($f.FullName, $n, $utf8)
    Write-Host "Updated $($f.Name)"
  }
}
Write-Host "Done."
