import type { ExperienceItem } from '@/types/portfolio'

const sharedTags = ['Vue.js', 'Laravel', 'CodeIgniter', 'MySQL', 'REST API']

export const experience: ExperienceItem[] = [
  {
    company: 'CV. Solution Intan Prima',
    role: { id: 'Web Developer', en: 'Web Developer' },
    period: { id: 'Mar 2023 — Apr 2025', en: 'Mar 2023 — Apr 2025' },
    description: {
      id: 'Bogor — mengembangkan website internal dan proyek klien dengan stack Vue.js, Laravel, dan CodeIgniter sesuai kebutuhan proyek.',
      en: 'Bogor — developing internal and client websites with Vue.js, Laravel, and CodeIgniter depending on project requirements.',
    },
    bullets: [
      {
        id: 'Membangun antarmuka interaktif dengan Vue.js yang terhubung ke API Laravel untuk modul konten dinamis dan panel admin.',
        en: 'Built interactive Vue.js frontends connected to Laravel APIs for dynamic content modules and admin panels.',
      },
      {
        id: 'Memelihara dan mengembangkan aplikasi legacy berbasis CodeIgniter untuk sistem internal yang masih aktif.',
        en: 'Maintained and extended legacy CodeIgniter applications for active internal systems.',
      },
      {
        id: 'Mengintegrasikan REST API, optimasi query database, dan deployment ke lingkungan produksi.',
        en: 'Integrated REST APIs, optimized database queries, and deployed to production environments.',
      },
    ],
    tags: sharedTags,
  },
  {
    company: 'PT. Netsindo Intermedia Etrade',
    role: { id: 'Web Developer', en: 'Web Developer' },
    period: { id: 'Agu 2021 — Mar 2023', en: 'Aug 2021 — Mar 2023' },
    description: {
      id: 'Bogor — mengerjakan website operasional perusahaan menggunakan Vue.js, Laravel, dan CodeIgniter untuk kebutuhan bisnis internal dan klien.',
      en: 'Bogor — delivering operational company websites using Vue.js, Laravel, and CodeIgniter for internal business and client needs.',
    },
    bullets: [
      {
        id: 'Mengembangkan dashboard dan fitur laporan dengan Vue.js di frontend dan Laravel/CodeIgniter di backend.',
        en: 'Developed dashboards and reporting features with Vue.js on the frontend and Laravel/CodeIgniter on the backend.',
      },
      {
        id: 'Membangun modul formulir digital dengan validasi server-side dan integrasi database MySQL.',
        en: 'Built digital form modules with server-side validation and MySQL database integration.',
      },
      {
        id: 'Berkolaborasi dengan tim non-teknis untuk menerjemahkan kebutuhan bisnis menjadi fitur web yang usable.',
        en: 'Collaborated with non-technical teams to translate business needs into usable web features.',
      },
    ],
    tags: sharedTags,
  },
  {
    company: 'Diskominfo Kota Bogor',
    role: { id: 'Web Developer', en: 'Web Developer' },
    period: { id: 'Agu 2020 — Agu 2021', en: 'Aug 2020 — Aug 2021' },
    description: {
      id: 'Bogor — membangun dan mengelola portal pemerintahan daerah dengan Vue.js, Laravel, dan CodeIgniter.',
      en: 'Bogor — building and managing local government portals with Vue.js, Laravel, and CodeIgniter.',
    },
    bullets: [
      {
        id: 'Mengelola portal COVID-19 Kota Bogor — pembaruan data harian dan penambahan halaman informasi publik.',
        en: 'Managed the Bogor City COVID-19 portal — daily data updates and new public information pages.',
      },
      {
        id: 'Mengembangkan website dinas dengan Vue.js di sisi frontend dan Laravel/CodeIgniter untuk backend & CMS.',
        en: 'Developed agency websites with Vue.js on the frontend and Laravel/CodeIgniter for backend and CMS.',
      },
      {
        id: 'Memastikan website pemerintahan responsif dan dapat diakses dari perangkat mobile masyarakat.',
        en: 'Ensured government websites were responsive and accessible from citizens\' mobile devices.',
      },
    ],
    tags: sharedTags,
  },
]
