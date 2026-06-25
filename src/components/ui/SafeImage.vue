<script setup lang="ts">
import { ImageOff } from '@lucide/vue'
import { ref, watch } from 'vue'

defineOptions({ inheritAttrs: false })

const props = withDefaults(
  defineProps<{
    src?: string | null
    alt?: string
    showFallbackIcon?: boolean
  }>(),
  {
    src: null,
    alt: '',
    showFallbackIcon: true,
  },
)

const hasError = ref(false)

watch(
  () => props.src,
  () => {
    hasError.value = false
  },
)

function onError() {
  hasError.value = true
}
</script>

<template>
  <img
    v-if="src && !hasError"
    :src="src"
    :alt="alt"
    v-bind="$attrs"
    @error="onError"
  />
  <div
    v-else
    v-bind="$attrs"
    role="img"
    :aria-label="alt || 'Gambar tidak tersedia'"
  >
    <slot name="fallback">
      <div class="flex h-full w-full items-center justify-center bg-stone-100 dark:bg-zinc-800">
        <ImageOff
          v-if="showFallbackIcon"
          class="h-8 w-8 text-stone-400 dark:text-zinc-500"
          aria-hidden="true"
        />
      </div>
    </slot>
  </div>
</template>
