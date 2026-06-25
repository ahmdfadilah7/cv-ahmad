<script setup lang="ts">
import { useI18n } from 'vue-i18n'

import RevealOnScroll from '@/components/ui/RevealOnScroll.vue'
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { usePortfolio } from '@/composables/usePortfolio'
import { useLocalized } from '@/composables/useLocalized'

const { t } = useI18n()
const { t: lt } = useLocalized()
const { experience } = usePortfolio()
</script>

<template>
  <section id="experience" class="section-shell">
    <div class="container-main">
      <RevealOnScroll>
        <SectionHeading :title="t('experience.title')" :subtitle="t('experience.subtitle')" />
      </RevealOnScroll>

      <div
        class="relative mt-8 space-y-6 sm:mt-10 sm:space-y-8 before:absolute before:left-[11px] before:top-2 before:h-[calc(100%-16px)] before:w-px before:bg-gradient-to-b before:from-lime-500/50 before:to-transparent md:before:left-[15px] dark:before:from-lime-300/40"
      >
        <RevealOnScroll
          v-for="(item, i) in experience"
          :key="`${item.company}-${i}`"
          :delay="i * 0.06"
        >
          <article
            class="relative grid min-w-0 gap-4 rounded-2xl border border-stone-200/90 bg-white/80 p-4 pl-9 shadow-sm transition duration-300 hover:-translate-y-0.5 hover:border-lime-500/35 hover:shadow-md sm:p-6 sm:pl-12 md:grid-cols-[minmax(180px,220px)_minmax(0,1fr)] dark:border-white/10 dark:bg-white/[0.04] dark:shadow-none dark:hover:shadow-lime-400/5"
          >
            <span
              class="absolute left-2.5 top-6 flex h-3 w-3 rounded-full border border-lime-600 bg-white shadow-[0_0_0_6px_rgba(163,230,53,0.15)] sm:left-4 sm:top-7 dark:border-lime-300 dark:bg-zinc-950 dark:shadow-[0_0_0_6px_rgba(190,242,100,0.12)]"
            />
            <div class="min-w-0">
              <p class="text-xs font-semibold uppercase tracking-wide text-lime-800 dark:text-lime-200">
                {{ lt(item.period) }}
              </p>
              <h3 class="font-heading mt-2 text-base font-semibold tracking-tight text-stone-900 sm:text-lg dark:text-white">
                {{ lt(item.role) }}
              </h3>
              <p class="break-words text-sm text-stone-600 dark:text-zinc-400">
                {{ item.company }}
              </p>
            </div>
            <div class="min-w-0 space-y-4">
              <p class="text-pretty text-sm leading-relaxed text-stone-700 dark:text-zinc-300">
                {{ lt(item.description) }}
              </p>
              <ul
                v-if="item.bullets.length"
                class="space-y-2 border-l-2 border-lime-500/25 pl-3 text-sm leading-relaxed text-stone-600 sm:pl-4 dark:border-lime-300/20 dark:text-zinc-400"
              >
                <li v-for="(bullet, bi) in item.bullets" :key="bi" class="break-words">
                  {{ lt(bullet) }}
                </li>
              </ul>
              <div class="flex flex-wrap gap-1.5 sm:gap-2">
                <span
                  v-for="tag in item.tags"
                  :key="tag"
                  class="rounded-full border border-stone-200/90 bg-white/80 px-2.5 py-0.5 text-xs text-stone-800 sm:px-3 sm:py-1 dark:border-white/10 dark:bg-white/5 dark:text-zinc-200"
                >
                  {{ tag }}
                </span>
              </div>
            </div>
          </article>
        </RevealOnScroll>
      </div>
    </div>
  </section>
</template>
