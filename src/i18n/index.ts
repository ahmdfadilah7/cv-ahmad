import { createI18n } from 'vue-i18n'

import en from '@/locales/en.json'
import id from '@/locales/id.json'

export type MessageSchema = typeof id
export type AppLocale = 'id' | 'en'

const savedLocale = localStorage.getItem('webprofile-locale')
const defaultLocale: AppLocale =
  savedLocale === 'en' || savedLocale === 'id' ? savedLocale : 'id'

export const i18n = createI18n({
  legacy: false,
  locale: defaultLocale,
  fallbackLocale: 'id',
  messages: { id, en },
})

function localeRef() {
  return i18n.global.locale as unknown as { value: AppLocale }
}

export function setLocale(locale: AppLocale) {
  localeRef().value = locale
  localStorage.setItem('webprofile-locale', locale)
  document.documentElement.lang = locale
}

export function getLocale(): AppLocale {
  return localeRef().value
}
