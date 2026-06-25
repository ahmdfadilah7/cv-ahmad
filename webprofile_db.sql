-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2026 at 10:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webprofile_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('webprofile-cache-356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1782373738),
('webprofile-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1782373738;', 1782373738),
('webprofile-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:1;', 1782368219),
('webprofile-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1782368219;', 1782368219);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company` varchar(255) NOT NULL,
  `role` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`role`)),
  `period` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`period`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`description`)),
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`tags`)),
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `company`, `role`, `period`, `description`, `tags`, `sort_order`, `created_at`, `updated_at`) VALUES
(4, 'CV. Solution Intan Prima', '{\"id\":\"Web Developer\",\"en\":\"Web Developer\"}', '{\"id\":\"Mar 2023 \\u2014 Apr 2025\",\"en\":\"Mar 2023 \\u2014 Apr 2025\"}', '{\"id\":\"Bogor \\u2014 mengembangkan website internal dan proyek klien dengan stack Vue.js, Laravel, dan CodeIgniter sesuai kebutuhan proyek.\",\"en\":\"Bogor \\u2014 developing internal and client websites with Vue.js, Laravel, and CodeIgniter depending on project requirements.\"}', '[\"Vue.js\",\"Laravel\",\"CodeIgniter\",\"MySQL\",\"REST API\"]', 1, '2026-06-24 23:45:19', '2026-06-25 01:02:08'),
(5, 'PT. Netsindo Intermedia Etrade', '{\"id\":\"Web Developer\",\"en\":\"Web Developer\"}', '{\"id\":\"Agu 2021 \\u2014 Mar 2023\",\"en\":\"Aug 2021 \\u2014 Mar 2023\"}', '{\"id\":\"Bogor \\u2014 mengerjakan website operasional perusahaan menggunakan Vue.js, Laravel, dan CodeIgniter untuk kebutuhan bisnis internal dan klien.\",\"en\":\"Bogor \\u2014 delivering operational company websites using Vue.js, Laravel, and CodeIgniter for internal business and client needs.\"}', '[\"Vue.js\",\"Laravel\",\"CodeIgniter\",\"MySQL\",\"REST API\"]', 2, '2026-06-24 23:45:19', '2026-06-25 01:02:24'),
(6, 'Diskominfo Kota Bogor', '{\"id\":\"Web Developer\",\"en\":\"Web Developer\"}', '{\"id\":\"Agu 2020 \\u2014 Agu 2021\",\"en\":\"Aug 2020 \\u2014 Aug 2021\"}', '{\"id\":\"Bogor \\u2014 membangun dan mengelola portal pemerintahan daerah dengan Vue.js, Laravel, dan CodeIgniter.\",\"en\":\"Bogor \\u2014 building and managing local government portals with Vue.js, Laravel, and CodeIgniter.\"}', '[\"Vue.js\",\"Laravel\",\"CodeIgniter\",\"MySQL\",\"REST API\"]', 3, '2026-06-24 23:45:19', '2026-06-25 01:02:38'),
(7, 'PT Astrindo Travel Services', '{\"id\":\"IT Staff\",\"en\":\"IT Staff\"}', '{\"id\":\"Nov 2025 - Sekarang\",\"en\":\"Nov 2025 - Present\"}', '{\"id\":\"Jakarta \\u2014 mengerjakan website operasional perusahaan menggunakan Vue.js, Laravel, dan CodeIgniter untuk kebutuhan bisnis internal dan klien.\",\"en\":\"Jakarta \\u2014 works on the company\'s operational website using Vue.js, Laravel, and CodeIgniter for internal business and client needs.\"}', '[\"Vue.js\",\"Laravel\",\"PHP\",\"MySQL\",\"REST API\",\"CodeIgniter\"]', 0, '2026-06-25 00:56:50', '2026-06-25 00:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `experience_bullets`
--

CREATE TABLE `experience_bullets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `experience_id` bigint(20) UNSIGNED NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`text`)),
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experience_bullets`
--

INSERT INTO `experience_bullets` (`id`, `experience_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES
(10, 4, '{\"id\":\"Membangun antarmuka interaktif dengan Vue.js yang terhubung ke API Laravel untuk modul konten dinamis dan panel admin.\",\"en\":\"Built interactive Vue.js frontends connected to Laravel APIs for dynamic content modules and admin panels.\"}', 0, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(11, 4, '{\"id\":\"Memelihara dan mengembangkan aplikasi legacy berbasis CodeIgniter untuk sistem internal yang masih aktif.\",\"en\":\"Maintained and extended legacy CodeIgniter applications for active internal systems.\"}', 1, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(12, 4, '{\"id\":\"Mengintegrasikan REST API, optimasi query database, dan deployment ke lingkungan produksi.\",\"en\":\"Integrated REST APIs, optimized database queries, and deployed to production environments.\"}', 2, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(13, 5, '{\"id\":\"Mengembangkan dashboard dan fitur laporan dengan Vue.js di frontend dan Laravel\\/CodeIgniter di backend.\",\"en\":\"Developed dashboards and reporting features with Vue.js on the frontend and Laravel\\/CodeIgniter on the backend.\"}', 0, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(14, 5, '{\"id\":\"Membangun modul formulir digital dengan validasi server-side dan integrasi database MySQL.\",\"en\":\"Built digital form modules with server-side validation and MySQL database integration.\"}', 1, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(15, 5, '{\"id\":\"Berkolaborasi dengan tim non-teknis untuk menerjemahkan kebutuhan bisnis menjadi fitur web yang usable.\",\"en\":\"Collaborated with non-technical teams to translate business needs into usable web features.\"}', 2, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(16, 6, '{\"id\":\"Mengelola portal COVID-19 Kota Bogor \\u2014 pembaruan data harian dan penambahan halaman informasi publik.\",\"en\":\"Managed the Bogor City COVID-19 portal \\u2014 daily data updates and new public information pages.\"}', 0, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(17, 6, '{\"id\":\"Mengembangkan website dinas dengan Vue.js di sisi frontend dan Laravel\\/CodeIgniter untuk backend & CMS.\",\"en\":\"Developed agency websites with Vue.js on the frontend and Laravel\\/CodeIgniter for backend and CMS.\"}', 1, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(18, 6, '{\"id\":\"Memastikan website pemerintahan responsif dan dapat diakses dari perangkat mobile masyarakat.\",\"en\":\"Ensured government websites were responsive and accessible from citizens mobile devices.\"}', 2, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(19, 7, '{\"id\":\"Membuat website internal untuk management project menggunakan Vue.js + Laravel, sehingga project lebih tertata dan terstruktur\",\"en\":\"Create an internal website for project management using Vue.js + Laravel, so that the project is more organized and structured\"}', 0, '2026-06-25 00:56:50', '2026-06-25 00:56:50'),
(20, 7, '{\"id\":\"Membangun antarmuka interaktif dengan Vue.js yang terhubung ke API Laravel untuk modul konten dinamis dan panel admin.\",\"en\":\"Built interactive Vue.js frontends connected to Laravel APIs for dynamic content modules and admin panels.\"}', 0, '2026-06-25 00:56:50', '2026-06-25 00:56:50'),
(21, 7, '{\"id\":\"Membangun website data customer untuk perusahaan sehingga data customer terdokumentasikan\",\"en\":\"Building a customer data website for the company so that customer data is documented\"}', 0, '2026-06-25 00:56:50', '2026-06-25 00:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_06_25_000001_create_portfolio_tables', 1),
(5, '2026_06_25_000002_create_site_settings_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `phone_tel` varchar(255) NOT NULL,
  `years_experience` varchar(255) NOT NULL,
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`location`)),
  `headline` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`headline`)),
  `tagline` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`tagline`)),
  `bio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`bio`)),
  `availability` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`availability`)),
  `cv_path` varchar(255) DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) NOT NULL DEFAULT 'Web Developer',
  `address_locality` varchar(255) NOT NULL DEFAULT 'Bogor',
  `address_country` varchar(2) NOT NULL DEFAULT 'ID',
  `knows_about` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`knows_about`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `name`, `email`, `phone`, `phone_tel`, `years_experience`, `location`, `headline`, `tagline`, `bio`, `availability`, `cv_path`, `photo_path`, `job_title`, `address_locality`, `address_country`, `knows_about`, `created_at`, `updated_at`) VALUES
(2, 'Ahmad Fadilah', 'ahmdfadilah7@gmail.com', '+62 898-9505-373', '+628989505373', '4+', '{\"id\":\"Bogor, Indonesia\",\"en\":\"Bogor, Indonesia\"}', '{\"id\":\"Web Developer\",\"en\":\"Web Developer\"}', '{\"id\":\"Saya merancang web yang tajam di mata, ringan di perangkat, dan kuat di produksi \\u2014 dengan Vue & Laravel.\",\"en\":\"I craft websites that look sharp, feel lightweight, and hold strong in production \\u2014 with Vue & Laravel.\"}', '{\"id\":\"Web Developer berbasis Bogor dengan 4 tahun pengalaman full-stack. Stack utama saya Vue.js di frontend dan Laravel di backend \\u2014 untuk website instansi pemerintah, portal perusahaan, hingga proyek klien.\",\"en\":\"Bogor-based Web Developer with 4 years of full-stack experience. My primary stack is Vue.js on the frontend and Laravel on the backend \\u2014 for government agency sites, corporate portals, and client projects.\"}', '{\"id\":\"Terbuka untuk peluang Web Developer & proyek freelance\",\"en\":\"Open to Web Developer roles & freelance projects\"}', 'portfolio/profile/cv/01KVYTE4G7J26JCRVNGNESPBMT.pdf', 'portfolio/profile/photos/01KVYTH6GQESWECD02P5YE2W9J.png', 'Web Developer', 'Bogor', 'ID', NULL, '2026-06-24 23:45:19', '2026-06-25 00:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `profile_highlights`
--

CREATE TABLE `profile_highlights` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_id` bigint(20) UNSIGNED NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`text`)),
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_highlights`
--

INSERT INTO `profile_highlights` (`id`, `profile_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES
(5, 2, '{\"id\":\"Pengalaman 4+ tahun di Diskominfo Kota Bogor, Netsindo, dan Solution Intan Prima.\",\"en\":\"4+ years across Diskominfo Kota Bogor, Netsindo, and Solution Intan Prima.\"}', 0, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(6, 2, '{\"id\":\"Terbiasa mengelola banyak website aktif sekaligus \\u2014 update konten, fitur baru, dan maintenance rutin.\",\"en\":\"Used to managing multiple live websites \\u2014 content updates, new features, and routine maintenance.\"}', 1, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(7, 2, '{\"id\":\"Stack utama: Vue.js, Laravel, CodeIgniter, TypeScript, Tailwind CSS, MySQL\\/PostgreSQL, REST API.\",\"en\":\"Core stack: Vue.js, Laravel, CodeIgniter, TypeScript, Tailwind CSS, MySQL\\/PostgreSQL, REST API.\"}', 2, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(8, 2, '{\"id\":\"Fokus pada website yang stabil di produksi, bukan sekadar tampil bagus di demo.\",\"en\":\"Focused on production-stable websites, not just good-looking demos.\"}', 3, '2026-06-24 23:45:19', '2026-06-24 23:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `profile_social_links`
--

CREATE TABLE `profile_social_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_social_links`
--

INSERT INTO `profile_social_links` (`id`, `profile_id`, `label`, `url`, `icon`, `handle`, `sort_order`, `created_at`, `updated_at`) VALUES
(5, 2, 'GitHub', 'https://github.com/ahmdfadilah7', 'github', '@ahmdfadilah7', 0, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(6, 2, 'LinkedIn', 'https://www.linkedin.com/in/ahmdfadilah7', 'linkedin', 'Ahmad Fadilah', 1, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(7, 2, 'WhatsApp', 'https://wa.me/628989505373', 'whatsapp', '+62 898-9505-373', 2, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(8, 2, 'Instagram', 'https://www.instagram.com/ahmdfadilah7', 'instagram', '@ahmdfadilah7', 3, '2026-06-24 23:45:19', '2026-06-24 23:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `profile_stats`
--

CREATE TABLE `profile_stats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_id` bigint(20) UNSIGNED NOT NULL,
  `label` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`label`)),
  `value` varchar(255) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_stats`
--

INSERT INTO `profile_stats` (`id`, `profile_id`, `label`, `value`, `sort_order`, `created_at`, `updated_at`) VALUES
(5, 2, '{\"id\":\"Tahun pengalaman\",\"en\":\"Years experience\"}', '4+', 0, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(6, 2, '{\"id\":\"Stack utama\",\"en\":\"Primary stack\"}', 'Vue / Laravel', 1, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(7, 2, '{\"id\":\"Lokasi\",\"en\":\"Location\"}', 'Bogor', 2, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(8, 2, '{\"id\":\"Bahasa\",\"en\":\"Languages\"}', 'ID / EN', 3, '2026-06-24 23:45:19', '2026-06-24 23:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`description`)),
  `context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`context`)),
  `role` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`role`)),
  `outcome` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`outcome`)),
  `image_path` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `stack` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`stack`)),
  `status` varchar(255) NOT NULL DEFAULT 'completed',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `slug`, `title`, `description`, `context`, `role`, `outcome`, `image_path`, `url`, `stack`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(5, 'ruang-huni', '{\"id\":\"Ruang Huni\",\"en\":\"Ruang Huni\"}', '{\"id\":\"Website Penyewaan properti seperti rumah, kos, apartemen dan ruko.\",\"en\":\"Property rental websites such as houses, boarding houses, apartments and shophouses.\"}', '{\"id\":\"Website yang dibangun untuk membantu customer mencari properti yang disewakan, dan membantu para agen untuk memposting unit properti yang mereka miliki agar dapat penyewa.\",\"en\":\"Websites are built to help customers find properties for rent, and help agents post the property units they own so they can become tenants.\"}', '{\"id\":\"Pembuat Website dan Pengembangan fitur.\",\"en\":\"Website Builder and Feature Development.\"}', '{\"id\":\"Untuk saat ini website masih uji coba belum masuk kedalam production karena ini website saya sendiri.\",\"en\":\"Currently, the website is still being tested and has not yet been included in production because this is my own website.\"}', 'portfolio/projects/covers/01KVYVEB7M9T9PCT990JAA0XR0.png', 'https://ruanghuni.hachiedigitation.com/', '[\"Laravel\",\"MySQL\",\"JavaScript\",\"PHP\"]', 'planned', 0, '2026-06-24 23:45:19', '2026-06-25 00:39:40'),
(6, 'tubevault', '{\"id\":\"Tubevault\",\"en\":\"Tubevault\"}', '{\"id\":\"Website untuk mendengarkan musik dari youtube.\",\"en\":\"Website to listen to music from YouTube.\"}', '{\"id\":\"Saya membuat website ini untuk membantu siapa saja yang ingin mendengarkan musik dari youtube dengan putar otomatis dan membuat playlist sendiri\",\"en\":\"I created this website to help anyone who wants to listen to music from YouTube by autoplaying and creating their own playlist\"}', '{\"id\":\"Full-stack development \\u2014 struktur halaman, backend PHP, dan integrasi database.\",\"en\":\"Full-stack development \\u2014 page structure, PHP backend, and database integration.\"}', '{\"id\":\"Website berjalan dengan baik dan fitur putar otomatis berjalan sesuai dengan keinginan saya\",\"en\":\"The website is running well and the autoplay feature is running according to my wishes\"}', 'portfolio/projects/covers/01KVYW0EPGNB3ZN3FKJ3C5T3SW.png', 'https://tubevault.hachiedigitation.com/', '[\"Vue.js\",\"Laravel\",\"MySQL\",\"PHP\",\"Javascript\"]', 'in_progress', 1, '2026-06-24 23:45:19', '2026-06-25 00:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `project_screenshots`
--

CREATE TABLE `project_screenshots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `caption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`caption`)),
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_screenshots`
--

INSERT INTO `project_screenshots` (`id`, `project_id`, `image_path`, `caption`, `sort_order`, `created_at`, `updated_at`) VALUES
(13, 5, 'portfolio/projects/screenshots/01KVYVBX4R2PAD3998R0YNW8EJ.png', '{\"id\":\"Halaman detail properti\",\"en\":\"Property details page\"}', 0, '2026-06-24 23:45:19', '2026-06-25 00:37:00'),
(14, 5, 'portfolio/projects/screenshots/01KVYVBX526CV84KDV76400HAR.png', '{\"id\":\"Halaman list properti sesuai kategori (Rumah, Kos, Apartemen, Ruko)\",\"en\":\"Property list page according to category (House, Boarding House, Apartment, Shophouse)\"}', 1, '2026-06-24 23:45:19', '2026-06-25 00:37:00'),
(15, 5, 'portfolio/projects/screenshots/01KVYVBX5958A5BP6TH5SEEEJT.png', '{\"id\":\"Dashboard user penyewa\",\"en\":\"Renter user dashboard\"}', 2, '2026-06-24 23:45:19', '2026-06-25 00:37:00'),
(16, 6, 'portfolio/projects/screenshots/01KVYW0EPYRNWSNET6PW6H2RQH.png', '{\"id\":\"Fitur pencarian musik atau konten dari youtube\",\"en\":\"Music search feature or content from YouTube\"}', 0, '2026-06-24 23:45:19', '2026-06-25 00:48:14'),
(17, 6, 'portfolio/projects/screenshots/01KVYW0EQ8HJHAQMBQNSN5CJ68.png', '{\"id\":\"Halaman perpustakaan\",\"en\":\"Library page\"}', 1, '2026-06-24 23:45:19', '2026-06-25 00:48:14'),
(18, 6, 'portfolio/projects/screenshots/01KVYW0EQK2SQXXJD2K06TN2HF.png', '{\"id\":\"Halaman pemutaran musik\",\"en\":\"Music playback page\"}', 2, '2026-06-24 23:45:19', '2026-06-25 00:48:14'),
(25, 5, 'portfolio/projects/screenshots/01KVYVBX5HANCVBGZXEC12PA8D.png', '{\"id\":\"Fitur perbandingan properti\",\"en\":\"Property comparison features\"}', 0, '2026-06-25 00:37:00', '2026-06-25 00:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4m3W2SlP6NKraZjpHsRZxvBPJE8aXArBWKbHNiIM', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoib0pLUmU4WkUwdDBrTGY1ZUt2dHEwemN5cThJb3F5aUVrVzBQaVJIeCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vZXhwZXJpZW5jZXMiO3M6NToicm91dGUiO3M6NDI6ImZpbGFtZW50LmFkbWluLnJlc291cmNlcy5leHBlcmllbmNlcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6ImRjYmMzYTRhMmFkNTc1Zjk0NDFlOGZjNzRlMjE0YjMxZDAxYjIyNmEyYjljZjBlNzBkMGVmYzQ4NzNiMDY2Y2EiO3M6ODoiZmlsYW1lbnQiO2E6MDp7fXM6NjoidGFibGVzIjthOjY6e3M6NDA6ImU0MmNlNDc2YjY0OTQyZDM4ZWQ4MzE3YTE2MWM1NTYwX2NvbHVtbnMiO2E6Mzp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6InRpdGxlIjtzOjU6ImxhYmVsIjtzOjg6IkthdGVnb3JpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToiaXRlbXNfY291bnQiO3M6NToibGFiZWwiO3M6MTI6Ikp1bWxhaCBza2lsbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InNvcnRfb3JkZXIiO3M6NToibGFiZWwiO3M6NjoiVXJ1dGFuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiJhMmM4OTI3MGZhMmZiOGYwNzMzNDhhMDMxNjg1MGE0M19jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJncm91cCI7czo1OiJsYWJlbCI7czo0OiJHcnVwIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czozOiJrZXkiO3M6NToibGFiZWwiO3M6NToiS3VuY2kiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjg6InZhbHVlX2lkIjtzOjU6ImxhYmVsIjtzOjk6IkluZG9uZXNpYSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6ODoidmFsdWVfZW4iO3M6NToibGFiZWwiO3M6NzoiRW5nbGlzaCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MToiYTJjODkyNzBmYTJmYjhmMDczMzQ4YTAzMTY4NTBhNDNfcGVyX3BhZ2UiO3M6MjoiNTAiO3M6NDA6IjkxOTQ2MTRjMWM5YmFiMTY2ZmMxZjI0OGQ1MDk3MTcyX2NvbHVtbnMiO2E6Mjp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjU6ImxhYmVsIjtzOjU6IlN0YWNrIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoic29ydF9vcmRlciI7czo1OiJsYWJlbCI7czo2OiJVcnV0YW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6IjE1ZmFhYmIzNGYzOWU4NjM1YTU2MmY1ODczM2EzMjJjX2NvbHVtbnMiO2E6NTp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6InRpdGxlIjtzOjU6ImxhYmVsIjtzOjU6Ikp1ZHVsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJzbHVnIjtzOjU6ImxhYmVsIjtzOjQ6IlNsdWciO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjY6InN0YXR1cyI7czo1OiJsYWJlbCI7czo2OiJTdGF0dXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6InN0YWNrIjtzOjU6ImxhYmVsIjtzOjU6IlN0YWNrIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoic29ydF9vcmRlciI7czo1OiJsYWJlbCI7czo2OiJVcnV0YW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6ImRlZTIyMjY3OTYyNWMxZGVkOTA5MmU4MDY5ODIyNzBmX2NvbHVtbnMiO2E6NTp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6ImNvbXBhbnkiO3M6NToibGFiZWwiO3M6MTA6IlBlcnVzYWhhYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6InJvbGUiO3M6NToibGFiZWwiO3M6NzoiSmFiYXRhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NjoicGVyaW9kIjtzOjU6ImxhYmVsIjtzOjc6IlBlcmlvZGUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6InRhZ3MiO3M6NToibGFiZWwiO3M6MzoiVGFnIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoic29ydF9vcmRlciI7czo1OiJsYWJlbCI7czo2OiJVcnV0YW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fX19', 1782374564);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `favicon_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `site_name`, `logo_path`, `favicon_path`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad Fadilah — Web Developer', NULL, '/favicon.svg', '2026-06-24 23:45:20', '2026-06-24 23:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `skill_categories`
--

CREATE TABLE `skill_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skill_categories`
--

INSERT INTO `skill_categories` (`id`, `title`, `sort_order`, `created_at`, `updated_at`) VALUES
(4, '{\"id\":\"Pengembangan\",\"en\":\"Development\"}', 0, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(5, '{\"id\":\"Data & API\",\"en\":\"Data & API\"}', 1, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(6, '{\"id\":\"Tools & Sistem\",\"en\":\"Tools & Systems\"}', 2, '2026-06-24 23:45:20', '2026-06-24 23:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `skill_items`
--

CREATE TABLE `skill_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `skill_category_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skill_items`
--

INSERT INTO `skill_items` (`id`, `skill_category_id`, `label`, `level`, `sort_order`, `created_at`, `updated_at`) VALUES
(12, 4, 'JavaScript', 'proficient', 0, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(13, 4, 'PHP / CodeIgniter', 'proficient', 1, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(14, 4, 'HTML & CSS', 'expert', 2, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(15, 4, 'jQuery', 'proficient', 3, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(16, 5, 'MySQL', 'expert', 0, '2026-06-24 23:45:20', '2026-06-24 23:45:20'),
(17, 5, 'PostgreSQL', 'proficient', 1, '2026-06-24 23:45:20', '2026-06-24 23:45:20'),
(18, 5, 'REST API', 'proficient', 2, '2026-06-24 23:45:20', '2026-06-24 23:45:20'),
(19, 6, 'Git', 'proficient', 0, '2026-06-24 23:45:20', '2026-06-24 23:45:20'),
(20, 6, 'Vite', 'proficient', 1, '2026-06-24 23:45:20', '2026-06-24 23:45:20'),
(21, 6, 'Linux', 'familiar', 2, '2026-06-24 23:45:20', '2026-06-24 23:45:20'),
(22, 6, 'Windows', 'expert', 3, '2026-06-24 23:45:20', '2026-06-24 23:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `skill_primary_items`
--

CREATE TABLE `skill_primary_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skill_primary_items`
--

INSERT INTO `skill_primary_items` (`id`, `label`, `sort_order`, `created_at`, `updated_at`) VALUES
(5, 'Vue.js', 0, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(6, 'Laravel', 1, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(7, 'TypeScript', 2, '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(8, 'Tailwind CSS', 3, '2026-06-24 23:45:19', '2026-06-24 23:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `skill_tags`
--

CREATE TABLE `skill_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skill_tags`
--

INSERT INTO `skill_tags` (`id`, `label`, `sort_order`, `created_at`, `updated_at`) VALUES
(7, 'Pinia', 0, '2026-06-24 23:45:20', '2026-06-24 23:45:20'),
(8, 'Vue Router', 1, '2026-06-24 23:45:20', '2026-06-24 23:45:20'),
(9, 'Docker', 2, '2026-06-24 23:45:20', '2026-06-24 23:45:20'),
(10, 'Responsive Design', 3, '2026-06-24 23:45:20', '2026-06-24 23:45:20'),
(11, 'SEO', 4, '2026-06-24 23:45:20', '2026-06-24 23:45:20'),
(12, 'Performance', 5, '2026-06-24 23:45:20', '2026-06-24 23:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `ui_translations`
--

CREATE TABLE `ui_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value_id` text NOT NULL,
  `value_en` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ui_translations`
--

INSERT INTO `ui_translations` (`id`, `group`, `key`, `value_id`, `value_en`, `created_at`, `updated_at`) VALUES
(69, 'meta', 'meta.title', 'Ahmad Fadilah — Web Developer', 'Ahmad Fadilah — Web Developer', '2026-06-24 23:45:17', '2026-06-24 23:45:17'),
(70, 'meta', 'meta.description', 'CV & portfolio Ahmad Fadilah — Web Developer Bogor, 4+ tahun pengalaman. Vue.js, Laravel, TypeScript, MySQL.', 'CV & portfolio of Ahmad Fadilah — Web Developer from Bogor, 4+ years experience. Vue.js, Laravel, TypeScript, MySQL.', '2026-06-24 23:45:17', '2026-06-24 23:45:17'),
(71, 'nav', 'nav.home', 'Beranda', 'Home', '2026-06-24 23:45:17', '2026-06-24 23:45:17'),
(72, 'nav', 'nav.about', 'Tentang', 'About', '2026-06-24 23:45:17', '2026-06-24 23:45:17'),
(73, 'nav', 'nav.skills', 'Keahlian', 'Skills', '2026-06-24 23:45:17', '2026-06-24 23:45:17'),
(74, 'nav', 'nav.experience', 'Pengalaman', 'Experience', '2026-06-24 23:45:17', '2026-06-24 23:45:17'),
(75, 'nav', 'nav.projects', 'Proyek', 'Projects', '2026-06-24 23:45:17', '2026-06-24 23:45:17'),
(76, 'nav', 'nav.contact', 'Kontak', 'Contact', '2026-06-24 23:45:17', '2026-06-24 23:45:17'),
(77, 'hero', 'hero.badge', 'Terbuka untuk peluang', 'Open to opportunities', '2026-06-24 23:45:17', '2026-06-24 23:45:17'),
(78, 'hero', 'hero.ctaProjects', 'Lihat proyek', 'View projects', '2026-06-24 23:45:17', '2026-06-24 23:45:17'),
(79, 'hero', 'hero.ctaContact', 'Hubungi saya', 'Get in touch', '2026-06-24 23:45:17', '2026-06-24 23:45:17'),
(80, 'hero', 'hero.ctaCv', 'Unduh CV', 'Download CV', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(81, 'hero', 'hero.yearsLabel', 'tahun pengalaman', 'years of experience', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(82, 'about', 'about.title', 'Tentang Saya', 'About Me', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(83, 'about', 'about.subtitle', 'Siapa saya dan bagaimana saya bekerja', 'Who I am and how I work', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(84, 'about', 'about.highlightsTitle', 'Keahlian utama', 'Core strengths', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(85, 'about', 'about.quickFactsTitle', 'Info singkat', 'Quick facts', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(86, 'skills', 'skills.title', 'Keahlian', 'Skills', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(87, 'skills', 'skills.subtitle', 'Stack yang saya gunakan sehari-hari', 'Technologies I work with day to day', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(88, 'skills', 'skills.primaryTitle', 'Stack utama', 'Primary stack', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(89, 'skills', 'skills.extraTitle', 'Juga familiar dengan', 'Also familiar with', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(90, 'skills', 'skills.levels.expert', 'Mahir', 'Expert', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(91, 'skills', 'skills.levels.proficient', 'Terampil', 'Proficient', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(92, 'skills', 'skills.levels.familiar', 'Familiar', 'Familiar', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(93, 'experience', 'experience.title', 'Pengalaman', 'Experience', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(94, 'experience', 'experience.subtitle', 'Perjalanan karier 4+ tahun di dunia web development', '4+ years journey in web development', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(95, 'projects', 'projects.title', 'Proyek', 'Projects', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(96, 'projects', 'projects.subtitle', 'Konteks, peran, dan hasil dari pekerjaan utama', 'Context, role, and outcomes from key work', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(97, 'projects', 'projects.viewProject', 'Lihat demo', 'View demo', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(98, 'projects', 'projects.viewDetail', 'Lihat detail & screenshot', 'View detail & screenshots', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(99, 'projects', 'projects.context', 'Konteks', 'Context', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(100, 'projects', 'projects.role', 'Peran', 'Role', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(101, 'projects', 'projects.outcome', 'Hasil', 'Outcome', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(102, 'projects', 'projects.status.completed', 'Selesai', 'Completed', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(103, 'projects', 'projects.status.in_progress', 'Berjalan', 'In progress', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(104, 'projects', 'projects.status.planned', 'Direncanakan', 'Planned', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(105, 'projectDetail', 'projectDetail.back', 'Kembali ke proyek', 'Back to projects', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(106, 'projectDetail', 'projectDetail.screenshots', 'Screenshot Proyek', 'Project Screenshots', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(107, 'projectDetail', 'projectDetail.screenshotsSubtitle', 'Cuplikan tampilan dari proyek yang telah dikerjakan', 'Screenshots from completed project work', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(108, 'projectDetail', 'projectDetail.viewDemo', 'Lihat demo / repository', 'View demo / repository', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(109, 'projectDetail', 'projectDetail.notFound', 'Proyek tidak ditemukan', 'Project not found', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(110, 'projectDetail', 'projectDetail.backHome', 'Kembali ke beranda', 'Back to home', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(111, 'projectDetail', 'projectDetail.closeLightbox', 'Tutup gambar', 'Close image', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(112, 'projectDetail', 'projectDetail.prevImage', 'Gambar sebelumnya', 'Previous image', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(113, 'projectDetail', 'projectDetail.nextImage', 'Gambar berikutnya', 'Next image', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(114, 'contact', 'contact.title', 'Kontak', 'Contact', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(115, 'contact', 'contact.subtitle', 'Mari diskusikan proyek atau peluang kerja', 'Let\'s discuss a project or job opportunity', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(116, 'contact', 'contact.email', 'Email', 'Email', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(117, 'contact', 'contact.phone', 'Telepon', 'Phone', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(118, 'contact', 'contact.location', 'Lokasi', 'Location', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(119, 'contact', 'contact.availability', 'Ketersediaan', 'Availability', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(120, 'contact', 'contact.downloadCv', 'Unduh CV (PDF)', 'Download CV (PDF)', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(121, 'contact', 'contact.cvHint', 'Letakkan file PDF Anda di public/cv-ahmad-fadilah.pdf', 'Place your PDF file at public/cv-ahmad-fadilah.pdf', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(122, 'contact', 'contact.responseTime', 'Biasanya membalas dalam 1–2 hari kerja.', 'I usually reply within 1–2 business days.', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(123, 'contact', 'contact.socialTitle', 'Media Sosial', 'Social Media', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(124, 'contact', 'contact.socialSubtitle', 'Terhubung lewat platform favorit Anda', 'Connect on your preferred platform', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(125, 'footer', 'footer.rights', 'Hak cipta dilindungi.', 'All rights reserved.', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(126, 'footer', 'footer.builtWith', 'Dibangun dengan Vue 3 & Tailwind CSS', 'Built with Vue 3 & Tailwind CSS', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(127, 'lang', 'lang.switch', 'Ganti bahasa', 'Switch language', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(128, 'lang', 'lang.id', 'ID', 'ID', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(129, 'lang', 'lang.en', 'EN', 'EN', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(130, 'theme', 'theme.toggle', 'Ganti tema', 'Toggle theme', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(131, 'theme', 'theme.light', 'Mode terang', 'Light mode', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(132, 'theme', 'theme.dark', 'Mode gelap', 'Dark mode', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(133, 'a11y', 'a11y.mainNav', 'Navigasi utama', 'Main navigation', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(134, 'a11y', 'a11y.openMenu', 'Buka menu', 'Open menu', '2026-06-24 23:45:18', '2026-06-24 23:45:18'),
(135, 'a11y', 'a11y.closeMenu', 'Tutup menu', 'Close menu', '2026-06-24 23:45:19', '2026-06-24 23:45:19'),
(136, 'a11y', 'a11y.skipToContent', 'Lewati ke konten utama', 'Skip to main content', '2026-06-24 23:45:19', '2026-06-24 23:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin WebProfile', 'admin@webprofile.test', '2026-06-24 23:15:07', '$2y$12$pCDIKmhDxVPIEjgUZpyPNu13XuRZc4VU68Tw8rb.X0EkA99nNShYO', NULL, '2026-06-24 23:15:07', '2026-06-24 23:15:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experience_bullets`
--
ALTER TABLE `experience_bullets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experience_bullets_experience_id_foreign` (`experience_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_highlights`
--
ALTER TABLE `profile_highlights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_highlights_profile_id_foreign` (`profile_id`);

--
-- Indexes for table `profile_social_links`
--
ALTER TABLE `profile_social_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_social_links_profile_id_foreign` (`profile_id`);

--
-- Indexes for table `profile_stats`
--
ALTER TABLE `profile_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_stats_profile_id_foreign` (`profile_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_slug_unique` (`slug`);

--
-- Indexes for table `project_screenshots`
--
ALTER TABLE `project_screenshots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_screenshots_project_id_foreign` (`project_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skill_categories`
--
ALTER TABLE `skill_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skill_items`
--
ALTER TABLE `skill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skill_items_skill_category_id_foreign` (`skill_category_id`);

--
-- Indexes for table `skill_primary_items`
--
ALTER TABLE `skill_primary_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skill_tags`
--
ALTER TABLE `skill_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ui_translations`
--
ALTER TABLE `ui_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ui_translations_key_unique` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `experience_bullets`
--
ALTER TABLE `experience_bullets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `profile_highlights`
--
ALTER TABLE `profile_highlights`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `profile_social_links`
--
ALTER TABLE `profile_social_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `profile_stats`
--
ALTER TABLE `profile_stats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `project_screenshots`
--
ALTER TABLE `project_screenshots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `skill_categories`
--
ALTER TABLE `skill_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `skill_items`
--
ALTER TABLE `skill_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `skill_primary_items`
--
ALTER TABLE `skill_primary_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `skill_tags`
--
ALTER TABLE `skill_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ui_translations`
--
ALTER TABLE `ui_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `experience_bullets`
--
ALTER TABLE `experience_bullets`
  ADD CONSTRAINT `experience_bullets_experience_id_foreign` FOREIGN KEY (`experience_id`) REFERENCES `experiences` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profile_highlights`
--
ALTER TABLE `profile_highlights`
  ADD CONSTRAINT `profile_highlights_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profile_social_links`
--
ALTER TABLE `profile_social_links`
  ADD CONSTRAINT `profile_social_links_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profile_stats`
--
ALTER TABLE `profile_stats`
  ADD CONSTRAINT `profile_stats_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_screenshots`
--
ALTER TABLE `project_screenshots`
  ADD CONSTRAINT `project_screenshots_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `skill_items`
--
ALTER TABLE `skill_items`
  ADD CONSTRAINT `skill_items_skill_category_id_foreign` FOREIGN KEY (`skill_category_id`) REFERENCES `skill_categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
