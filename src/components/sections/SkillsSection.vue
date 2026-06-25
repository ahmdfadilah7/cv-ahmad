<script setup lang="ts">
import { Code2, Database, Wrench } from '@lucide/vue'
import { useI18n } from 'vue-i18n'

import Badge from '@/components/ui/Badge.vue'
import RevealOnScroll from '@/components/ui/RevealOnScroll.vue'
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { usePortfolio } from '@/composables/usePortfolio'
import type { SkillLevel } from '@/types/portfolio'
import { useLocalized } from '@/composables/useLocalized'

const { t } = useI18n()
const { t: lt } = useLocalized()
const { primaryStack, skillGroups, skillTags } = usePortfolio()

const groupIcons = [Code2, Database, Wrench] as const

function levelVariant(level: SkillLevel) {
  if (level === 'expert') return 'accent'
  if (level === 'proficient') return 'default'
  return 'muted'
}
</script>

<template>
  <section id="skills" class="section-shell">
    <div class="container-main">
      <RevealOnScroll>
        <SectionHeading :title="t('skills.title')" :subtitle="t('skills.subtitle')" />
      </RevealOnScroll>

      <!-- Primary stack -->
      <RevealOnScroll :delay="0.05">
        <div
          class="mt-8 rounded-2xl border border-lime-500/25 bg-gradient-to-br from-lime-500/10 via-white/60 to-transparent p-5 sm:mt-10 sm:p-6 dark:border-lime-300/20 dark:from-lime-300/8 dark:via-white/[0.03]"
        >
          <p class="text-xs font-semibold uppercase tracking-[0.18em] text-lime-800 dark:text-lime-300">
            {{ t('skills.primaryTitle') }}
          </p>
          <div class="mt-4 flex flex-wrap gap-2.5 sm:gap-3">
            <span
              v-for="tech in primaryStack"
              :key="tech"
              class="inline-flex items-center rounded-full border border-lime-500/30 bg-white/90 px-4 py-2 text-sm font-semibold text-stone-900 shadow-sm dark:border-lime-300/25 dark:bg-zinc-900/80 dark:text-white"
            >
              {{ tech }}
            </span>
          </div>
        </div>
      </RevealOnScroll>

      <!-- Skill groups -->
      <div class="mt-6 grid gap-4 sm:mt-8 sm:grid-cols-3 sm:gap-5">
        <RevealOnScroll
          v-for="(group, gi) in skillGroups"
          :key="gi"
          :delay="0.08 + gi * 0.05"
          class="min-w-0"
        >
          <article class="glass-card h-full rounded-2xl p-4 sm:p-5">
            <div class="flex items-center gap-2.5">
              <div
                class="inline-flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-lime-500/12 text-lime-800 dark:bg-lime-300/10 dark:text-lime-200"
              >
                <component :is="groupIcons[gi]" class="h-4 w-4" />
              </div>
              <h3 class="font-heading text-sm font-semibold text-stone-900 sm:text-base dark:text-white">
                {{ lt(group.title) }}
              </h3>
            </div>

            <ul class="mt-4 space-y-3">
              <li
                v-for="skill in group.skills"
                :key="skill.label"
                class="flex flex-col gap-1.5 sm:flex-row sm:items-center sm:justify-between sm:gap-3"
              >
                <span class="min-w-0 text-sm text-stone-700 dark:text-zinc-300">
                  {{ skill.label }}
                </span>
                <Badge :variant="levelVariant(skill.level)" class="w-fit shrink-0">
                  {{ t(`skills.levels.${skill.level}`) }}
                </Badge>
              </li>
            </ul>
          </article>
        </RevealOnScroll>
      </div>

      <!-- Extra tags -->
      <RevealOnScroll :delay="0.15">
        <div class="mt-8 border-t border-stone-200/80 pt-6 sm:mt-10 dark:border-white/10">
          <p class="text-xs font-semibold uppercase tracking-wide text-stone-500 dark:text-zinc-500">
            {{ t('skills.extraTitle') }}
          </p>
          <div class="mt-3 flex flex-wrap gap-2">
            <span
              v-for="tag in skillTags"
              :key="tag"
              class="rounded-full border border-stone-200/80 bg-white/60 px-3 py-1 text-xs font-medium text-stone-600 dark:border-white/10 dark:bg-white/5 dark:text-zinc-400"
            >
              {{ tag }}
            </span>
          </div>
        </div>
      </RevealOnScroll>
    </div>
  </section>
</template>
