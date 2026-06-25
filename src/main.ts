import { createHead } from '@unhead/vue/client'
import { MotionPlugin } from '@vueuse/motion'
import { createPinia } from 'pinia'
import { createApp } from 'vue'

import App from './App.vue'
import { i18n, getLocale, setLocale } from './i18n'
import router from './router'
import { usePortfolioStore } from './stores/portfolio'
import { useThemeStore } from './stores/theme'
import './styles/main.css'

async function bootstrap() {
  const app = createApp(App)
  const pinia = createPinia()

  app.use(pinia)
  app.use(router)
  app.use(i18n)
  app.use(createHead())
  app.use(MotionPlugin)

  const themeStore = useThemeStore()
  themeStore.applyTheme()
  setLocale(getLocale())

  const portfolioStore = usePortfolioStore()
  await portfolioStore.fetchFromApi()

  app.mount('#app')
}

bootstrap()
