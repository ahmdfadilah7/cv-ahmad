<script setup lang="ts">
import { Moon, Sun } from '@lucide/vue'
import { usePreferredDark } from '@vueuse/core'
import { storeToRefs } from 'pinia'
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'

import { useThemeStore } from '@/stores/theme'

const { t } = useI18n()
const themeStore = useThemeStore()
const { mode } = storeToRefs(themeStore)
const preferredDark = usePreferredDark()

const isDark = computed(
  () => mode.value === 'dark' || (mode.value === 'system' && preferredDark.value),
)
</script>

<template>
  <button
    type="button"
    class="inline-flex h-9 w-9 items-center justify-center rounded-full border border-stone-200/90 bg-white/70 text-stone-700 transition hover:border-lime-500/40 hover:text-lime-800 dark:border-white/10 dark:bg-white/5 dark:text-zinc-300 dark:hover:border-lime-300/40 dark:hover:text-lime-200"
    :aria-label="t('theme.toggle')"
    @click="themeStore.toggle()"
  >
    <Sun v-if="isDark" class="h-4 w-4" aria-hidden="true" />
    <Moon v-else class="h-4 w-4" aria-hidden="true" />
  </button>
</template>
