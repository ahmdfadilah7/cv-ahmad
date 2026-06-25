<script setup lang="ts">
import { useI18n } from 'vue-i18n'

import Button from '@/components/ui/Button.vue'
import RevealOnScroll from '@/components/ui/RevealOnScroll.vue'
import SafeImage from '@/components/ui/SafeImage.vue'
import SocialLinks from '@/components/ui/SocialLinks.vue'
import { usePortfolio } from '@/composables/usePortfolio'
import { useLocalized } from '@/composables/useLocalized'

const emit = defineEmits<{
  navigate: [id: string]
}>()

const { t } = useI18n()
const { t: lt } = useLocalized()
const { profile } = usePortfolio()
</script>

<template>
  <section id="hero" class="section-shell relative overflow-hidden">
    <div class="container-main">
      <div class="grid items-center gap-8 sm:gap-10 lg:grid-cols-[minmax(0,1fr)_auto] lg:gap-12">
        <div class="min-w-0 order-2 lg:order-1">
          <RevealOnScroll>
            <p
              class="mb-4 inline-flex max-w-full items-start gap-2 rounded-full border border-stone-200/90 bg-white/80 px-3 py-1.5 text-[0.7rem] font-medium leading-snug text-lime-800 shadow-sm backdrop-blur sm:items-center sm:text-xs dark:border-white/10 dark:bg-white/5 dark:text-lime-200"
            >
              <span class="status-dot mt-1.5 inline-flex h-1.5 w-1.5 shrink-0 rounded-full bg-lime-500 sm:mt-0 dark:bg-lime-300" />
              <span>{{ lt(profile.availability) }}</span>
            </p>
          </RevealOnScroll>

          <RevealOnScroll :delay="0.05">
            <h1
              class="font-heading text-balance text-3xl font-semibold leading-[1.1] tracking-tight text-stone-900 sm:text-4xl sm:leading-tight lg:text-[3.25rem] dark:text-white"
            >
              {{ profile.name }}
            </h1>
          </RevealOnScroll>

          <RevealOnScroll :delay="0.1">
            <p class="mt-3 text-lg font-medium text-lime-700 sm:text-xl dark:text-lime-300">
              {{ lt(profile.headline) }} · {{ profile.yearsExperience }} {{ t('hero.yearsLabel') }}
            </p>
          </RevealOnScroll>

          <RevealOnScroll :delay="0.15">
            <p class="mt-5 max-w-2xl text-pretty text-base leading-relaxed text-stone-600 sm:mt-6 sm:text-lg dark:text-zinc-400">
              {{ lt(profile.tagline) }}
            </p>
          </RevealOnScroll>

          <RevealOnScroll :delay="0.2">
            <div class="mt-8 flex w-full flex-col gap-2.5 sm:mt-10 sm:w-auto sm:flex-row sm:flex-wrap sm:gap-3">
              <Button
                variant="primary"
                class="w-full sm:w-auto"
                @click="emit('navigate', 'projects')"
              >
                {{ t('hero.ctaProjects') }}
              </Button>
              <Button
                variant="secondary"
                class="w-full sm:w-auto"
                @click="emit('navigate', 'contact')"
              >
                {{ t('hero.ctaContact') }}
              </Button>
              <Button variant="ghost" class="w-full sm:w-auto" :href="profile.cvUrl" download>
                {{ t('hero.ctaCv') }}
              </Button>
            </div>
          </RevealOnScroll>

          <div class="mt-6 sm:mt-8">
            <SocialLinks :links="profile.social" animate :base-delay="0.25" />
          </div>
        </div>

        <RevealOnScroll :delay="0.08" class="order-1 flex justify-center lg:order-2">
          <div class="relative">
            <div
              class="absolute -inset-3 rounded-full bg-gradient-to-br from-lime-400/30 to-transparent blur-xl dark:from-lime-300/20"
            />
            <div
              class="relative h-36 w-36 overflow-hidden rounded-full border-4 border-lime-500/30 bg-stone-200 shadow-xl sm:h-48 sm:w-48 lg:h-56 lg:w-56 dark:border-lime-300/30 dark:bg-zinc-800"
            >
              <SafeImage
                :src="profile.photoUrl"
                :alt="profile.name"
                :show-fallback-icon="false"
                class="h-full w-full object-cover"
              >
                <template #fallback>
                  <div
                    class="flex h-full w-full items-center justify-center bg-gradient-to-br from-stone-100 to-stone-200 dark:from-zinc-800 dark:to-zinc-900"
                  >
                    <span class="font-heading text-4xl font-bold text-lime-700 sm:text-5xl dark:text-lime-300">
                      AF
                    </span>
                  </div>
                </template>
              </SafeImage>
            </div>
          </div>
        </RevealOnScroll>
      </div>

      <div class="mt-10 grid grid-cols-2 gap-2.5 sm:mt-12 sm:grid-cols-4 sm:gap-3">
        <RevealOnScroll
          v-for="(stat, i) in profile.stats"
          :key="stat.value + lt(stat.label)"
          :delay="0.2 + i * 0.05"
        >
          <div
            class="glass-card rounded-2xl px-3 py-3.5 text-center shadow-sm transition duration-300 hover:-translate-y-0.5 sm:px-4 sm:py-4"
          >
            <p class="font-heading text-xl font-semibold text-stone-900 sm:text-2xl dark:text-white">
              {{ stat.value }}
            </p>
            <p class="mt-1 text-[0.65rem] font-medium uppercase leading-tight tracking-wide text-stone-500 sm:text-xs dark:text-zinc-500">
              {{ lt(stat.label) }}
            </p>
          </div>
        </RevealOnScroll>
      </div>
    </div>
  </section>
</template>
