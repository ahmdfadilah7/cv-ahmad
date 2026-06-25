<script setup lang="ts">
import { ArrowLeft, ExternalLink } from '@lucide/vue'
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { useRoute, useRouter } from 'vue-router'
import { useHead } from '@unhead/vue'

import ProjectScreenshotGallery from '@/components/projects/ProjectScreenshotGallery.vue'
import Badge from '@/components/ui/Badge.vue'
import Button from '@/components/ui/Button.vue'
import RevealOnScroll from '@/components/ui/RevealOnScroll.vue'
import SafeImage from '@/components/ui/SafeImage.vue'
import { usePortfolio } from '@/composables/usePortfolio'
import type { ProjectStatus } from '@/types/portfolio'
import { useLocalized } from '@/composables/useLocalized'

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const { t: lt } = useLocalized()
const { getProjectBySlug } = usePortfolio()

const project = computed(() => getProjectBySlug(route.params.slug as string))

const caseStudyKeys = ['context', 'role', 'outcome'] as const

function statusVariant(status: ProjectStatus) {
  if (status === 'completed') return 'accent'
  if (status === 'in_progress') return 'default'
  return 'muted'
}

function goBack() {
  router.push({ path: '/', hash: '#projects' })
}

useHead(() => {
  if (!project.value) {
    return {
      title: t('projectDetail.notFound'),
    }
  }
  return {
    title: `${lt(project.value.title)} — ${t('meta.title')}`,
    meta: [{ name: 'description', content: lt(project.value.description) }],
  }
})
</script>

<template>
  <div v-if="project" class="section-shell pb-16 sm:pb-20">
    <div class="container-main">
      <RevealOnScroll>
        <button
          type="button"
          class="inline-flex items-center gap-1.5 text-sm font-medium text-stone-600 transition hover:text-lime-800 dark:text-zinc-400 dark:hover:text-lime-200"
          @click="goBack"
        >
          <ArrowLeft class="h-4 w-4" />
          {{ t('projectDetail.back') }}
        </button>
      </RevealOnScroll>

      <RevealOnScroll :delay="0.05">
        <header class="mt-6 max-w-3xl">
          <div class="flex flex-wrap items-center gap-2">
            <Badge :variant="statusVariant(project.status)">
              {{ t(`projects.status.${project.status}`) }}
            </Badge>
            <Badge v-for="tech in project.stack" :key="tech" variant="muted">
              {{ tech }}
            </Badge>
          </div>

          <h1 class="font-heading mt-4 text-balance text-3xl font-semibold tracking-tight text-stone-900 sm:text-4xl dark:text-white">
            {{ lt(project.title) }}
          </h1>
          <p class="mt-4 text-pretty text-base leading-relaxed text-stone-600 sm:text-lg dark:text-zinc-400">
            {{ lt(project.description) }}
          </p>

          <div v-if="project.url" class="mt-6">
            <Button variant="primary" :href="project.url" target="_blank" rel="noopener noreferrer">
              {{ t('projectDetail.viewDemo') }}
              <ExternalLink class="ml-1.5 inline h-4 w-4" />
            </Button>
          </div>
        </header>
      </RevealOnScroll>

      <RevealOnScroll :delay="0.1">
        <div class="mt-10 overflow-hidden rounded-2xl border border-stone-200/90 shadow-sm dark:border-white/10">
          <SafeImage
            :src="project.imageUrl"
            :alt="lt(project.title)"
            class="aspect-[21/9] w-full object-cover object-top"
          />
        </div>
      </RevealOnScroll>

      <div class="mt-10 grid gap-6 sm:grid-cols-3">
        <RevealOnScroll
          v-for="(key, i) in caseStudyKeys"
          :key="key"
          :delay="0.15 + i * 0.05"
        >
          <dl class="glass-card h-full rounded-2xl p-5">
            <dt class="text-xs font-semibold uppercase tracking-wide text-lime-800 dark:text-lime-300">
              {{ t(`projects.${key}`) }}
            </dt>
            <dd class="mt-2 text-pretty text-sm leading-relaxed text-stone-600 dark:text-zinc-400">
              {{ lt(project[key]) }}
            </dd>
          </dl>
        </RevealOnScroll>
      </div>

      <RevealOnScroll :delay="0.3">
        <div class="mt-12 sm:mt-16">
          <ProjectScreenshotGallery :screenshots="project.screenshots" />
        </div>
      </RevealOnScroll>
    </div>
  </div>

  <div v-else class="section-shell">
    <div class="container-main py-16 text-center">
      <RevealOnScroll>
        <h1 class="font-heading text-2xl font-semibold text-stone-900 dark:text-white">
          {{ t('projectDetail.notFound') }}
        </h1>
        <Button variant="primary" class="mt-6" @click="router.push('/')">
          {{ t('projectDetail.backHome') }}
        </Button>
      </RevealOnScroll>
    </div>
  </div>
</template>
