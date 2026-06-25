import { computed } from 'vue'
import { useI18n } from 'vue-i18n'

import type { LocalizedText } from '@/types/portfolio'

export function useLocalized() {
  const { locale } = useI18n()

  const t = (text: LocalizedText) => computed(() => text[locale.value as keyof LocalizedText]).value

  const localized = (text: LocalizedText) =>
    computed(() => text[locale.value as keyof LocalizedText])

  return { t, localized, locale }
}
