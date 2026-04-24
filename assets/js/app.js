/* ============================================================
   DecoShop — front JS
   Slideshow • sticky header • mega-menu mobile • drawers
   Newsletter UX • back-to-top • cart count • tabs
   ============================================================ */
(function () {
  'use strict';

  // ===== Sticky header shadow =====
  const header = document.querySelector('.header');
  const onScroll = () => {
    if (!header) return;
    header.classList.toggle('is-scrolled', window.scrollY > 8);
    const topBtn = document.querySelector('.to-top');
    if (topBtn) topBtn.classList.toggle('is-visible', window.scrollY > 400);
  };
  window.addEventListener('scroll', onScroll, { passive: true });
  onScroll();

  // ===== Back to top =====
  document.querySelector('.to-top')?.addEventListener('click', () =>
    window.scrollTo({ top: 0, behavior: 'smooth' })
  );

  // ===== Mobile menu =====
  const nav = document.querySelector('.nav');
  const menuToggle = document.querySelector('.menu-toggle');
  menuToggle?.addEventListener('click', () => {
    nav?.classList.toggle('is-open');
    document.body.style.overflow = nav?.classList.contains('is-open') ? 'hidden' : '';
  });
  // mobile mega toggle
  document.querySelectorAll('.nav__item').forEach((item) => {
    const link = item.querySelector('.nav__link');
    link?.addEventListener('click', (e) => {
      if (window.innerWidth > 860) return;
      if (!item.querySelector('.mega')) return;
      e.preventDefault();
      item.classList.toggle('is-open');
    });
  });

  // ===== Hero slideshow =====
  const hero = document.querySelector('[data-slideshow]');
  if (hero) {
    const track = hero.querySelector('.hero__slides');
    const slides = [...hero.querySelectorAll('.hero__slide')];
    const dotsWrap = hero.querySelector('.hero__nav');
    const prev = hero.querySelector('.hero__arrow--prev');
    const next = hero.querySelector('.hero__arrow--next');
    let idx = 0;
    let timer;

    slides.forEach((_, i) => {
      const b = document.createElement('button');
      b.className = 'hero__dot';
      b.setAttribute('aria-label', `Diapositive ${i + 1}`);
      b.addEventListener('click', () => go(i));
      dotsWrap.appendChild(b);
    });

    const dots = [...dotsWrap.children];
    function go(i) {
      idx = (i + slides.length) % slides.length;
      track.style.transform = `translateX(-${idx * 100}%)`;
      dots.forEach((d, n) => d.classList.toggle('is-active', n === idx));
      slides.forEach((s, n) => s.classList.toggle('is-active', n === idx));
      resetTimer();
    }
    function resetTimer() {
      clearInterval(timer);
      timer = setInterval(() => go(idx + 1), 6000);
    }
    prev?.addEventListener('click', () => go(idx - 1));
    next?.addEventListener('click', () => go(idx + 1));
    hero.addEventListener('mouseenter', () => clearInterval(timer));
    hero.addEventListener('mouseleave', resetTimer);
    // touch
    let x0 = null;
    hero.addEventListener('touchstart', (e) => (x0 = e.touches[0].clientX), { passive: true });
    hero.addEventListener('touchend', (e) => {
      if (x0 === null) return;
      const dx = e.changedTouches[0].clientX - x0;
      if (Math.abs(dx) > 40) go(idx + (dx < 0 ? 1 : -1));
      x0 = null;
    });
    go(0);
  }

  // ===== Tabs (best sellers / new) =====
  document.querySelectorAll('[data-tabs]').forEach((group) => {
    const tabs = group.querySelectorAll('.tab');
    const panels = group.querySelectorAll('[data-panel]');
    tabs.forEach((tab) =>
      tab.addEventListener('click', () => {
        tabs.forEach((t) => t.classList.remove('is-active'));
        tab.classList.add('is-active');
        const k = tab.dataset.tab;
        panels.forEach((p) => p.toggleAttribute('hidden', p.dataset.panel !== k));
      })
    );
  });

  // (Add-to-cart logic moved to the Wishlist + Cart module below — event-delegated + localStorage)

  // ===== Newsletter fake submit =====
  document.querySelector('.newsletter__form')?.addEventListener('submit', (e) => {
    e.preventDefault();
    const form = e.currentTarget;
    const input = form.querySelector('input');
    if (!input.value || !input.checkValidity()) {
      input.focus();
      return;
    }
    form.innerHTML = '<div style="padding:1rem;font-weight:600">Merci ! Votre code promo arrive dans votre boîte mail. ✉️</div>';
  });

  // ===== Reveal on scroll =====
  const io = new IntersectionObserver(
    (entries) =>
      entries.forEach((e) => {
        if (e.isIntersecting) {
          e.target.style.opacity = '1';
          e.target.style.transform = 'translateY(0)';
          io.unobserve(e.target);
        }
      }),
    { threshold: 0.08 }
  );
  document.querySelectorAll('[data-reveal]').forEach((el) => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(20px)';
    el.style.transition = 'opacity .7s ease, transform .7s ease';
    io.observe(el);
  });

  // year in footer
  const y = document.getElementById('year');
  if (y) y.textContent = new Date().getFullYear();

  // ===== TikTok videos : mute toggle + pause off-screen =====
  const rsVideos = document.querySelectorAll('[data-rs-video]');
  if (rsVideos.length) {
    // Unmute on click of the mute button; clicking a video also toggles mute
    document.querySelectorAll('.rs-card__mute').forEach((btn) => {
      btn.addEventListener('click', (e) => {
        e.preventDefault();
        e.stopPropagation();
        const card = btn.closest('.rs-card');
        const video = card?.querySelector('video');
        if (!video) return;
        // Mute all other videos first (avoid audio cacophony)
        if (video.muted) {
          rsVideos.forEach((v) => { v.muted = true; });
          document.querySelectorAll('.rs-card__mute').forEach((b) => b.setAttribute('aria-pressed', 'false'));
          video.muted = false;
          video.volume = 1;
          btn.setAttribute('aria-pressed', 'true');
          video.play().catch(() => {});
        } else {
          video.muted = true;
          btn.setAttribute('aria-pressed', 'false');
        }
      });
    });
    // Pause videos out of viewport to save CPU/battery
    const vObserver = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          const v = entry.target;
          if (entry.isIntersecting) v.play().catch(() => {});
          else v.pause();
        });
      },
      { rootMargin: '200px 0px' }
    );
    rsVideos.forEach((v) => vObserver.observe(v));
  }

  // ===== Custom cursor (DISABLED - removed per user request) =====
  const cursor = null;
  if (false) {
    const ring = cursor.querySelector('.ds-cursor__ring');
    const dot = cursor.querySelector('.ds-cursor__dot');
    let mx = -100, my = -100, rx = -100, ry = -100;
    document.addEventListener('mousemove', (e) => {
      mx = e.clientX;
      my = e.clientY;
      dot.style.transform = `translate3d(${mx}px, ${my}px, 0)`;
    });
    // smooth-follow ring
    (function loop() {
      rx += (mx - rx) * 0.18;
      ry += (my - ry) * 0.18;
      ring.style.transform = `translate3d(${rx}px, ${ry}px, 0)`;
      requestAnimationFrame(loop);
    })();
    // hover state on interactive elements
    const hoverSel = 'a, button, [role="button"], .pcard, .collection-card, .mega__tile, .hero__dot, .hero__arrow, .tab, label, summary, .review-more';
    document.addEventListener('mouseover', (e) => {
      if (e.target.closest(hoverSel)) cursor.classList.add('is-hover');
      if (e.target.matches('input[type="text"],input[type="email"],input[type="search"],textarea')) cursor.classList.add('is-text');
    });
    document.addEventListener('mouseout', (e) => {
      if (e.target.closest(hoverSel)) cursor.classList.remove('is-hover');
      if (e.target.matches('input[type="text"],input[type="email"],input[type="search"],textarea')) cursor.classList.remove('is-text');
    });
    document.addEventListener('mousedown', () => cursor.classList.add('is-click'));
    document.addEventListener('mouseup', () => cursor.classList.remove('is-click'));
    document.addEventListener('mouseleave', () => cursor.style.opacity = '0');
    document.addEventListener('mouseenter', () => cursor.style.opacity = '1');
  }

  // ===== Reviews slider =====
  const reviewsTrack = document.getElementById('reviewsTrack');
  if (reviewsTrack) {
    const step = () => Math.max(260, reviewsTrack.querySelector('.review-card')?.offsetWidth || 280) + 18;
    document.querySelector('.reviews-arrow--prev')?.addEventListener('click', () => reviewsTrack.scrollBy({ left: -step(), behavior: 'smooth' }));
    document.querySelector('.reviews-arrow--next')?.addEventListener('click', () => reviewsTrack.scrollBy({ left: step(), behavior: 'smooth' }));
    // "Lire la suite" toggles card expand
    reviewsTrack.querySelectorAll('.review-more').forEach((btn) =>
      btn.addEventListener('click', () => {
        const card = btn.closest('.review-card');
        const open = card.classList.toggle('is-open');
        btn.textContent = open ? 'Réduire' : 'Lire la suite';
      })
    );
  }

  // ===== Image fallback: switch to a different real photo on error (NO SVG) =====
  // If the primary image fails, try picsum.photos with a random seed (real photo)
  document.querySelectorAll('img').forEach((img) => {
    img.addEventListener('error', function () {
      if (this.dataset.retry === '2') return;
      const attempt = (this.dataset.retry || '0') === '0' ? 1 : 2;
      this.dataset.retry = String(attempt);
      const seed = (this.alt || 'decoshop').replace(/\s+/g, '-').toLowerCase() + '-' + attempt;
      this.src = `https://picsum.photos/seed/${encodeURIComponent(seed)}/1200/800`;
    });
  });

  // ============================================================
  // Wishlist + Cart (persistent, localStorage, page-agnostic)
  // ============================================================
  const STORAGE = { favs: 'decoshop:favs:v1', cart: 'decoshop:cart:v1' };

  const slugify = (s) =>
    (s || '').toString().toLowerCase()
      .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/(^-|-$)/g, '')
      .slice(0, 80);

  const readJSON = (key, fb) => {
    try { const v = JSON.parse(localStorage.getItem(key)); return v == null ? fb : v; }
    catch { return fb; }
  };
  const writeJSON = (key, val) => { try { localStorage.setItem(key, JSON.stringify(val)); } catch {} };

  const getFavs = () => readJSON(STORAGE.favs, []);
  const setFavs = (v) => writeJSON(STORAGE.favs, v);
  const getCart = () => readJSON(STORAGE.cart, []);
  const setCart = (v) => writeJSON(STORAGE.cart, v);

  const escapeHtml = (s) =>
    (s || '').replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));

  const formatEUR = (n) => (Math.round(n * 100) / 100).toFixed(2).replace('.', ',') + ' €';

  // Detect relative prefix for cross-page links (index vs /pages vs /collections)
  const isNested = /\/(pages|collections)\//i.test(location.pathname);
  const PREFIX = isNested ? '../' : '';

  // Extract product data from a .pcard element
  function productFromCard(cardEl) {
    if (!cardEl) return null;
    const title = (cardEl.querySelector('.pcard__title')?.textContent || '').trim();
    if (!title) return null;
    const handle = slugify(title);
    const img = cardEl.querySelector('.pcard__media img');
    const image = img?.currentSrc || img?.src || '';
    const priceEl = cardEl.querySelector('.pcard__price .price');
    const priceText = (priceEl?.textContent || '').trim();
    const dataPrice = cardEl.dataset.price || '';
    const numeric = (dataPrice || priceText).replace(/\u00A0/g, ' ').replace(/[^\d,.\-]/g, '').replace(',', '.');
    const price = parseFloat(numeric) || 0;
    const cat = (cardEl.querySelector('.pcard__cat')?.textContent || '').trim();
    const mediaLink = cardEl.querySelector('.pcard__media');
    const href = mediaLink?.getAttribute('href') || '#';
    return { handle, title, image, price, priceText, cat, href };
  }

  // ---------- Header: inject favorites icon ----------
  function injectFavHeaderIcon() {
    document.querySelectorAll('.header__actions').forEach((actions) => {
      if (actions.querySelector('[data-fav-header]')) return;
      const cartIcon = actions.querySelector('a[aria-label="Panier"]');
      const a = document.createElement('a');
      a.className = 'header__icon';
      a.href = PREFIX + 'pages/favoris.html';
      a.setAttribute('aria-label', 'Mes favoris');
      a.setAttribute('data-fav-header', '');
      a.innerHTML =
        '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">' +
        '<path d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.6l-1-1a5.5 5.5 0 0 0-7.8 7.8L12 21l8.8-8.6a5.5 5.5 0 0 0 0-7.8z"/>' +
        '</svg>' +
        '<span>Favoris</span>' +
        '<span class="fav-count" hidden>0</span>';
      if (cartIcon) actions.insertBefore(a, cartIcon);
      else actions.appendChild(a);
    });
  }

  function updateFavBadge() {
    const n = getFavs().length;
    document.querySelectorAll('.fav-count').forEach((el) => {
      el.textContent = String(n);
      el.hidden = n === 0;
    });
    // Reflect favorite state on all product cards currently in the DOM
    const set = new Set(getFavs().map((f) => f.handle));
    document.querySelectorAll('.pcard').forEach((card) => {
      const btn = card.querySelector('.pcard__fav');
      if (!btn) return;
      const p = productFromCard(card);
      if (!p) return;
      const active = set.has(p.handle);
      btn.classList.toggle('is-active', active);
      btn.setAttribute('aria-pressed', active ? 'true' : 'false');
      btn.setAttribute('aria-label', active ? 'Retirer des favoris' : 'Ajouter aux favoris');
    });
  }

  // ---------- Cart drawer ----------
  function injectCartDrawer() {
    if (document.getElementById('cartDrawer')) return;
    const drawer = document.createElement('div');
    drawer.id = 'cartDrawer';
    drawer.className = 'drawer';
    drawer.setAttribute('aria-hidden', 'true');
    drawer.innerHTML =
      '<div class="drawer__backdrop" data-drawer-close></div>' +
      '<aside class="drawer__panel" role="dialog" aria-label="Panier" aria-modal="true">' +
        '<header class="drawer__head">' +
          '<h3 class="drawer__title">Mon panier <span class="drawer__count" id="drawerCount">0</span></h3>' +
          '<button class="drawer__close" data-drawer-close aria-label="Fermer">' +
            '<svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"><path d="M6 6l12 12M18 6L6 18"/></svg>' +
          '</button>' +
        '</header>' +
        '<div class="drawer__body" id="drawerBody"></div>' +
        '<footer class="drawer__foot" id="drawerFoot" hidden>' +
          '<div class="drawer__subtotal"><span>Sous-total</span><strong id="drawerTotal">0,00 €</strong></div>' +
          '<p class="drawer__ship">Livraison offerte dès 69 € • Paiement 3× sans frais dès 100 €</p>' +
          '<button class="btn btn--primary" id="drawerCheckout" type="button">Commander</button>' +
          '<button class="btn btn--ghost btn--sm" data-drawer-close type="button">Continuer mes achats</button>' +
        '</footer>' +
      '</aside>';
    document.body.appendChild(drawer);
  }

  function openDrawer() {
    const d = document.getElementById('cartDrawer');
    if (!d) return;
    renderDrawer();
    requestAnimationFrame(() => {
      d.classList.add('is-open');
      d.setAttribute('aria-hidden', 'false');
      document.body.style.overflow = 'hidden';
    });
  }
  function closeDrawer() {
    const d = document.getElementById('cartDrawer');
    if (!d) return;
    d.classList.remove('is-open');
    d.setAttribute('aria-hidden', 'true');
    document.body.style.overflow = '';
  }

  function renderDrawer() {
    const body = document.getElementById('drawerBody');
    const foot = document.getElementById('drawerFoot');
    const countEl = document.getElementById('drawerCount');
    const totalEl = document.getElementById('drawerTotal');
    if (!body) return;
    const cart = getCart();
    const totalQty = cart.reduce((s, it) => s + it.qty, 0);
    if (countEl) countEl.textContent = String(totalQty);

    if (cart.length === 0) {
      body.innerHTML =
        '<div class="drawer__empty">' +
          '<svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M3 7h18l-1.5 12.5a1.5 1.5 0 0 1-1.5 1.3H6a1.5 1.5 0 0 1-1.5-1.3L3 7z"/><path d="M8 7V5.5A4 4 0 0 1 16 5.5V7"/></svg>' +
          '<p><strong>Votre panier est vide.</strong></p>' +
          '<p>Parcourez nos collections pour y ajouter vos coups de cœur.</p>' +
          '<a class="btn btn--primary btn--sm" href="' + PREFIX + 'collections/nouveautes.html">Voir les nouveautés</a>' +
        '</div>';
      if (foot) foot.hidden = true;
      return;
    }

    body.innerHTML = cart.map((it) =>
      '<article class="mini-cart__item" data-handle="' + escapeHtml(it.handle) + '">' +
        '<img src="' + escapeHtml(it.image) + '" alt="' + escapeHtml(it.title) + '" loading="lazy" />' +
        '<div class="mini-cart__info">' +
          (it.cat ? '<div class="mini-cart__cat">' + escapeHtml(it.cat) + '</div>' : '') +
          '<div class="mini-cart__title">' + escapeHtml(it.title) + '</div>' +
          '<div class="mini-cart__price">' + formatEUR(it.price * it.qty) + '</div>' +
          '<div class="mini-cart__controls">' +
            '<div class="mini-cart__qty">' +
              '<button class="qty-btn" data-qty="-1" type="button" aria-label="Diminuer la quantité">−</button>' +
              '<span class="qty-val">' + it.qty + '</span>' +
              '<button class="qty-btn" data-qty="1" type="button" aria-label="Augmenter la quantité">+</button>' +
            '</div>' +
            '<button class="mini-cart__remove" data-remove type="button" aria-label="Retirer du panier">' +
              '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18M8 6V4h8v2"/><path d="M19 6l-1.2 14a2 2 0 0 1-2 1.8H8.2a2 2 0 0 1-2-1.8L5 6"/><path d="M10 10v7M14 10v7"/></svg>' +
            '</button>' +
          '</div>' +
        '</div>' +
      '</article>'
    ).join('');

    const subtotal = cart.reduce((s, it) => s + it.price * it.qty, 0);
    if (totalEl) totalEl.textContent = formatEUR(subtotal);
    if (foot) foot.hidden = false;
  }

  function updateCartBadge(pulse) {
    const n = getCart().reduce((s, it) => s + it.qty, 0);
    document.querySelectorAll('.cart-count').forEach((el) => {
      el.textContent = String(n);
      el.hidden = n === 0;
      if (pulse && n > 0 && el.animate) {
        el.animate(
          [{ transform: 'scale(1)' }, { transform: 'scale(1.4)' }, { transform: 'scale(1)' }],
          { duration: 350, easing: 'ease-out' }
        );
      }
    });
  }

  // ---------- Toast ----------
  let toastTimer = null;
  function showToast(msg) {
    let t = document.getElementById('toast');
    if (!t) {
      t = document.createElement('div');
      t.id = 'toast';
      t.className = 'toast';
      t.setAttribute('role', 'status');
      t.setAttribute('aria-live', 'polite');
      document.body.appendChild(t);
    }
    t.textContent = msg;
    t.classList.add('is-visible');
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => t.classList.remove('is-visible'), 2600);
  }

  // ---------- Favorites page (auto-render if on favoris.html) ----------
  function renderFavoritesPage() {
    const list = document.getElementById('favsList');
    if (!list) return;
    const empty = document.getElementById('favsEmpty');
    const countEl = document.getElementById('favsCount');
    const favs = getFavs();
    if (countEl) countEl.textContent = String(favs.length);
    if (!favs.length) {
      list.innerHTML = '';
      if (empty) empty.hidden = false;
      return;
    }
    if (empty) empty.hidden = true;
    list.innerHTML = favs.map((p) =>
      '<article class="pcard" data-price="' + escapeHtml((p.price || 0).toString().replace('.', ',')) + '">' +
        '<a class="pcard__media" href="' + escapeHtml(p.href || '#') + '" aria-label="' + escapeHtml(p.title) + '">' +
          '<img src="' + escapeHtml(p.image) + '" alt="' + escapeHtml(p.title) + '" loading="lazy" />' +
        '</a>' +
        '<button class="pcard__fav is-active" aria-label="Retirer des favoris" aria-pressed="true">' +
          '<svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.6l-1-1a5.5 5.5 0 0 0-7.8 7.8L12 21l8.8-8.6a5.5 5.5 0 0 0 0-7.8z"/></svg>' +
        '</button>' +
        '<div class="pcard__body">' +
          (p.cat ? '<span class="pcard__cat">' + escapeHtml(p.cat) + '</span>' : '') +
          '<h3 class="pcard__title">' + escapeHtml(p.title) + '</h3>' +
          '<div class="pcard__price"><span class="price">' + escapeHtml(p.priceText || formatEUR(p.price || 0)) + '</span></div>' +
          '<button class="pcard__add" data-label="Ajouter au panier" type="button">Ajouter au panier</button>' +
        '</div>' +
      '</article>'
    ).join('');
  }

  // ---------- Event wiring (delegation — works on static + dynamic cards) ----------
  document.addEventListener('click', (e) => {
    // Open cart drawer
    const cartLink = e.target.closest('a[aria-label="Panier"]');
    if (cartLink) {
      e.preventDefault();
      openDrawer();
      return;
    }

    // Drawer close triggers
    if (e.target.closest('[data-drawer-close]')) {
      closeDrawer();
      return;
    }

    // Drawer checkout
    if (e.target.closest('#drawerCheckout')) {
      if (!getCart().length) return;
      setCart([]);
      renderDrawer();
      updateCartBadge();
      showToast('Merci ! Votre commande a été enregistrée. Nous vous contactons sous 24 h.');
      closeDrawer();
      return;
    }

    // Drawer qty +/-
    const qtyBtn = e.target.closest('[data-qty]');
    if (qtyBtn) {
      const item = qtyBtn.closest('[data-handle]');
      if (!item) return;
      const handle = item.dataset.handle;
      const delta = parseInt(qtyBtn.dataset.qty, 10) || 0;
      const cart = getCart();
      const it = cart.find((x) => x.handle === handle);
      if (!it) return;
      it.qty = Math.max(0, it.qty + delta);
      const nc = cart.filter((x) => x.qty > 0);
      setCart(nc);
      renderDrawer();
      updateCartBadge();
      return;
    }

    // Drawer remove item
    const rmBtn = e.target.closest('[data-remove]');
    if (rmBtn) {
      const item = rmBtn.closest('[data-handle]');
      if (!item) return;
      setCart(getCart().filter((x) => x.handle !== item.dataset.handle));
      renderDrawer();
      updateCartBadge();
      return;
    }

    // Favorite toggle
    const favBtn = e.target.closest('.pcard__fav');
    if (favBtn) {
      e.preventDefault();
      const card = favBtn.closest('.pcard');
      const p = productFromCard(card);
      if (!p) return;
      const favs = getFavs();
      const i = favs.findIndex((f) => f.handle === p.handle);
      if (i === -1) {
        favs.unshift(p);
        setFavs(favs);
        showToast('Ajouté aux favoris');
      } else {
        favs.splice(i, 1);
        setFavs(favs);
        showToast('Retiré des favoris');
      }
      updateFavBadge();
      renderFavoritesPage();
      return;
    }

    // Add to cart
    const addBtn = e.target.closest('.pcard__add');
    if (addBtn) {
      e.preventDefault();
      const card = addBtn.closest('.pcard');
      const p = productFromCard(card);
      if (!p) return;
      const cart = getCart();
      const existing = cart.find((x) => x.handle === p.handle);
      if (existing) existing.qty += 1;
      else cart.push({ ...p, qty: 1 });
      setCart(cart);
      updateCartBadge(true);
      showToast('Ajouté au panier : ' + p.title);
      // Button visual feedback
      if (!addBtn.dataset.label) addBtn.dataset.label = addBtn.textContent.trim() || 'Ajouter au panier';
      const original = addBtn.dataset.label;
      addBtn.innerHTML = '<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12l5 5L20 7"/></svg> Ajouté !';
      clearTimeout(addBtn._restore);
      addBtn._restore = setTimeout(() => { addBtn.innerHTML = original; }, 1400);
      return;
    }
  });

  // Keyboard: ESC closes drawer
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') closeDrawer();
  });

  // Sync across tabs
  window.addEventListener('storage', (e) => {
    if (e.key === STORAGE.favs) { updateFavBadge(); renderFavoritesPage(); }
    if (e.key === STORAGE.cart) { updateCartBadge(); renderDrawer(); }
  });

  // Boot
  injectFavHeaderIcon();
  injectCartDrawer();
  updateFavBadge();
  updateCartBadge();
  renderFavoritesPage();
})();
