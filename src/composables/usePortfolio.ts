import { storeToRefs } from 'pinia'
import { computed } from 'vue'

import { usePortfolioStore } from '@/stores/portfolio'

export function usePortfolio() {
  const store = usePortfolioStore()
  const { profile, experience, projects, skills, site } = storeToRefs(store)

  return {
    store,
    site,
    profile,
    experience,
    projects,
    skills,
    primaryStack: computed(() => skills.value.primaryStack),
    skillGroups: computed(() => skills.value.skillGroups),
    skillTags: computed(() => skills.value.skillTags),
    getProjectBySlug: (slug: string) => store.getProjectBySlug(slug),
  }
}
