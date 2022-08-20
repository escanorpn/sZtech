-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2022 at 11:59 AM
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
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(3, 'kiwi lemon kooler', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl rhoncus mattis rhoncus urna. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Massa placerat duis ultricies lacus sed turpis tincidunt id aliquet. Vitae proin sagittis nisl rhoncus mattis rhoncus. Velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus. Commodo ullamcorper a lacus vestibulum. Nibh praesent tristique magna sit amet purus gravida quis blandit.\n\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl rhoncus mattis rhoncus urna. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Massa placerat duis ultricies lacus sed turpis tincidunt id aliquet. Vitae proin sagittis nisl rhoncus mattis rhoncus. Velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus. Commodo ullamcorper a lacus vestibulum. Nibh praesent tristique magna sit amet purus gravida quis blandit.', '2022-08-10 10:12:54', '2022-08-10 10:12:54'),
(4, 'kiwi lemon kooler', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl rhoncus mattis rhoncus urna. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Massa placerat duis ultricies lacus sed turpis tincidunt id aliquet. Vitae proin sagittis nisl rhoncus mattis rhoncus. Velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus. Commodo ullamcorper a lacus vestibulum. Nibh praesent tristique magna sit amet purus gravida quis blandit.\n\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl rhoncus mattis rhoncus urna. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Massa placerat duis ultricies lacus sed turpis tincidunt id aliquet. Vitae proin sagittis nisl rhoncus mattis rhoncus. Velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus. Commodo ullamcorper a lacus vestibulum. Nibh praesent tristique magna sit amet purus gravida quis blandit.', '2022-08-10 10:13:04', '2022-08-10 10:13:04'),
(5, 'kiwi lemon kooler', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl rhoncus mattis rhoncus urna. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Massa placerat duis ultricies lacus sed turpis tincidunt id aliquet. Vitae proin sagittis nisl rhoncus mattis rhoncus. Velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus. Commodo ullamcorper a lacus vestibulum. Nibh praesent tristique magna sit amet purus gravida quis blandit.\n\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl rhoncus mattis rhoncus urna. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Massa placerat duis ultricies lacus sed turpis tincidunt id aliquet. Vitae proin sagittis nisl rhoncus mattis rhoncus. Velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus. Commodo ullamcorper a lacus vestibulum. Nibh praesent tristique magna sit amet purus gravida quis blandit.', '2022-08-10 10:13:07', '2022-08-10 10:13:07'),
(6, 'RECIPE DEVELOPMENT', 'test', '2022-08-12 10:40:14', '2022-08-12 10:40:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
