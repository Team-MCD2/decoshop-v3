$ErrorActionPreference = 'Stop'
$rootDir   = $PSScriptRoot
$pagesDir  = Join-Path $rootDir 'pages'
$colDir    = Join-Path $rootDir 'collections'
$utf8      = New-Object System.Text.UTF8Encoding $false

# ============================================================
# Build the full home footer with paths adjusted for subdirs
# $selfDir = 'pages' or 'collections' to decide local links
# ============================================================
function Build-FooterBlock($selfDir) {
  $p = '..'   # all subdirs are 1 level deep
  $homeHref    = "$p/index.html"
  $magasinHref = "$p/index.html#magasin"
  $colPath     = "$p/collections"

  # Contact pages: from /pages/ -> local (e.g. "faq.html"); from /collections/ -> "../pages/faq.html"
  if ($selfDir -eq 'pages') {
    $livraison   = 'livraison.html'
    $retours     = 'retours.html'
    $faq         = 'faq.html'
    $contact     = 'contact.html'
    $suivi       = 'suivi.html'
    $apropos     = 'a-propos.html'
    $engagements = 'engagements.html'
    $pro         = 'professionnels.html'
    $mentions    = 'mentions-legales.html'
    $cgv         = 'cgv.html'
    $confid      = 'confidentialite.html'
    $cookies     = 'cookies.html'
  } else {
    $livraison   = "$p/pages/livraison.html"
    $retours     = "$p/pages/retours.html"
    $faq         = "$p/pages/faq.html"
    $contact     = "$p/pages/contact.html"
    $suivi       = "$p/pages/suivi.html"
    $apropos     = "$p/pages/a-propos.html"
    $engagements = "$p/pages/engagements.html"
    $pro         = "$p/pages/professionnels.html"
    $mentions    = "$p/pages/mentions-legales.html"
    $cgv         = "$p/pages/cgv.html"
    $confid      = "$p/pages/confidentialite.html"
    $cookies     = "$p/pages/cookies.html"
  }

  return @"
  <!-- ==================== Footer ==================== -->
  <footer class="footer" role="contentinfo">
    <div class="container">
      <div class="footer__grid">
        <div class="footer__brand">
          <a class="brand" href="$homeHref" aria-label="DecoShop Toulouse">
            <span class="brand__logo"><img src="$p/assets/logo.png" alt="DecoShop Toulouse" /></span>
            <span class="brand__text">
              <span class="brand__name">DecoShop</span>
              <span class="brand__city">Toulouse</span>
            </span>
          </a>
          <p>Votre boutique de d&eacute;coration int&eacute;rieure &agrave; Toulouse. Objets d&eacute;co, tapis, luminaires, arts de la table et ambiance orientale.</p>
          <div class="footer__social">
            <a href="https://www.tiktok.com/@decoshoptoulouse?_t=8qrNuvaGHBJ&amp;_r=1" aria-label="TikTok @decoshoptoulouse" target="_blank" rel="noopener">
              <svg viewBox="0 0 24 24" fill="currentColor"><path d="M16.5 5.4a5.5 5.5 0 0 1-3.1-1.7 5.5 5.5 0 0 1-1.2-3.4H8.9v13.6a2.7 2.7 0 1 1-2.7-2.7c.3 0 .6 0 .8.1V7.5a6 6 0 1 0 5.1 5.9V8.8a8.4 8.4 0 0 0 4.4 1.4V7.1z"/></svg>
            </a>
          </div>
        </div>
        <div>
          <h5>Boutique</h5>
          <ul>
            <li><a href="$colPath/nouveautes.html">Nouveaut&eacute;s</a></li>
            <li><a href="$colPath/ramadan.html">Ramadan &amp; A&iuml;d</a></li>
            <li><a href="$colPath/salon.html">Salon</a></li>
            <li><a href="$colPath/arts-de-la-table.html">Arts de la table</a></li>
            <li><a href="$colPath/soldes.html">Promos</a></li>
          </ul>
        </div>
        <div>
          <h5>Aide &amp; service</h5>
          <ul>
            <li><a href="$livraison">Livraison</a></li>
            <li><a href="$retours">Retours &amp; remboursements</a></li>
            <li><a href="$faq">FAQ</a></li>
            <li><a href="$contact">Nous contacter</a></li>
            <li><a href="$suivi">Suivi de commande</a></li>
          </ul>
        </div>
        <div>
          <h5>&Agrave; propos</h5>
          <ul>
            <li><a href="$apropos">Notre histoire</a></li>
            <li><a href="$magasinHref">Notre magasin</a></li>
            <li><a href="$engagements">Nos engagements</a></li>
            <li><a href="$pro">Espace pro / B2B</a></li>
          </ul>
        </div>
        <div>
          <h5>DecoShop Toulouse</h5>
          <ul>
            <li>58 Rue Jacques Babinet</li>
            <li>31100 Toulouse, France</li>
            <li><a href="tel:+33767278625">07 67 27 86 25</a></li>
            <li><a href="mailto:contact@decoshop-toulouse.fr">contact@decoshop-toulouse.fr</a></li>
            <li>Lun&ndash;Sam &middot; 10h&ndash;19h</li>
          </ul>
          <div class="footer__pay" aria-label="Moyens de paiement accept&eacute;s">
            <img src="$p/assets/img/payments/visa.svg" alt="Visa" width="46" height="30" />
            <img src="$p/assets/img/payments/mastercard.svg" alt="Mastercard" width="46" height="30" />
            <img src="$p/assets/img/payments/amex.svg" alt="American Express" width="46" height="30" />
            <span class="pay-badge pay-badge--cb" aria-label="Carte Bancaire">CB</span>
            <img src="$p/assets/img/payments/paypal.svg" alt="PayPal" width="46" height="30" />
            <span class="pay-badge pay-badge--x3" aria-label="Paiement en 3 fois sans frais">3&times;</span>
          </div>
        </div>
      </div>
      <div class="footer__bottom">
        <div>&copy; <span id="year">2026</span> DecoShop Toulouse. Tous droits r&eacute;serv&eacute;s.</div>
        <div class="footer__links">
          <a href="$mentions">Mentions l&eacute;gales</a> &middot;
          <a href="$cgv">CGV</a> &middot;
          <a href="$confid">Confidentialit&eacute;</a> &middot;
          <a href="$cookies">Cookies</a>
        </div>
        <div class="footer__credit">
          Site d&eacute;velopp&eacute; par <a href="https://microdidact.com/" target="_blank" rel="noopener" class="credit-link">Microdidact</a>
        </div>
      </div>
    </div>
  </footer>
"@
}

function Inject-Footer([string]$file, [string]$selfDir) {
  $content = [System.IO.File]::ReadAllText($file, $utf8)
  # Match the existing <footer ...>...</footer> (non-greedy, across lines)
  $pattern = '(?s)\s*(<!--[^>]*Footer[^>]*-->\s*)?<footer\b[^>]*>.*?</footer>'
  $new = Build-FooterBlock $selfDir
  $updated = [System.Text.RegularExpressions.Regex]::Replace($content, $pattern, "`r`n`r`n$new", 1)
  if ($updated -eq $content) {
    Write-Host ("SKIP (no <footer>): " + (Split-Path $file -Leaf)) -ForegroundColor Yellow
    return
  }
  [System.IO.File]::WriteAllText($file, $updated, $utf8)
  Write-Host ("OK   " + (Split-Path $file -Leaf))
}

Write-Host "=== /pages/ ===" -ForegroundColor Cyan
Get-ChildItem -Path $pagesDir -Filter *.html | ForEach-Object { Inject-Footer $_.FullName 'pages' }

Write-Host "=== /collections/ ===" -ForegroundColor Cyan
Get-ChildItem -Path $colDir -Filter *.html | ForEach-Object { Inject-Footer $_.FullName 'collections' }

Write-Host "`nTermine." -ForegroundColor Green
