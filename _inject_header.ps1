$ErrorActionPreference = 'Stop'
$rootDir   = $PSScriptRoot
$pagesDir  = Join-Path $rootDir 'pages'
$colDir    = Join-Path $rootDir 'collections'
$utf8      = New-Object System.Text.UTF8Encoding $false

# ============================================================
# Builds the Announcement bar + full Header for a given prefix
# $prefix = '..' for subdirs (pages/ and collections/)
# $selfDir = 'pages' or 'collections' (used to decide Contact link)
# $activeSlug = slug of current page (e.g. 'contact', 'ramadan') for aria-current
# ============================================================
function Build-HeaderBlock($prefix, $selfDir, $activeSlug) {
  # Contact link: if we're in /pages/, contact.html is same dir; else ../pages/contact.html
  $contactHref = if ($selfDir -eq 'pages') { 'contact.html' } else { "$prefix/pages/contact.html" }
  $colPath = "$prefix/collections"
  $pagePath = "$prefix/pages"
  $homeHref = "$prefix/index.html"
  $magasinHref = "$prefix/index.html#magasin"
  $accountHref = "$prefix/index.html"
  $cartHref = "$prefix/index.html"
  $assets = "$prefix/assets"

  return @"
  <!-- ==================== Barre d'annonce ==================== -->
  <div class="announcement" aria-label="Informations boutique">
    <div class="announcement__track" aria-hidden="true">
      <span><span class="dot"></span> Livraison offerte d&egrave;s 69&euro; en France</span>
      <span><span class="dot"></span> Retrait gratuit au magasin de Toulouse &mdash; 58 Rue Jacques Babinet</span>
      <span><span class="dot"></span> -15% sur la collection Ramadan avec le code <strong>RAMADAN15</strong></span>
      <span><span class="dot"></span> Paiement en 3&times; sans frais d&egrave;s 100&euro;</span>
      <span><span class="dot"></span> Livraison offerte d&egrave;s 69&euro; en France</span>
      <span><span class="dot"></span> Retrait gratuit au magasin de Toulouse &mdash; 58 Rue Jacques Babinet</span>
      <span><span class="dot"></span> -15% sur la collection Ramadan avec le code <strong>RAMADAN15</strong></span>
      <span><span class="dot"></span> Paiement en 3&times; sans frais d&egrave;s 100&euro;</span>
    </div>
  </div>

  <!-- ==================== Header ==================== -->
  <header class="header" role="banner">
    <div class="header__top">
      <button class="menu-toggle" aria-label="Ouvrir le menu" aria-controls="primary-nav">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round"><path d="M4 7h16M4 12h16M4 17h16"/></svg>
      </button>

      <a class="header__logo brand" href="$homeHref" aria-label="DecoShop Toulouse - Accueil">
        <span class="brand__logo"><img src="$assets/logo.png" alt="DecoShop Toulouse" /></span>
        <span class="brand__text">
          <span class="brand__name">DecoShop</span>
          <span class="brand__city">Toulouse</span>
        </span>
      </a>

      <form class="header__search" role="search" action="$homeHref" method="get">
        <div class="search__form">
          <input type="search" name="q" placeholder="Que recherchez-vous&nbsp;? lanterne, tapis, vaisselle&hellip;" aria-label="Recherche" autocomplete="off" />
          <button type="submit" aria-label="Rechercher">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="7.5"/><path d="M16.5 16.5 21 21"/></svg>
          </button>
        </div>
      </form>

      <div class="header__actions">
        <a class="header__icon" href="$magasinHref" aria-label="Notre magasin">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s-7-5.5-7-12a7 7 0 0 1 14 0c0 6.5-7 12-7 12z"/><circle cx="12" cy="10" r="2.6"/></svg>
          <span>Magasin</span>
        </a>
        <a class="header__icon" href="$accountHref" aria-label="Mon compte">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="4"/><path d="M4 21c1.5-3.5 4.5-5.5 8-5.5s6.5 2 8 5.5"/></svg>
          <span>Compte</span>
        </a>
        <a class="header__icon" href="$cartHref" aria-label="Panier">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"><path d="M3 7h18l-1.5 12.5a1.5 1.5 0 0 1-1.5 1.3H6a1.5 1.5 0 0 1-1.5-1.3L3 7z"/><path d="M8 7V5.5A4 4 0 0 1 16 5.5V7"/></svg>
          <span>Panier</span>
          <span class="cart-count" hidden>0</span>
        </a>
      </div>
    </div>

    <nav class="nav" id="primary-nav" aria-label="Navigation principale">
      <ul class="nav__list">
        <li class="nav__item"><a class="nav__link" href="$homeHref">Accueil</a></li>

        <li class="nav__item">
          <a class="nav__link" href="$colPath/salon.html">Salon
            <svg class="caret" viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M5 7.5 10 12.5 15 7.5"/></svg>
          </a>
          <div class="mega">
            <div class="mega__col">
              <a class="mega__tile" href="$colPath/tapis.html">
                <img src="$assets/img/photos/col-tapis.jpg" alt="Tapis berb&egrave;res" loading="lazy" />
                <span>Tapis</span>
              </a>
            </div>
            <div class="mega__col">
              <h6>Mobilier d'appoint</h6>
              <ul>
                <li><a href="$colPath/salon.html">Tables basses</a></li>
                <li><a href="$colPath/salon.html">Consoles &amp; entr&eacute;es</a></li>
                <li><a href="$colPath/salon.html">&Eacute;tag&egrave;res &amp; biblioth&egrave;ques</a></li>
                <li><a href="$colPath/salon.html">Poufs &amp; assises</a></li>
              </ul>
            </div>
            <div class="mega__col">
              <h6>D&eacute;co murale</h6>
              <ul>
                <li><a href="$colPath/calligraphie.html">Cadres &amp; tableaux</a></li>
                <li><a href="$colPath/salon.html">Miroirs</a></li>
                <li><a href="$colPath/salon.html">Horloges</a></li>
                <li><a href="$colPath/calligraphie.html">Calligraphie arabe</a></li>
              </ul>
            </div>
            <div class="mega__col">
              <h6>Luminaires</h6>
              <ul>
                <li><a href="$colPath/lanternes.html">Lanternes marocaines</a></li>
                <li><a href="$colPath/lanternes.html">Suspensions</a></li>
                <li><a href="$colPath/lanternes.html">Lampadaires</a></li>
                <li><a href="$colPath/lanternes.html">Bougies &amp; photophores</a></li>
              </ul>
            </div>
          </div>
        </li>

        <li class="nav__item">
          <a class="nav__link" href="$colPath/arts-de-la-table.html">Arts de la table
            <svg class="caret" viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M5 7.5 10 12.5 15 7.5"/></svg>
          </a>
          <div class="mega">
            <div class="mega__col">
              <a class="mega__tile" href="$colPath/vaisselle-orientale.html">
                <img src="$assets/img/photos/col-vaisselle.jpg" alt="Vaisselle orientale" loading="lazy"/>
                <span>Vaisselle orientale</span>
              </a>
            </div>
            <div class="mega__col">
              <h6>Service &agrave; th&eacute;</h6>
              <ul>
                <li><a href="$colPath/vaisselle-orientale.html">Th&eacute;i&egrave;res</a></li>
                <li><a href="$colPath/vaisselle-orientale.html">Verres &agrave; th&eacute;</a></li>
                <li><a href="$colPath/vaisselle-orientale.html">Plateaux grav&eacute;s</a></li>
                <li><a href="$colPath/vaisselle-orientale.html">Sucriers</a></li>
              </ul>
            </div>
            <div class="mega__col">
              <h6>Vaisselle</h6>
              <ul>
                <li><a href="$colPath/vaisselle-orientale.html">Tajines</a></li>
                <li><a href="$colPath/vaisselle-orientale.html">Assiettes peintes main</a></li>
                <li><a href="$colPath/vaisselle-orientale.html">Bols &amp; mezz&eacute;s</a></li>
                <li><a href="$colPath/vaisselle-orientale.html">Couverts dor&eacute;s</a></li>
              </ul>
            </div>
            <div class="mega__col">
              <h6>Textile de table</h6>
              <ul>
                <li><a href="$colPath/arts-de-la-table.html">Nappes brod&eacute;es</a></li>
                <li><a href="$colPath/arts-de-la-table.html">Sets de table</a></li>
                <li><a href="$colPath/arts-de-la-table.html">Serviettes</a></li>
                <li><a href="$colPath/arts-de-la-table.html">Chemins de table</a></li>
              </ul>
            </div>
          </div>
        </li>

        <li class="nav__item">
          <a class="nav__link nav__link--hot" href="$colPath/ramadan.html">Ramadan &amp; A&iuml;d</a>
        </li>
        <li class="nav__item"><a class="nav__link" href="$colPath/cadeaux.html">Cadeaux</a></li>
        <li class="nav__item"><a class="nav__link" href="$colPath/nouveautes.html">Nouveaut&eacute;s</a></li>
        <li class="nav__item"><a class="nav__link" href="$colPath/soldes.html">Promos</a></li>
        <li class="nav__item"><a class="nav__link" href="$magasinHref">Notre magasin</a></li>
        <li class="nav__item"><a class="nav__link" href="$contactHref">Contact</a></li>
      </ul>
    </nav>
  </header>
"@
}

function Inject-Header([string]$file, [string]$selfDir, [string]$activeSlug) {
  $content = [System.IO.File]::ReadAllText($file, $utf8)

  # Regex (?s) = singleline (dot matches newlines), non-greedy
  # Match from optional preceding announcement block up through </header>
  $pattern = '(?s)(\s*<!--[^>]*Barre d''annonce[^>]*-->\s*<div class="announcement".*?</div>\s*</div>\s*)?\s*<header class="header".*?</header>'

  $new = Build-HeaderBlock '..' $selfDir $activeSlug
  $updated = [System.Text.RegularExpressions.Regex]::Replace($content, $pattern, "`r`n$new", 1)

  if ($updated -eq $content) {
    Write-Host "SKIP (no match): $file" -ForegroundColor Yellow
    return $false
  }

  [System.IO.File]::WriteAllText($file, $updated, $utf8)
  Write-Host ("OK   " + (Split-Path $file -Leaf))
  return $true
}

# ============ Process /pages/ ============
Write-Host "=== /pages/ ===" -ForegroundColor Cyan
Get-ChildItem -Path $pagesDir -Filter *.html | ForEach-Object {
  $slug = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
  Inject-Header $_.FullName 'pages' $slug | Out-Null
}

# ============ Process /collections/ ============
Write-Host "=== /collections/ ===" -ForegroundColor Cyan
Get-ChildItem -Path $colDir -Filter *.html | ForEach-Object {
  $slug = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
  Inject-Header $_.FullName 'collections' $slug | Out-Null
}

Write-Host ""
Write-Host "Termine." -ForegroundColor Green
