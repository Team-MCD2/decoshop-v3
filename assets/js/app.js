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

  // ===== Add to cart (UI only) =====
  const cartCount = document.querySelector('.cart-count');
  let count = 0;
  document.querySelectorAll('.pcard__add').forEach((btn) =>
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      count++;
      if (cartCount) {
        cartCount.textContent = count;
        cartCount.hidden = false;
        cartCount.animate(
          [{ transform: 'scale(1)' }, { transform: 'scale(1.4)' }, { transform: 'scale(1)' }],
          { duration: 350, easing: 'ease-out' }
        );
      }
      btn.innerHTML = '<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12l5 5L20 7"/></svg> Ajouté !';
      setTimeout(() => (btn.innerHTML = btn.dataset.label || 'Ajouter au panier'), 1600);
    })
  );

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
})();
