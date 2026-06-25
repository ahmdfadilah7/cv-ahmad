import { useHead } from '@unhead/vue'
import { storeToRefs } from 'pinia'

import { usePortfolioStore } from '@/stores/portfolio'

export function useStructuredData() {
  const { profile } = storeToRefs(usePortfolioStore())

  useHead(() => ({
    script: [
      {
        type: 'application/ld+json',
        innerHTML: JSON.stringify({
          '@context': 'https://schema.org',
          '@type': 'Person',
          name: profile.value.name,
          jobTitle: 'Web Developer',
          email: profile.value.email,
          telephone: profile.value.phoneTel,
          address: {
            '@type': 'PostalAddress',
            addressLocality: 'Bogor',
            addressCountry: 'ID',
          },
          sameAs: profile.value.social
            .filter((s) => s.url.startsWith('http'))
            .map((s) => s.url),
          knowsAbout: [
            'Vue.js',
            'Laravel',
            'TypeScript',
            'Tailwind CSS',
            'PHP',
            'JavaScript',
            'MySQL',
            'REST API',
            'Web Development',
          ],
        }),
      },
    ],
  }))
}
