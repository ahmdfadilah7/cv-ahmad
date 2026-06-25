<script setup lang="ts">
import { Download, Mail, MapPin, Phone } from '@lucide/vue'
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'

import Button from '@/components/ui/Button.vue'
import RevealOnScroll from '@/components/ui/RevealOnScroll.vue'
import SectionHeading from '@/components/ui/SectionHeading.vue'
import SocialLinks from '@/components/ui/SocialLinks.vue'
import { usePortfolio } from '@/composables/usePortfolio'
import { useLocalized } from '@/composables/useLocalized'

const { t } = useI18n()
const { t: lt } = useLocalized()
const { profile } = usePortfolio()

const contactItems = computed(() => [
  {
    key: 'email',
    labelKey: 'contact.email',
    value: profile.value.email,
    href: `mailto:${profile.value.email}`,
    icon: Mail,
    breakAll: true,
  },
  {
    key: 'phone',
    labelKey: 'contact.phone',
    value: profile.value.phone,
    href: `tel:${profile.value.phoneTel}`,
    icon: Phone,
    breakAll: false,
  },
  {
    key: 'location',
    labelKey: 'contact.location',
    value: lt(profile.value.location),
    href: null,
    icon: MapPin,
    breakAll: false,
  },
])
</script>

<template>
  <section id="contact" class="section-shell">
    <div class="container-main">
      <RevealOnScroll>
        <SectionHeading :title="t('contact.title')" :subtitle="t('contact.subtitle')" />
      </RevealOnScroll>

      <div class="mt-8 grid gap-6 sm:mt-10 lg:grid-cols-[minmax(0,1fr)_minmax(240px,280px)]">
        <div class="flex min-w-0 flex-col gap-4">
          <div class="grid grid-cols-1 gap-4 sm:grid-cols-3">
            <RevealOnScroll
              v-for="(item, i) in contactItems"
              :key="item.key"
              :delay="i * 0.05"
              class="min-w-0"
            >
              <component
                :is="item.href ? 'a' : 'div'"
                :href="item.href ?? undefined"
                class="glass-card flex h-full min-w-0 gap-3 rounded-2xl p-4 shadow-sm transition duration-300 hover:-translate-y-0.5 sm:gap-4 sm:p-5"
                :class="item.href ? 'hover:border-lime-500/30' : ''"
              >
                <div
                  class="inline-flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-lime-500/15 text-lime-800 dark:bg-lime-300/10 dark:text-lime-200"
                >
                  <component :is="item.icon" class="h-5 w-5" />
                </div>
                <div class="min-w-0">
                  <p class="text-xs font-semibold uppercase tracking-wide text-stone-500 dark:text-zinc-500">
                    {{ t(item.labelKey) }}
                  </p>
                  <p
                    class="mt-1 text-sm font-medium text-stone-900 dark:text-white"
                    :class="item.breakAll ? 'break-all' : 'break-words'"
                  >
                    {{ item.value }}
                  </p>
                </div>
              </component>
            </RevealOnScroll>
          </div>

          <RevealOnScroll :delay="0.15" class="min-w-0">
            <div class="glass-card rounded-2xl p-4 shadow-sm sm:p-5">
              <p class="text-xs font-semibold uppercase tracking-wide text-stone-500 dark:text-zinc-500">
                {{ t('contact.availability') }}
              </p>
              <p class="mt-2 break-words text-pretty text-sm leading-relaxed text-stone-700 dark:text-zinc-300">
                {{ lt(profile.availability) }}
              </p>
              <p class="mt-3 text-xs text-stone-500 dark:text-zinc-500">
                {{ t('contact.responseTime') }}
              </p>
            </div>
          </RevealOnScroll>

          <RevealOnScroll :delay="0.2" class="min-w-0">
            <h3 class="font-heading text-base font-semibold text-stone-900 dark:text-white">
              {{ t('contact.socialTitle') }}
            </h3>
            <p class="mt-1 text-sm text-stone-600 dark:text-zinc-400">
              {{ t('contact.socialSubtitle') }}
            </p>
            <div class="mt-4">
              <SocialLinks :links="profile.social" variant="card" animate :base-delay="0.25" />
            </div>
          </RevealOnScroll>
        </div>

        <RevealOnScroll :delay="0.1" class="min-w-0">
          <div
            class="glass-card flex h-full flex-col justify-center rounded-2xl p-5 text-center shadow-sm sm:p-6"
          >
            <div
              class="mx-auto inline-flex h-14 w-14 items-center justify-center rounded-full bg-lime-500/15 text-lime-800 dark:bg-lime-300/10 dark:text-lime-200"
            >
              <Download class="h-6 w-6" />
            </div>
            <h3 class="font-heading mt-4 text-lg font-semibold text-stone-900 dark:text-white">
              {{ t('contact.downloadCv') }}
            </h3>
            <p class="mt-2 text-sm text-stone-600 dark:text-zinc-400">
              {{ profile.name }}
            </p>
            <Button
              variant="primary"
              :href="profile.cvUrl"
              download
              class="mt-6 w-full"
            >
              {{ t('hero.ctaCv') }}
            </Button>
          </div>
        </RevealOnScroll>
      </div>
    </div>
  </section>
</template>
