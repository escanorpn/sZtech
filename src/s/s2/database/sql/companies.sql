-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 23, 2022 at 04:55 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kilaqitu_claudia`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
