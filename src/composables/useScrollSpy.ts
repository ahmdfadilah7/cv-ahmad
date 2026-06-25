import { onMounted, onUnmounted, ref } from 'vue'

export function useScrollSpy(sectionIds: string[], offset = 96) {
  const activeSection = ref(sectionIds[0] ?? '')

  function updateActive() {
    const scrollY = window.scrollY + offset

    for (let i = sectionIds.length - 1; i >= 0; i--) {
      const id = sectionIds[i]
      if (!id) continue
      const el = document.getElementById(id)
      if (el && el.offsetTop <= scrollY) {
        activeSection.value = id
        return
      }
    }
  }

  onMounted(() => {
    updateActive()
    window.addEventListener('scroll', updateActive, { passive: true })
  })

  onUnmounted(() => {
    window.removeEventListener('scroll', updateActive)
  })

  function scrollToSection(id: string) {
    const el = document.getElementById(id)
    if (!el) return
    const top = el.getBoundingClientRect().top + window.scrollY - offset + 1
    window.scrollTo({ top, behavior: 'smooth' })
  }

  return { activeSection, scrollToSection }
}
