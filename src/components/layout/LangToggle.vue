<script setup lang="ts">
import { useI18n } from 'vue-i18n'

import { setLocale } from '@/i18n'

const { locale, t } = useI18n()

function switchLocale(next: 'id' | 'en') {
  if (locale.value !== next) {
    setLocale(next)
  }
}
</script>

<template>
  <div
    class="inline-flex rounded-full border border-stone-200/90 bg-white/70 p-0.5 dark:border-white/10 dark:bg-white/5"
    role="group"
    :aria-label="t('lang.switch')"
  >
    <button
      type="button"
      class="rounded-full px-2.5 py-1 text-xs font-semibold transition"
      :class="
        locale === 'id'
          ? 'bg-stone-900 text-white dark:bg-lime-300 dark:text-stone-950'
          : 'text-stone-600 hover:text-stone-900 dark:text-zinc-400 dark:hover:text-white'
      "
      @click="switchLocale('id')"
    >
      {{ t('lang.id') }}
    </button>
    <button
      type="button"
      class="rounded-full px-2.5 py-1 text-xs font-semibold transition"
      :class="
        locale === 'en'
          ? 'bg-stone-900 text-white dark:bg-lime-300 dark:text-stone-950'
          : 'text-stone-600 hover:text-stone-900 dark:text-zinc-400 dark:hover:text-white'
      "
      @click="switchLocale('en')"
    >
      {{ t('lang.en') }}
    </button>
  </div>
</template>
