-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Okt 2023 pada 11.49
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gudang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangs`
--

CREATE TABLE `barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name_barang` varchar(255) NOT NULL,
  `image_barang` varchar(255) DEFAULT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barangs`
--

INSERT INTO `barangs` (`id`, `user_id`, `name_barang`, `image_barang`, `stok`, `created_at`, `updated_at`) VALUES
(47, 1, 'Komputer', 'barang_images/46Zgb4kjeiGepnIC2vQfKkxJ9VRNbwUY19PUscKm.jpg', 0, '2023-10-20 07:46:35', '2023-10-25 02:36:35'),
(48, 1, 'Printer', 'barang_images/jyoJ52ag7FjZezdwmuvJogFeftKrFGZR5sD64KL3.jpg', 64, '2023-10-20 07:46:51', '2023-10-25 02:26:11'),
(49, 1, 'Proyektor', 'barang_images/8yLuzIr685EFbnKcuIL7pt969CmGncHHgWNL5ZLr.jpg', 15, '2023-10-20 07:47:09', '2023-10-20 07:47:09'),
(50, 1, 'sdfg', 'barang_images/Rtaw1l7KedgZbQs4Vudn76JnlBeGd0EzNQbiuSRk.png', 4, '2023-10-24 21:11:00', '2023-10-24 21:11:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `keluars`
--

CREATE TABLE `keluars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `name_barang` varchar(255) DEFAULT NULL,
  `tgl` longtext DEFAULT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `keluars`
--

INSERT INTO `keluars` (`id`, `user_id`, `barang_id`, `name_barang`, `tgl`, `stok`, `created_at`, `updated_at`) VALUES
(10, 1, 48, NULL, '12-12-2020', 1, '2023-10-25 00:54:05', '2023-10-25 00:54:05'),
(11, 1, 48, NULL, '12-12-2020', 1, '2023-10-25 02:26:11', '2023-10-25 02:26:11'),
(12, 1, 47, NULL, '2023-10-25', 2, '2023-10-25 02:28:15', '2023-10-25 02:28:15'),
(13, 1, 47, NULL, '2023-10-25', 45, '2023-10-25 02:35:57', '2023-10-25 02:35:57'),
(14, 1, 47, NULL, '2023-10-25', 3, '2023-10-25 02:36:14', '2023-10-25 02:36:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `masuks`
--

CREATE TABLE `masuks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `name_barang` varchar(255) DEFAULT NULL,
  `tgl` longtext DEFAULT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `masuks`
--

INSERT INTO `masuks` (`id`, `user_id`, `barang_id`, `name_barang`, `tgl`, `stok`, `created_at`, `updated_at`) VALUES
(16, 1, 47, NULL, '12/12/2020', 1, '2023-10-24 04:57:51', '2023-10-24 04:57:51'),
(17, 1, 47, NULL, '12/12/2020', 1, '2023-10-24 05:05:20', '2023-10-24 05:05:20'),
(18, 1, 48, NULL, '12-12-2020', 1, '2023-10-24 05:38:47', '2023-10-24 05:38:47'),
(19, 1, 48, NULL, '12-12-2020', 1, '2023-10-24 06:34:06', '2023-10-24 06:34:06'),
(20, 1, 48, NULL, '12-12-2020', 1, '2023-10-24 06:45:50', '2023-10-24 06:45:50'),
(21, 1, 48, NULL, '12-12-2020', 1, '2023-10-24 07:21:53', '2023-10-24 07:21:53'),
(22, 1, 48, NULL, '12-12-2020', 1, '2023-10-25 00:29:56', '2023-10-25 00:29:56'),
(24, 1, 47, NULL, '2023-10-25', 2, '2023-10-25 00:39:27', '2023-10-25 00:39:27'),
(25, 1, 48, NULL, '2023-10-25', 50, '2023-10-25 00:42:58', '2023-10-25 00:42:58'),
(26, 1, 47, NULL, '2023-10-25', 45, '2023-10-25 02:29:47', '2023-10-25 02:29:47'),
(27, 1, 47, NULL, '2023-10-25', 2, '2023-10-25 02:36:35', '2023-10-25 02:36:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_18_022701_create_barangs_table', 1),
(6, '2023_10_18_063652_create_masuks_table', 1),
(7, '2023_10_18_152912_create_keluars_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyApp', 'ed1eec383ad5c1793291b51e92557a1246418486b72fdb4fadd1c529924e65be', '[\"*\"]', '2023-10-25 02:36:38', NULL, '2023-10-18 18:32:52', '2023-10-25 02:36:38'),
(2, 'App\\Models\\User', 2, 'MyApp', 'cdb20e9d7da124ff8d856234a3be090f625bc515929e407e5c3f8cb1e7041320', '[\"*\"]', '2023-10-19 20:20:37', NULL, '2023-10-19 06:48:37', '2023-10-19 20:20:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'iros', 'jjebbde@fgs', NULL, '$2y$10$rJ64MBo.J4dozb3yWmpzD.Nt6kC/6GvlSf/5ymEf1zXF.me/GuOgW', '1|L87KWAL4MWj5mbjfEdyGooY188J90YcS3nu8xpTi247ba7b0', NULL, '2023-10-18 18:32:52', '2023-10-18 18:32:52'),
(2, 'syin', 'syin@AYAM', NULL, '$2y$10$U9u5q2Gz.S5F2vLR8l2WI.FqXqd.8DlscRE4HotQ0g2t3OWfcfCPK', '2|JNkxpSG7tiiy5LtGXpO0aRxOQIKogf4yKWnBkIFb3024e303', NULL, '2023-10-19 06:48:37', '2023-10-19 06:48:37');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barangs_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `keluars`
--
ALTER TABLE `keluars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keluars_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `masuks`
--
ALTER TABLE `masuks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `masuks_user_id_foreign` (`user_id`),
  ADD KEY `fk_barang_id` (`barang_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `keluars`
--
ALTER TABLE `keluars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `masuks`
--
ALTER TABLE `masuks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barangs`
--
ALTER TABLE `barangs`
  ADD CONSTRAINT `barangs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keluars`
--
ALTER TABLE `keluars`
  ADD CONSTRAINT `keluars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `masuks`
--
ALTER TABLE `masuks`
  ADD CONSTRAINT `fk_barang_id` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`),
  ADD CONSTRAINT `masuks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
