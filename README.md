# DecoShop Toulouse — Thématique (HTML/CSS/JS)

Version statique inspirée de la structure `trust-industries` et personnalisée pour **DecoShop** (Toulouse, 31100).

## Lancer en local

Ouvrir `index.html` directement dans le navigateur, ou servir le dossier :

```powershell
# depuis decoshop-thematique/
python -m http.server 5173
# puis http://localhost:5173
```

## Contenu

- `index.html` — Homepage complète (header sticky, mega-menu, hero slideshow, USP, collections, promo Ramadan, grille produits onglets, magasin Toulouse + Google Maps, témoignages, Instagram/TikTok, newsletter, footer légal)
- `assets/css/styles.css` — Charte DecoShop (bleu `#1E3A8A` + jaune `#FACC15`), DM Sans + Playfair Display, responsive
- `assets/js/app.js` — Slideshow, sticky header, mega-menu mobile, onglets produits, add-to-cart UI, reveal scroll, newsletter
- `assets/img/logo.svg` / `logo-mark.svg` — Logo reconstitué en SVG

## SEO implémenté

- `<title>`, `meta description`, `keywords`, `robots`, `canonical`, `hreflang fr-FR`
- Balises Open Graph + Twitter Card
- Geo tags (FR-31, Toulouse, coordonnées)
- **JSON-LD** `Organization`, `LocalBusiness`/`Store`, `WebSite` (SearchAction), `BreadcrumbList`
- Données entreprise réelles : SIRET 912 459 542 00011, 3 Rue Émile Baudot 31100 Toulouse, +33 5 34 51 29 12
- Liens sociaux : Instagram `@decoshoptlse31`, TikTok `@decoshoptoulouse`
- Favicon SVG, alt images, `loading="lazy"`, preconnect polices

## Prochaine étape (après validation)

Conversion vers thème **Shopify Liquid** :
- `layout/theme.liquid`
- `sections/header.liquid`, `hero-slideshow.liquid`, `featured-collections.liquid`, `promo-banner.liquid`, `featured-products.liquid`, `store-locator.liquid`, `testimonials.liquid`, `instagram-feed.liquid`, `newsletter.liquid`, `footer.liquid`
- `snippets/product-card.liquid`, `mega-menu.liquid`, `icon-*.liquid`
- `config/settings_schema.json` + `settings_data.json` (thème customizer)
- `templates/index.json`, `templates/collection.json`, `templates/product.json`, `templates/page.*.json`
- `locales/fr.default.json`
- `assets/styles.css`, `assets/app.js`, `assets/logo.svg`
