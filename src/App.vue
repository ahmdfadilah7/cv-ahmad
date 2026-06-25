<script setup lang="ts">
import { RouterView, useRoute, useRouter } from 'vue-router'
import { computed, watch } from 'vue'
import { useI18n } from 'vue-i18n'
import { useHead } from '@unhead/vue'

import AppFooter from '@/components/layout/AppFooter.vue'
import AppHeader from '@/components/layout/AppHeader.vue'
import { usePortfolio } from '@/composables/usePortfolio'
import { useScrollSpy } from '@/composables/useScrollSpy'
import { useStructuredData } from '@/composables/useStructuredData'

const route = useRoute()
const router = useRouter()
const sectionIds = ['hero', 'about', 'skills', 'experience', 'projects', 'contact']
const { activeSection: spySection, scrollToSection } = useScrollSpy(sectionIds)

const isHome = computed(() => route.name === 'home')

const activeSection = computed(() => {
  if (route.name === 'project-detail') return 'projects'
  return spySection.value
})

function handleNavigate(id: string) {
  if (isHome.value) {
    scrollToSection(id)
    return
  }
  router.push({ path: '/', hash: `#${id}` })
}

const { t, locale } = useI18n()
const { site } = usePortfolio()

useStructuredData()

const pageTitle = computed(() => site.value.siteName || t('meta.title'))
const pageDescription = computed(() => t('meta.description'))

useHead({
  title: pageTitle,
  meta: [{ name: 'description', content: pageDescription }],
  link: [
    {
      rel: 'icon',
      href: computed(() => site.value.faviconUrl || '/favicon.svg'),
      type: 'image/svg+xml',
    },
  ],
  htmlAttrs: {
    lang: computed(() => locale.value),
  },
})

watch(
  locale,
  (value) => {
    document.documentElement.lang = value
  },
  { immediate: true },
)
</script>

<template>
  <a
    :href="isHome ? '#hero' : '/'"
    class="sr-only focus:not-sr-only focus:fixed focus:left-4 focus:top-4 focus:z-[100] focus:rounded-lg focus:bg-lime-300 focus:px-4 focus:py-2 focus:text-sm focus:font-semibold focus:text-stone-950"
  >
    {{ t('a11y.skipToContent') }}
  </a>
  <div class="site-grid min-h-screen min-h-[100dvh] overflow-x-clip">
    <div class="site-content flex min-h-screen flex-col">
      <AppHeader :active-section="activeSection" @navigate="handleNavigate" />
      <main class="flex-1">
        <RouterView v-slot="{ Component, route: viewRoute }">
          <Transition name="page" mode="out-in">
            <component :is="Component" :key="viewRoute.path" />
          </Transition>
        </RouterView>
      </main>
      <AppFooter />
    </div>
  </div>
</template>
