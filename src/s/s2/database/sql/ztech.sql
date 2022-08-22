-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2022 at 01:05 PM
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
-- Database: `ztech`
--

-- --------------------------------------------------------

--
-- Table structure for table `finances`
--

CREATE TABLE `finances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `finances`
--

INSERT INTO `finances` (`id`, `sid`, `name`, `value`, `status`, `created_at`, `updated_at`) VALUES
(8, '5', 'Fees', '400', 'pending', '2022-08-20 08:55:30', '2022-08-21 03:11:12'),
(11, '5', NULL, '2000', 'payed', '2022-08-20 09:17:29', '2022-08-20 09:17:29'),
(12, '5', NULL, '400', 'pending', '2022-08-20 09:19:37', '2022-08-20 09:19:37'),
(13, '5', NULL, '400', 'pending', '2022-08-20 09:20:46', '2022-08-20 09:20:46'),
(14, '5', NULL, '1400', 'pending', '2022-08-20 09:21:04', '2022-08-20 09:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `gowns`
--

CREATE TABLE `gowns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gowns`
--

INSERT INTO `gowns` (`id`, `sid`, `name`, `status`, `created_at`, `updated_at`) VALUES
(11, '5', 'issued', 'pending', '2022-08-21 15:03:22', '2022-08-21 15:03:22'),
(12, '17', 'issued', 'pending', '2022-08-21 15:04:25', '2022-08-21 15:04:25'),
(13, '17', 'returned', 'pending', '2022-08-21 15:04:29', '2022-08-21 15:04:29'),
(14, '18', 'issued', 'pending', '2022-08-21 15:04:48', '2022-08-21 15:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `hods`
--

CREATE TABLE `hods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hods`
--

INSERT INTO `hods` (`id`, `hid`, `uid`, `created_at`, `updated_at`) VALUES
(2, '1', '1', '2022-08-17 08:27:06', '2022-08-17 08:27:06');

-- --------------------------------------------------------

--
-- Table structure for table `libs`
--

CREATE TABLE `libs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Penalty',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `libs`
--

INSERT INTO `libs` (`id`, `sid`, `name`, `value`, `status`, `created_at`, `updated_at`) VALUES
(2, '3', 'penalty', '333', 'cleared', '2022-08-17 11:52:51', '2022-08-20 02:01:32'),
(5, '1', 'penalty', '333', 'Pending', '2022-08-17 12:22:46', '2022-08-17 12:22:46'),
(6, '5', 'penalty5', '333', 'pending', '2022-08-20 01:44:56', '2022-08-20 02:22:27'),
(7, '5', 'penalty', '333', 'cleared', '2022-08-20 01:46:32', '2022-08-20 02:05:54'),
(8, '5', 'penalty', '333', 'cleared', '2022-08-20 01:49:23', '2022-08-20 02:05:54'),
(9, '5', 'Exam', '200', 'Pending', '2022-08-20 06:06:55', '2022-08-20 06:06:55');

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
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_08_17_091127_create_hods_table', 2),
(3, '2022_08_17_114538_create_libs_table', 3),
(4, '2022_08_17_115000_lib', 4),
(5, '2022_08_17_190439_create_finances_table', 5),
(6, '2022_08_17_193212_create_gowns_table', 6);

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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test1', '2022-08-17 06:06:32', '2022-08-17 06:06:32'),
(2, 'student', 'student', '2022-08-17 06:07:05', '2022-08-17 06:07:05'),
(3, 'F-Ztech', 'finance', '2022-08-17 06:07:32', '2022-08-17 06:07:32'),
(4, 'H-Ztech', 'hod', '2022-08-17 06:07:43', '2022-08-17 06:07:43'),
(5, 'L-Ztech', 'lib', '2022-08-17 06:08:13', '2022-08-17 06:08:13'),
(6, 'G-Ztech', 'gown', '2022-08-18 05:16:25', '2022-08-18 05:16:25'),
(7, 'R-Ztech', 'rec', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'student',
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gowns` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not issued',
  `gown` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `finance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `lib` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `cert_i` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not issued',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `number`, `email`, `code`, `admission`, `email_verified_at`, `password`, `remember_token`, `gowns`, `gown`, `finance`, `lib`, `cert_i`, `created_at`, `updated_at`) VALUES
(1, 'name', 'admin', '0713772837', 'admin@gmail.com', NULL, 'pending', NULL, '$2y$10$KROhVAaEdZhKkkHIjRiG2.G5rUZ29uwYDse0RAMujF7LXnKakTYvq', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-17 05:39:08', '2022-08-18 07:22:21'),
(2, 'name', 'finance', NULL, 'finance@gmail.com', NULL, 'admitted', NULL, '$2y$10$2KYQSuve3XW0xw9h56MRBe1P5sGRekOFR1zRvBaBBndHCrZrclvFK', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-17 06:09:19', '2022-08-19 15:34:25'),
(3, 'name', 'hod', NULL, 'hod@gmail.com', NULL, 'admitted', NULL, '$2y$10$OjUeZyMrta3eMy/4CK4lZ.agZYT6ioPFHy1J6HEwYhkt676uvymJy', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-17 06:09:30', '2022-08-19 15:34:25'),
(4, 'name', 'lib', NULL, 'lib@gmail.com', NULL, 'admitted', NULL, '$2y$10$ySSGyg3awEY7PPRuB3qAe.APgFGFWbM9EavEB3WKw4Bkc03n8eHIa', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-17 06:09:38', '2022-08-19 15:34:25'),
(5, 'Test', 'student', NULL, 'student@gmail.com', '123', 'admitted', NULL, '$2y$10$D7l4KylffdANEFIh/FIsH.HcXiUb/0u3t9RDbWTv1JVvzTpLvrJrO', NULL, 'issued', 'true', 'true', 'true', 'issued', '2022-08-17 08:05:15', '2022-08-22 03:21:43'),
(17, '0Uxp', 'student', NULL, 'Bkny@gmail.com', 'PXZJM', 'admitted', NULL, '$2y$10$.wxoQfj7JAXQ.HFODeVwq.QAKXPoBSufnqgOM9.6YnSmtyWnQAjnu', NULL, 'returned', 'false', 'false', 'false', 'issued', NULL, '2022-08-22 03:21:48'),
(18, 'oKmV', 'student', NULL, 'epvm@gmail.com', 'S3ddc', 'admitted', NULL, '$2y$10$Q.PzgxU03ewSqD5yCI77Xe9k8.U38.wLoRPouCtE.juu5XSZ23nHW', NULL, 'issued', 'false', 'false', 'false', 'issued', NULL, '2022-08-22 03:22:02'),
(19, 'gVzT', 'student', NULL, 'YBDd@gmail.com', '9a2zd', 'pending', NULL, '$2y$10$FuIbpF4KJbyTiS9EjlAgk..hdu5QEYIAxX4U96GiIUoI9Y/PLb05u', NULL, '', 'false', 'false', 'false', 'not issued', NULL, '2022-08-21 14:28:44'),
(20, 'YASN', 'student', NULL, 'wbyN@gmail.com', 'upJWs', 'admitted', NULL, '$2y$10$aI4XepmuapmqvXCZBegx5uj6LPVwWXRfFg.YnsHJciaKK8bHOh0he', NULL, '', 'false', 'false', 'false', 'not issued', NULL, '2022-08-19 15:42:07'),
(21, 'dloR', 'student', NULL, 'UrUB@gmail.com', 'cdqSJ', 'pending', NULL, '$2y$10$Zcyp7N0l.LYaZkBq3E2eSu0z017Z1mmcvFgyj76nZlxYNOhR9AeC6', NULL, '', 'false', 'false', 'false', 'not issued', NULL, NULL),
(22, 'YOGh', 'student', NULL, 'yiRR@gmail.com', 'PCSlr', 'pending', NULL, '$2y$10$xAZIAyjs2fklNo1i29BW9OL2SCA52DrbNSN9tghC127QxI2ejQvi.', NULL, '', 'false', 'false', 'false', 'not issued', NULL, NULL),
(23, 'ZC1P', 'student', NULL, 'yD2N@gmail.com', 'Ity2B', 'pending', NULL, '$2y$10$4fQGweRNy96i50iD1TF/2uL1CASq/1W64gk/pFdSe5B9/En2wyDlu', NULL, '', 'false', 'false', 'false', 'not issued', NULL, NULL),
(24, 'ShH2', 'student', NULL, 'HowC@gmail.com', 'ABnuw', 'pending', NULL, '$2y$10$XwiWO59./c0FRNrxLMcX.eiE.HR3P51d5/UuTbaqYw8ZsKe0orll.', NULL, '', 'false', 'false', 'false', 'not issued', NULL, NULL),
(25, 'wyJm', 'student', NULL, 'fi9S@gmail.com', 'Lx7cY', 'pending', NULL, '$2y$10$BkFiRqvUGH.FXWVDiuFv9eyjZFYbB9xOm0HDXUXhVmK1LfTru6KBq', NULL, '', 'false', 'false', 'false', 'not issued', NULL, NULL),
(26, 'GUhp', 'student', NULL, 'jzKA@gmail.com', 'NtM3l', 'pending', NULL, '$2y$10$TgQC5n/HR.NKuBo47w3MduDF2nflrudZ5Gb1ko3UrOgqf7Iy5zgje', NULL, '', 'false', 'false', 'false', 'not issued', NULL, NULL),
(27, 'name', 'finance', NULL, 'email@gmail.com', 'F-Ztech', 'pending', NULL, '$2y$10$G2Z95.toMrq9vfa2QC9caOmTjADewtltIplmW1mSpxzoEaAoljKhC', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:01:06', '2022-08-19 02:01:06'),
(28, 'name', 'student', NULL, 'email1@gmail.com', NULL, 'pending', NULL, '$2y$10$6KEbgIcMnIvhY46SIG4yu.pUKpgNk43k4ZohhG3KKb4/7PSKlXxM2', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:01:44', '2022-08-19 02:01:44'),
(29, 'name', 'student', NULL, 'email2@gmail.com', 'acd', 'pending', NULL, '$2y$10$1zzmxRiqak18tmMPPHWJWeHbcciwnov7AUd7dbRqj9rSqtOZ/Sg0a', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:02:08', '2022-08-19 02:02:08'),
(30, 'Peter', 'student', NULL, 'mail@gmail.com', '123', 'pending', NULL, '$2y$10$RCmpnhfJS3T03NI4y7W8YeI1xLrHZ2i4dc4jrJa9BanxvUgzVc6UK', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:04:55', '2022-08-19 02:04:55'),
(31, 'pater', 'student', NULL, 'vector.n@gmail.com', 'code', 'pending', NULL, '$2y$10$BIYgsV.VoDpWLpS1/pO6yuZZWwQiDhHKvxTEjSJYubbPn1O96LtU6', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:07:39', '2022-08-19 02:07:39'),
(32, 'Peter', 'student', NULL, 'st1@gmail.com', 'c', 'pending', NULL, '$2y$10$GfavFUZNMYA.vqS5YcM5vO9qicPIj5GrtO4cxj42Rjj2Mk0mVzegq', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:16:27', '2022-08-19 02:16:27'),
(33, 'Peter', 'student', NULL, 'st2@gmail.com', '123', 'pending', NULL, '$2y$10$9Gekjgs7YyncJB9kNfcNrO4OEWhfC0IdK8FEezvGf4FHWrdqAAzoS', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:22:05', '2022-08-19 02:22:05'),
(34, 'name', 'student', NULL, 'email3@gmail.com', 'acd', 'pending', NULL, '$2y$10$CwLEBRGidX3j7oqeCnBzfOo3DWe7QldtPAs4Jj7FjmHIEOCp5CChq', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:22:22', '2022-08-19 02:22:22'),
(35, 'name', 'student', NULL, 'email4@gmail.com', 'acd', 'pending', NULL, '$2y$10$X6N5r9Jr/cFNomG.icYfZuKYJcCTK1mv/2Tgtay2On7CtZJ0QH8Si', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:24:41', '2022-08-19 02:24:41'),
(36, 'name', 'student', NULL, 'email5@gmail.com', 'acd', 'pending', NULL, '$2y$10$/LiMg9WhLsvJIHFcb5fqEe8sOVYFQ6KvDSSZ9rC0kXfkuaV70wFrK', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:26:06', '2022-08-19 02:26:06'),
(37, 'name', 'student', NULL, 'e1@gmail.com', 'acd', 'pending', NULL, '$2y$10$H3dsOF4l./VzqQvYh/Yw5OUczpML.NXAQ6l5t4jNYDGH1NXvb8H9O', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:28:18', '2022-08-19 02:28:18'),
(38, 'name', 'student', NULL, 'e2@gmail.com', 'acd', 'pending', NULL, '$2y$10$.IGPkMyOQFMC6P6RWIKcBu.QUXCu825iuRnRUpYSu9ZLcW63QLbnS', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:30:09', '2022-08-19 02:30:09'),
(39, 'Peter', 'finance', NULL, 'f2@gmal.com', 'F-Ztech', 'pending', NULL, '$2y$10$E2TRvq1zP8CUHyBbiKY7GeHyLeDub4nTajbzQZg7yZwjAsbbiYH5O', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-19 02:31:30', '2022-08-19 02:31:30'),
(42, 'gown', 'gown', NULL, 'gown@gmail.com', 'G-Ztech', 'pending', NULL, '$2y$10$oVlyTRBterd3/V348X.Mx.HAsQsWKUWzTRAzS6PafxFgiVHS1/5/O', NULL, '', 'false', 'false', 'false', 'not issued', '2022-08-21 14:33:43', '2022-08-21 14:33:43'),
(43, 'student1', 'student', NULL, 'student1@gmail.com', 'ztech', 'pending', NULL, '$2y$10$HzrgUKX4Z/BTAcRpdTXaE.R7r3kQspbu272rYvvZ9Lb.5lDygi8X.', NULL, 'not issued', 'false', 'false', 'false', 'not issued', '2022-08-22 02:18:09', '2022-08-22 02:18:09'),
(45, 'Rec', 'rec', NULL, 'rec@gmail.com', 'R-Ztech', 'pending', NULL, '$2y$10$CoAlkKZAgecsWRxtwDHPlO.xC3zveFrYgWx1p3mlofXxTrRULlDQO', NULL, 'not issued', 'false', 'false', 'false', 'not issued', '2022-08-22 02:24:52', '2022-08-22 02:24:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `finances`
--
ALTER TABLE `finances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gowns`
--
ALTER TABLE `gowns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hods`
--
ALTER TABLE `hods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `libs`
--
ALTER TABLE `libs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `finances`
--
ALTER TABLE `finances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `gowns`
--
ALTER TABLE `gowns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hods`
--
ALTER TABLE `hods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `libs`
--
ALTER TABLE `libs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
