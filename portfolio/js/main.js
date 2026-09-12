// ============================================================
// JOYDEB KUMAR PORTFOLIO — INTERACTIVE SCRIPTS
// ============================================================

document.addEventListener('DOMContentLoaded', () => {
  initNavbar();
  initResumeModal();
  initScrollAnimations();
  initParticleCanvas();
});

// ---------- Resume Modal ----------
function initResumeModal() {
  const resumeBtn = document.getElementById('resume-btn');
  const modal = document.getElementById('resume-modal');
  const closeBtn = document.getElementById('close-resume');
  const backdrop = document.getElementById('resume-backdrop');

  if (resumeBtn && modal) {
    resumeBtn.addEventListener('click', () => {
      modal.classList.add('active');
      document.body.style.overflow = 'hidden';
    });

    const closeModal = () => {
      modal.classList.remove('active');
      document.body.style.overflow = '';
    };

    if (closeBtn) closeBtn.addEventListener('click', closeModal);
    if (backdrop) backdrop.addEventListener('click', closeModal);

    window.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && modal.classList.contains('active')) {
        closeModal();
      }
    });
  }
}

// ---------- Navbar & Mobile Drawer ----------
function initNavbar() {
  const nav = document.querySelector('nav');
  const hamburger = document.querySelector('.nav-hamburger');
  const drawer = document.querySelector('.nav-mobile-drawer');
  const drawerLinks = document.querySelectorAll('.nav-mobile-drawer a');

  window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
      nav.classList.add('scrolled');
    } else {
      nav.classList.remove('scrolled');
    }
  });

  if (hamburger && drawer) {
    hamburger.addEventListener('click', () => {
      hamburger.classList.toggle('open');
      drawer.classList.toggle('open');
      document.body.style.overflow = drawer.classList.contains('open') ? 'hidden' : '';
    });

    drawerLinks.forEach(link => {
      link.addEventListener('click', () => {
        hamburger.classList.remove('open');
        drawer.classList.remove('open');
        document.body.style.overflow = '';
      });
    });
  }
}

// ---------- Scroll Reveal Animations & Progress Fill ----------
function initScrollAnimations() {
  const animatedElements = document.querySelectorAll('.fade-in, .fade-in-left, .fade-in-right');

  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible');

          // If language progress bars inside this element, fill them
          const langBars = entry.target.querySelectorAll('.lang-bar-fill');
          langBars.forEach(bar => {
            const width = bar.getAttribute('data-width');
            if (width) bar.style.width = width;
          });
        }
      });
    },
    { threshold: 0.15 }
  );

  animatedElements.forEach(el => observer.observe(el));
}

// ---------- Dynamic Particle Canvas Background ----------
function initParticleCanvas() {
  const canvas = document.getElementById('particles-canvas');
  if (!canvas) return;

  const ctx = canvas.getContext('2d');
  let width = (canvas.width = window.innerWidth);
  let height = (canvas.height = window.innerHeight);

  window.addEventListener('resize', () => {
    width = canvas.width = window.innerWidth;
    height = canvas.height = window.innerHeight;
  });

  const particleCount = 45;
  const particles = [];

  for (let i = 0; i < particleCount; i++) {
    particles.push({
      x: Math.random() * width,
      y: Math.random() * height,
      vx: (Math.random() - 0.5) * 0.4,
      vy: (Math.random() - 0.5) * 0.4,
      radius: Math.random() * 2 + 1,
      color: i % 2 === 0 ? 'rgba(79, 142, 247, ' : 'rgba(139, 92, 246, ',
      alpha: Math.random() * 0.5 + 0.1,
    });
  }

  function render() {
    ctx.clearRect(0, 0, width, height);

    for (let i = 0; i < particles.length; i++) {
      const p = particles[i];
      p.x += p.vx;
      p.y += p.vy;

      if (p.x < 0) p.x = width;
      if (p.x > width) p.x = 0;
      if (p.y < 0) p.y = height;
      if (p.y > height) p.y = 0;

      ctx.beginPath();
      ctx.arc(p.x, p.y, p.radius, 0, Math.PI * 2);
      ctx.fillStyle = `${p.color}${p.alpha})`;
      ctx.fill();

      // Connect near particles
      for (let j = i + 1; j < particles.length; j++) {
        const p2 = particles[j];
        const dx = p.x - p2.x;
        const dy = p.y - p2.y;
        const dist = Math.sqrt(dx * dx + dy * dy);

        if (dist < 100) {
          ctx.beginPath();
          ctx.strokeStyle = `rgba(79, 142, 247, ${0.1 * (1 - dist / 100)})`;
          ctx.lineWidth = 0.6;
          ctx.moveTo(p.x, p.y);
          ctx.lineTo(p2.x, p2.y);
          ctx.stroke();
        }
      }
    }

    requestAnimationFrame(render);
  }

  render();
}
