<script setup lang="ts">
import { ChevronLeft, ChevronRight, X, ZoomIn } from '@lucide/vue'
import { computed, onMounted, onUnmounted, ref } from 'vue'
import { useI18n } from 'vue-i18n'

import type { ProjectScreenshot } from '@/types/portfolio'
import SafeImage from '@/components/ui/SafeImage.vue'
import { useLocalized } from '@/composables/useLocalized'

const props = defineProps<{
  screenshots: ProjectScreenshot[]
}>()

const { t } = useI18n()
const { t: lt } = useLocalized()

const lightboxIndex = ref<number | null>(null)

const visibleScreenshots = computed(() =>
  props.screenshots.filter((shot) => Boolean(shot.url?.trim())),
)

const activeScreenshot = computed(() => {
  if (lightboxIndex.value === null) return null
  return visibleScreenshots.value[lightboxIndex.value] ?? null
})

function openLightbox(index: number) {
  lightboxIndex.value = index
}

function closeLightbox() {
  lightboxIndex.value = null
}

function showPrev() {
  if (lightboxIndex.value === null) return
  lightboxIndex.value =
    (lightboxIndex.value - 1 + visibleScreenshots.value.length) % visibleScreenshots.value.length
}

function showNext() {
  if (lightboxIndex.value === null) return
  lightboxIndex.value = (lightboxIndex.value + 1) % visibleScreenshots.value.length
}

function onKeydown(event: KeyboardEvent) {
  if (lightboxIndex.value === null) return
  if (event.key === 'Escape') closeLightbox()
  if (event.key === 'ArrowLeft') showPrev()
  if (event.key === 'ArrowRight') showNext()
}

onMounted(() => window.addEventListener('keydown', onKeydown))
onUnmounted(() => window.removeEventListener('keydown', onKeydown))
</script>

<template>
  <section aria-label="Project screenshots">
    <h2 class="font-heading text-xl font-semibold text-stone-900 sm:text-2xl dark:text-white">
      {{ t('projectDetail.screenshots') }}
    </h2>
    <p class="mt-2 text-sm text-stone-600 dark:text-zinc-400">
      {{ t('projectDetail.screenshotsSubtitle') }}
    </p>

    <div v-if="visibleScreenshots.length" class="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
      <button
        v-for="(shot, index) in visibleScreenshots"
        :key="`${shot.url}-${index}`"
        type="button"
        class="group relative overflow-hidden rounded-2xl border border-stone-200/90 bg-stone-100 text-left shadow-sm transition duration-300 hover:-translate-y-0.5 hover:border-lime-500/35 hover:shadow-md dark:border-white/10 dark:bg-zinc-900"
        @click="openLightbox(index)"
      >
        <div class="relative aspect-[16/10] overflow-hidden">
          <SafeImage
            :src="shot.url"
            :alt="shot.caption ? lt(shot.caption) : `Screenshot ${index + 1}`"
            class="h-full w-full object-cover object-top transition duration-500 group-hover:scale-[1.02]"
            loading="lazy"
            decoding="async"
          />
          <div
            class="absolute inset-0 flex items-center justify-center bg-stone-900/0 transition group-hover:bg-stone-900/25"
          >
            <ZoomIn
              class="h-8 w-8 text-white opacity-0 transition group-hover:opacity-100"
              aria-hidden="true"
            />
          </div>
        </div>
        <p
          v-if="shot.caption"
          class="border-t border-stone-200/80 px-3 py-2.5 text-xs font-medium text-stone-600 sm:px-4 sm:text-sm dark:border-white/10 dark:text-zinc-400"
        >
          {{ lt(shot.caption) }}
        </p>
      </button>
    </div>
    <p v-else class="mt-6 text-sm text-stone-500 dark:text-zinc-500">
      {{ t('projectDetail.screenshotsEmpty') }}
    </p>

    <Teleport to="body">
      <div
        v-if="lightboxIndex !== null"
        class="fixed inset-0 z-[200] flex items-center justify-center bg-stone-950/90 p-4 backdrop-blur-sm"
        role="dialog"
        aria-modal="true"
        :aria-label="t('projectDetail.screenshots')"
        @click.self="closeLightbox"
      >
        <button
          type="button"
          class="absolute right-4 top-4 inline-flex h-10 w-10 items-center justify-center rounded-full border border-white/20 bg-white/10 text-white transition hover:bg-white/20"
          :aria-label="t('projectDetail.closeLightbox')"
          @click="closeLightbox"
        >
          <X class="h-5 w-5" />
        </button>

        <button
          v-if="visibleScreenshots.length > 1"
          type="button"
          class="absolute left-3 top-1/2 inline-flex h-10 w-10 -translate-y-1/2 items-center justify-center rounded-full border border-white/20 bg-white/10 text-white transition hover:bg-white/20 sm:left-6"
          :aria-label="t('projectDetail.prevImage')"
          @click="showPrev"
        >
          <ChevronLeft class="h-5 w-5" />
        </button>

        <button
          v-if="visibleScreenshots.length > 1"
          type="button"
          class="absolute right-3 top-1/2 inline-flex h-10 w-10 -translate-y-1/2 items-center justify-center rounded-full border border-white/20 bg-white/10 text-white transition hover:bg-white/20 sm:right-6"
          :aria-label="t('projectDetail.nextImage')"
          @click="showNext"
        >
          <ChevronRight class="h-5 w-5" />
        </button>

        <figure v-if="activeScreenshot" class="max-h-[85vh] w-full max-w-5xl">
          <SafeImage
            :src="activeScreenshot.url"
            :alt="
              activeScreenshot.caption
                ? lt(activeScreenshot.caption)
                : `Screenshot ${lightboxIndex! + 1}`
            "
            class="mx-auto max-h-[75vh] w-full rounded-xl object-contain shadow-2xl"
          />
          <figcaption
            v-if="activeScreenshot.caption"
            class="mt-3 text-center text-sm text-zinc-300"
          >
            {{ lt(activeScreenshot.caption) }}
          </figcaption>
          <p class="mt-2 text-center text-xs text-zinc-500">
            {{ lightboxIndex! + 1 }} / {{ visibleScreenshots.length }}
          </p>
        </figure>
      </div>
    </Teleport>
  </section>
</template>
