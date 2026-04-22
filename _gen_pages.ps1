$ErrorActionPreference = 'Stop'
$root = Join-Path $PSScriptRoot 'pages'
New-Item -ItemType Directory -Force -Path $root | Out-Null

$head = @'
<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <meta name="theme-color" content="#1E3A8A" />
  <title>__TITLE__ &mdash; DecoShop Toulouse</title>
  <meta name="description" content="__DESC__" />
  <meta name="robots" content="index, follow" />
  <link rel="canonical" href="https://decoshop-toulouse.fr/pages/__SLUG__" />
  <link rel="icon" href="../favicon.ico" sizes="any" />
  <link rel="icon" type="image/png" sizes="32x32" href="../favicon-32.png" />
  <link rel="apple-touch-icon" sizes="180x180" href="../apple-touch-icon.png" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Playfair+Display:wght@600;700;900&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="../assets/css/styles.css" />
  <link rel="stylesheet" href="_shared.css" />
</head>
<body>
  <header class="header">
    <div class="header__top" style="grid-template-columns:auto 1fr auto">
      <a class="brand header__logo" href="../index.html" aria-label="DecoShop Toulouse">
        <span class="brand__logo"><img src="../assets/logo.png" alt="DecoShop Toulouse" /></span>
        <span class="brand__text">
          <span class="brand__name">DecoShop</span>
          <span class="brand__city">Toulouse</span>
        </span>
      </a>
      <div></div>
      <a class="btn btn--ghost btn--sm" href="../index.html">&larr; Retour &agrave; l'accueil</a>
    </div>
  </header>
  <main class="container">
    <article class="legal" data-reveal>
'@

$tail = @'
      <p style="margin-top:3rem;color:var(--muted);font-size:.85rem">Derni&egrave;re mise &agrave; jour&nbsp;: avril 2026</p>
      <a class="back-top" href="#top">&uarr; Haut de page</a>
    </article>
  </main>
  <footer class="footer">
    <div class="container">
      <div class="footer__bottom">
        <div>&copy; <span id="year">2026</span> DecoShop Toulouse. Tous droits r&eacute;serv&eacute;s.</div>
        <div class="footer__links">
          <a href="mentions-legales.html">Mentions l&eacute;gales</a> &middot;
          <a href="cgv.html">CGV</a> &middot;
          <a href="confidentialite.html">Confidentialit&eacute;</a> &middot;
          <a href="cookies.html">Cookies</a>
        </div>
        <div class="footer__credit">Site d&eacute;velopp&eacute; par <a href="https://microdidact.com/" target="_blank" rel="noopener" class="credit-link">Microdidact</a></div>
      </div>
    </div>
  </footer>
  <script src="../assets/js/app.js" defer></script>
</body>
</html>
'@

$utf8 = New-Object System.Text.UTF8Encoding $false
function Make($slug, $title, $desc, $body) {
  $h = $head.Replace('__TITLE__', $title).Replace('__DESC__', $desc).Replace('__SLUG__', $slug)
  $full = $h + "`r`n" + $body + "`r`n" + $tail
  [System.IO.File]::WriteAllText((Join-Path $root "$slug.html"), $full, $utf8)
  Write-Host "OK  $slug.html"
}

# ==================== CGV ====================
$cgv = @'
      <h1>Conditions g&eacute;n&eacute;rales de vente</h1>
      <p class="lead">Les pr&eacute;sentes CGV r&eacute;gissent les ventes de produits de d&eacute;coration r&eacute;alis&eacute;es par DecoShop, aupr&egrave;s des particuliers, tant en magasin qu&rsquo;en ligne sur <strong>decoshop-toulouse.fr</strong>.</p>

      <h2>1. Objet</h2>
      <p>Les pr&eacute;sentes Conditions g&eacute;n&eacute;rales de vente (&laquo; CGV &raquo;) s&rsquo;appliquent &agrave; toute commande pass&eacute;e par un client consommateur (&laquo; Client &raquo;) aupr&egrave;s de DECOSHOP SAS, soci&eacute;t&eacute; par actions simplifi&eacute;e au capital de 1&nbsp;000&nbsp;&euro;, immatricul&eacute;e au RCS de Toulouse sous le num&eacute;ro 912&nbsp;459&nbsp;542, dont le si&egrave;ge est situ&eacute; au 58 Rue Jacques Babinet, 31100 Toulouse (ci-apr&egrave;s &laquo; DecoShop &raquo;).</p>
      <p>Toute commande emporte adh&eacute;sion pleine et enti&egrave;re aux pr&eacute;sentes CGV, que le Client d&eacute;clare avoir lues et accept&eacute;es avant validation.</p>

      <h2>2. Produits</h2>
      <p>Les produits propos&eacute;s sont d&eacute;crits et pr&eacute;sent&eacute;s avec la plus grande exactitude possible. Les photographies ne sont pas contractuelles&nbsp;; de l&eacute;g&egrave;res variations de teinte ou de finition peuvent exister, notamment pour les pi&egrave;ces artisanales (tapis berb&egrave;res, lanternes, poteries peintes main). Les dimensions annonc&eacute;es peuvent varier de &plusmn;&nbsp;2&nbsp;%.</p>

      <h2>3. Prix</h2>
      <p>Les prix sont indiqu&eacute;s en euros TTC, TVA fran&ccedil;aise incluse (20&nbsp;% sauf r&eacute;gimes particuliers). Ils n&rsquo;incluent pas les frais de livraison, factur&eacute;s en sus et affich&eacute;s avant validation de la commande. DecoShop se r&eacute;serve le droit de modifier ses prix &agrave; tout moment&nbsp;; les produits sont factur&eacute;s au tarif en vigueur au moment de la validation de la commande.</p>

      <h2>4. Commande</h2>
      <p>Le Client passe commande en ligne via le panier, apr&egrave;s cr&eacute;ation d&rsquo;un compte ou en mode invit&eacute;. La commande est r&eacute;put&eacute;e conclue apr&egrave;s&nbsp;:</p>
      <ul>
        <li>validation du panier et des informations de livraison&nbsp;;</li>
        <li>acceptation explicite des pr&eacute;sentes CGV&nbsp;;</li>
        <li>paiement effectif et confirmation par email de DecoShop.</li>
      </ul>
      <p>DecoShop se r&eacute;serve le droit de refuser toute commande anormale, de mauvaise foi ou pour tout motif l&eacute;gitime (stock &eacute;puis&eacute;, litige ant&eacute;rieur, etc.).</p>

      <h2>5. Paiement</h2>
      <p>Les moyens de paiement accept&eacute;s sont&nbsp;: carte bancaire (CB, Visa, Mastercard, American Express), PayPal et paiement en 3 fois sans frais par carte bancaire d&egrave;s 100&nbsp;&euro; d&rsquo;achat. Les transactions sont s&eacute;curis&eacute;es par notre prestataire bancaire (protocole 3D Secure).</p>
      <p>Les donn&eacute;es bancaires ne sont jamais stock&eacute;es par DecoShop.</p>

      <h2>6. Livraison</h2>
      <p>DecoShop livre en France m&eacute;tropolitaine, en Corse ainsi qu&rsquo;en Belgique et au Luxembourg. Le retrait gratuit est possible au magasin de Toulouse sous 2&nbsp;heures ouvr&eacute;es apr&egrave;s confirmation.</p>
      <p>Les d&eacute;lais moyens de livraison sont&nbsp;:</p>
      <ul>
        <li><strong>Standard&nbsp;:</strong> 2 &agrave; 5 jours ouvr&eacute;s (offerte d&egrave;s 69&nbsp;&euro; d&rsquo;achat)&nbsp;;</li>
        <li><strong>Express&nbsp;:</strong> 24 &agrave; 48&nbsp;h (9,90&nbsp;&euro;)&nbsp;;</li>
        <li><strong>Pi&egrave;ces volumineuses&nbsp;:</strong> 5 &agrave; 10 jours ouvr&eacute;s, sur rendez-vous.</li>
      </ul>
      <p>Les d&eacute;lais sont indicatifs&nbsp;; un retard de livraison ne peut donner lieu &agrave; annulation qu&rsquo;en cas de d&eacute;passement sup&eacute;rieur &agrave; 30 jours apr&egrave;s mise en demeure rest&eacute;e infructueuse.</p>

      <h2>7. Droit de r&eacute;tractation</h2>
      <p>Conform&eacute;ment aux articles L.221-18 et suivants du Code de la consommation, le Client dispose d&rsquo;un d&eacute;lai de <strong>14 jours</strong> &agrave; compter de la r&eacute;ception de la commande pour exercer son droit de r&eacute;tractation, sans avoir &agrave; motiver sa d&eacute;cision.</p>
      <p>Les produits doivent &ecirc;tre retourn&eacute;s dans leur emballage d&rsquo;origine, non utilis&eacute;s et en parfait &eacute;tat. Les frais de retour sont &agrave; la charge du Client, sauf produit d&eacute;fectueux. Voir notre page <a href="retours.html">Retours &amp; remboursements</a>.</p>
      <div class="callout"><p><strong>Exception&nbsp;:</strong> les produits personnalis&eacute;s (gravures, calligraphies sur mesure) ne sont pas repris sauf d&eacute;faut av&eacute;r&eacute;.</p></div>

      <h2>8. Garanties l&eacute;gales</h2>
      <p>Tous les produits b&eacute;n&eacute;ficient de la <strong>garantie l&eacute;gale de conformit&eacute;</strong> (articles L.217-4 &agrave; L.217-14 du Code de la consommation) et de la <strong>garantie contre les vices cach&eacute;s</strong> (articles 1641 &agrave; 1649 du Code civil). Le Client dispose de 2 ans &agrave; compter de la d&eacute;livrance du bien pour agir.</p>

      <h2>9. R&eacute;clamations et m&eacute;diation</h2>
      <p>Toute r&eacute;clamation peut &ecirc;tre adress&eacute;e &agrave; <a href="mailto:contact@decoshop-toulouse.fr">contact@decoshop-toulouse.fr</a>. &Agrave; d&eacute;faut d&rsquo;accord amiable, le Client peut saisir gratuitement le m&eacute;diateur de la consommation <strong>CM2C</strong>, 14 rue Saint-Jean, 75017 Paris (<a href="https://cm2c.net" target="_blank" rel="noopener">cm2c.net</a>), ou la plateforme europ&eacute;enne de r&egrave;glement des litiges (<a href="https://ec.europa.eu/consumers/odr" target="_blank" rel="noopener">ec.europa.eu/consumers/odr</a>).</p>

      <h2>10. Droit applicable</h2>
      <p>Les pr&eacute;sentes CGV sont r&eacute;gies par le droit fran&ccedil;ais. En cas de litige, les tribunaux fran&ccedil;ais sont seuls comp&eacute;tents, nonobstant pluralit&eacute; de d&eacute;fendeurs ou appel en garantie.</p>
'@

# ==================== CONFIDENTIALITE ====================
$conf = @'
      <h1>Politique de confidentialit&eacute;</h1>
      <p class="lead">DecoShop s&rsquo;engage &agrave; prot&eacute;ger la vie priv&eacute;e de ses clients. Cette politique explique quelles donn&eacute;es personnelles nous collectons, pourquoi, comment nous les utilisons et quels sont vos droits (RGPD).</p>

      <h2>1. Responsable du traitement</h2>
      <p>Le responsable du traitement est DECOSHOP SAS, 58 Rue Jacques Babinet, 31100 Toulouse. Contact&nbsp;: <a href="mailto:contact@decoshop-toulouse.fr">contact@decoshop-toulouse.fr</a>.</p>

      <h2>2. Donn&eacute;es collect&eacute;es</h2>
      <p>Nous collectons uniquement les donn&eacute;es n&eacute;cessaires &agrave; nos services&nbsp;:</p>
      <table>
        <thead><tr><th>Donn&eacute;es</th><th>Finalit&eacute;</th><th>Base l&eacute;gale</th><th>Dur&eacute;e</th></tr></thead>
        <tbody>
          <tr><td>Nom, pr&eacute;nom, email, t&eacute;l&eacute;phone, adresse postale</td><td>Traitement des commandes, SAV, livraison</td><td>Contrat</td><td>5 ans apr&egrave;s la derni&egrave;re commande</td></tr>
          <tr><td>Historique d&rsquo;achat, pr&eacute;f&eacute;rences</td><td>Am&eacute;lioration du service, recommandations</td><td>Int&eacute;r&ecirc;t l&eacute;gitime</td><td>3 ans d&rsquo;inactivit&eacute;</td></tr>
          <tr><td>Email (newsletter)</td><td>Communications marketing</td><td>Consentement</td><td>Jusqu&rsquo;&agrave; d&eacute;sinscription</td></tr>
          <tr><td>Donn&eacute;es de facturation</td><td>Obligation comptable</td><td>Obligation l&eacute;gale</td><td>10 ans</td></tr>
          <tr><td>Cookies analytiques, techniques</td><td>Fonctionnement du site, mesure d&rsquo;audience</td><td>Consentement / int&eacute;r&ecirc;t l&eacute;gitime</td><td>13 mois max</td></tr>
        </tbody>
      </table>

      <h2>3. Destinataires</h2>
      <p>Vos donn&eacute;es sont destin&eacute;es exclusivement &agrave; DecoShop et &agrave; ses sous-traitants techniques strictement indispensables&nbsp;:</p>
      <ul>
        <li><strong>Shopify International</strong> (Irlande) &mdash; h&eacute;bergement et plateforme e-commerce&nbsp;;</li>
        <li><strong>Stripe / PayPal</strong> &mdash; traitement s&eacute;curis&eacute; des paiements&nbsp;;</li>
        <li><strong>Chronopost, Colissimo, Relais Colis</strong> &mdash; livraison&nbsp;;</li>
        <li><strong>Sendinblue (Brevo)</strong> &mdash; emailing transactionnel et newsletter&nbsp;;</li>
        <li><strong>Google Analytics 4</strong> &mdash; mesure d&rsquo;audience anonymis&eacute;e.</li>
      </ul>
      <p>Aucune donn&eacute;e n&rsquo;est vendue &agrave; des tiers.</p>

      <h2>4. Transferts hors UE</h2>
      <p>Certains prestataires peuvent h&eacute;berger des donn&eacute;es aux &Eacute;tats-Unis (Google, Stripe). Ces transferts sont encadr&eacute;s par les clauses contractuelles types de la Commission europ&eacute;enne et/ou la certification Data Privacy Framework.</p>

      <h2>5. Vos droits (RGPD)</h2>
      <p>Conform&eacute;ment au R&egrave;glement (UE) 2016/679 et &agrave; la loi Informatique et Libert&eacute;s, vous disposez des droits suivants&nbsp;:</p>
      <ul>
        <li><strong>Acc&egrave;s</strong> &mdash; obtenir une copie de vos donn&eacute;es&nbsp;;</li>
        <li><strong>Rectification</strong> &mdash; corriger des informations inexactes&nbsp;;</li>
        <li><strong>Effacement</strong> &mdash; demander la suppression (&laquo;&nbsp;droit &agrave; l&rsquo;oubli&nbsp;&raquo;)&nbsp;;</li>
        <li><strong>Limitation</strong> &mdash; geler temporairement le traitement&nbsp;;</li>
        <li><strong>Portabilit&eacute;</strong> &mdash; r&eacute;cup&eacute;rer vos donn&eacute;es dans un format structur&eacute;&nbsp;;</li>
        <li><strong>Opposition</strong> &mdash; refuser un traitement fond&eacute; sur l&rsquo;int&eacute;r&ecirc;t l&eacute;gitime&nbsp;;</li>
        <li><strong>Directives post-mortem</strong> &mdash; organiser le sort de vos donn&eacute;es apr&egrave;s votre d&eacute;c&egrave;s.</li>
      </ul>

      <div class="callout">
        <p><strong>Pour exercer vos droits&nbsp;:</strong> envoyez un email &agrave; <a href="mailto:contact@decoshop-toulouse.fr">contact@decoshop-toulouse.fr</a> ou un courrier &agrave; DecoShop &mdash; 58 Rue Jacques Babinet, 31100 Toulouse. Nous r&eacute;pondons sous 1 mois maximum. Joignez une copie d&rsquo;un justificatif d&rsquo;identit&eacute; pour les demandes sensibles.</p>
        <p>Vous pouvez &eacute;galement introduire une r&eacute;clamation aupr&egrave;s de la <a href="https://www.cnil.fr" target="_blank" rel="noopener">CNIL</a>.</p>
      </div>

      <h2>6. S&eacute;curit&eacute;</h2>
      <p>Nous mettons en place des mesures techniques et organisationnelles appropri&eacute;es&nbsp;: chiffrement TLS/HTTPS, hachage des mots de passe (bcrypt), acc&egrave;s restreint aux donn&eacute;es clients, journalisation, sauvegardes quotidiennes.</p>

      <h2>7. Mineurs</h2>
      <p>Le site n&rsquo;est pas destin&eacute; aux enfants de moins de 15 ans. Aucune donn&eacute;e concernant un mineur de moins de 15 ans ne devrait nous &ecirc;tre transmise sans le consentement du titulaire de l&rsquo;autorit&eacute; parentale.</p>

      <h2>8. Modifications</h2>
      <p>Cette politique peut &eacute;voluer. Toute modification substantielle sera notifi&eacute;e par email ou par bandeau visible sur le site.</p>
'@

# ==================== COOKIES ====================
$cook = @'
      <h1>Politique cookies</h1>
      <p class="lead">Les cookies sont de petits fichiers textes d&eacute;pos&eacute;s sur votre appareil par le site que vous visitez. Ils permettent au site de fonctionner, de m&eacute;moriser vos pr&eacute;f&eacute;rences et de mesurer son audience.</p>

      <h2>1. Cookies que nous utilisons</h2>
      <table>
        <thead><tr><th>Cat&eacute;gorie</th><th>Exemples</th><th>Finalit&eacute;</th><th>Dur&eacute;e</th><th>Consentement</th></tr></thead>
        <tbody>
          <tr><td><strong>Strictement n&eacute;cessaires</strong></td><td>session, panier, CSRF, langue</td><td>Faire fonctionner le site, s&eacute;curiser le paiement</td><td>Session &agrave; 13 mois</td><td>Non requis</td></tr>
          <tr><td><strong>Pr&eacute;f&eacute;rences</strong></td><td>devise, taille affich&eacute;e</td><td>M&eacute;moriser vos choix d&rsquo;affichage</td><td>6 mois</td><td>Implicite</td></tr>
          <tr><td><strong>Mesure d&rsquo;audience</strong></td><td>_ga, _ga_* (Google Analytics&nbsp;4)</td><td>Statistiques anonymis&eacute;es (pages vues, dur&eacute;e)</td><td>13 mois</td><td>Requis</td></tr>
          <tr><td><strong>Marketing</strong></td><td>_fbp (Meta Pixel), _ttp (TikTok Pixel)</td><td>Mesure et personnalisation publicitaire</td><td>13 mois</td><td>Requis</td></tr>
        </tbody>
      </table>

      <h2>2. G&eacute;rer votre consentement</h2>
      <p>Lors de votre premi&egrave;re visite, un bandeau vous permet d&rsquo;accepter, refuser ou personnaliser les cookies non essentiels. Vous pouvez &agrave; tout moment revenir sur ce choix&nbsp;:</p>
      <ul>
        <li>via le lien &laquo;&nbsp;G&eacute;rer mes cookies&nbsp;&raquo; en pied de page&nbsp;;</li>
        <li>via les param&egrave;tres de votre navigateur (Chrome, Firefox, Safari, Edge).</li>
      </ul>

      <div class="callout"><p>Refuser les cookies analytiques ou marketing n&rsquo;emp&ecirc;che pas l&rsquo;acc&egrave;s au site&nbsp;; cela limite simplement les statistiques d&rsquo;audience et la publicit&eacute; personnalis&eacute;e.</p></div>

      <h2>3. Cookies tiers</h2>
      <p>Certains contenus int&eacute;gr&eacute;s (vid&eacute;os YouTube, TikTok, carte Google Maps) peuvent d&eacute;poser leurs propres cookies lorsqu&rsquo;ils sont charg&eacute;s. Consultez les politiques respectives&nbsp;:</p>
      <ul>
        <li><a href="https://www.tiktok.com/legal/cookie-policy" target="_blank" rel="noopener">TikTok &mdash; Cookie Policy</a></li>
        <li><a href="https://policies.google.com/technologies/cookies" target="_blank" rel="noopener">Google &mdash; Technologies</a></li>
        <li><a href="https://www.facebook.com/policies/cookies/" target="_blank" rel="noopener">Meta (Facebook, Instagram)</a></li>
      </ul>

      <h2>4. Dur&eacute;e de conservation</h2>
      <p>Conform&eacute;ment aux recommandations de la CNIL, le consentement est valable <strong>6 mois</strong>. Il vous sera redemand&eacute; ensuite.</p>

      <h2>5. Vous en savez plus</h2>
      <p>Pour en savoir plus sur les cookies en g&eacute;n&eacute;ral, consultez la page d&eacute;di&eacute;e de la <a href="https://www.cnil.fr/fr/cookies-et-traceurs-que-dit-la-loi" target="_blank" rel="noopener">CNIL</a>.</p>
'@

# ==================== CONTACT ====================
$contact = @'
      <h1>Nous contacter</h1>
      <p class="lead">Une question sur un produit, une commande, le magasin&nbsp;? Nous r&eacute;pondons sous 24&nbsp;h ouvr&eacute;es.</p>

      <div class="grid2">
        <div class="card">
          <h3>Par t&eacute;l&eacute;phone</h3>
          <p><a href="tel:+33767278625"><strong>07 67 27 86 25</strong></a></p>
          <p>Du lundi au samedi, de 10&nbsp;h &agrave; 19&nbsp;h.</p>
        </div>
        <div class="card">
          <h3>Par email</h3>
          <p><a href="mailto:contact@decoshop-toulouse.fr"><strong>contact@decoshop-toulouse.fr</strong></a></p>
          <p>R&eacute;ponse sous 24&nbsp;h ouvr&eacute;es.</p>
        </div>
        <div class="card">
          <h3>En magasin</h3>
          <p><strong>58 Rue Jacques Babinet</strong><br/>31100 Toulouse, France</p>
          <p><a href="https://www.google.com/maps/dir/?api=1&destination=58+Rue+Jacques+Babinet+31100+Toulouse" target="_blank" rel="noopener">Itin&eacute;raire Google&nbsp;Maps &rarr;</a></p>
        </div>
        <div class="card">
          <h3>Sur TikTok</h3>
          <p><a href="https://www.tiktok.com/@decoshoptoulouse" target="_blank" rel="noopener"><strong>@decoshoptoulouse</strong></a></p>
          <p>Toutes nos nouveaut&eacute;s et inspirations en vid&eacute;o.</p>
        </div>
      </div>

      <h2>Formulaire de contact</h2>
      <p>Utilisez le formulaire ci-dessous pour toute question&nbsp;:</p>
      <form class="contact-form" action="#" method="post" novalidate>
        <div class="row2">
          <div>
            <label for="c-nom">Nom *</label>
            <input id="c-nom" name="nom" required autocomplete="name" />
          </div>
          <div>
            <label for="c-email">Email *</label>
            <input id="c-email" name="email" type="email" required autocomplete="email" />
          </div>
        </div>
        <div class="row2">
          <div>
            <label for="c-tel">T&eacute;l&eacute;phone</label>
            <input id="c-tel" name="tel" type="tel" autocomplete="tel" />
          </div>
          <div>
            <label for="c-sujet">Sujet *</label>
            <select id="c-sujet" name="sujet" required>
              <option value="">Choisir&hellip;</option>
              <option>Question sur un produit</option>
              <option>Suivi de commande</option>
              <option>Retour / remboursement</option>
              <option>Partenariat / B2B</option>
              <option>Presse</option>
              <option>Autre</option>
            </select>
          </div>
        </div>
        <div>
          <label for="c-msg">Votre message *</label>
          <textarea id="c-msg" name="message" required placeholder="D&eacute;crivez votre demande&hellip;"></textarea>
        </div>
        <div>
          <label style="font-weight:400;font-size:.85rem;color:var(--muted)"><input type="checkbox" required style="width:auto;margin-right:.4rem" /> J&rsquo;accepte que mes donn&eacute;es soient utilis&eacute;es pour traiter ma demande. Voir notre <a href="confidentialite.html">politique de confidentialit&eacute;</a>.</label>
        </div>
        <button class="btn btn--primary" type="submit">Envoyer le message</button>
      </form>
'@

# ==================== FAQ ====================
$faq = @'
      <h1>Foire aux questions</h1>
      <p class="lead">Les r&eacute;ponses aux questions les plus fr&eacute;quentes. Vous ne trouvez pas votre r&eacute;ponse&nbsp;? <a href="contact.html">Contactez-nous</a>.</p>

      <h2>Commande &amp; paiement</h2>
      <details class="faq-item"><summary>Comment passer commande&nbsp;?</summary>
        <p>Ajoutez vos produits au panier, validez, renseignez vos coordonn&eacute;es de livraison et payez en s&eacute;curit&eacute;. Vous recevez un email de confirmation instantan&eacute;.</p></details>
      <details class="faq-item"><summary>Quels moyens de paiement sont accept&eacute;s&nbsp;?</summary>
        <p>Carte bancaire (CB, Visa, Mastercard, Amex), PayPal, et paiement en 3 fois sans frais d&egrave;s 100&nbsp;&euro;.</p></details>
      <details class="faq-item"><summary>Le paiement est-il s&eacute;curis&eacute;&nbsp;?</summary>
        <p>Oui, toutes les transactions sont chiffr&eacute;es (TLS 1.3) et valid&eacute;es par 3D Secure. Aucune donn&eacute;e bancaire n&rsquo;est stock&eacute;e chez DecoShop.</p></details>
      <details class="faq-item"><summary>Puis-je modifier ou annuler ma commande&nbsp;?</summary>
        <p>Vous pouvez modifier ou annuler sous 2&nbsp;h apr&egrave;s validation, en nous contactant au <a href="tel:+33767278625">07 67 27 86 25</a>. Pass&eacute; ce d&eacute;lai, la pr&eacute;paration est lanc&eacute;e.</p></details>

      <h2>Livraison</h2>
      <details class="faq-item"><summary>Quels sont les d&eacute;lais de livraison&nbsp;?</summary>
        <p>2 &agrave; 5 jours ouvr&eacute;s en standard (France m&eacute;tropolitaine), 24 &agrave; 48&nbsp;h en express. D&eacute;tails sur la page <a href="livraison.html">Livraison</a>.</p></details>
      <details class="faq-item"><summary>Livrez-vous &agrave; l&rsquo;&eacute;tranger&nbsp;?</summary>
        <p>Nous livrons en France m&eacute;tropolitaine, Corse, Belgique et Luxembourg. Pour d&rsquo;autres pays, contactez-nous pour un devis.</p></details>
      <details class="faq-item"><summary>Puis-je retirer ma commande en magasin&nbsp;?</summary>
        <p>Oui, gratuitement, au 58 Rue Jacques Babinet &agrave; Toulouse. D&egrave;s r&eacute;ception de l&rsquo;email de confirmation (environ 2&nbsp;h).</p></details>

      <h2>Retours &amp; garanties</h2>
      <details class="faq-item"><summary>Combien de temps pour retourner un produit&nbsp;?</summary>
        <p>14 jours &agrave; compter de la r&eacute;ception, sans avoir &agrave; vous justifier. Voir <a href="retours.html">Retours &amp; remboursements</a>.</p></details>
      <details class="faq-item"><summary>Un produit est arriv&eacute; cass&eacute;, que faire&nbsp;?</summary>
        <p>Contactez-nous sous 48&nbsp;h avec des photos. Nous vous envoyons un remplacement ou remboursons int&eacute;gralement, frais de retour inclus.</p></details>
      <details class="faq-item"><summary>Les produits sont-ils garantis&nbsp;?</summary>
        <p>Oui, garantie l&eacute;gale de conformit&eacute; (2 ans) et contre les vices cach&eacute;s. Certains produits b&eacute;n&eacute;ficient de garanties constructeur &eacute;tendues.</p></details>

      <h2>Produits &amp; magasin</h2>
      <details class="faq-item"><summary>Les produits sont-ils artisanaux&nbsp;?</summary>
        <p>Une grande partie de notre s&eacute;lection (tapis berb&egrave;res, lanternes marocaines, vaisselle peinte main, calligraphies) est fabriqu&eacute;e &agrave; la main par des artisans du Maroc, de Tunisie et du sud de la France. De l&eacute;g&egrave;res variations sont donc normales et t&eacute;moignent de l&rsquo;authenticit&eacute; de la pi&egrave;ce.</p></details>
      <details class="faq-item"><summary>Avez-vous un showroom physique&nbsp;?</summary>
        <p>Oui, au <strong>58 Rue Jacques Babinet &agrave; Toulouse</strong>, ouvert du lundi au samedi de 10&nbsp;h &agrave; 19&nbsp;h. Venez voir nos pi&egrave;ces en vrai&nbsp;!</p></details>
      <details class="faq-item"><summary>Proposez-vous des conseils d&eacute;co&nbsp;?</summary>
        <p>Oui, nos conseillers en magasin sont form&eacute;s pour vous accompagner. Vous pouvez aussi r&eacute;server un rendez-vous &laquo;&nbsp;conseil d&eacute;co&nbsp;&raquo; gratuit sur rdv.</p></details>
      <details class="faq-item"><summary>Faites-vous des remises professionnelles (B2B)&nbsp;?</summary>
        <p>Oui, pour les architectes d&rsquo;int&eacute;rieur, h&ocirc;teliers, restaurateurs et CHR. Voir notre <a href="professionnels.html">espace pro</a>.</p></details>
'@

# ==================== LIVRAISON ====================
$liv = @'
      <h1>Livraison</h1>
      <p class="lead">Rapide, suivie et offerte d&egrave;s 69&nbsp;&euro;. D&eacute;couvrez nos options de livraison.</p>

      <h2>Tarifs &amp; d&eacute;lais</h2>
      <table>
        <thead><tr><th>Mode</th><th>D&eacute;lai</th><th>Tarif</th><th>Zone</th></tr></thead>
        <tbody>
          <tr><td><strong>Retrait magasin</strong></td><td>Sous 2&nbsp;h ouvr&eacute;es</td><td>Gratuit</td><td>Toulouse &mdash; 58 Rue Jacques Babinet</td></tr>
          <tr><td><strong>Standard</strong> (Colissimo)</td><td>2 &agrave; 5 jours ouvr&eacute;s</td><td>4,90&nbsp;&euro; &mdash; <strong>Offerte d&egrave;s 69&nbsp;&euro;</strong></td><td>France m&eacute;tropolitaine + Corse</td></tr>
          <tr><td><strong>Express</strong> (Chronopost)</td><td>24 &agrave; 48&nbsp;h</td><td>9,90&nbsp;&euro;</td><td>France m&eacute;tropolitaine</td></tr>
          <tr><td><strong>Relais colis</strong></td><td>3 &agrave; 6 jours ouvr&eacute;s</td><td>3,90&nbsp;&euro;</td><td>France + Belgique</td></tr>
          <tr><td><strong>Encombrant / meuble</strong></td><td>5 &agrave; 10 jours ouvr&eacute;s</td><td>&Agrave; partir de 29&nbsp;&euro; (sur devis)</td><td>Sur rendez-vous</td></tr>
          <tr><td><strong>International</strong></td><td>5 &agrave; 10 jours ouvr&eacute;s</td><td>&Agrave; partir de 14,90&nbsp;&euro;</td><td>Belgique, Luxembourg</td></tr>
        </tbody>
      </table>

      <div class="callout"><p><strong>Astuce&nbsp;:</strong> pour les gros objets fragiles (miroirs soleil, lanternes XL), privil&eacute;giez le retrait magasin ou la livraison encombrant pour un colisage sp&eacute;cial.</p></div>

      <h2>Suivi de commande</h2>
      <p>Vous recevez un email de confirmation, puis un num&eacute;ro de suivi d&egrave;s l&rsquo;expedition. Vous pouvez &eacute;galement suivre votre commande depuis la page <a href="suivi.html">Suivi de commande</a> ou depuis votre compte client.</p>

      <h2>Emballage</h2>
      <p>Nous soignons nos colis&nbsp;: carton double-cannelure, papier bulle, calage mousse pour les fragiles. Nous privil&eacute;gions les emballages <strong>recycl&eacute;s et recyclables</strong>, sans plastique inutile.</p>

      <h2>Absence &agrave; la livraison</h2>
      <p>En cas d&rsquo;absence lors du passage du transporteur&nbsp;: un avis de passage est d&eacute;pos&eacute;. Le colis est conserv&eacute; 14 jours en point de retrait. Pass&eacute; ce d&eacute;lai, il nous est retourn&eacute;&nbsp;; le renvoi est factur&eacute; au tarif de livraison standard.</p>

      <h2>Livraison en magasin offerte</h2>
      <p>Envie de venir d&eacute;couvrir le magasin&nbsp;? Choisissez le retrait gratuit au 58 Rue Jacques Babinet. Nos conseillers vous accueillent du lundi au samedi de 10&nbsp;h &agrave; 19&nbsp;h, et pr&eacute;parent votre commande en 2&nbsp;h maximum.</p>
'@

# ==================== RETOURS ====================
$ret = @'
      <h1>Retours &amp; remboursements</h1>
      <p class="lead">Vous disposez de 14 jours pour changer d&rsquo;avis. Proc&eacute;dure simple et rapide.</p>

      <h2>D&eacute;lai de r&eacute;tractation</h2>
      <p>Conform&eacute;ment au Code de la consommation (articles L.221-18 et suivants), vous disposez d&rsquo;un d&eacute;lai de <strong>14 jours calendaires</strong> &agrave; compter de la r&eacute;ception de votre commande pour exercer votre droit de r&eacute;tractation, sans avoir &agrave; vous justifier.</p>

      <h2>Comment retourner un produit&nbsp;?</h2>
      <ol style="padding-left:1.2rem">
        <li style="margin-bottom:.5rem"><strong>Contactez-nous</strong> par email &agrave; <a href="mailto:contact@decoshop-toulouse.fr">contact@decoshop-toulouse.fr</a> avec votre num&eacute;ro de commande et le(s) produit(s) concern&eacute;(s).</li>
        <li style="margin-bottom:.5rem"><strong>Recevez un num&eacute;ro de retour</strong> et, si vous le souhaitez, un bon de retour Colissimo pr&eacute;-affranchi (d&eacute;duit du remboursement).</li>
        <li style="margin-bottom:.5rem"><strong>Emballez le produit</strong> dans son emballage d&rsquo;origine, avec tous ses accessoires.</li>
        <li style="margin-bottom:.5rem"><strong>Exp&eacute;diez</strong> &agrave;&nbsp;: DecoShop &mdash; Service Retours, 58 Rue Jacques Babinet, 31100 Toulouse.</li>
        <li><strong>Remboursement</strong> sous 14 jours apr&egrave;s r&eacute;ception et contr&ocirc;le, sur le moyen de paiement initial.</li>
      </ol>

      <h2>Conditions &agrave; respecter</h2>
      <ul>
        <li>Produit non utilis&eacute;, non endommag&eacute;, non lav&eacute;&nbsp;;</li>
        <li>Emballage d&rsquo;origine et &eacute;tiquettes intacts&nbsp;;</li>
        <li>Tous les accessoires et notices pr&eacute;sents&nbsp;;</li>
        <li>Renvoy&eacute; dans les 14 jours apr&egrave;s notification du retour.</li>
      </ul>

      <div class="callout"><p><strong>Frais de retour&nbsp;:</strong> &agrave; votre charge (retour standard environ 8&nbsp;&euro;), sauf en cas de produit d&eacute;fectueux, non conforme ou re&ccedil;u cass&eacute;. Dans ce cas, nous prenons en charge le retour et l&rsquo;&eacute;change / remboursement int&eacute;gral.</p></div>

      <h2>Produits non repris</h2>
      <ul>
        <li>Produits personnalis&eacute;s (gravures, calligraphies sur mesure, tailles sp&eacute;ciales)&nbsp;;</li>
        <li>Produits d&eacute;scell&eacute;s pour des raisons d&rsquo;hygi&egrave;ne (certaines bougies, diffuseurs)&nbsp;;</li>
        <li>Produits visiblement utilis&eacute;s ou d&eacute;grad&eacute;s par le client.</li>
      </ul>

      <h2>Produit arriv&eacute; cass&eacute; ou d&eacute;fectueux</h2>
      <p>Contactez-nous sous 48&nbsp;h avec des photos du colis et du produit. Nous traitons en priorit&eacute; ces cas et vous proposons&nbsp;: un renvoi gratuit d&rsquo;un produit identique, un avoir, ou un remboursement int&eacute;gral (produit + frais de port).</p>

      <h2>&Eacute;change</h2>
      <p>Les &eacute;changes ne sont pas automatiques. Nous vous invitons &agrave; nous retourner le produit puis &agrave; passer une nouvelle commande. Ainsi, vous &ecirc;tes assur&eacute; d&rsquo;obtenir le bon produit rapidement.</p>

      <h2>Formulaire de r&eacute;tractation</h2>
      <p>Vous pouvez utiliser le mod&egrave;le de formulaire officiel&nbsp;:</p>
      <div class="callout" style="font-family:monospace;font-size:.88rem">
        <p>&Agrave; l&rsquo;attention de&nbsp;: DecoShop, 58 Rue Jacques Babinet, 31100 Toulouse, <a href="mailto:contact@decoshop-toulouse.fr">contact@decoshop-toulouse.fr</a></p>
        <p>Je vous notifie par la pr&eacute;sente ma r&eacute;tractation du contrat portant sur la vente du produit :<br/>Command&eacute; le : &hellip; / Re&ccedil;u le : &hellip;<br/>Nom du consommateur : &hellip;<br/>Adresse : &hellip;<br/>Date : &hellip; / Signature : &hellip;</p>
      </div>
'@

# ==================== SUIVI ====================
$suivi = @'
      <h1>Suivi de commande</h1>
      <p class="lead">Retrouvez le statut de votre commande en quelques secondes.</p>

      <div class="callout"><p><strong>Astuce&nbsp;:</strong> vous trouverez votre num&eacute;ro de commande dans l&rsquo;email de confirmation (format <code>DS-2026-XXXXX</code>).</p></div>

      <h2>Suivre ma commande</h2>
      <form class="contact-form" action="#" method="get" novalidate>
        <div class="row2">
          <div>
            <label for="s-num">Num&eacute;ro de commande *</label>
            <input id="s-num" name="order" placeholder="DS-2026-XXXXX" required />
          </div>
          <div>
            <label for="s-email">Email de commande *</label>
            <input id="s-email" name="email" type="email" required />
          </div>
        </div>
        <button class="btn btn--primary" type="submit">Voir le statut</button>
      </form>

      <h2>Les diff&eacute;rents statuts</h2>
      <table>
        <thead><tr><th>Statut</th><th>Ce que cela signifie</th></tr></thead>
        <tbody>
          <tr><td><strong>Paiement confirm&eacute;</strong></td><td>Votre paiement est valid&eacute;, nous pr&eacute;parons votre colis.</td></tr>
          <tr><td><strong>En pr&eacute;paration</strong></td><td>Vos produits sont en cours de pr&eacute;paration &agrave; notre entrep&ocirc;t de Toulouse.</td></tr>
          <tr><td><strong>Exp&eacute;di&eacute;</strong></td><td>Votre colis est confi&eacute; au transporteur. Vous recevez un num&eacute;ro de suivi par email.</td></tr>
          <tr><td><strong>En livraison</strong></td><td>Votre colis est en tourn&eacute;e. Le livreur passera aujourd&rsquo;hui ou demain.</td></tr>
          <tr><td><strong>Livr&eacute;</strong></td><td>Colis remis au destinataire ou d&eacute;pos&eacute; en point relais.</td></tr>
          <tr><td><strong>En retour</strong></td><td>Vous avez demand&eacute; un retour&nbsp;; nous attendons le colis pour traitement.</td></tr>
          <tr><td><strong>Rembours&eacute;</strong></td><td>Le remboursement a &eacute;t&eacute; initi&eacute;. Les fonds apparaissent sous 3 &agrave; 5 jours ouvr&eacute;s.</td></tr>
        </tbody>
      </table>

      <h2>Un souci avec votre commande&nbsp;?</h2>
      <p>Notre service client r&eacute;pond du lundi au samedi&nbsp;:</p>
      <ul>
        <li>T&eacute;l&eacute;phone&nbsp;: <a href="tel:+33767278625">07 67 27 86 25</a></li>
        <li>Email&nbsp;: <a href="mailto:contact@decoshop-toulouse.fr">contact@decoshop-toulouse.fr</a></li>
        <li>Formulaire&nbsp;: <a href="contact.html">Nous contacter</a></li>
      </ul>
'@

# ==================== A PROPOS ====================
$apro = @'
      <h1>Notre histoire</h1>
      <p class="lead">DecoShop, c&rsquo;est une boutique toulousaine n&eacute;e d&rsquo;une passion pour la d&eacute;coration d&rsquo;inspiration orientale et les pi&egrave;ces qui racontent une histoire.</p>

      <h2>Nos origines</h2>
      <p>Fond&eacute;e en 2022 par <strong>Fayssal Boussatta</strong>, DecoShop est n&eacute;e d&rsquo;une &eacute;vidence&nbsp;: faire d&eacute;couvrir &agrave; Toulouse les plus belles pi&egrave;ces d&eacute;co du bassin m&eacute;diterran&eacute;en, en particulier du Maroc et de la Tunisie, tout en les mariant &agrave; un style contemporain et chaleureux.</p>
      <p>Apr&egrave;s plusieurs ann&eacute;es de voyages, de rencontres avec des artisans et de s&eacute;lections patientes, le premier magasin a ouvert ses portes au 58 Rue Jacques Babinet, dans le quartier dynamique de Rangueil.</p>

      <h2>Notre s&eacute;lection</h2>
      <p>Chaque pi&egrave;ce de notre catalogue est choisie avec soin&nbsp;:</p>
      <ul>
        <li><strong>Tapis berb&egrave;res</strong> tiss&eacute;s &agrave; la main dans l&rsquo;Atlas marocain&nbsp;;</li>
        <li><strong>Lanternes &amp; photophores</strong> en laiton cisel&eacute; par les artisans de F&egrave;s&nbsp;;</li>
        <li><strong>Vaisselle peinte main</strong> (tajines, plats, th&eacute;i&egrave;res) des poteries de Safi&nbsp;;</li>
        <li><strong>Calligraphies</strong> arabes contemporaines d&rsquo;artistes tunisiens&nbsp;;</li>
        <li><strong>Mobilier d&rsquo;appoint</strong> (poufs cuir, tables basses en bois sculpt&eacute;)&nbsp;;</li>
        <li><strong>Miroirs soleil</strong> en laiton, r&eacute;dition d&rsquo;un classique des ann&eacute;es 60.</li>
      </ul>

      <h2>Ce qui nous distingue</h2>
      <div class="grid2">
        <div class="card">
          <h3>L&rsquo;authenticit&eacute;</h3>
          <p>Nous travaillons en direct avec les artisans&nbsp;: pas d&rsquo;interm&eacute;diaires, pas de copies industrielles. Chaque pi&egrave;ce est unique.</p>
        </div>
        <div class="card">
          <h3>Le conseil</h3>
          <p>Une question sur l&rsquo;association d&rsquo;un tapis et d&rsquo;un canap&eacute;&nbsp;? Notre &eacute;quipe en magasin vous accompagne sans pression.</p>
        </div>
        <div class="card">
          <h3>Le juste prix</h3>
          <p>Pas de marketing tapageur ni de marges excessives. Nous ach&egrave;tons en volume raisonnable pour garder des prix accessibles.</p>
        </div>
        <div class="card">
          <h3>La proximit&eacute;</h3>
          <p>Un vrai magasin physique &agrave; Toulouse, et une &eacute;quipe qui r&eacute;pond vraiment au t&eacute;l&eacute;phone.</p>
        </div>
      </div>

      <h2>Le magasin</h2>
      <p>Venez nous rendre visite au 58 Rue Jacques Babinet, 31100 Toulouse. Parking gratuit en contre-bas, m&eacute;tro ligne B arr&ecirc;t Rangueil &agrave; 5 min.</p>
      <p>Horaires&nbsp;: du lundi au samedi de 10&nbsp;h &agrave; 19&nbsp;h, ferm&eacute; le dimanche.</p>
      <p><a href="../index.html#magasin">Voir le plan &rarr;</a></p>
'@

# ==================== ENGAGEMENTS ====================
$eng = @'
      <h1>Nos engagements</h1>
      <p class="lead">Acheter une d&eacute;co, ce n&rsquo;est pas juste acheter un objet. C&rsquo;est soutenir un artisan, un savoir-faire, une fili&egrave;re. Voici les n&ocirc;tres.</p>

      <h2>1. Artisanat &amp; commerce &eacute;quitable</h2>
      <p>Une part significative de notre s&eacute;lection est issue d&rsquo;ateliers d&rsquo;artisans au Maroc, en Tunisie et en France. Nous travaillons <strong>en direct</strong>, sans centrale d&rsquo;achat, pour que la valeur revienne aux cr&eacute;ateurs.</p>
      <p>Nous garantissons une r&eacute;mun&eacute;ration juste aux artisans, des conditions de travail dignes et une traceabilit&eacute; compl&egrave;te.</p>

      <h2>2. Moins d&rsquo;emballage, mieux d&rsquo;emballage</h2>
      <ul>
        <li>Cartons <strong>100&nbsp;% recycl&eacute;s et recyclables</strong>&nbsp;;</li>
        <li>Calage en papier kraft ou papier bulle recycl&eacute; (pas de plastique neuf)&nbsp;;</li>
        <li>Adhesif en papier kraft&nbsp;;</li>
        <li>Pas d&rsquo;emballage d&eacute;coratif inutile&nbsp;: c&rsquo;est la pi&egrave;ce qui compte.</li>
      </ul>

      <h2>3. Mat&eacute;riaux durables</h2>
      <p>Nous privil&eacute;gions les mati&egrave;res naturelles&nbsp;: laine, coton, lin, laiton, bois massif, c&eacute;ramique &eacute;maill&eacute;e. Nous &eacute;vitons les placages plastique et les peintures contenant des m&eacute;taux lourds.</p>

      <h2>4. R&eacute;paration plut&ocirc;t que remplacement</h2>
      <p>Une pi&egrave;ce ab&icirc;m&eacute;e&nbsp;? Avant de jeter, nous vous aidons &agrave; la faire r&eacute;parer. Pour les tapis berb&egrave;res, nous travaillons avec une restauratrice sp&eacute;cialis&eacute;e &agrave; Toulouse.</p>

      <h2>5. Local &amp; circuit court quand c&rsquo;est possible</h2>
      <p>Certaines de nos pi&egrave;ces (cadres photo, bougies parfum&eacute;es, savons) sont r&eacute;alis&eacute;es par des artisans de la r&eacute;gion toulousaine. C&rsquo;est indiqu&eacute; par un petit logo &laquo;&nbsp;Occitanie &raquo; sur la fiche produit.</p>

      <h2>6. Transparence</h2>
      <p>Nos marges, nos pays d&rsquo;origine, nos co&ucirc;ts de transport&nbsp;: rien n&rsquo;est cach&eacute;. Posez-nous la question par email, nous r&eacute;pondons.</p>

      <div class="callout"><p>Notre engagement n&rsquo;est pas parfait, il progresse. Chaque ann&eacute;e, nous publions sur notre blog un bilan de ce qui a &eacute;t&eacute; am&eacute;lior&eacute; et de ce qu&rsquo;il reste &agrave; faire.</p></div>
'@

# ==================== PROFESSIONNELS (B2B) ====================
$pro = @'
      <h1>Espace professionnels / B2B</h1>
      <p class="lead">Architectes d&rsquo;int&eacute;rieur, h&ocirc;teliers, restaurateurs, CHR, boutiques&nbsp;: DecoShop vous accompagne pour vos projets d&rsquo;am&eacute;nagement et de d&eacute;coration.</p>

      <h2>Ce que nous proposons</h2>
      <div class="grid2">
        <div class="card">
          <h3>Remises d&eacute;di&eacute;es</h3>
          <p>De -15&nbsp;% &agrave; -30&nbsp;% selon les volumes. Remise automatique applicable sur votre compte pro.</p>
        </div>
        <div class="card">
          <h3>Conseil personnalis&eacute;</h3>
          <p>Un interlocuteur d&eacute;di&eacute;, des moodboards, des &eacute;chantillons livr&eacute;s sur demande.</p>
        </div>
        <div class="card">
          <h3>Commandes sp&eacute;ciales</h3>
          <p>Tapis sur mesure, lanternes en s&eacute;ries, calligraphies personnalis&eacute;es pour les entreprises.</p>
        </div>
        <div class="card">
          <h3>Paiement &agrave; 30 jours</h3>
          <p>Apr&egrave;s validation du dossier pro, paiement par virement &agrave; 30 jours fin de mois.</p>
        </div>
      </div>

      <h2>Ils nous font confiance</h2>
      <ul>
        <li>Plusieurs restaurants orientaux de Toulouse et de la r&eacute;gion (d&eacute;coration de salle, vaisselle, luminaires)&nbsp;;</li>
        <li>Architectes d&rsquo;int&eacute;rieur Haute-Garonne &amp; Tarn (pi&egrave;ces sur mesure)&nbsp;;</li>
        <li>H&ocirc;tels &amp; chambres d&rsquo;h&ocirc;tes de caract&egrave;re&nbsp;;</li>
        <li>Espaces bien-&ecirc;tre &amp; hammams.</li>
      </ul>

      <h2>Demander un devis / ouvrir un compte pro</h2>
      <p>Contactez-nous avec les &eacute;l&eacute;ments suivants&nbsp;:</p>
      <ul>
        <li>Raison sociale et SIRET&nbsp;;</li>
        <li>Secteur d&rsquo;activit&eacute; et description du projet&nbsp;;</li>
        <li>Volume approximatif et d&eacute;lais souhait&eacute;s.</li>
      </ul>

      <form class="contact-form" action="#" method="post" novalidate>
        <div class="row2">
          <div><label for="p-societe">Raison sociale *</label><input id="p-societe" name="societe" required /></div>
          <div><label for="p-siret">SIRET *</label><input id="p-siret" name="siret" required pattern="[0-9 ]{14,17}" /></div>
        </div>
        <div class="row2">
          <div><label for="p-nom">Nom du contact *</label><input id="p-nom" name="nom" required autocomplete="name" /></div>
          <div><label for="p-email">Email *</label><input id="p-email" name="email" type="email" required autocomplete="email" /></div>
        </div>
        <div class="row2">
          <div><label for="p-tel">T&eacute;l&eacute;phone *</label><input id="p-tel" name="tel" type="tel" required autocomplete="tel" /></div>
          <div><label for="p-secteur">Secteur</label>
            <select id="p-secteur" name="secteur">
              <option value="">Choisir&hellip;</option>
              <option>Architecte d&rsquo;int&eacute;rieur</option>
              <option>H&ocirc;tellerie / chambre d&rsquo;h&ocirc;tes</option>
              <option>Restauration / CHR</option>
              <option>Boutique d&eacute;co</option>
              <option>Bien-&ecirc;tre / spa / hammam</option>
              <option>Autre</option>
            </select>
          </div>
        </div>
        <div><label for="p-msg">Votre projet *</label><textarea id="p-msg" name="message" required placeholder="D&eacute;crivez votre besoin, volume et d&eacute;lais&hellip;"></textarea></div>
        <button class="btn btn--primary" type="submit">Envoyer ma demande</button>
      </form>
'@

# ==================== Execution ====================
Make 'cgv' 'Conditions g&eacute;n&eacute;rales de vente' 'Conditions generales de vente de DecoShop Toulouse - paiement, livraison, retours, garanties.' $cgv
Make 'confidentialite' 'Politique de confidentialit&eacute;' 'Politique de confidentialite RGPD de DecoShop Toulouse : donnees collectees, finalites, droits.' $conf
Make 'cookies' 'Politique cookies' 'Politique cookies de DecoShop Toulouse : types de cookies, gestion du consentement, dureees.' $cook
Make 'contact' 'Contact' 'Contactez DecoShop Toulouse - telephone 07 67 27 86 25, email contact@decoshop-toulouse.fr, magasin 58 Rue Jacques Babinet.' $contact
Make 'faq' 'Foire aux questions' 'FAQ DecoShop Toulouse : commandes, paiement, livraison, retours, garanties, magasin.' $faq
Make 'livraison' 'Livraison' 'Livraison DecoShop Toulouse : tarifs, delais, options, retrait gratuit magasin.' $liv
Make 'retours' 'Retours &amp; remboursements' 'Politique de retour et remboursement DecoShop Toulouse : 14 jours, procedure, conditions.' $ret
Make 'suivi' 'Suivi de commande' 'Suivez votre commande DecoShop Toulouse : statuts, numero de suivi, service client.' $suivi
Make 'a-propos' 'Notre histoire' 'A propos de DecoShop Toulouse : histoire, selection, artisans, magasin Rangueil.' $apro
Make 'engagements' 'Nos engagements' 'Engagements de DecoShop Toulouse : artisanat equitable, emballages recycles, materiaux durables.' $eng
Make 'professionnels' 'Espace pro / B2B' 'Espace professionnels DecoShop : remises B2B pour architectes, hoteliers, restaurateurs, boutiques.' $pro

Write-Host "---"
Write-Host ("Pages generees dans: " + $root)
Get-ChildItem $root -Filter *.html | Select Name, @{N='KB';E={[math]::Round($_.Length/1024,1)}} | Format-Table -AutoSize
