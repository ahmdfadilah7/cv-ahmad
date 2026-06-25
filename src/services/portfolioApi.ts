import type { ProfileData, ExperienceItem, ProjectItem, SiteSettings } from '@/types/portfolio'

const API_BASE = (import.meta.env.VITE_API_URL ?? 'http://localhost:8000').replace(/\/+$/, '')

export type PortfolioApiResponse = {
  site: SiteSettings
  profile: ProfileData
  experience: ExperienceItem[]
  projects: ProjectItem[]
  skills: {
    primaryStack: string[]
    skillGroups: Array<{
      title: { id: string; en: string }
      skills: Array<{ label: string; level: string }>
    }>
    skillTags: string[]
  }
  ui: {
    id: Record<string, unknown>
    en: Record<string, unknown>
  }
}

export async function fetchPortfolioData(): Promise<PortfolioApiResponse> {
  const response = await fetch(`${API_BASE}/api/portfolio`, {
    headers: { Accept: 'application/json' },
  })

  if (!response.ok) {
    throw new Error(`API error: ${response.status}`)
  }

  return response.json() as Promise<PortfolioApiResponse>
}
