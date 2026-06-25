<script setup lang="ts">
import AboutSection from '@/components/sections/AboutSection.vue'
import ContactSection from '@/components/sections/ContactSection.vue'
import ExperienceSection from '@/components/sections/ExperienceSection.vue'
import HeroSection from '@/components/sections/HeroSection.vue'
import ProjectsSection from '@/components/sections/ProjectsSection.vue'
import SkillsSection from '@/components/sections/SkillsSection.vue'
import { useScrollSpy } from '@/composables/useScrollSpy'

const sectionIds = ['hero', 'about', 'skills', 'experience', 'projects', 'contact']
const { scrollToSection } = useScrollSpy(sectionIds)

function handleNavigate(id: string) {
  scrollToSection(id)
}
</script>

<template>
  <div>
    <HeroSection @navigate="handleNavigate" />
    <AboutSection />
    <SkillsSection />
    <ExperienceSection />
    <ProjectsSection />
    <ContactSection />
  </div>
</template>
