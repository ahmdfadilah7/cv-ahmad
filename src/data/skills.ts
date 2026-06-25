import type { SkillCategory } from '@/types/portfolio'

export const primaryStack = ['Vue.js', 'Laravel', 'TypeScript', 'Tailwind CSS']

export const skillGroups: SkillCategory[] = [
  {
    title: { id: 'Pengembangan', en: 'Development' },
    skills: [
      { label: 'JavaScript', level: 'proficient' },
      { label: 'PHP / CodeIgniter', level: 'proficient' },
      { label: 'HTML & CSS', level: 'expert' },
      { label: 'jQuery', level: 'proficient' },
    ],
  },
  {
    title: { id: 'Data & API', en: 'Data & API' },
    skills: [
      { label: 'MySQL', level: 'expert' },
      { label: 'PostgreSQL', level: 'proficient' },
      { label: 'REST API', level: 'proficient' },
    ],
  },
  {
    title: { id: 'Tools & Sistem', en: 'Tools & Systems' },
    skills: [
      { label: 'Git', level: 'proficient' },
      { label: 'Vite', level: 'proficient' },
      { label: 'Linux', level: 'familiar' },
      { label: 'Windows', level: 'expert' },
    ],
  },
]

export const skillTags = [
  'Pinia',
  'Vue Router',
  'Docker',
  'Responsive Design',
  'SEO',
  'Performance',
]
