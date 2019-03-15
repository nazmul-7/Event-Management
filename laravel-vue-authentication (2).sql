-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2019 at 06:13 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-vue-authentication`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `totalHoursApplied` double(8,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'runningWeek',
  `isApproved` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `event_id`, `user_id`, `totalHoursApplied`, `status`, `isApproved`, `created_at`, `updated_at`) VALUES
(10, 1, 1, 3.00, 'runningWeek', 'Yes', '2019-03-14 14:14:09', '2019-03-14 14:14:09'),
(11, 2, 1, 3.00, 'runningWeek', 'Yes', '2019-03-14 14:14:10', '2019-03-14 14:14:10'),
(12, 4, 1, 4.00, 'runningWeek', 'Yes', '2019-03-14 14:14:11', '2019-03-14 14:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `eventName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventDesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventLocation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeSlot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalHours` double(8,2) NOT NULL,
  `eventDate` date NOT NULL,
  `numberOfGuests` int(11) NOT NULL,
  `numberOfValetsNeeded` int(11) NOT NULL,
  `visibleAfter` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'runningWeek',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `eventName`, `eventDesc`, `eventLocation`, `timeSlot`, `totalHours`, `eventDate`, `numberOfGuests`, `numberOfValetsNeeded`, `visibleAfter`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'a', 'a', 'a', '02:00 AM - 06:00 AM', 4.00, '2019-03-14', 50, 5, 1, 'runningWeek', '2019-03-13 19:14:11', '2019-03-14 05:56:29'),
(2, 1, 'This is Frist Event', 'This is Some Description.This is Some Description.This is Some Description.This is Some Description.This is Some Description.', 'Sylhet,Bangladesh', '08:00 AM - 02:09 PM', 6.15, '2019-03-14', 50, 5, 1, 'runningWeek', '2019-03-13 23:15:26', '2019-03-14 10:55:04'),
(3, 1, 'Zx', 'aZXZ', 'ZXZX', '02:00 AM - 03:00 AM', 3.00, '2019-04-09', 23, 23, 1, 'runningWeek', '2019-03-14 06:55:44', '2019-03-14 06:57:50'),
(4, 1, 'SA', 'as', 'AS', '03:02 AM - 03:05 AM', 0.05, '2019-03-15', 232, 23, 23, 'runningWeek', '2019-03-14 10:55:25', '2019-03-14 10:55:25');

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
(3, '2019_03_13_143120_create_events_table', 2),
(4, '2019_03_13_144844_create_applications_table', 3);

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `phone`, `position`, `image`, `email_verified_at`, `password`, `isActive`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nazmul editedf', 'Chowdhury editedf', 'nazmulchowdhury4@gmail.com', '01681189844', 'super', '/uploads/SO6EFo15fq1bEqe4Luy4A9mguSNj44fnmetNg5Dy.png', NULL, '$2y$10$LYrX6kFIf91jwNo1CfIcauM/njL4v6VyRmwRMz4ENfOJGrc2PmXh2', 1, NULL, '2019-03-13 03:20:47', '2019-03-14 11:34:12'),
(3, 'Kamran', 'Ahmed', 'kamran@gmail.com', NULL, 'admin', NULL, NULL, '$2y$10$LYrX6kFIf91jwNo1CfIcauM/njL4v6VyRmwRMz4ENfOJGrc2PmXh2', 1, NULL, '2019-03-14 00:32:51', '2019-03-14 11:36:16'),
(4, 'Shipu', 'Numan', 'shipu@gmail.com', NULL, 'super', NULL, NULL, '$2y$10$3vHVn/IW8CNSTo3oR1gJl.pBR3sl0kf6hIwS0gu0b8yLrWj.MEiOm', 1, NULL, '2019-03-15 04:59:59', '2019-03-15 04:59:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
