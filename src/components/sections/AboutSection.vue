<script setup lang="ts">
import { Check, Mail, MapPin, Phone } from '@lucide/vue'
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'

import RevealOnScroll from '@/components/ui/RevealOnScroll.vue'
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { usePortfolio } from '@/composables/usePortfolio'
import { useLocalized } from '@/composables/useLocalized'

const { t } = useI18n()
const { t: lt } = useLocalized()
const { profile } = usePortfolio()

const quickFacts = computed(() => [
  { icon: MapPin, label: lt(profile.value.location) },
  { icon: Mail, label: profile.value.email },
  { icon: Phone, label: profile.value.phone },
  { icon: Check, label: lt(profile.value.availability) },
])
</script>

<template>
  <section id="about" class="section-shell">
    <div class="container-main">
      <RevealOnScroll>
        <SectionHeading :title="t('about.title')" :subtitle="t('about.subtitle')" />
      </RevealOnScroll>

      <div class="mt-8 grid gap-8 sm:mt-10 lg:grid-cols-[minmax(0,1fr)_minmax(260px,320px)] lg:gap-10">
        <RevealOnScroll :delay="0.05" class="min-w-0">
          <p class="text-pretty text-base leading-relaxed text-stone-700 dark:text-zinc-300">
            {{ lt(profile.bio) }}
          </p>

          <h3 class="font-heading mt-8 text-sm font-semibold uppercase tracking-wide text-stone-500 dark:text-zinc-500">
            {{ t('about.highlightsTitle') }}
          </h3>
          <ul class="mt-4 space-y-3">
            <li
              v-for="(item, i) in profile.highlights"
              :key="i"
              class="flex gap-3 text-sm leading-relaxed text-stone-600 dark:text-zinc-400"
            >
              <Check class="mt-0.5 h-4 w-4 shrink-0 text-lime-600 dark:text-lime-300" />
              <span class="min-w-0 break-words">{{ lt(item) }}</span>
            </li>
          </ul>
        </RevealOnScroll>

        <RevealOnScroll :delay="0.1" class="min-w-0">
          <div class="glass-card rounded-2xl p-4 shadow-sm sm:p-5">
            <h3 class="font-heading text-sm font-semibold uppercase tracking-wide text-stone-500 dark:text-zinc-500">
              {{ t('about.quickFactsTitle') }}
            </h3>
            <ul class="mt-5 space-y-4">
              <li v-for="(fact, i) in quickFacts" :key="i" class="flex gap-3">
                <div
                  class="inline-flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-lime-500/15 text-lime-800 dark:bg-lime-300/10 dark:text-lime-200"
                >
                  <component :is="fact.icon" class="h-4 w-4" />
                </div>
                <div class="min-w-0">
                  <p class="break-words text-sm font-medium text-stone-900 dark:text-white">
                    {{ fact.label }}
                  </p>
                </div>
              </li>
            </ul>
          </div>
        </RevealOnScroll>
      </div>
    </div>
  </section>
</template>
