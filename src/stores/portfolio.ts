import { defineStore } from 'pinia'

import { experience as fallbackExperience } from '@/data/experience'
import { profile as fallbackProfile } from '@/data/profile'
import { projects as fallbackProjects } from '@/data/projects'
import { primaryStack, skillGroups, skillTags } from '@/data/skills'
import en from '@/locales/en.json'
import id from '@/locales/id.json'
import { fetchPortfolioData } from '@/services/portfolioApi'
import { i18n, type MessageSchema } from '@/i18n'
import type {
  ExperienceItem,
  ProfileData,
  ProjectItem,
  SiteSettings,
  SkillCategory,
} from '@/types/portfolio'

type SkillsState = {
  primaryStack: string[]
  skillGroups: SkillCategory[]
  skillTags: string[]
}

const fallbackSite: SiteSettings = {
  siteName: 'Ahmad Fadilah — Web Developer',
  logoUrl: null,
  faviconUrl: '/favicon.svg',
}

export const usePortfolioStore = defineStore('portfolio', {
  state: () => ({
    loaded: false,
    loading: false,
    error: null as string | null,
    site: fallbackSite as SiteSettings,
    profile: fallbackProfile as ProfileData,
    experience: fallbackExperience as ExperienceItem[],
    projects: fallbackProjects as ProjectItem[],
    skills: {
      primaryStack,
      skillGroups,
      skillTags,
    } as SkillsState,
  }),
  getters: {
    getProjectBySlug:
      (state) =>
      (slug: string): ProjectItem | undefined =>
        state.projects.find((project) => project.slug === slug),
  },
  actions: {
    async fetchFromApi() {
      if (this.loading) return

      this.loading = true
      this.error = null

      try {
        const data = await fetchPortfolioData()

        if (data.site) {
          this.site = data.site as SiteSettings
        }
        if (data.profile && Object.keys(data.profile).length > 0) {
          this.profile = data.profile as ProfileData
        }
        if (data.experience?.length) {
          this.experience = data.experience as ExperienceItem[]
        }
        if (data.projects?.length) {
          this.projects = data.projects as ProjectItem[]
        }
        if (data.skills) {
          this.skills = data.skills as SkillsState
        }
        if (data.ui?.id && data.ui?.en) {
          i18n.global.setLocaleMessage('id', data.ui.id as MessageSchema)
          i18n.global.setLocaleMessage('en', data.ui.en as MessageSchema)
        }

        this.loaded = true
      } catch (error) {
        this.error = error instanceof Error ? error.message : 'Failed to load portfolio data'
        i18n.global.setLocaleMessage('id', id)
        i18n.global.setLocaleMessage('en', en)
      } finally {
        this.loading = false
      }
    },
  },
})
