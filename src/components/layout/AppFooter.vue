<script setup lang="ts">
import { useI18n } from 'vue-i18n'

import SocialLinks from '@/components/ui/SocialLinks.vue'
import { usePortfolio } from '@/composables/usePortfolio'
import { useLocalized } from '@/composables/useLocalized'

const { t } = useI18n()
const { t: lt } = useLocalized()
const { profile } = usePortfolio()

const year = new Date().getFullYear()
</script>

<template>
  <footer class="border-t border-stone-200/60 py-8 sm:py-10 dark:border-white/10">
    <div class="container-main flex flex-col items-center justify-between gap-6 sm:flex-row">
      <div class="text-center sm:text-left">
        <p class="font-heading text-sm font-semibold text-stone-900 dark:text-white">
          {{ profile.name }}
        </p>
        <p class="mt-1 text-sm text-stone-500 dark:text-zinc-500">
          © {{ year }} — {{ t('footer.rights') }}
        </p>
        <p class="mt-1 text-xs text-stone-400 dark:text-zinc-600">
          {{ t('footer.builtWith') }}
        </p>
      </div>

      <SocialLinks :links="profile.social" />
    </div>
    <p class="mt-4 text-center text-xs text-stone-400 dark:text-zinc-600">
      {{ lt(profile.location) }}
    </p>
  </footer>
</template>
