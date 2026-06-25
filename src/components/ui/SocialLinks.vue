<script setup lang="ts">
import RevealOnScroll from '@/components/ui/RevealOnScroll.vue'
import SocialBrandIcon from '@/components/ui/SocialBrandIcon.vue'
import type { SocialLink } from '@/types/portfolio'

withDefaults(
  defineProps<{
    links: SocialLink[]
    variant?: 'icon' | 'card'
    animate?: boolean
    baseDelay?: number
  }>(),
  {
    variant: 'icon',
    animate: false,
    baseDelay: 0,
  },
)

function isExternalLink(url: string) {
  return url.startsWith('http')
}
</script>

<template>
  <div
    :class="
      variant === 'card'
        ? 'grid gap-3 sm:grid-cols-2'
        : 'flex flex-wrap items-center gap-2.5 sm:gap-3'
    "
  >
    <template v-for="(link, i) in links" :key="link.url">
      <RevealOnScroll v-if="animate" :delay="baseDelay + i * 0.05">
        <a
          :href="link.url"
          :target="isExternalLink(link.url) ? '_blank' : undefined"
          :rel="isExternalLink(link.url) ? 'noopener noreferrer' : undefined"
          :aria-label="link.label"
          :class="
            variant === 'card'
              ? 'glass-card group flex items-center gap-3 rounded-2xl p-4 shadow-sm transition duration-300 hover:-translate-y-0.5 hover:border-lime-500/30 sm:p-5'
              : 'inline-flex h-10 w-10 items-center justify-center rounded-full border border-stone-200/90 bg-white/70 text-stone-600 transition duration-300 hover:-translate-y-0.5 hover:border-lime-500/40 hover:text-lime-800 dark:border-white/10 dark:bg-white/5 dark:text-zinc-400 dark:hover:border-lime-300/40 dark:hover:text-lime-200'
          "
        >
          <div
            :class="
              variant === 'card'
                ? 'inline-flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-lime-500/15 text-lime-800 transition group-hover:scale-105 dark:bg-lime-300/10 dark:text-lime-200'
                : 'h-4 w-4'
            "
          >
            <SocialBrandIcon :platform="link.icon" :class="variant === 'card' ? 'h-5 w-5' : 'h-4 w-4'" />
          </div>
          <div v-if="variant === 'card'" class="min-w-0">
            <p class="text-xs font-semibold uppercase tracking-wide text-stone-500 dark:text-zinc-500">
              {{ link.label }}
            </p>
            <p class="mt-0.5 truncate text-sm font-medium text-stone-900 dark:text-white">
              {{ link.handle ?? link.label }}
            </p>
          </div>
        </a>
      </RevealOnScroll>

      <a
        v-else
        :href="link.url"
        :target="isExternalLink(link.url) ? '_blank' : undefined"
        :rel="isExternalLink(link.url) ? 'noopener noreferrer' : undefined"
        :aria-label="link.label"
        :class="
          variant === 'card'
            ? 'glass-card group flex items-center gap-3 rounded-2xl p-4 shadow-sm transition duration-300 hover:-translate-y-0.5 hover:border-lime-500/30 sm:p-5'
            : 'inline-flex h-10 w-10 items-center justify-center rounded-full border border-stone-200/90 bg-white/70 text-stone-600 transition duration-300 hover:-translate-y-0.5 hover:border-lime-500/40 hover:text-lime-800 dark:border-white/10 dark:bg-white/5 dark:text-zinc-400 dark:hover:border-lime-300/40 dark:hover:text-lime-200'
        "
      >
        <div
          :class="
            variant === 'card'
              ? 'inline-flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-lime-500/15 text-lime-800 transition group-hover:scale-105 dark:bg-lime-300/10 dark:text-lime-200'
              : 'h-4 w-4'
          "
        >
          <SocialBrandIcon :platform="link.icon" :class="variant === 'card' ? 'h-5 w-5' : 'h-4 w-4'" />
        </div>
        <div v-if="variant === 'card'" class="min-w-0">
          <p class="text-xs font-semibold uppercase tracking-wide text-stone-500 dark:text-zinc-500">
            {{ link.label }}
          </p>
          <p class="mt-0.5 truncate text-sm font-medium text-stone-900 dark:text-white">
            {{ link.handle ?? link.label }}
          </p>
        </div>
      </a>
    </template>
  </div>
</template>
