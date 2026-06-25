<script setup lang="ts">
defineProps<{
  title: string
  subtitle?: string
  align?: 'left' | 'center'
}>()
</script>

<template>
  <div :class="align === 'center' ? 'text-center' : 'text-left'">
    <p
      v-if="subtitle"
      class="text-[0.65rem] font-semibold uppercase tracking-[0.15em] text-lime-800 sm:text-xs sm:tracking-[0.2em] dark:text-lime-300"
    >
      {{ subtitle }}
    </p>
    <h2
      class="font-heading mt-2 text-balance text-2xl font-semibold tracking-tight text-stone-900 sm:text-3xl lg:text-4xl dark:text-white"
    >
      {{ title }}
    </h2>
  </div>
</template>
