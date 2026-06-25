<script setup lang="ts">
import { ArrowRight, ExternalLink } from '@lucide/vue'
import { useI18n } from 'vue-i18n'
import { RouterLink } from 'vue-router'

import Badge from '@/components/ui/Badge.vue'
import RevealOnScroll from '@/components/ui/RevealOnScroll.vue'
import SafeImage from '@/components/ui/SafeImage.vue'
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { usePortfolio } from '@/composables/usePortfolio'
import type { ProjectStatus } from '@/types/portfolio'
import { useLocalized } from '@/composables/useLocalized'

const { t } = useI18n()
const { t: lt } = useLocalized()
const { projects } = usePortfolio()

function statusVariant(status: ProjectStatus) {
  if (status === 'completed') return 'accent'
  if (status === 'in_progress') return 'default'
  return 'muted'
}
</script>

<template>
  <section id="projects" class="section-shell">
    <div class="container-main">
      <RevealOnScroll>
        <SectionHeading :title="t('projects.title')" :subtitle="t('projects.subtitle')" />
      </RevealOnScroll>

      <div class="mt-8 grid gap-5 sm:mt-10 sm:gap-6 lg:grid-cols-2">
        <RevealOnScroll
          v-for="(project, i) in projects"
          :key="project.slug"
          :delay="i * 0.05"
          class="min-w-0"
        >
          <article
            class="group flex h-full min-w-0 flex-col overflow-hidden rounded-2xl border border-stone-200/90 bg-white/80 shadow-sm transition duration-300 hover:-translate-y-1 hover:border-lime-500/35 hover:shadow-lg hover:shadow-lime-500/10 dark:border-white/10 dark:bg-white/[0.04] dark:hover:shadow-lime-400/5"
          >
            <RouterLink :to="{ name: 'project-detail', params: { slug: project.slug } }" class="block">
              <div class="relative aspect-[16/9] overflow-hidden bg-stone-100 dark:bg-zinc-800">
                <SafeImage
                  :src="project.imageUrl"
                  :alt="lt(project.title)"
                  class="h-full w-full object-cover transition duration-500 group-hover:scale-[1.02]"
                  loading="lazy"
                  decoding="async"
                />
                <div class="absolute left-2 top-2 sm:left-3 sm:top-3">
                  <Badge :variant="statusVariant(project.status)">
                    {{ t(`projects.status.${project.status}`) }}
                  </Badge>
                </div>
              </div>
            </RouterLink>

            <div class="flex min-w-0 flex-1 flex-col p-4 sm:p-5">
              <RouterLink
                :to="{ name: 'project-detail', params: { slug: project.slug } }"
                class="font-heading text-base font-semibold text-stone-900 transition hover:text-lime-800 sm:text-lg dark:text-white dark:hover:text-lime-200"
              >
                {{ lt(project.title) }}
              </RouterLink>
              <p class="mt-2 line-clamp-3 text-pretty text-sm leading-relaxed text-stone-600 dark:text-zinc-400">
                {{ lt(project.description) }}
              </p>

              <div class="mt-4 flex flex-wrap gap-1.5">
                <Badge v-for="tech in project.stack" :key="tech" variant="muted">
                  {{ tech }}
                </Badge>
              </div>

              <div class="mt-5 flex flex-wrap items-center gap-4">
                <RouterLink
                  :to="{ name: 'project-detail', params: { slug: project.slug } }"
                  class="inline-flex items-center gap-1.5 text-sm font-semibold text-lime-800 transition hover:gap-2 dark:text-lime-300"
                >
                  {{ t('projects.viewDetail') }}
                  <ArrowRight class="h-3.5 w-3.5 shrink-0" />
                </RouterLink>
                <a
                  v-if="project.url"
                  :href="project.url"
                  target="_blank"
                  rel="noopener noreferrer"
                  class="inline-flex items-center gap-1.5 text-sm font-medium text-stone-600 transition hover:text-stone-900 dark:text-zinc-400 dark:hover:text-white"
                >
                  {{ t('projects.viewProject') }}
                  <ExternalLink class="h-3.5 w-3.5 shrink-0" />
                </a>
              </div>
            </div>
          </article>
        </RevealOnScroll>
      </div>
    </div>
  </section>
</template>
