# WebProfile Backend (Laravel)

CMS & API untuk website portfolio Vue.

## Persyaratan

- PHP 8.2+
- Composer
- MySQL (`webprofile_db`)

## Setup

```bash
cd backend
cp .env.example .env   # jika belum ada
# Pastikan DB_DATABASE=webprofile_db di .env

composer install
php artisan key:generate
php artisan migrate:fresh --seed
php artisan storage:link
php artisan serve
```

## Admin panel

- URL: http://localhost:8000/admin
- Email: `admin@webprofile.test`
- Password: `password`

### Menu admin

| Menu | Fungsi |
|------|--------|
| **Profil** | Nama, bio, tagline, highlight, statistik, media sosial |
| **Pengalaman** | Riwayat kerja + bullet points |
| **Proyek** | Proyek + screenshot + studi kasus |
| **Kategori keahlian** | Grup skill + level |
| **Stack utama** | Pill stack di section skills |
| **Tag keahlian** | Tag cloud skills |
| **Teks UI** | Semua label tombol, judul section, navigasi (ID/EN) |

## API

```
GET /api/portfolio
```

Mengembalikan seluruh data untuk frontend Vue dalam format yang sama dengan file `src/data/*.ts` dan `src/locales/*.json`.

## Frontend

Di root project Vue, set:

```
VITE_API_URL=http://localhost:8000
```

Jalankan backend (`php artisan serve`) dan frontend (`npm run dev`) bersamaan.
