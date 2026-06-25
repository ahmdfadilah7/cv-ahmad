export type LocalizedText = {
  id: string
  en: string
}

export type SocialPlatform = 'github' | 'linkedin' | 'instagram' | 'whatsapp'

export type SocialLink = {
  label: string
  url: string
  icon: SocialPlatform
  handle?: string
}

export type SkillLevel = 'expert' | 'proficient' | 'familiar'

export type SiteSettings = {
  siteName: string
  logoUrl: string | null
  faviconUrl: string
}

export type ProfileData = {
  name: string
  email: string
  phone: string
  phoneTel: string
  location: LocalizedText
  headline: LocalizedText
  yearsExperience: string
  tagline: LocalizedText
  bio: LocalizedText
  highlights: LocalizedText[]
  social: SocialLink[]
  stats: { label: LocalizedText; value: string }[]
  cvUrl: string
  photoUrl: string | null
  availability: LocalizedText
}

export type SkillItem = {
  label: string
  level: SkillLevel
}

export type SkillCategory = {
  title: LocalizedText
  skills: SkillItem[]
}

export type ExperienceItem = {
  company: string
  role: LocalizedText
  period: LocalizedText
  description: LocalizedText
  bullets: LocalizedText[]
  tags: string[]
}

export type ProjectStatus = 'planned' | 'in_progress' | 'completed'

export type ProjectScreenshot = {
  url: string
  caption?: LocalizedText
}

export type ProjectItem = {
  slug: string
  title: LocalizedText
  description: LocalizedText
  context: LocalizedText
  role: LocalizedText
  outcome: LocalizedText
  imageUrl: string | null
  url: string | null
  stack: string[]
  status: ProjectStatus
  screenshots: ProjectScreenshot[]
}
