import type { ProjectItem } from '@/types/portfolio'

export const projects: ProjectItem[] = [
  {
    slug: 'covid-portal-bogor',
    title: {
      id: 'Portal COVID-19 Kota Bogor',
      en: 'Bogor City COVID-19 Portal',
    },
    description: {
      id: 'Portal informasi publik prioritas tinggi untuk pembaruan data dan edukasi warga.',
      en: 'High-priority public information portal for data updates and citizen education.',
    },
    context: {
      id: 'Dinas membutuhkan kanal resmi untuk menyampaikan data dan informasi COVID-19 secara cepat dan akurat.',
      en: 'The agency needed an official channel to deliver COVID-19 data and information quickly and accurately.',
    },
    role: {
      id: 'Pengembangan fitur, pembaruan konten harian, dan perawatan website produksi.',
      en: 'Feature development, daily content updates, and production website maintenance.',
    },
    outcome: {
      id: 'Portal aktif digunakan publik dengan alur update konten yang terstruktur dan tampilan mobile-friendly.',
      en: 'Portal actively used by the public with structured content updates and a mobile-friendly layout.',
    },
    imageUrl: '/projects/covid-portal.svg',
    url: null,
    stack: ['Vue.js', 'Laravel', 'MySQL', 'JavaScript'],
    status: 'completed',
    screenshots: [
      {
        url: '/projects/covid-portal/screenshot-1.svg',
        caption: { id: 'Halaman utama portal informasi', en: 'Portal information homepage' },
      },
      {
        url: '/projects/covid-portal/screenshot-2.svg',
        caption: { id: 'Dashboard data harian', en: 'Daily data dashboard' },
      },
      {
        url: '/projects/covid-portal/screenshot-3.svg',
        caption: { id: 'Tampilan mobile responsif', en: 'Responsive mobile view' },
      },
    ],
  },
  {
    slug: 'diskominfo-websites',
    title: {
      id: 'Website Pemerintahan Diskominfo',
      en: 'Diskominfo Government Websites',
    },
    description: {
      id: 'Serangkaian website instansi pemerintah daerah dengan fitur publikasi dan layanan digital.',
      en: 'A series of local government agency websites with publishing and digital service features.',
    },
    context: {
      id: 'Beberapa dinas memerlukan website resmi dengan kemampuan publikasi berita dan formulir layanan.',
      en: 'Multiple departments needed official websites with news publishing and service forms.',
    },
    role: {
      id: 'Full-stack development — struktur halaman, backend PHP, dan integrasi database.',
      en: 'Full-stack development — page structure, PHP backend, and database integration.',
    },
    outcome: {
      id: 'Website responsif diluncurkan sesuai kebutuhan masing-masing dinas dengan modul yang dapat dikembangkan.',
      en: 'Responsive websites launched per department needs with extensible modules.',
    },
    imageUrl: '/projects/government.svg',
    url: null,
    stack: ['Vue.js', 'Laravel', 'CodeIgniter', 'MySQL'],
    status: 'completed',
    screenshots: [
      {
        url: '/projects/government/screenshot-1.svg',
        caption: { id: 'Beranda instansi pemerintah', en: 'Government agency homepage' },
      },
      {
        url: '/projects/government/screenshot-2.svg',
        caption: { id: 'Halaman berita & publikasi', en: 'News & publishing page' },
      },
      {
        url: '/projects/government/screenshot-3.svg',
        caption: { id: 'Formulir layanan masyarakat', en: 'Public service form' },
      },
    ],
  },
  {
    slug: 'corporate-client-websites',
    title: {
      id: 'Website Korporat & Klien',
      en: 'Corporate & Client Websites',
    },
    description: {
      id: 'Website perusahaan dan proyek klien dengan kebutuhan admin panel dan integrasi API.',
      en: 'Company and client websites with admin panel and API integration requirements.',
    },
    context: {
      id: 'Perusahaan dan klien membutuhkan website yang dapat dikelola mandiri tanpa menyentuh kode.',
      en: 'Companies and clients needed websites they could manage without touching code.',
    },
    role: {
      id: 'Arsitektur Laravel, pengembangan modul CMS ringan, dan deployment ke server produksi.',
      en: 'Laravel architecture, lightweight CMS module development, and production server deployment.',
    },
    outcome: {
      id: 'Tim klien dapat mengelola konten sendiri; formulir dan data terintegrasi ke backend secara aman.',
      en: 'Client teams can manage their own content; forms and data integrate securely with the backend.',
    },
    imageUrl: '/projects/corporate.svg',
    url: null,
    stack: ['Vue.js', 'Laravel', 'REST API', 'MySQL'],
    status: 'completed',
    screenshots: [
      {
        url: '/projects/corporate/screenshot-1.svg',
        caption: { id: 'Landing page perusahaan', en: 'Corporate landing page' },
      },
      {
        url: '/projects/corporate/screenshot-2.svg',
        caption: { id: 'Panel admin CMS', en: 'CMS admin panel' },
      },
      {
        url: '/projects/corporate/screenshot-3.svg',
        caption: { id: 'Manajemen konten & formulir', en: 'Content & form management' },
      },
    ],
  },
  {
    slug: 'webprofile-portfolio',
    title: {
      id: 'WebProfile — Portfolio Pribadi',
      en: 'WebProfile — Personal Portfolio',
    },
    description: {
      id: 'Website CV & portfolio modern sebagai showcase kemampuan front-end terkini.',
      en: 'Modern CV & portfolio website showcasing current front-end capabilities.',
    },
    context: {
      id: 'Membutuhkan profil online profesional yang mencerminkan skill terbaru di luar stack PHP tradisional.',
      en: 'Needed a professional online profile reflecting newer skills beyond the traditional PHP stack.',
    },
    role: {
      id: 'Desain UI, implementasi Vue 3 + Tailwind, i18n dwibahasa, dan optimasi performa.',
      en: 'UI design, Vue 3 + Tailwind implementation, bilingual i18n, and performance optimization.',
    },
    outcome: {
      id: 'Single-page portfolio responsif dengan dark mode, animasi halus, dan siap di-deploy statis.',
      en: 'Responsive single-page portfolio with dark mode, subtle animations, and static deploy readiness.',
    },
    imageUrl: '/projects/portfolio.svg',
    url: 'https://github.com/ahmdfadilah7',
    stack: ['Vue 3', 'Vite', 'Tailwind', 'TypeScript'],
    status: 'in_progress',
    screenshots: [
      {
        url: '/projects/portfolio/screenshot-1.svg',
        caption: { id: 'Hero & navigasi utama', en: 'Hero & main navigation' },
      },
      {
        url: '/projects/portfolio/screenshot-2.svg',
        caption: { id: 'Section keahlian & pengalaman', en: 'Skills & experience sections' },
      },
      {
        url: '/projects/portfolio/screenshot-3.svg',
        caption: { id: 'Halaman detail proyek', en: 'Project detail page' },
      },
    ],
  },
]

export function getProjectBySlug(slug: string): ProjectItem | undefined {
  return projects.find((project) => project.slug === slug)
}
