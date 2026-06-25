import type { ProfileData } from '@/types/portfolio'

export const profile: ProfileData = {
  name: 'Ahmad Fadilah',
  email: 'ahmdfadilah7@gmail.com',
  phone: '+62 898-9505-373',
  phoneTel: '+628989505373',
  location: {
    id: 'Bogor, Indonesia',
    en: 'Bogor, Indonesia',
  },
  headline: {
    id: 'Web Developer',
    en: 'Web Developer',
  },
  yearsExperience: '4+',
  tagline: {
    id: 'Saya merancang web yang tajam di mata, ringan di perangkat, dan kuat di produksi — dengan Vue & Laravel.',
    en: 'I craft websites that look sharp, feel lightweight, and hold strong in production — with Vue & Laravel.',
  },
  bio: {
    id: 'Web Developer berbasis Bogor dengan 4 tahun pengalaman full-stack. Stack utama saya Vue.js di frontend dan Laravel di backend — untuk website instansi pemerintah, portal perusahaan, hingga proyek klien.',
    en: 'Bogor-based Web Developer with 4 years of full-stack experience. My primary stack is Vue.js on the frontend and Laravel on the backend — for government agency sites, corporate portals, and client projects.',
  },
  highlights: [
    {
      id: 'Pengalaman 4+ tahun di Diskominfo Kota Bogor, Netsindo, dan Solution Intan Prima.',
      en: '4+ years across Diskominfo Kota Bogor, Netsindo, and Solution Intan Prima.',
    },
    {
      id: 'Terbiasa mengelola banyak website aktif sekaligus — update konten, fitur baru, dan maintenance rutin.',
      en: 'Used to managing multiple live websites — content updates, new features, and routine maintenance.',
    },
    {
      id: 'Stack utama: Vue.js, Laravel, CodeIgniter, TypeScript, Tailwind CSS, MySQL/PostgreSQL, REST API.',
      en: 'Core stack: Vue.js, Laravel, CodeIgniter, TypeScript, Tailwind CSS, MySQL/PostgreSQL, REST API.',
    },
    {
      id: 'Fokus pada website yang stabil di produksi, bukan sekadar tampil bagus di demo.',
      en: 'Focused on production-stable websites, not just good-looking demos.',
    },
  ],
  social: [
    {
      label: 'GitHub',
      url: 'https://github.com/ahmdfadilah7',
      icon: 'github',
      handle: '@ahmdfadilah7',
    },
    {
      label: 'LinkedIn',
      url: 'https://www.linkedin.com/in/ahmdfadilah7',
      icon: 'linkedin',
      handle: 'Ahmad Fadilah',
    },
    {
      label: 'WhatsApp',
      url: 'https://wa.me/628989505373',
      icon: 'whatsapp',
      handle: '+62 898-9505-373',
    },
    {
      label: 'Instagram',
      url: 'https://www.instagram.com/ahmdfadilah7',
      icon: 'instagram',
      handle: '@ahmdfadilah7',
    },
  ],
  stats: [
    { label: { id: 'Tahun pengalaman', en: 'Years experience' }, value: '4+' },
    { label: { id: 'Stack utama', en: 'Primary stack' }, value: 'Vue / Laravel' },
    { label: { id: 'Lokasi', en: 'Location' }, value: 'Bogor' },
    { label: { id: 'Bahasa', en: 'Languages' }, value: 'ID / EN' },
  ],
  cvUrl: '/cv-ahmad-fadilah.pdf',
  photoUrl: '/profile.svg',
  availability: {
    id: 'Terbuka untuk peluang Web Developer & proyek freelance',
    en: 'Open to Web Developer roles & freelance projects',
  },
}
