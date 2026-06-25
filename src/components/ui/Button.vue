<script setup lang="ts">
defineOptions({ name: 'UiButton' })

defineProps<{
  variant?: 'primary' | 'secondary' | 'ghost'
  href?: string
  type?: 'button' | 'submit'
  download?: boolean | string
}>()

defineEmits<{
  click: []
}>()
</script>

<template>
  <component
    :is="href ? 'a' : 'button'"
    :href="href"
    :download="download"
    :type="href ? undefined : type ?? 'button'"
    class="inline-flex items-center justify-center rounded-full px-5 py-2.5 text-sm font-semibold transition duration-300 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-lime-500"
    :class="{
      'bg-stone-900 text-white shadow-md hover:-translate-y-0.5 hover:bg-stone-800 dark:bg-lime-300 dark:text-stone-950 dark:hover:bg-lime-200':
        variant === 'primary' || !variant,
      'border border-stone-300/90 bg-white/70 text-stone-800 hover:-translate-y-0.5 hover:border-lime-500/50 hover:text-lime-900 dark:border-white/15 dark:bg-transparent dark:text-white dark:hover:border-lime-300/50 dark:hover:text-lime-200':
        variant === 'secondary',
      'border border-transparent text-stone-700 underline-offset-4 hover:underline dark:text-zinc-300':
        variant === 'ghost',
    }"
    @click="$emit('click')"
  >
    <slot />
  </component>
</template>
