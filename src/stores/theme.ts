import { usePreferredDark, useStorage } from '@vueuse/core'
import { watch } from 'vue'
import { defineStore } from 'pinia'

export type ThemeMode = 'light' | 'dark' | 'system'

export const useThemeStore = defineStore('theme', () => {
  const preferredDark = usePreferredDark()
  const mode = useStorage<ThemeMode>('webprofile-theme', 'system')

  function applyTheme() {
    const isDark = mode.value === 'dark' || (mode.value === 'system' && preferredDark.value)
    document.documentElement.classList.toggle('dark', isDark)
    document.documentElement.classList.toggle('light', !isDark)
  }

  function toggle() {
    const isDark =
      mode.value === 'dark' || (mode.value === 'system' && preferredDark.value)
    mode.value = isDark ? 'light' : 'dark'
    applyTheme()
  }

  watch([mode, preferredDark], applyTheme, { immediate: true })

  return { mode, toggle, applyTheme }
})
