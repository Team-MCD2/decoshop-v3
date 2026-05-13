$ErrorActionPreference = 'Stop'
$root = Join-Path $PSScriptRoot 'collections'
New-Item -ItemType Directory -Force -Path $root | Out-Null

# ============== TEMPLATE ==============
$template = @'
<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <meta name="theme-color" content="#1E3A8A" />
  <title>__TITLE__ &mdash; DecoShop Toulouse</title>
  <meta name="description" content="__DESC__" />
  <meta name="robots" content="index, follow" />
  <link rel="canonical" href="https://decoshop-toulouse.fr/collections/__SLUG__" />
  <meta property="og:type" content="website" />
  <meta property="og:title" content="__TITLE__ | DecoShop Toulouse" />
  <meta property="og:description" content="__DESC__" />
  <meta property="og:image" content="https://decoshop-toulouse.fr/__HERO_IMG__" />
  <link rel="icon" href="../favicon.ico" sizes="any" />
  <link rel="icon" type="image/png" sizes="32x32" href="../favicon-32.png" />
  <link rel="apple-touch-icon" sizes="180x180" href="../apple-touch-icon.png" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Playfair+Display:wght@600;700;900&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="../assets/css/styles.css" />
  <link rel="stylesheet" href="../pages/_shared.css" />
  <link rel="stylesheet" href="_collection.css" />
  <script type="application/ld+json">
  {
    "@context":"https://schema.org",
    "@type":"CollectionPage",
    "name":"__TITLE__",
    "description":"__DESC__",
    "url":"https://decoshop-toulouse.fr/collections/__SLUG__",
    "breadcrumb":{
      "@type":"BreadcrumbList",
      "itemListElement":[
        {"@type":"ListItem","position":1,"name":"Accueil","item":"https://decoshop-toulouse.fr/"},
        {"@type":"ListItem","position":2,"name":"Collections","item":"https://decoshop-toulouse.fr/collections"},
        {"@type":"ListItem","position":3,"name":"__TITLE__","item":"https://decoshop-toulouse.fr/collections/__SLUG__"}
      ]
    }
  }
  </script>
</head>
<body>
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

      <a class="header__logo brand" href="../index.html" aria-label="DecoShop Toulouse - Accueil">
        <span class="brand__logo"><img src="../assets/logo.png" alt="DecoShop Toulouse" /></span>
        <span class="brand__text">
          <span class="brand__name">DecoShop</span>
          <span class="brand__city">Toulouse</span>
        </span>
      </a>

      <form class="header__search" role="search" action="/search" method="get">
        <div class="search__form">
          <input type="search" name="q" placeholder="Que recherchez-vous ? lanterne, tapis, vaisselle&hellip;" aria-label="Recherche" autocomplete="off" />
          <button type="submit" aria-label="Rechercher">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="7.5"/><path d="M16.5 16.5 21 21"/></svg>
          </button>
        </div>
      </form>

      <div class="header__actions">
        <a class="header__icon" href="../index.html#magasin" aria-label="Notre magasin">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" style="width:22px;height:22px"><path d="M12 22s-7-5.5-7-12a7 7 0 0 1 14 0c0 6.5-7 12-7 12z"/><circle cx="12" cy="10" r="2.6"/></svg>
          <span>Magasin</span>
        </a>
        <a class="header__icon" href="/account" aria-label="Mon compte">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" style="width:22px;height:22px"><circle cx="12" cy="8" r="4"/><path d="M4 21c1.5-3.5 4.5-5.5 8-5.5s6.5 2 8 5.5"/></svg>
          <span>Compte</span>
        </a>
        <a class="header__icon" href="/favorites" aria-label="Mes favoris">
          <div class="icon-badge-wrapper">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" style="width:22px;height:22px"><path d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.6l-1-1a5.5 5.5 0 0 0-7.8 7.8L12 21l8.8-8.6a5.5 5.5 0 0 0 0-7.8z"/></svg>
            <span class="badge badge--red">0</span>
          </div>
          <span>Favoris</span>
        </a>
        <a class="header__icon" href="/cart" aria-label="Panier">
          <div class="icon-badge-wrapper">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" style="width:22px;height:22px"><path d="M3 7h18l-1.5 12.5a1.5 1.5 0 0 1-1.5 1.3H6a1.5 1.5 0 0 1-1.5-1.3L3 7z"/><path d="M8 7V5.5A4 4 0 0 1 16 5.5V7"/></svg>
            <span class="badge badge--yellow">0</span>
          </div>
          <span>Panier</span>
        </a>
      </div>
    </div>

    <nav class="nav" id="primary-nav" aria-label="Navigation principale">
      <ul class="nav__list">
        <li class="nav__item"><a class="nav__link" href="../index.html">Accueil</a></li>
        <li class="nav__item">
          <a class="nav__link" href="../collections/salon.html">Salon
            <svg class="caret" viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M5 7.5 10 12.5 15 7.5"/></svg>
          </a>
          <div class="mega">
            <div class="mega__col">
              <a class="mega__tile" href="../collections/tapis.html">
                <img src="../assets/img/photos/col-tapis.jpg" alt="Tapis berb&egrave;res" loading="lazy" />
                <span>Tapis</span>
              </a>
            </div>
            <div class="mega__col">
              <h6>Mobilier d'appoint</h6>
              <ul>
                <li><a href="../collections/salon.html">Tables basses</a></li>
                <li><a href="../collections/salon.html">Consoles & entr&eacute;es</a></li>
                <li><a href="../collections/salon.html">&Eacute;tag&egrave;res & biblioth&egrave;ques</a></li>
                <li><a href="../collections/salon.html">Poufs & assises</a></li>
              </ul>
            </div>
            <div class="mega__col">
              <h6>D&eacute;co murale</h6>
              <ul>
                <li><a href="../collections/calligraphie.html">Cadres & tableaux</a></li>
                <li><a href="../collections/salon.html">Miroirs</a></li>
                <li><a href="../collections/salon.html">Horloges</a></li>
                <li><a href="../collections/calligraphie.html">Calligraphie arabe</a></li>
              </ul>
            </div>
            <div class="mega__col">
              <h6>Luminaires</h6>
              <ul>
                <li><a href="../collections/lanternes.html">Lanternes marocaines</a></li>
                <li><a href="../collections/lanternes.html">Suspensions</a></li>
                <li><a href="../collections/lanternes.html">Lampadaires</a></li>
                <li><a href="../collections/lanternes.html">Bougies & photophores</a></li>
              </ul>
            </div>
          </div>
        </li>
        <li class="nav__item">
          <a class="nav__link" href="../collections/arts-de-la-table.html">Arts de la table
            <svg class="caret" viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M5 7.5 10 12.5 15 7.5"/></svg>
          </a>
          <div class="mega">
            <div class="mega__col">
              <a class="mega__tile" href="../collections/vaisselle-orientale.html">
                <img src="../assets/img/photos/col-vaisselle.jpg" alt="Vaisselle orientale" loading="lazy"/>
                <span>Vaisselle orientale</span>
              </a>
            </div>
            <div class="mega__col">
              <h6>Service &agrave; th&eacute;</h6>
              <ul>
                <li><a href="../collections/vaisselle-orientale.html">Th&eacute;i&egrave;res</a></li>
                <li><a href="../collections/vaisselle-orientale.html">Verres &agrave; th&eacute;</a></li>
                <li><a href="../collections/vaisselle-orientale.html">Plateaux grav&eacute;s</a></li>
                <li><a href="../collections/vaisselle-orientale.html">Sucriers</a></li>
              </ul>
            </div>
            <div class="mega__col">
              <h6>Vaisselle</h6>
              <ul>
                <li><a href="../collections/vaisselle-orientale.html">Tajines</a></li>
                <li><a href="../collections/vaisselle-orientale.html">Assiettes peintes main</a></li>
                <li><a href="../collections/vaisselle-orientale.html">Bols & mezz&eacute;s</a></li>
                <li><a href="../collections/vaisselle-orientale.html">Couverts dor&eacute;s</a></li>
              </ul>
            </div>
            <div class="mega__col">
              <h6>Textile de table</h6>
              <ul>
                <li><a href="../collections/arts-de-la-table.html">Nappes brod&eacute;es</a></li>
                <li><a href="../collections/arts-de-la-table.html">Sets de table</a></li>
                <li><a href="../collections/arts-de-la-table.html">Serviettes</a></li>
              </ul>
            </div>
          </div>
        </li>
        <li class="nav__item"><a class="nav__link nav__link--hot" href="../collections/ramadan.html">Ramadan & A&iuml;d</a></li>
        <li class="nav__item"><a class="nav__link" href="../collections/cadeaux.html">Cadeaux</a></li>
        <li class="nav__item"><a class="nav__link" href="../collections/nouveautes.html">Nouveaut&eacute;s</a></li>
        <li class="nav__item"><a class="nav__link" href="../collections/soldes.html">Promos</a></li>
        <li class="nav__item"><a class="nav__link" href="../index.html#magasin">Notre magasin</a></li>
        <li class="nav__item"><a class="nav__link" href="../pages/contact.html">Contact</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <!-- HERO -->
    <section class="col-hero" aria-label="__TITLE__">
      <div class="col-hero__bg" style="background-image:url('../__HERO_IMG__')"></div>
      <div class="container">
        <div class="col-hero__inner">
          <nav class="col-hero__crumb" aria-label="Fil d'Ariane">
            <a href="../index.html">Accueil</a><span>/</span>
            <a href="../index.html#categories">Collections</a><span>/</span>
            <span>__TITLE__</span>
          </nav>
          <h1>__HERO_H1__</h1>
          <p>__HERO_P__</p>
          <div class="col-hero__stats">
            <div class="col-hero__stat"><b>__COUNT__</b><small>R&eacute;f&eacute;rences</small></div>
            <div class="col-hero__stat"><b>4.9<span style="color:#fff">/5</span></b><small>Avis clients</small></div>
            <div class="col-hero__stat"><b>24h</b><small>Exp&eacute;dition</small></div>
            <div class="col-hero__stat"><b>__SHIPPING__</b><small>Livraison</small></div>
          </div>
        </div>
      </div>
    </section>

    <!-- TOOLBAR -->
    <div class="col-toolbar" id="colToolbar">
      <div class="container col-toolbar__row">
        <div class="col-toolbar__count"><b id="prodCount">__COUNT__</b> produits</div>
        <div class="col-chips" role="tablist">
          __CHIPS__
        </div>
        <div class="col-sort">
          <label for="colSort" class="sr-only">Trier</label>
          <select id="colSort">
            <option value="popular">Plus populaires</option>
            <option value="new">Nouveaut&eacute;s</option>
            <option value="priceAsc">Prix croissant</option>
            <option value="priceDesc">Prix d&eacute;croissant</option>
            <option value="ratingDesc">Mieux not&eacute;s</option>
          </select>
        </div>
      </div>
    </div>

    <!-- PRODUCT GRID -->
    <section class="container">
      <div class="col-grid" id="colGrid" data-reveal>
        __PRODUCTS__
      </div>
      <div class="col-more">
        <button class="btn btn--ghost" id="loadMore">Voir plus de produits</button>
      </div>
    </section>

    <!-- INTRO -->
    <section class="col-intro">
      <div class="container col-intro__grid" data-reveal>
        <div>
          <h2>__INTRO_H2__</h2>
          __INTRO_BODY__
        </div>
        <div class="col-intro__pic">
          <img src="../__INTRO_IMG__" alt="__TITLE__ DecoShop Toulouse" loading="lazy" />
          <span class="badge-float">&#10003; S&eacute;lection artisanale</span>
        </div>
      </div>
    </section>

    <!-- PERKS -->
    <section class="col-perks">
      <div class="container col-perks__grid" data-reveal>
        <div class="col-perk">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M1 3h15v13H1z"/><path d="M16 8h4l3 3v5h-7V8z"/><circle cx="5.5" cy="18.5" r="2.5"/><circle cx="18.5" cy="18.5" r="2.5"/></svg>
          <b>Livraison offerte</b><small>D&egrave;s 69&nbsp;&euro; d&rsquo;achat</small>
        </div>
        <div class="col-perk">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M3 3h18v4H3z"/><path d="M5 7v14h14V7"/><path d="M10 12h4"/></svg>
          <b>Retrait magasin</b><small>Gratuit &agrave; Toulouse en 2&nbsp;h</small>
        </div>
        <div class="col-perk">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0z"/><path d="M12 7v5l3 2"/></svg>
          <b>14 jours pour changer d&rsquo;avis</b><small>Retour simple et rapide</small>
        </div>
        <div class="col-perk">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M8 12l3 3 5-6"/></svg>
          <b>Paiement s&eacute;curis&eacute;</b><small>CB, PayPal, 3x sans frais</small>
        </div>
      </div>
    </section>

    <!-- RELATED -->
    <section class="col-related">
      <div class="container" data-reveal>
        <h2>Vous aimerez aussi</h2>
        <div class="col-related__grid">
          __RELATED__
        </div>
      </div>
    </section>
  </main>

  <!-- ==================== Newsletter ==================== -->
  <section class="newsletter" aria-labelledby="nl-title">
    <div class="container">
      <h2 id="nl-title">Recevez -10% sur votre premi&egrave;re commande</h2>
      <p>Inscrivez-vous &agrave; la newsletter DecoShop pour &ecirc;tre au courant des nouveaut&eacute;s, ventes priv&eacute;es et &eacute;v&eacute;nements en magasin.</p>
      <form class="newsletter__form" novalidate>
        <label class="visually-hidden" for="nl-email">Email</label>
        <input id="nl-email" type="email" required placeholder="Votre adresse email" />
        <button class="btn btn--primary" type="submit">Je m'inscris</button>
      </form>
      <p style="font-size:.75rem;margin-top:1rem;color:rgba(15,23,42,.7)">En vous inscrivant, vous acceptez de recevoir nos emails. D&eacute;sinscription en 1 clic.</p>
    </div>
  </section>

  <!-- ==================== Footer ==================== -->
  <footer class="footer" role="contentinfo">
    <div class="container">
      <div class="footer__grid">
        <div class="footer__brand">
          <a class="brand" href="../index.html" aria-label="DecoShop Toulouse">
            <span class="brand__logo"><img src="../assets/logo.png" alt="DecoShop Toulouse" /></span>
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
            <li><a href="../collections/nouveautes.html">Nouveaut&eacute;s</a></li>
            <li><a href="../collections/ramadan.html">Ramadan & A&iuml;d</a></li>
            <li><a href="../collections/salon.html">Salon</a></li>
            <li><a href="../collections/arts-de-la-table.html">Arts de la table</a></li>
            <li><a href="../collections/soldes.html">Promos</a></li>
          </ul>
        </div>
        <div>
          <h5>Aide & service</h5>
          <ul>
            <li><a href="../pages/livraison.html">Livraison</a></li>
            <li><a href="../pages/retours.html">Retours &amp; remboursements</a></li>
            <li><a href="../pages/faq.html">FAQ</a></li>
            <li><a href="../pages/contact.html">Nous contacter</a></li>
            <li><a href="../pages/suivi.html">Suivi de commande</a></li>
          </ul>
        </div>
        <div>
          <h5>&Agrave; propos</h5>
          <ul>
            <li><a href="../pages/a-propos.html">Notre histoire</a></li>
            <li><a href="../index.html#magasin">Notre magasin</a></li>
            <li><a href="../pages/engagements.html">Nos engagements</a></li>
            <li><a href="../pages/professionnels.html">Espace pro / B2B</a></li>
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
            <img src="../assets/img/payments/visa.svg" alt="Visa" width="46" height="30" />
            <img src="../assets/img/payments/mastercard.svg" alt="Mastercard" width="46" height="30" />
            <img src="../assets/img/payments/amex.svg" alt="American Express" width="46" height="30" />
            <span class="pay-badge pay-badge--cb" aria-label="Carte Bancaire">CB</span>
            <img src="../assets/img/payments/paypal.svg" alt="PayPal" width="46" height="30" />
            <span class="pay-badge pay-badge--x3" aria-label="Paiement en 3 fois sans frais">3&times;</span>
          </div>
        </div>
      </div>
      <div class="footer__bottom">
        <div>&copy; <span id="year">2026</span> DecoShop Toulouse. Tous droits r&eacute;serv&eacute;s.</div>
        <div class="footer__links">
          <a href="../pages/mentions-legales.html">Mentions l&eacute;gales</a> &middot;
          <a href="../pages/cgv.html">CGV</a> &middot;
          <a href="../pages/confidentialite.html">Confidentialit&eacute;</a> &middot;
          <a href="../pages/cookies.html">Cookies</a>
        </div>
        <div class="footer__credit">
          Site d&eacute;velopp&eacute; par <a href="https://microdidact.com/" target="_blank" rel="noopener" class="credit-link">Microdidact</a>
        </div>
      </div>
    </div>
  </footer>

  <script src="../assets/js/app.js" defer></script>
  <script>
    // Sticky toolbar shadow
    (function(){
      var bar=document.getElementById('colToolbar');
      if(!bar)return;
      var obs=new IntersectionObserver(function(e){ bar.classList.toggle('is-stuck', e[0].intersectionRatio<1); },{threshold:[1]});
      var sentinel=document.createElement('div'); sentinel.style.height='1px'; bar.parentNode.insertBefore(sentinel,bar); obs.observe(sentinel);
    })();
    // Chip filter (client-side mock)
    document.querySelectorAll('.col-chip').forEach(function(c){
      c.addEventListener('click',function(){
        document.querySelectorAll('.col-chip').forEach(function(x){x.classList.remove('is-active');});
        c.classList.add('is-active');
        var f=c.dataset.filter||'all';
        document.querySelectorAll('#colGrid .pcard').forEach(function(p){
          var tags=(p.dataset.tags||'').split(' ');
          p.style.display=(f==='all'||tags.indexOf(f)>=0)?'':'none';
        });
      });
    });
    // Sort (client-side mock)
    var sortSel=document.getElementById('colSort');
    if(sortSel){
      sortSel.addEventListener('change',function(){
        var grid=document.getElementById('colGrid');
        var cards=Array.from(grid.querySelectorAll('.pcard'));
        var v=sortSel.value;
        cards.sort(function(a,b){
          var pa=parseFloat(a.dataset.price||0), pb=parseFloat(b.dataset.price||0);
          var ra=parseFloat(a.dataset.rating||0), rb=parseFloat(b.dataset.rating||0);
          if(v==='priceAsc') return pa-pb;
          if(v==='priceDesc') return pb-pa;
          if(v==='ratingDesc') return rb-ra;
          if(v==='new') return (b.dataset.new?1:0)-(a.dataset.new?1:0);
          return 0;
        });
        cards.forEach(function(c){grid.appendChild(c);});
      });
    }
    // Load more (mock)
    var lm=document.getElementById('loadMore');
    if(lm){ lm.addEventListener('click',function(){ lm.textContent='C\u2019est tout pour l\u2019instant &mdash; revenez vite, de nouvelles pi\u00e8ces arrivent chaque semaine.'; lm.disabled=true; lm.classList.add('btn--ghost'); }); }
  </script>
</body>
</html>
'@

function Build-Product($data) {
  $tags = $data.tags -join ' '
  $badgeHtml = ''
  if ($data.badge) {
    $cls = if ($data.badge -like '-*%') { 'badge--sale' } else { 'badge--new' }
    $badgeHtml = "<span class=""pcard__badges""><span class=""badge $cls"">$($data.badge)</span></span>"
  }
  $priceHtml = if ($data.oldPrice) {
    "<div class=""pcard__price""><span class=""price price--sale"">$($data.price)&nbsp;&euro;</span><span class=""price price--strike"">$($data.oldPrice)&nbsp;&euro;</span></div>"
  } else {
    "<div class=""pcard__price""><span class=""price"">$($data.price)&nbsp;&euro;</span></div>"
  }
  $rating = $data.rating
  $stars = '&starf;' * [int][math]::Floor($rating) + '&star;' * (5 - [int][math]::Floor($rating))
  $count = $data.reviews
  $slug = if ($data.slug) { "../products/$($data.slug)" } else { "#" }
  return @"
<article class="pcard" data-price="$($data.price)" data-rating="$rating" data-tags="$tags"$(if($data.isNew){' data-new="1"'})>
  <a class="pcard__media" href="$slug" aria-label="$($data.title)">
    $badgeHtml
    <img src="../$($data.img)" alt="$($data.title)" loading="lazy" />
  </a>
  <button class="pcard__fav" aria-label="Ajouter aux favoris"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.6l-1-1a5.5 5.5 0 0 0-7.8 7.8L12 21l8.8-8.6a5.5 5.5 0 0 0 0-7.8z"/></svg></button>
  <div class="pcard__body">
    <span class="pcard__cat">$($data.cat)</span>
    <h3 class="pcard__title"><a href="$slug">$($data.title)</a></h3>
    <div class="pcard__rating">$stars <span style="color:var(--muted)">($count)</span></div>
    $priceHtml
    <button class="pcard__add" data-label="Ajouter au panier">Ajouter au panier</button>
  </div>
</article>
"@
}

function Build-Chips($chips) {
  $out = '<button class="col-chip is-active" data-filter="all">Tout</button>'
  foreach ($c in $chips) {
    $slug = ($c -replace '[^\w]', '-').ToLower()
    $out += "<button class=""col-chip"" data-filter=""$slug"">$c</button>"
  }
  return $out
}

function Build-Related($items) {
  $out = ''
  foreach ($r in $items) {
    $out += @"
<a class="col-rel-card" href="$($r.href)">
  <img src="../$($r.img)" alt="$($r.name)" loading="lazy" />
  <b>$($r.name)</b>
</a>
"@
  }
  return $out
}

function New-Collection($def) {
  $chips = Build-Chips $def.chips
  $prods = ($def.products | ForEach-Object { Build-Product $_ }) -join "`r`n"
  $rel = Build-Related $def.related
  $html = $template
  $html = $html.Replace('__TITLE__', $def.title)
  $html = $html.Replace('__DESC__', $def.desc)
  $html = $html.Replace('__SLUG__', $def.slug)
  $html = $html.Replace('__HERO_IMG__', $def.heroImg)
  $html = $html.Replace('__HERO_H1__', $def.heroH1)
  $html = $html.Replace('__HERO_P__', $def.heroP)
  $html = $html.Replace('__COUNT__', [string]$def.products.Count)
  $html = $html.Replace('__SHIPPING__', $def.shipping)
  $html = $html.Replace('__CHIPS__', $chips)
  $html = $html.Replace('__PRODUCTS__', $prods)
  $html = $html.Replace('__INTRO_H2__', $def.introH2)
  $html = $html.Replace('__INTRO_BODY__', $def.introBody)
  $html = $html.Replace('__INTRO_IMG__', $def.introImg)
  $html = $html.Replace('__RELATED__', $rel)
  $utf8 = New-Object System.Text.UTF8Encoding $false
  [System.IO.File]::WriteAllText((Join-Path $root "$($def.slug).html"), $html, $utf8)
  Write-Host ("OK  " + $def.slug + ".html  (" + $def.products.Count + " produits)")
}

# ============== PHOTO POOL ==============
$IMG = @{
  lanternes    = 'assets/img/photos/col-lanternes.jpg'
  tapis        = 'assets/img/photos/col-tapis.jpg'
  vaisselle    = 'assets/img/photos/col-vaisselle.jpg'
  miroirs      = 'assets/img/photos/col-miroirs.jpg'
  ramadan      = 'assets/img/photos/col-ramadan.jpg'
  calligraphie = 'assets/img/photos/col-calligraphie.jpg'
  heroRamadan  = 'assets/img/photos/hero-ramadan.jpg'
  heroLanterns = 'assets/img/photos/hero-lanterns.jpg'
  heroSalon    = 'assets/img/photos/hero-salon.jpg'
  promoRam     = 'assets/img/photos/promo-ramadan.jpg'
  prodLant1    = 'assets/img/photos/prod-lanterne.jpg'
  prodLant2    = 'assets/img/photos/prod-lanterne2.jpg'
  prodPhoto    = 'assets/img/photos/prod-photophore.jpg'
  prodMiroir   = 'assets/img/photos/prod-miroir.jpg'
  prodPouf     = 'assets/img/photos/prod-pouf.jpg'
  prodPlateau  = 'assets/img/photos/prod-plateau.jpg'
  prodTajine   = 'assets/img/photos/prod-tajine.jpg'
  prodTapis    = 'assets/img/photos/prod-tapis.jpg'
  prodThe      = 'assets/img/photos/prod-the.jpg'
  prodCoussin  = 'assets/img/photos/prod-coussin.jpg'
}

# ============== COLLECTION DEFINITIONS ==============
$collections = @()

# --- 1. RAMADAN & AID ---
$collections += @{
  slug = 'ramadan'
  title = 'Ramadan &amp; A&iuml;d'
  desc = 'Collection capsule Ramadan et Aid : plateaux gravures, verres a the dores, lanternes laiton, calligraphies. Livraison 24-48h.'
  heroImg = $IMG.heroRamadan
  heroH1 = 'Ramadan &amp; <em>A&iuml;d</em>'
  heroP = 'Notre collection capsule pour sublimer vos soir&eacute;es de Ramadan et vos tabl&eacute;es d&rsquo;A&iuml;d. Plateaux cisel&eacute;s, verres dor&eacute;s, lanternes marocaines et calligraphies sign&eacute;es.'
  shipping = 'Offerte 69&euro;'
  chips = @('Tables', 'Luminaires', 'D&eacute;co murale', 'Bougies')
  products = @(
    @{ title='Plateau grav&eacute; Alger &mdash; m&eacute;tal argent&eacute; &Oslash;50'; cat='Arts de la table'; img=$IMG.prodPlateau; price='69,00'; rating=5; reviews=42; badge='Best'; tags=@('tables'); isNew=$false }
    @{ title='Service &agrave; th&eacute; Andalus &mdash; th&eacute;i&egrave;re + 6 verres dor&eacute;s'; cat='Arts de la table'; img=$IMG.vaisselle; price='89,00'; rating=5; reviews=128; tags=@('tables'); slug='service-a-the-andalus' }
    @{ title='Lanterne Fez &mdash; laiton dor&eacute;'; cat='Luminaires'; img=$IMG.prodLant1; price='59,90'; rating=5; reviews=87; badge='Nouveau'; tags=@('luminaires'); isNew=$true; slug='lanterne-fez' }
    @{ title='Cadre calligraphie Bismillah &mdash; dor&eacute;'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='39,00'; oldPrice='46,00'; rating=5; reviews=54; badge='-15%'; tags=@('d-co-murale') }
    @{ title='Photophore &eacute;toile ajour&eacute;e &mdash; cuivre (x3)'; cat='Bougies'; img=$IMG.prodPhoto; price='24,90'; rating=4; reviews=31; tags=@('bougies') }
    @{ title='Tajine d&eacute;cor Safi &mdash; peint main &Oslash;32'; cat='Arts de la table'; img=$IMG.prodTajine; price='34,90'; oldPrice='46,90'; rating=5; reviews=78; badge='-25%'; tags=@('tables') }
    @{ title='Th&eacute;i&egrave;re Marrakech &mdash; inox dor&eacute; 1L'; cat='Arts de la table'; img=$IMG.prodThe; price='45,00'; rating=4; reviews=22; tags=@('tables') }
    @{ title='Chemin de table brod&eacute; or &mdash; 2,40m'; cat='Textile'; img=$IMG.prodCoussin; price='29,00'; rating=4; reviews=18; tags=@('tables') }
  )
  introH2 = 'L&rsquo;art de recevoir, &agrave; l&rsquo;orientale'
  introBody = '<p>Chaque ann&eacute;e, nous s&eacute;lectionnons les plus belles pi&egrave;ces aupr&egrave;s d&rsquo;artisans du Maroc et de Tunisie pour composer une collection capsule d&eacute;di&eacute;e au Ramadan et &agrave; l&rsquo;A&iuml;d.</p><p>Plateaux grav&eacute;s, verres &agrave; th&eacute; dor&eacute;s, lanternes cisel&eacute;es, tajines peints &agrave; la main&nbsp;: de quoi cr&eacute;er une tabl&eacute;e qui rassemble, qui r&eacute;conforte et qui dure.</p><p><strong>Livraison en 24-48&nbsp;h</strong> pendant le mois de Ramadan pour que rien ne vous manque.</p>'
  introImg = $IMG.promoRam
  related = @(
    @{ name='Lanternes &amp; photophores'; href='lanternes.html'; img=$IMG.lanternes }
    @{ name='Vaisselle orientale'; href='vaisselle-orientale.html'; img=$IMG.vaisselle }
    @{ name='Calligraphie'; href='calligraphie.html'; img=$IMG.calligraphie }
    @{ name='Arts de la table'; href='arts-de-la-table.html'; img=$IMG.prodPlateau }
  )
}

# --- 2. TAPIS ---
$collections += @{
  slug = 'tapis'
  title = 'Tapis'
  desc = 'Tapis berberes Beni Ouarain, Azilal, Boujaad, Kilim : authenticite artisanale et grande taille. Livraison France metropolitaine.'
  heroImg = $IMG.tapis
  heroH1 = 'Tapis <em>berb&egrave;res</em>'
  heroP = 'Pi&egrave;ces uniques tiss&eacute;es &agrave; la main dans l&rsquo;Atlas marocain. Beni Ouarain &agrave; la laine &eacute;paisse, Azilal color&eacute;, Boujaad &eacute;nergique, Kilim plat&nbsp;: chaque tapis raconte une histoire.'
  shipping = '4,90&euro;'
  chips = @('Beni Ouarain', 'Azilal', 'Boujaad', 'Kilim', 'Runner')
  products = @(
    @{ title='Tapis Beni Ouarain &mdash; laine naturelle 200x290'; cat='Tapis'; img=$IMG.tapis; price='239,00'; oldPrice='299,00'; rating=5; reviews=87; badge='-20%'; tags=@('beni-ouarain'); slug='tapis-berbere-atlas' }
    @{ title='Tapis Azilal rouge &mdash; motifs losanges 170x240'; cat='Tapis'; img=$IMG.prodTapis; price='189,00'; rating=5; reviews=42; tags=@('azilal') }
    @{ title='Tapis Boujaad vintage &mdash; 160x230'; cat='Tapis'; img=$IMG.tapis; price='259,00'; rating=5; reviews=31; badge='Nouveau'; tags=@('boujaad'); isNew=$true }
    @{ title='Kilim r&eacute;versible &mdash; tons sable 200x300'; cat='Tapis'; img=$IMG.prodTapis; price='169,00'; rating=4; reviews=26; tags=@('kilim') }
    @{ title='Tapis Beni Ouarain XL &mdash; 250x350'; cat='Tapis'; img=$IMG.tapis; price='399,00'; rating=5; reviews=18; tags=@('beni-ouarain') }
    @{ title='Runner berb&egrave;re &mdash; 80x300 couloir'; cat='Tapis'; img=$IMG.prodTapis; price='99,00'; rating=4; reviews=54; tags=@('runner') }
    @{ title='Tapis Azilal pastel &mdash; 140x200'; cat='Tapis'; img=$IMG.tapis; price='149,00'; oldPrice='189,00'; rating=5; reviews=22; badge='-20%'; tags=@('azilal') }
    @{ title='Kilim g&eacute;om&eacute;trique noir &amp; blanc &mdash; 200x300'; cat='Tapis'; img=$IMG.prodTapis; price='179,00'; rating=4; reviews=12; badge='Nouveau'; tags=@('kilim'); isNew=$true }
  )
  introH2 = 'Des tapis v&eacute;ritablement tiss&eacute;s main'
  introBody = '<p>Nous travaillons avec des coop&eacute;ratives de femmes tisseuses dans les villages de l&rsquo;Atlas et du Moyen-Atlas marocain. Chaque tapis prend entre <strong>15 et 60 jours</strong> &agrave; &ecirc;tre tiss&eacute;, sur m&eacute;tier traditionnel, avec une laine vierge non teint&eacute;e chimiquement.</p><p>Les l&eacute;g&egrave;res asym&eacute;tries et variations de teinte sont le marqueur d&rsquo;une pi&egrave;ce authentique&nbsp;&mdash; aucune copie industrielle ne les reproduit.</p>'
  introImg = $IMG.tapis
  related = @(
    @{ name='Salon'; href='salon.html'; img=$IMG.heroSalon }
    @{ name='Coussins &amp; textile'; href='textile.html'; img=$IMG.prodCoussin }
    @{ name='Poufs cuir'; href='poufs.html'; img=$IMG.prodPouf }
    @{ name='Lanternes'; href='lanternes.html'; img=$IMG.lanternes }
  )
}

# --- 3. LANTERNES ---
$collections += @{
  slug = 'lanternes'
  title = 'Lanternes &amp; photophores'
  desc = 'Lanternes marocaines Fez, photophores ciseles, luminaires laiton cuivre. Ambiance chaleureuse et lumieres tamisees.'
  heroImg = $IMG.heroLanterns
  heroH1 = 'Lumi&egrave;res <em>tamis&eacute;es</em>'
  heroP = 'Lanternes marocaines de F&egrave;s, photophores cisel&eacute;s, luminaires en laiton et cuivre. Pour cr&eacute;er une atmosph&egrave;re chaude, intime et tr&egrave;s d&eacute;corative.'
  shipping = 'Offerte 69&euro;'
  chips = @('Lanternes XL', 'Photophores', 'Suspensions', 'Bougies LED')
  products = @(
    @{ title='Lanterne Fez &mdash; laiton dor&eacute; H40'; cat='Luminaires'; img=$IMG.prodLant1; price='59,90'; rating=5; reviews=128; badge='Best'; tags=@('lanternes-xl') }
    @{ title='Lanterne Fez XL &mdash; version dor&eacute;e H65'; cat='Luminaires'; img=$IMG.prodLant2; price='79,00'; oldPrice='112,00'; rating=5; reviews=42; badge='-30%'; tags=@('lanternes-xl') }
    @{ title='Photophore &eacute;toile ajour&eacute;e &mdash; cuivre'; cat='Bougies'; img=$IMG.prodPhoto; price='24,90'; rating=4; reviews=78; tags=@('photophores') }
    @{ title='Suspension cuivre cisel&eacute;e &mdash; &Oslash;45'; cat='Luminaires'; img=$IMG.lanternes; price='129,00'; rating=5; reviews=22; badge='Nouveau'; tags=@('suspensions'); isNew=$true }
    @{ title='Trio photophores berb&egrave;res &mdash; laiton'; cat='Bougies'; img=$IMG.prodPhoto; price='39,00'; rating=4; reviews=31; tags=@('photophores') }
    @{ title='Lanterne de sol Marrakech &mdash; H90'; cat='Luminaires'; img=$IMG.prodLant1; price='149,00'; rating=5; reviews=18; tags=@('lanternes-xl') }
    @{ title='Bougies LED rechargeables &mdash; lot de 6'; cat='Bougies'; img=$IMG.prodPhoto; price='34,90'; rating=5; reviews=66; tags=@('bougies-led') }
    @{ title='Suspension ajour&eacute;e M&eacute;dina &mdash; laiton'; cat='Luminaires'; img=$IMG.lanternes; price='189,00'; oldPrice='229,00'; rating=5; reviews=14; badge='-17%'; tags=@('suspensions') }
  )
  introH2 = 'L&rsquo;&acirc;me de la d&eacute;co orientale'
  introBody = '<p>Rien ne transforme une pi&egrave;ce comme une belle lumi&egrave;re tamis&eacute;e. Nos lanternes sont cisel&eacute;es &agrave; la main par les artisans de F&egrave;s&nbsp;: le laiton est travaill&eacute; au marteau, perc&eacute; de motifs traditionnels, puis patin&eacute; pour obtenir cette teinte dor&eacute;e profonde.</p><p>Pos&eacute;es au sol, suspendues dans un salon, ou group&eacute;es en trio sur une table&nbsp;: elles cr&eacute;ent instantan&eacute;ment une atmosph&egrave;re.</p>'
  introImg = $IMG.heroLanterns
  related = @(
    @{ name='Ramadan &amp; A&iuml;d'; href='ramadan.html'; img=$IMG.ramadan }
    @{ name='Miroirs'; href='miroirs.html'; img=$IMG.miroirs }
    @{ name='Calligraphie'; href='calligraphie.html'; img=$IMG.calligraphie }
    @{ name='Salon'; href='salon.html'; img=$IMG.heroSalon }
  )
}

# --- 4. VAISSELLE ORIENTALE ---
$collections += @{
  slug = 'vaisselle-orientale'
  title = 'Vaisselle orientale'
  desc = 'Vaisselle peinte main du Maroc : tajines, assiettes Safi, bols mezze, couverts dores, services a the complets.'
  heroImg = $IMG.vaisselle
  heroH1 = 'Vaisselle <em>peinte main</em>'
  heroP = 'Tajines d&eacute;cor&eacute;s de Safi, assiettes color&eacute;es, bols mezz&eacute; et couverts dor&eacute;s. Pour des repas qui ont du caract&egrave;re.'
  shipping = 'Offerte 69&euro;'
  chips = @('Th&eacute;i&egrave;res', 'Tajines', 'Assiettes', 'Bols', 'Couverts')
  products = @(
    @{ title='Service &agrave; th&eacute; Andalus &mdash; th&eacute;i&egrave;re + 6 verres dor&eacute;s'; cat='Arts de la table'; img=$IMG.vaisselle; price='89,00'; rating=5; reviews=128; badge='Best'; tags=@('th-i-res') }
    @{ title='Th&eacute;i&egrave;re Marrakech &mdash; inox dor&eacute; 1L'; cat='Arts de la table'; img=$IMG.prodThe; price='45,00'; rating=4; reviews=54; tags=@('th-i-res') }
    @{ title='Tajine d&eacute;cor Safi &mdash; peint main &Oslash;32'; cat='Arts de la table'; img=$IMG.prodTajine; price='34,90'; oldPrice='46,90'; rating=5; reviews=78; badge='-25%'; tags=@('tajines') }
    @{ title='Lot de 6 assiettes Safi &mdash; motifs bleus'; cat='Arts de la table'; img=$IMG.vaisselle; price='59,00'; rating=5; reviews=42; badge='Nouveau'; tags=@('assiettes'); isNew=$true }
    @{ title='Bols mezz&eacute; lot de 4 &mdash; c&eacute;ramique &eacute;maill&eacute;e'; cat='Arts de la table'; img=$IMG.prodTajine; price='29,00'; rating=4; reviews=31; tags=@('bols') }
    @{ title='Plateau grav&eacute; Alger &mdash; m&eacute;tal argent&eacute; &Oslash;50'; cat='Arts de la table'; img=$IMG.prodPlateau; price='69,00'; rating=5; reviews=22; tags=@('th-i-res') }
    @{ title='Couverts dor&eacute;s &mdash; lot de 16 pi&egrave;ces'; cat='Arts de la table'; img=$IMG.vaisselle; price='79,00'; rating=4; reviews=18; tags=@('couverts') }
    @{ title='Tajine XL f&ecirc;tes &mdash; &Oslash;38 peint main'; cat='Arts de la table'; img=$IMG.prodTajine; price='54,90'; rating=5; reviews=12; tags=@('tajines') }
  )
  introH2 = 'L&rsquo;atelier des potiers de Safi'
  introBody = '<p>Safi, petite ville c&ocirc;ti&egrave;re marocaine, est r&eacute;put&eacute;e depuis le 12e si&egrave;cle pour ses poteries &eacute;maill&eacute;es. Nos tajines, assiettes et bols y sont toujours fa&ccedil;onn&eacute;s &agrave; la main, puis peints un &agrave; un au pinceau fin.</p><p>Chaque pi&egrave;ce passe ensuite au four &agrave; bois entre 900&deg;C et 1&nbsp;000&deg;C. Les motifs traditionnels &mdash; fleurs, &eacute;toiles, arabesques &mdash; ne sont jamais identiques d&rsquo;une pi&egrave;ce &agrave; l&rsquo;autre.</p>'
  introImg = $IMG.vaisselle
  related = @(
    @{ name='Ramadan &amp; A&iuml;d'; href='ramadan.html'; img=$IMG.ramadan }
    @{ name='Textile de table'; href='textile.html'; img=$IMG.prodCoussin }
    @{ name='Lanternes'; href='lanternes.html'; img=$IMG.lanternes }
    @{ name='Arts de la table'; href='arts-de-la-table.html'; img=$IMG.prodPlateau }
  )
}

# --- 5. CALLIGRAPHIE ---
$collections += @{
  slug = 'calligraphie'
  title = 'Calligraphie'
  desc = 'Calligraphies arabes encadrees : Bismillah, Mashallah, ayat al-Koursi. Cadres dores et contemporains.'
  heroImg = $IMG.calligraphie
  heroH1 = 'Calligraphie <em>arabe</em>'
  heroP = 'Tableaux calligraphiques arabes sign&eacute;s par des artistes tunisiens et marocains. Versets, invocations, noms de famille personnalis&eacute;s.'
  shipping = 'Offerte 69&euro;'
  chips = @('Versets', 'Invocations', 'Personnalis&eacute;', 'Prints')
  products = @(
    @{ title='Cadre Bismillah &mdash; dor&eacute; A3'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='39,00'; oldPrice='46,00'; rating=5; reviews=128; badge='-15%'; tags=@('invocations') }
    @{ title='Ayat al-Koursi &mdash; calligraphie grand format 70x100'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='129,00'; rating=5; reviews=42; badge='Best'; tags=@('versets') }
    @{ title='Mashallah noir &amp; or &mdash; A4'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='29,00'; rating=5; reviews=78; tags=@('invocations') }
    @{ title='Calligraphie personnalis&eacute;e &mdash; pr&eacute;nom sur mesure'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='69,00'; rating=5; reviews=54; badge='Nouveau'; tags=@('personnalis-'); isNew=$true }
    @{ title='Sourate Al-Ikhlas &mdash; noir &amp; or 50x70'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='79,00'; rating=5; reviews=22; tags=@('versets') }
    @{ title='Triptyque Allah &mdash; Mohammed &mdash; Bismillah'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='99,00'; rating=4; reviews=18; tags=@('versets') }
    @{ title='Print A5 Alhamdulillah &mdash; 3 versions'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='14,90'; rating=4; reviews=36; tags=@('prints') }
    @{ title='Cadre nom de famille &mdash; calligraphie arabe + fran&ccedil;ais'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='89,00'; rating=5; reviews=12; tags=@('personnalis-') }
  )
  introH2 = 'L&rsquo;&eacute;criture comme art'
  introBody = '<p>La calligraphie arabe est bien plus qu&rsquo;une &eacute;criture&nbsp;: c&rsquo;est un art &agrave; part enti&egrave;re, pratiqu&eacute; depuis plus de mille ans. Chaque style &mdash; Diwani, Thuluth, Maghrebi, K&oacute;fi &mdash; r&eacute;pond &agrave; des r&egrave;gles pr&eacute;cises de proportion.</p><p>Nous collaborons avec des calligraphes form&eacute;s dans les &eacute;coles traditionnelles tunisiennes et marocaines. Leurs &oelig;uvres sont ensuite encadr&eacute;es en France, dans des encadrements nobles (bois massif, dorure &agrave; la feuille).</p>'
  introImg = $IMG.calligraphie
  related = @(
    @{ name='Ramadan &amp; A&iuml;d'; href='ramadan.html'; img=$IMG.ramadan }
    @{ name='Miroirs'; href='miroirs.html'; img=$IMG.miroirs }
    @{ name='Salon'; href='salon.html'; img=$IMG.heroSalon }
    @{ name='Cadeaux'; href='cadeaux.html'; img=$IMG.prodPlateau }
  )
}

# --- 6. SALON ---
$collections += @{
  slug = 'salon'
  title = 'Salon'
  desc = 'Tout pour amenager un salon chaleureux : tapis, coussins, poufs cuir, miroirs, luminaires et pieces decoratives.'
  heroImg = $IMG.heroSalon
  heroH1 = 'Un salon qui raconte <em>votre histoire</em>'
  heroP = 'Tapis moelleux, coussins brod&eacute;s, poufs en cuir, miroirs soleil. Les cl&eacute;s d&rsquo;un salon qui vous ressemble, chaleureux et v&eacute;cu.'
  shipping = 'Offerte 69&euro;'
  chips = @('Tapis', 'Coussins', 'Poufs', 'Miroirs', 'Luminaires')
  products = @(
    @{ title='Tapis Beni Ouarain &mdash; laine naturelle 200x290'; cat='Tapis'; img=$IMG.tapis; price='239,00'; oldPrice='299,00'; rating=5; reviews=87; badge='-20%'; tags=@('tapis') }
    @{ title='Pouf cuir Marrakech &mdash; tress&eacute; main'; cat='Assises'; img=$IMG.prodPouf; price='149,00'; rating=5; reviews=42; tags=@('poufs') }
    @{ title='Miroir soleil M&eacute;dina &mdash; laiton bross&eacute; &Oslash;80'; cat='Miroirs'; img=$IMG.prodMiroir; price='119,00'; rating=5; reviews=54; badge='Nouveau'; tags=@('miroirs'); isNew=$true; slug='miroir-soleil-medina' }
    @{ title='Coussin Kilim brod&eacute; main &mdash; 45x45'; cat='Textile'; img=$IMG.prodCoussin; price='29,90'; rating=4; reviews=78; tags=@('coussins') }
    @{ title='Lanterne de sol Marrakech &mdash; H90'; cat='Luminaires'; img=$IMG.prodLant1; price='149,00'; rating=5; reviews=18; tags=@('luminaires') }
    @{ title='Lot de 3 coussins ethniques &mdash; 40x40'; cat='Textile'; img=$IMG.prodCoussin; price='59,00'; oldPrice='75,00'; rating=4; reviews=31; badge='-21%'; tags=@('coussins') }
    @{ title='Pouf en laine berb&egrave;re &mdash; &Oslash;55'; cat='Assises'; img=$IMG.prodPouf; price='99,00'; rating=5; reviews=22; tags=@('poufs') }
    @{ title='Miroir rond cisel&eacute; &mdash; laiton dor&eacute; &Oslash;60'; cat='Miroirs'; img=$IMG.prodMiroir; price='89,00'; rating=4; reviews=26; tags=@('miroirs') }
  )
  introH2 = 'Cr&eacute;ez un cocon &agrave; votre image'
  introBody = '<p>Un salon r&eacute;ussi, c&rsquo;est un savant m&eacute;lange&nbsp;: un grand tapis qui d&eacute;finit l&rsquo;espace, des coussins qui invitent &agrave; s&rsquo;asseoir, une belle lumi&egrave;re, et ces pi&egrave;ces d&eacute;coratives qui racontent vos voyages.</p><p>Nos conseillers en magasin peuvent vous aider &agrave; composer votre ambiance gratuitement, sur rendez-vous.</p>'
  introImg = $IMG.heroSalon
  related = @(
    @{ name='Tapis'; href='tapis.html'; img=$IMG.tapis }
    @{ name='Lanternes'; href='lanternes.html'; img=$IMG.lanternes }
    @{ name='Miroirs'; href='miroirs.html'; img=$IMG.miroirs }
    @{ name='Coussins'; href='textile.html'; img=$IMG.prodCoussin }
  )
}

# --- 7. ARTS DE LA TABLE ---
$collections += @{
  slug = 'arts-de-la-table'
  title = 'Arts de la table'
  desc = 'Tout pour dresser une belle tablee : services a the, plateaux, vaisselle peinte main, nappes brodees.'
  heroImg = $IMG.prodPlateau
  heroH1 = 'L&rsquo;art de la <em>tabl&eacute;e</em>'
  heroP = 'Services &agrave; th&eacute;, plateaux grav&eacute;s, vaisselle peinte main, nappes brod&eacute;es, chemins de table. De quoi recevoir avec &eacute;l&eacute;gance.'
  shipping = 'Offerte 69&euro;'
  chips = @('Service &agrave; th&eacute;', 'Plateaux', 'Vaisselle', 'Textile table')
  products = @(
    @{ title='Service &agrave; th&eacute; Andalus &mdash; th&eacute;i&egrave;re + 6 verres dor&eacute;s'; cat='Services'; img=$IMG.vaisselle; price='89,00'; rating=5; reviews=128; badge='Best'; tags=@('service---th-') }
    @{ title='Plateau grav&eacute; Alger &mdash; m&eacute;tal argent&eacute; &Oslash;50'; cat='Plateaux'; img=$IMG.prodPlateau; price='69,00'; rating=5; reviews=42; tags=@('plateaux') }
    @{ title='Tajine d&eacute;cor Safi &mdash; peint main &Oslash;32'; cat='Vaisselle'; img=$IMG.prodTajine; price='34,90'; oldPrice='46,90'; rating=5; reviews=78; badge='-25%'; tags=@('vaisselle') }
    @{ title='Chemin de table brod&eacute; or &mdash; 2,40m'; cat='Textile'; img=$IMG.prodCoussin; price='29,00'; rating=4; reviews=54; tags=@('textile-table') }
    @{ title='Th&eacute;i&egrave;re Marrakech &mdash; inox dor&eacute; 1L'; cat='Services'; img=$IMG.prodThe; price='45,00'; rating=4; reviews=22; tags=@('service---th-') }
    @{ title='Lot de 6 assiettes Safi &mdash; motifs bleus'; cat='Vaisselle'; img=$IMG.vaisselle; price='59,00'; rating=5; reviews=31; badge='Nouveau'; tags=@('vaisselle'); isNew=$true }
    @{ title='Plateau rond en laiton cisel&eacute; &mdash; &Oslash;40'; cat='Plateaux'; img=$IMG.prodPlateau; price='49,00'; rating=5; reviews=18; tags=@('plateaux') }
    @{ title='Nappe brod&eacute;e main &mdash; 180x260'; cat='Textile'; img=$IMG.prodCoussin; price='89,00'; rating=4; reviews=12; tags=@('textile-table') }
  )
  introH2 = 'Dresser une table, c&rsquo;est raconter quelque chose'
  introBody = '<p>Chez DecoShop, on croit qu&rsquo;une belle table ne se limite pas &agrave; l&rsquo;assiette. Elle se compose&nbsp;: un plateau qui accueille, des verres dor&eacute;s qui capturent la lumi&egrave;re, une nappe brod&eacute;e, des bougies qui adoucissent le moment.</p><p>Toutes nos pi&egrave;ces sont s&eacute;lectionn&eacute;es pour s&rsquo;accorder entre elles&nbsp;: assemblez librement, l&rsquo;harmonie est garantie.</p>'
  introImg = $IMG.prodPlateau
  related = @(
    @{ name='Vaisselle orientale'; href='vaisselle-orientale.html'; img=$IMG.vaisselle }
    @{ name='Ramadan &amp; A&iuml;d'; href='ramadan.html'; img=$IMG.ramadan }
    @{ name='Bougies &amp; photophores'; href='lanternes.html'; img=$IMG.lanternes }
    @{ name='Cadeaux'; href='cadeaux.html'; img=$IMG.prodPlateau }
  )
}

# --- 8. NOUVEAUTES ---
$collections += @{
  slug = 'nouveautes'
  title = 'Nouveaut&eacute;s'
  desc = 'Les dernieres arrivees DecoShop Toulouse : pieces uniques, editions limitees, collections capsule.'
  heroImg = $IMG.heroLanterns
  heroH1 = 'Les <em>nouveaut&eacute;s</em>'
  heroP = 'Les derni&egrave;res pi&egrave;ces arriv&eacute;es en magasin&nbsp;&mdash; certaines en s&eacute;rie limit&eacute;e. &Agrave; voir en priorit&eacute;.'
  shipping = '24h'
  chips = @('Cette semaine', 'Ce mois-ci', 'S&eacute;ries limit&eacute;es')
  products = @(
    @{ title='Miroir soleil M&eacute;dina &mdash; laiton bross&eacute; &Oslash;80'; cat='Miroirs'; img=$IMG.prodMiroir; price='119,00'; rating=5; reviews=12; badge='Nouveau'; tags=@('cette-semaine'); isNew=$true }
    @{ title='Suspension cuivre cisel&eacute;e &mdash; &Oslash;45'; cat='Luminaires'; img=$IMG.lanternes; price='129,00'; rating=5; reviews=8; badge='Nouveau'; tags=@('cette-semaine'); isNew=$true }
    @{ title='Tapis Boujaad vintage &mdash; 160x230'; cat='Tapis'; img=$IMG.tapis; price='259,00'; rating=5; reviews=6; badge='S&eacute;rie limit&eacute;e'; tags=@('s-ries-limit-es'); isNew=$true }
    @{ title='Calligraphie personnalis&eacute;e &mdash; pr&eacute;nom sur mesure'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='69,00'; rating=5; reviews=14; badge='Nouveau'; tags=@('ce-mois-ci'); isNew=$true }
    @{ title='Lot de 6 assiettes Safi &mdash; motifs bleus'; cat='Arts de la table'; img=$IMG.vaisselle; price='59,00'; rating=5; reviews=9; badge='Nouveau'; tags=@('ce-mois-ci'); isNew=$true }
    @{ title='Bougies LED rechargeables &mdash; lot de 6'; cat='Bougies'; img=$IMG.prodPhoto; price='34,90'; rating=5; reviews=22; badge='Nouveau'; tags=@('ce-mois-ci'); isNew=$true }
    @{ title='Kilim g&eacute;om&eacute;trique noir &amp; blanc &mdash; 200x300'; cat='Tapis'; img=$IMG.tapis; price='179,00'; rating=4; reviews=4; badge='Nouveau'; tags=@('cette-semaine'); isNew=$true }
    @{ title='Pouf en laine berb&egrave;re &mdash; &Oslash;55'; cat='Assises'; img=$IMG.prodPouf; price='99,00'; rating=5; reviews=11; badge='Nouveau'; tags=@('ce-mois-ci'); isNew=$true }
  )
  introH2 = 'Fra&icirc;chement arriv&eacute; dans notre atelier'
  introBody = '<p>Nous renouvelons notre s&eacute;lection chaque semaine. Certaines pi&egrave;ces, comme les tapis Boujaad vintage ou les calligraphies sign&eacute;es, sont en <strong>s&eacute;rie limit&eacute;e</strong>&nbsp;: une fois parties, on ne les retrouve pas.</p><p>Inscrivez-vous &agrave; la newsletter pour &ecirc;tre pr&eacute;venu en avant-premi&egrave;re des nouveaut&eacute;s.</p>'
  introImg = $IMG.heroLanterns
  related = @(
    @{ name='Ramadan &amp; A&iuml;d'; href='ramadan.html'; img=$IMG.ramadan }
    @{ name='Promos'; href='soldes.html'; img=$IMG.tapis }
    @{ name='Cadeaux'; href='cadeaux.html'; img=$IMG.prodPlateau }
    @{ name='Salon'; href='salon.html'; img=$IMG.heroSalon }
  )
}

# --- 9. SOLDES / PROMOS ---
$collections += @{
  slug = 'soldes'
  title = 'Promos'
  desc = 'Ventes privees et promotions DecoShop Toulouse : jusqu a -30% sur tapis, lanternes, vaisselle et calligraphies.'
  heroImg = $IMG.promoRam
  heroH1 = 'Jusqu&rsquo;&agrave; <em>-30&nbsp;%</em>'
  heroP = 'Notre s&eacute;lection de pi&egrave;ces en promotion. Stocks limit&eacute;s&nbsp;&mdash; premiers arriv&eacute;s, premiers servis.'
  shipping = 'Offerte 69&euro;'
  chips = @('-10&thinsp;%', '-20&thinsp;%', '-30&thinsp;%')
  products = @(
    @{ title='Lanterne Fez XL &mdash; version dor&eacute;e H65'; cat='Luminaires'; img=$IMG.prodLant2; price='79,00'; oldPrice='112,00'; rating=5; reviews=42; badge='-30%'; tags=@('-30') }
    @{ title='Tapis Beni Ouarain &mdash; 200x290'; cat='Tapis'; img=$IMG.tapis; price='239,00'; oldPrice='299,00'; rating=5; reviews=87; badge='-20%'; tags=@('-20') }
    @{ title='Cadre Bismillah &mdash; dor&eacute; A3'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='39,00'; oldPrice='46,00'; rating=5; reviews=128; badge='-15%'; tags=@('-10') }
    @{ title='Tajine d&eacute;cor Safi &mdash; peint main &Oslash;32'; cat='Arts de la table'; img=$IMG.prodTajine; price='34,90'; oldPrice='46,90'; rating=5; reviews=78; badge='-25%'; tags=@('-20') }
    @{ title='Tapis Azilal pastel &mdash; 140x200'; cat='Tapis'; img=$IMG.tapis; price='149,00'; oldPrice='189,00'; rating=5; reviews=22; badge='-20%'; tags=@('-20') }
    @{ title='Lot de 3 coussins ethniques &mdash; 40x40'; cat='Textile'; img=$IMG.prodCoussin; price='59,00'; oldPrice='75,00'; rating=4; reviews=31; badge='-21%'; tags=@('-20') }
    @{ title='Suspension ajour&eacute;e M&eacute;dina &mdash; laiton'; cat='Luminaires'; img=$IMG.lanternes; price='189,00'; oldPrice='229,00'; rating=5; reviews=14; badge='-17%'; tags=@('-10') }
    @{ title='Miroir rond cisel&eacute; &mdash; laiton dor&eacute; &Oslash;60'; cat='Miroirs'; img=$IMG.prodMiroir; price='69,00'; oldPrice='89,00'; rating=4; reviews=26; badge='-22%'; tags=@('-20') }
  )
  introH2 = 'Des vraies promos, pas des faux rabais'
  introBody = '<p>Chez DecoShop, pas de &laquo;&nbsp;prix gonfl&eacute;s avant d&rsquo;&ecirc;tre barr&eacute;s&nbsp;&raquo;. Nos prix de r&eacute;f&eacute;rence sont bien ceux pratiqu&eacute;s les 30 derniers jours.</p><p>Les remises portent surtout sur la fin de collection ou les pi&egrave;ces dont nous renouvelons le stock. D&eacute;finitives, sans code promo additionnel.</p>'
  introImg = $IMG.promoRam
  related = @(
    @{ name='Nouveaut&eacute;s'; href='nouveautes.html'; img=$IMG.heroLanterns }
    @{ name='Tapis'; href='tapis.html'; img=$IMG.tapis }
    @{ name='Lanternes'; href='lanternes.html'; img=$IMG.lanternes }
    @{ name='Cadeaux'; href='cadeaux.html'; img=$IMG.prodPlateau }
  )
}

# --- 10. CADEAUX ---
$collections += @{
  slug = 'cadeaux'
  title = 'Cadeaux'
  desc = 'Idees cadeaux pour tous les budgets : calligraphies, services a the, photophores, lanternes. Emballage cadeau offert.'
  heroImg = $IMG.prodPlateau
  heroH1 = 'Id&eacute;es <em>cadeaux</em>'
  heroP = 'Pour un anniversaire, une cr&eacute;maill&egrave;re, l&rsquo;A&iuml;d ou juste pour faire plaisir. S&eacute;lection par budget, emballage cadeau offert sur demande.'
  shipping = 'Offerte 69&euro;'
  chips = @('Moins de 30&euro;', '30 - 60&euro;', '60 - 100&euro;', 'Plus de 100&euro;')
  products = @(
    @{ title='Photophore &eacute;toile ajour&eacute;e &mdash; cuivre'; cat='Bougies'; img=$IMG.prodPhoto; price='24,90'; rating=4; reviews=78; tags=@('moins-de-30-') }
    @{ title='Mashallah noir &amp; or &mdash; A4'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='29,00'; rating=5; reviews=54; tags=@('moins-de-30-') }
    @{ title='Coussin Kilim brod&eacute; main &mdash; 45x45'; cat='Textile'; img=$IMG.prodCoussin; price='29,90'; rating=4; reviews=78; tags=@('moins-de-30-') }
    @{ title='Cadre Bismillah &mdash; dor&eacute; A3'; cat='D&eacute;co murale'; img=$IMG.calligraphie; price='39,00'; oldPrice='46,00'; rating=5; reviews=128; badge='-15%'; tags=@('30---60-') }
    @{ title='Th&eacute;i&egrave;re Marrakech &mdash; inox dor&eacute; 1L'; cat='Arts de la table'; img=$IMG.prodThe; price='45,00'; rating=4; reviews=22; tags=@('30---60-') }
    @{ title='Trio photophores berb&egrave;res &mdash; laiton'; cat='Bougies'; img=$IMG.prodPhoto; price='39,00'; rating=4; reviews=31; tags=@('30---60-') }
    @{ title='Service &agrave; th&eacute; Andalus &mdash; th&eacute;i&egrave;re + 6 verres'; cat='Arts de la table'; img=$IMG.vaisselle; price='89,00'; rating=5; reviews=128; badge='Best'; tags=@('60---100-') }
    @{ title='Miroir soleil M&eacute;dina &mdash; laiton bross&eacute; &Oslash;80'; cat='Miroirs'; img=$IMG.prodMiroir; price='119,00'; rating=5; reviews=54; badge='Nouveau'; tags=@('plus-de-100-'); isNew=$true }
  )
  introH2 = 'Le cadeau qui ne se jette pas'
  introBody = '<p>Marre des bougies industrielles et des kits salle de bain&nbsp;? Offrez une belle pi&egrave;ce d&eacute;co, artisanale, qui durera des ann&eacute;es et qu&rsquo;on montre avec plaisir.</p><p><strong>Emballage cadeau offert</strong> sur simple demande au moment de la commande, et carte manuscrite &agrave; votre message si vous voulez.</p>'
  introImg = $IMG.prodPlateau
  related = @(
    @{ name='Calligraphie'; href='calligraphie.html'; img=$IMG.calligraphie }
    @{ name='Bougies &amp; photophores'; href='lanternes.html'; img=$IMG.lanternes }
    @{ name='Vaisselle orientale'; href='vaisselle-orientale.html'; img=$IMG.vaisselle }
    @{ name='Nouveaut&eacute;s'; href='nouveautes.html'; img=$IMG.heroLanterns }
  )
}

# ============== EXECUTE ==============
foreach ($c in $collections) { New-Collection $c }

Write-Host "---"
Write-Host ("Pages generees dans: " + $root)
Get-ChildItem $root -Filter *.html | Select Name, @{N='KB';E={[math]::Round($_.Length/1024,1)}} | Format-Table -AutoSize
