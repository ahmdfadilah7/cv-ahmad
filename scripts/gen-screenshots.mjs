import fs from 'node:fs'
import path from 'node:path'

const projects = [
  { folder: 'covid-portal', title: 'COVID-19 Portal', accent: '#65a30d', bg: '#0f172a' },
  { folder: 'government', title: 'Diskominfo Web', accent: '#0ea5e9', bg: '#1e1b4b' },
  { folder: 'corporate', title: 'Corporate Site', accent: '#f59e0b', bg: '#18181b' },
  { folder: 'portfolio', title: 'WebProfile', accent: '#bef264', bg: '#0c0a09' },
]

const layouts = [
  { label: 'Homepage', bars: [[200, 12], [320, 8], [280, 8]], cards: 3 },
  { label: 'Dashboard', bars: [[160, 12], [240, 8]], cards: 4 },
  { label: 'Mobile View', bars: [[120, 10], [180, 8]], cards: 2, mobile: true },
]

function svg(project, layout, index) {
  const w = 1200
  const h = 750
  const { accent, bg, title } = project
  const mobile = layout.mobile
  const contentW = mobile ? 360 : 1104
  const contentX = mobile ? (w - contentW) / 2 : 48
  const contentH = mobile ? 520 : 480
  const contentY = mobile ? 140 : 200

  const bars = layout.bars
    .map(
      ([bw, bh], i) =>
        `<rect x="${contentX + 24}" y="${contentY + 40 + i * 36}" width="${bw}" height="${bh}" rx="${bh / 2}" fill="#3f3f46"/>`,
    )
    .join('')

  let cards = ''
  const cardCount = layout.cards
  const cardW = mobile ? contentW - 48 : Math.floor((contentW - 48 - (cardCount - 1) * 16) / cardCount)
  for (let c = 0; c < cardCount; c++) {
    const cx = contentX + 24 + c * (cardW + 16)
    const cy = contentY + 160
    const ch = mobile ? 120 : 200
    cards += `<rect x="${cx}" y="${cy}" width="${cardW}" height="${ch}" rx="12" fill="#27272a" stroke="#3f3f46"/>`
    cards += `<rect x="${cx + 16}" y="${cy + 20}" width="${Math.min(cardW - 32, 100)}" height="8" rx="4" fill="#52525b"/>`
    cards += `<rect x="${cx + 16}" y="${cy + 40}" width="${Math.min(cardW - 32, 60)}" height="24" rx="6" fill="${accent}" fill-opacity="0.8"/>`
  }

  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${w} ${h}" fill="none">
<rect width="${w}" height="${h}" fill="${bg}"/>
<circle cx="1050" cy="120" r="140" fill="${accent}" fill-opacity="0.1"/>
<rect x="0" y="0" width="${w}" height="56" fill="#09090b"/>
<circle cx="28" cy="28" r="6" fill="#ef4444"/><circle cx="52" cy="28" r="6" fill="#eab308"/><circle cx="76" cy="28" r="6" fill="#22c55e"/>
<rect x="120" y="18" width="${w - 240}" height="20" rx="10" fill="#27272a"/>
<text x="48" y="110" font-family="system-ui,sans-serif" font-size="32" font-weight="700" fill="#fafaf9">${title}</text>
<text x="48" y="148" font-family="system-ui,sans-serif" font-size="18" fill="#a1a1aa">${layout.label} — Screenshot ${index}</text>
<rect x="${contentX}" y="${contentY}" width="${contentW}" height="${contentH}" rx="16" fill="#18181b" stroke="#3f3f46"/>
${bars}${cards}
<rect x="${contentX + 24}" y="${contentY + contentH - 56}" width="120" height="36" rx="18" fill="${accent}"/>
</svg>`
}

for (const project of projects) {
  const dir = path.join('public', 'projects', project.folder)
  fs.mkdirSync(dir, { recursive: true })
  layouts.forEach((layout, i) => {
    const file = path.join(dir, `screenshot-${i + 1}.svg`)
    fs.writeFileSync(file, svg(project, layout, i + 1))
  })
}

console.log('Created', projects.length * layouts.length, 'screenshot SVGs')
