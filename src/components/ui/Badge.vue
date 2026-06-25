<script setup lang="ts">
defineOptions({ name: 'UiBadge' })

defineProps<{
  variant?: 'default' | 'accent' | 'muted'
}>()
</script>

<template>
  <span
    class="inline-flex items-center rounded-full border px-3 py-1 text-xs font-medium"
    :class="{
      'border-stone-200/90 bg-white/80 text-stone-800 dark:border-white/10 dark:bg-white/5 dark:text-zinc-200':
        variant === 'default' || !variant,
      'border-lime-500/30 bg-lime-500/10 text-lime-800 dark:border-lime-300/30 dark:bg-lime-300/10 dark:text-lime-200':
        variant === 'accent',
      'border-transparent bg-stone-100/80 text-stone-600 dark:bg-white/5 dark:text-zinc-400':
        variant === 'muted',
    }"
  >
    <slot />
  </span>
</template>
