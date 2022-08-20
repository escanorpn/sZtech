-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2022 at 09:40 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dash1`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `url`, `created_at`, `updated_at`) VALUES
(1, 'public/files/companies/2022-07-23/Hc3VSi6Em5t2f13Xr2H6kWpZmHbKfYwhRW0ZOPj2.jpg', '2022-07-23 03:40:11', '2022-07-23 03:40:11'),
(2, 'public/files/companies/2022-07-23/AuhQz7dUdjGDskjD7kNI3C79fGoOR65YJ8SXfbfI.jpg', '2022-07-23 03:40:11', '2022-07-23 03:40:11'),
(3, 'public/files/companies/2022-07-23/kE2Ex7UI3hGVdOrwZXrbuHHMYD2t5dpt01CCtlyA.jpg', '2022-07-23 03:40:11', '2022-07-23 03:40:11'),
(4, 'public/files/companies/2022-07-23/lgqLIeqvu6DnZYGVxAuco4CihzhdWo7lhKFECHEe.jpg', '2022-07-23 03:40:12', '2022-07-23 03:40:12'),
(5, 'public/files/companies/2022-07-23/9bV5Ie4gmMAd1jbYuCOMJ5V5WDfNDV92DuHXbPva.jpg', '2022-07-23 03:40:12', '2022-07-23 03:40:12'),
(6, 'public/files/companies/2022-07-23/t288GakUxhUrzH8mHPQnjM2VOc51Zb1hJ7HaESii.jpg', '2022-07-23 03:40:12', '2022-07-23 03:40:12'),
(7, 'public/files/companies/2022-07-23/QMuZ3jOqbrcIv1C5eIFOVVSw00Q0oB15lPnKc5fo.jpg', '2022-07-23 03:40:12', '2022-07-23 03:40:12'),
(8, 'public/files/companies/2022-07-23/QqrWYuQ3VQ0ocj0bsSq1t9Rxjit8P6tncxkYMME0.jpg', '2022-07-23 03:40:13', '2022-07-23 03:40:13'),
(9, 'public/files/companies/2022-07-23/s0UY8vubP1rnyjgnhEgOubWSYPDsCdrAxnPpgYMu.jpg', '2022-07-23 03:40:13', '2022-07-23 03:40:13'),
(10, 'public/files/companies/2022-07-23/WueBfZkyHuNbrbgiW0H0l1P87nHiDOLTHJoT3AK5.jpg', '2022-07-23 03:40:13', '2022-07-23 03:40:13'),
(11, 'public/files/companies/2022-07-23/7Kfw4oXwh1hisHNTmQJowV2FQHh9SZ6pqn3FYOYV.jpg', '2022-07-23 03:40:13', '2022-07-23 03:40:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `url`, `product_id`, `project_id`, `created_at`, `updated_at`, `service_id`) VALUES
(1, 'public/files/2022-07-22/Vir13ypFDUdCS8fmfi3H6MTdF37PqxR0iTOHhFh2.jpg', 3, NULL, '2022-07-22 16:02:49', '2022-07-22 16:02:49', NULL),
(2, 'public/files/2022-07-22/jZgCfsxsWKO9KSuXTMsiHD9iBV0Ar7eZJiSdhmiS.jpg', 3, NULL, '2022-07-22 16:02:49', '2022-07-22 16:02:49', NULL),
(3, 'public/files/2022-07-22/lzGhAjiVjHWjk04A6U6G8wKfASp2kZPnBOSiOh7s.jpg', 3, NULL, '2022-07-22 16:02:49', '2022-07-22 16:02:49', NULL),
(4, 'public/files/2022-07-22/RrN8brgXXf26CYLovyQiBTTZQzBel5LR9h243x2Z.jpg', 4, NULL, '2022-07-22 16:03:01', '2022-07-22 16:03:01', NULL),
(5, 'public/files/2022-07-23/V3adrimFWEfxbEVLrwSvKROetEiPOJOXjNmMnlXa.jpg', 5, NULL, '2022-07-22 22:55:58', '2022-07-22 22:55:58', NULL),
(6, 'public/files/2022-07-23/4COGoFNTYIq3ckhidklWmC1btz9P27yuslP1HO5q.jpg', 6, NULL, '2022-07-22 22:56:09', '2022-07-22 22:56:09', NULL),
(7, 'public/files/2022-07-23/T1sHsP3OGkbjbETbdgEQuCHMVfET7oSntTfwRSua.jpg', 7, NULL, '2022-07-22 22:56:49', '2022-07-22 22:56:49', NULL),
(8, 'public/files/2022-07-23/U2hmRGu25uWVDTdxC2Ff5ileji291FvrwFh3zJkn.jpg', 7, NULL, '2022-07-22 22:56:50', '2022-07-22 22:56:50', NULL),
(9, 'public/files/2022-07-23/2UcJhAlQ4YLvYRi8qI4OwBIiXxsBJZb0OIfVx0QT.jpg', 8, NULL, '2022-07-22 22:57:06', '2022-07-22 22:57:06', NULL),
(10, 'public/files/2022-07-23/8gOAn0EAtUHLHlGS4y6P2AMVkHfHL6QMiMXqi6pB.jpg', 8, NULL, '2022-07-22 22:57:06', '2022-07-22 22:57:06', NULL),
(11, 'public/files/2022-07-23/UC586H0kOxenlRxvqilRb1QymVNKbKPPBU7WxWDE.jpg', 8, NULL, '2022-07-22 22:57:06', '2022-07-22 22:57:06', NULL),
(12, 'public/files/2022-07-23/XZOWZKGkWmY3DEEoArPvChXwByKzI3vlCJ1ayAs8.jpg', 9, NULL, '2022-07-22 22:57:16', '2022-07-22 22:57:16', NULL),
(13, 'public/files/2022-07-23/KppP7NN5UvshCOITxJBUaxi8dmqSvLfR3aG5hJX2.jpg', 10, NULL, '2022-07-22 22:57:19', '2022-07-22 22:57:19', NULL),
(14, 'public/files/2022-07-23/T9h9ygJjKXMC7Ty0MxLycrvdp7PdrLb6Xy5JKnK7.jpg', 11, NULL, '2022-07-22 22:57:23', '2022-07-22 22:57:23', NULL),
(15, 'public/files/2022-07-23/9ZUMyV7z8uD2fNHCsbiFbx0tXX30ZjwHqdj3sMLu.jpg', 12, NULL, '2022-07-23 03:08:45', '2022-07-23 03:08:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_07_11_103726_create_products_table', 1),
(6, '2022_07_11_120251_create_images_table', 1),
(7, '2022_07_16_112547_create_companies_table', 1),
(8, '2022_07_16_112858_create_services_table', 1),
(9, '2022_07_16_133428_create_projects_table', 1),
(10, '2022_07_16_164617_add__service_id_to_images', 1),
(11, '2022_07_18_092459_add_priority_to_projects_table', 1),
(12, '2022_07_22_183104_create_portfolios_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `img`, `created_at`, `updated_at`) VALUES
(4, 'kiwi lemon kooler', 'null', NULL, '2022-07-22 16:03:01', '2022-07-22 16:03:01'),
(5, 'chocolate cinnamon tea', 'null', NULL, '2022-07-22 22:55:58', '2022-07-22 22:55:58'),
(6, 'chocolate cinnamon tea', 'With description', NULL, '2022-07-22 22:56:09', '2022-07-22 22:56:09'),
(7, 'chocolate granola', NULL, NULL, '2022-07-22 22:56:49', '2022-07-22 22:56:49'),
(8, 'chocolate granola', NULL, NULL, '2022-07-22 22:57:06', '2022-07-22 22:57:06'),
(9, 'chocolate granola', NULL, NULL, '2022-07-22 22:57:16', '2022-07-22 22:57:16'),
(10, 'chocolate granola', NULL, NULL, '2022-07-22 22:57:19', '2022-07-22 22:57:19'),
(11, 'chocolate granola', NULL, NULL, '2022-07-22 22:57:23', '2022-07-22 22:57:23'),
(12, 'test', 'null', NULL, '2022-07-23 03:08:45', '2022-07-23 03:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'name', 'vector.n@gmail.com', NULL, '$2y$10$I7TTKt0JNs.cs4W3qrJu.ewqItvqN5SnXdUpB/hJz/YDhXFiktASK', NULL, '2022-07-22 22:13:59', '2022-07-22 22:13:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
