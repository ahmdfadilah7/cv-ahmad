<script setup lang="ts">
import { Menu, X } from '@lucide/vue'
import { ref } from 'vue'
import { useI18n } from 'vue-i18n'

import LangToggle from '@/components/layout/LangToggle.vue'
import ThemeToggle from '@/components/layout/ThemeToggle.vue'
import { usePortfolio } from '@/composables/usePortfolio'

defineProps<{
  activeSection: string
}>()

const emit = defineEmits<{
  navigate: [id: string]
}>()

const { t } = useI18n()
const menuOpen = ref(false)
const { site } = usePortfolio()

const navItems = [
  { id: 'hero', labelKey: 'nav.home' },
  { id: 'about', labelKey: 'nav.about' },
  { id: 'skills', labelKey: 'nav.skills' },
  { id: 'experience', labelKey: 'nav.experience' },
  { id: 'projects', labelKey: 'nav.projects' },
  { id: 'contact', labelKey: 'nav.contact' },
] as const

function handleNav(id: string) {
  emit('navigate', id)
  menuOpen.value = false
}
</script>

<template>
  <header
    class="sticky top-0 z-50 border-b border-stone-200/60 bg-white/80 backdrop-blur-md dark:border-white/10 dark:bg-zinc-950/80"
    style="padding-top: env(safe-area-inset-top)"
  >
    <div class="container-main flex items-center justify-between gap-3 py-3 sm:gap-4">
      <button
        type="button"
        class="inline-flex shrink-0 items-center gap-2 font-heading text-sm font-bold tracking-tight text-stone-900 dark:text-white"
        @click="handleNav('hero')"
      >
        <img
          v-if="site.logoUrl"
          :src="site.logoUrl"
          :alt="site.siteName"
          class="h-8 w-auto max-w-[140px] object-contain"
        />
        <template v-else>
          {{ site.siteName }}
          <span class="text-lime-700 dark:text-lime-300">.</span>
        </template>
      </button>

      <nav class="hidden items-center gap-0.5 lg:flex" :aria-label="t('a11y.mainNav')">
        <button
          v-for="item in navItems"
          :key="item.id"
          type="button"
          class="rounded-full px-2.5 py-1.5 text-sm font-medium transition xl:px-3"
          :class="
            activeSection === item.id
              ? 'bg-lime-500/15 text-lime-800 dark:bg-lime-300/10 dark:text-lime-200'
              : 'text-stone-600 hover:text-stone-900 dark:text-zinc-400 dark:hover:text-white'
          "
          @click="handleNav(item.id)"
        >
          {{ t(item.labelKey) }}
        </button>
      </nav>

      <div class="flex shrink-0 items-center gap-1.5 sm:gap-2">
        <LangToggle />
        <ThemeToggle />
        <button
          type="button"
          class="inline-flex h-9 w-9 items-center justify-center rounded-full border border-stone-200/90 bg-white/70 text-stone-700 lg:hidden dark:border-white/10 dark:bg-white/5 dark:text-zinc-300"
          :aria-label="menuOpen ? t('a11y.closeMenu') : t('a11y.openMenu')"
          :aria-expanded="menuOpen"
          @click="menuOpen = !menuOpen"
        >
          <X v-if="menuOpen" class="h-4 w-4" />
          <Menu v-else class="h-4 w-4" />
        </button>
      </div>
    </div>

    <nav
      v-if="menuOpen"
      class="border-t border-stone-200/60 lg:hidden dark:border-white/10"
      :aria-label="t('a11y.mainNav')"
    >
      <div class="container-main flex flex-col gap-1 py-3">
        <button
          v-for="item in navItems"
          :key="item.id"
          type="button"
          class="rounded-lg px-3 py-2.5 text-left text-sm font-medium transition"
          :class="
            activeSection === item.id
              ? 'bg-lime-500/15 text-lime-800 dark:bg-lime-300/10 dark:text-lime-200'
              : 'text-stone-600 hover:bg-stone-100 dark:text-zinc-400 dark:hover:bg-white/5'
          "
          @click="handleNav(item.id)"
        >
          {{ t(item.labelKey) }}
        </button>
      </div>
    </nav>
  </header>
</template>
