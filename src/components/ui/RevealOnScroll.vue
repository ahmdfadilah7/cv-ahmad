<script setup lang="ts">
import { computed } from 'vue'

const props = withDefaults(
  defineProps<{
    delay?: number
  }>(),
  {
    delay: 0,
  },
)

const visibleOnce = computed(() => ({
  opacity: 1,
  y: 0,
  transition: { delay: props.delay, duration: 0.5 },
}))
</script>

<template>
  <div v-motion :initial="{ opacity: 0, y: 24 }" :visible-once="visibleOnce">
    <slot />
  </div>
</template>
