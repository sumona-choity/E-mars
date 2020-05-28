-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2019 at 07:31 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_appify_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `assign_projects`
--

CREATE TABLE `assign_projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_projects`
--

INSERT INTO `assign_projects` (`id`, `project_id`, `employee_id`, `created_at`, `updated_at`) VALUES
(12, 15, 5, '2019-10-29 00:56:31', '2019-10-29 00:56:31'),
(14, 11, 6, '2019-10-29 01:00:35', '2019-10-29 01:00:35'),
(15, 4, 6, '2019-10-29 01:01:17', '2019-10-29 01:01:17');

-- --------------------------------------------------------

--
-- Table structure for table `assign_tasks`
--

CREATE TABLE `assign_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `task_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimated_time` decimal(5,2) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `total_time` decimal(5,2) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not done',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_tasks`
--

INSERT INTO `assign_tasks` (`id`, `project_id`, `employee_id`, `task_name`, `description`, `estimated_time`, `start_time`, `end_time`, `total_time`, `status`, `created_at`, `updated_at`) VALUES
(2, 9, 5, 'fjbgdjfg', 'bcfghjfhg', '5.00', '2019-10-24 06:00:00', '2019-10-31 06:00:00', '168.00', 'not done', '2019-10-29 03:43:35', '2019-10-29 03:43:35'),
(3, 4, 4, 'fdhgdfhg', 'dfhgdfh', '1.00', '2019-10-15 01:00:00', '2019-10-31 00:00:00', '383.00', 'done', '2019-10-29 03:44:09', '2019-10-29 03:44:09'),
(4, 3, 1, 'sfdjkgfkfg', 'dsksdlgsdgf', '3.00', '2019-10-23 06:00:00', '2019-10-31 06:00:00', '192.00', 'Not Done', '2019-10-29 05:05:24', '2019-10-29 05:05:24'),
(5, 11, 4, 'jhjgjg', 'jhighiug', '3.00', NULL, NULL, NULL, 'done', '2019-10-29 05:15:59', '2019-10-29 05:15:59'),
(6, 3, 4, 'qwer', 'qwer', '1.00', NULL, NULL, NULL, 'Not done', '2019-11-03 23:27:31', '2019-11-03 23:27:31'),
(7, 3, 4, 'asff', 'fdgdg', '2.00', NULL, NULL, NULL, 'Not done', '2019-11-03 23:41:37', '2019-11-03 23:41:37'),
(8, 3, 4, 'hfhdh', 'sdgdfh', '2.00', NULL, NULL, NULL, 'Not done', '2019-11-03 23:43:11', '2019-11-03 23:43:11'),
(9, 4, 3, 'fdg', 'dsaf', '2.00', '2019-11-03 21:00:00', '2019-11-04 00:00:00', '2.00', 'running', '2019-11-03 23:46:51', '2019-11-03 23:46:51'),
(11, 11, 3, 'asdasf', 'sdafs', '1.00', NULL, NULL, NULL, 'Not done', '2019-11-03 23:52:33', '2019-11-03 23:52:33'),
(12, 14, 3, 'sdgdfg', 'sdgsdf', '1.00', NULL, NULL, NULL, 'Not done', '2019-11-03 23:56:45', '2019-11-03 23:56:45'),
(16, 9, 3, 'asdfghjkl', 'asdfghjkl', '2.00', NULL, NULL, NULL, 'Not done', '2019-11-04 00:27:14', '2019-11-04 00:27:14');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(2, 'choity', 'choity@gmail.com', 'jjhgjytfy', '1234', '2019-10-27 00:19:14', '2019-10-27 00:19:14'),
(3, 'djkl', 'dj@gmail.com', 'sdfgdsh', '1234', '2019-10-27 01:11:09', '2019-10-27 01:11:09'),
(4, 'abc', 'abc@gmail.com', 'roerwfsmf', '123456789', '2019-10-28 22:55:12', '2019-10-28 22:55:12'),
(5, 'fdsaf', 'ADSAF@gmail.com', 'jjhgjytfyvdfs', '1234', '2019-11-03 02:36:53', '2019-11-03 02:36:53'),
(6, 'lkl', 'lkl@gmail.com', 'qwertyuiop', '12345678910', '2019-11-03 23:14:30', '2019-11-03 23:14:30');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'App developer', '2019-10-26 05:33:24', '2019-10-26 05:33:24'),
(4, 'ux/ui designer', '2019-10-26 05:34:17', '2019-10-26 05:34:17'),
(7, 'front end', '2019-10-26 06:38:48', '2019-10-26 06:38:48'),
(8, 'Back end', '2019-10-26 06:39:59', '2019-10-26 06:39:59'),
(9, 'Intern', '2019-10-29 23:25:59', '2019-10-29 23:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` int(11) NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_attendances`
--

CREATE TABLE `employee_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `current_date` date NOT NULL,
  `entry_time` time DEFAULT NULL,
  `break_start` time DEFAULT NULL,
  `break_end` time DEFAULT NULL,
  `duration_of_break` decimal(5,0) NOT NULL DEFAULT '0',
  `leave_time` time DEFAULT NULL,
  `number_of_outing` int(11) NOT NULL DEFAULT '0',
  `total_in_time` decimal(5,2) DEFAULT NULL,
  `total_out_time` decimal(5,2) DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_attendances`
--

INSERT INTO `employee_attendances` (`id`, `employee_id`, `current_date`, `entry_time`, `break_start`, `break_end`, `duration_of_break`, `leave_time`, `number_of_outing`, `total_in_time`, `total_out_time`, `score`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-10-30', '10:05:00', '01:20:00', '02:20:00', '10', '07:00:00', 0, '20.00', '5.00', 0, '2019-10-30 03:55:54', '2019-10-30 03:55:54'),
(2, 2, '2019-10-30', '09:00:00', '02:00:00', '03:00:00', '2', '05:00:00', 0, '5.00', '2.00', 0, '2019-10-30 03:55:54', '2019-10-30 03:55:54'),
(3, 3, '2019-10-30', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-10-30 03:55:54', '2019-10-30 03:55:54'),
(4, 4, '2019-10-30', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-10-30 03:55:54', '2019-10-30 03:55:54'),
(5, 5, '2019-10-30', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-10-30 03:55:54', '2019-10-30 03:55:54'),
(6, 6, '2019-10-30', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-10-30 03:55:54', '2019-10-30 03:55:54'),
(7, 7, '2019-10-30', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-10-30 03:55:54', '2019-10-30 03:55:54'),
(8, 8, '2019-10-30', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-10-30 03:55:54', '2019-10-30 03:55:54'),
(17, 1, '2019-10-31', '10:00:00', '01:20:00', '02:20:00', '60', '19:00:00', 0, '440.00', '100.00', 0, '2019-10-30 22:43:32', '2019-10-30 22:43:32'),
(18, 2, '2019-10-31', '02:00:00', '01:20:00', '02:26:00', '66', NULL, 0, NULL, NULL, 0, '2019-10-30 22:43:32', '2019-10-30 22:43:32'),
(19, 3, '2019-10-31', '05:00:00', '06:00:00', '06:05:00', '5', '07:00:00', 0, '115.00', '5.00', 0, '2019-10-30 22:43:32', '2019-10-30 22:43:32'),
(20, 4, '2019-10-31', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-10-30 22:43:32', '2019-10-30 22:43:32'),
(21, 5, '2019-10-31', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-10-30 22:43:32', '2019-10-30 22:43:32'),
(22, 6, '2019-10-31', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-10-30 22:43:33', '2019-10-30 22:43:33'),
(23, 7, '2019-10-31', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-10-30 22:43:33', '2019-10-30 22:43:33'),
(24, 8, '2019-10-31', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-10-30 22:43:33', '2019-10-30 22:43:33'),
(25, 1, '2019-11-01', '10:00:00', '01:00:00', '02:00:00', '60', '19:00:00', 0, '480.00', '60.00', 0, '2019-11-01 03:13:14', '2019-11-01 03:13:14'),
(26, 2, '2019-11-01', '09:00:00', '01:00:00', '02:00:00', '60', '18:00:00', 0, '480.00', '60.00', 0, '2019-11-01 03:13:15', '2019-11-01 03:13:15'),
(27, 3, '2019-11-01', '09:00:00', '01:00:00', '02:00:00', '60', '18:00:00', 0, '480.00', '60.00', 0, '2019-11-01 03:13:15', '2019-11-01 03:13:15'),
(28, 4, '2019-11-01', '09:00:00', '01:00:00', '02:00:00', '60', '18:00:00', 0, '424.00', '116.00', 0, '2019-11-01 03:13:15', '2019-11-01 03:13:15'),
(29, 1, '2019-11-03', '10:00:00', '01:00:00', '02:00:00', '60', '18:00:00', 0, '420.00', '60.00', 0, '2019-11-02 22:27:04', '2019-11-02 22:27:04'),
(30, 2, '2019-11-03', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-02 22:27:04', '2019-11-02 22:27:04'),
(31, 3, '2019-11-03', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-02 22:27:04', '2019-11-02 22:27:04'),
(32, 4, '2019-11-03', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-02 22:27:04', '2019-11-02 22:27:04'),
(33, 5, '2019-11-03', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-02 22:27:04', '2019-11-02 22:27:04'),
(34, 6, '2019-11-03', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-02 22:27:04', '2019-11-02 22:27:04'),
(35, 7, '2019-11-03', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-02 22:27:04', '2019-11-02 22:27:04'),
(36, 8, '2019-11-03', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-02 22:27:04', '2019-11-02 22:27:04'),
(37, 1, '2019-11-04', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:33:16', '2019-11-03 01:33:16'),
(38, 2, '2019-11-04', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:33:16', '2019-11-03 01:33:16'),
(39, 3, '2019-11-04', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:33:16', '2019-11-03 01:33:16'),
(40, 4, '2019-11-04', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:33:16', '2019-11-03 01:33:16'),
(41, 5, '2019-11-04', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:33:16', '2019-11-03 01:33:16'),
(42, 6, '2019-11-04', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:33:16', '2019-11-03 01:33:16'),
(43, 7, '2019-11-04', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:33:16', '2019-11-03 01:33:16'),
(44, 8, '2019-11-04', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:33:16', '2019-11-03 01:33:16'),
(45, 9, '2019-11-04', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:33:16', '2019-11-03 01:33:16'),
(46, 1, '2019-11-05', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:38:37', '2019-11-03 01:38:37'),
(47, 2, '2019-11-05', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:38:38', '2019-11-03 01:38:38'),
(48, 3, '2019-11-05', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:38:38', '2019-11-03 01:38:38'),
(49, 4, '2019-11-05', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:38:38', '2019-11-03 01:38:38'),
(50, 5, '2019-11-05', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:38:38', '2019-11-03 01:38:38'),
(51, 6, '2019-11-05', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:38:38', '2019-11-03 01:38:38'),
(52, 7, '2019-11-05', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:38:38', '2019-11-03 01:38:38'),
(53, 8, '2019-11-05', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:38:38', '2019-11-03 01:38:38'),
(54, 9, '2019-11-05', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:38:38', '2019-11-03 01:38:38'),
(55, 1, '2019-11-14', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:44:00', '2019-11-03 01:44:00'),
(56, 2, '2019-11-14', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:44:00', '2019-11-03 01:44:00'),
(57, 3, '2019-11-14', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:44:00', '2019-11-03 01:44:00'),
(58, 4, '2019-11-14', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:44:01', '2019-11-03 01:44:01'),
(59, 5, '2019-11-14', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:44:01', '2019-11-03 01:44:01'),
(60, 6, '2019-11-14', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:44:01', '2019-11-03 01:44:01'),
(61, 7, '2019-11-14', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:44:01', '2019-11-03 01:44:01'),
(62, 8, '2019-11-14', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:44:01', '2019-11-03 01:44:01'),
(63, 9, '2019-11-14', NULL, NULL, NULL, '0', NULL, 0, NULL, NULL, 0, '2019-11-03 01:44:01', '2019-11-03 01:44:01');

-- --------------------------------------------------------

--
-- Table structure for table `employee_tasks`
--

CREATE TABLE `employee_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extra_outings`
--

CREATE TABLE `extra_outings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_time` time NOT NULL,
  `entry_time` time NOT NULL,
  `duration` int(5) NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra_outings`
--

INSERT INTO `extra_outings` (`id`, `attendance_id`, `employee_id`, `leave_time`, `entry_time`, `duration`, `reason`, `created_at`, `updated_at`) VALUES
(3, 18, 2, '06:15:00', '06:00:00', 15, 'Tea and refresh', '2019-10-31 06:24:18', '2019-10-31 06:24:18'),
(4, 18, 2, '06:15:00', '06:00:00', 15, 'Tea and refresh', '2019-10-31 06:25:32', '2019-10-31 06:25:32'),
(5, 17, 1, '06:30:00', '06:00:00', 30, 'Tea , resresh , meal', '2019-10-31 06:27:17', '2019-10-31 06:27:17'),
(6, 17, 1, '05:10:00', '05:00:00', 10, 'Emni', '2019-10-31 06:43:32', '2019-10-31 06:43:32'),
(7, 27, 3, '03:30:00', '03:00:00', 30, 'for refreshing', '2019-11-02 00:14:18', '2019-11-02 00:14:18'),
(8, 28, 4, '04:00:00', '03:04:00', 56, 'dfsdg', '2019-11-02 00:16:19', '2019-11-02 00:16:19'),
(9, 28, 4, '05:00:00', '04:00:00', 60, 'dsgfsdg', '2019-11-02 00:17:47', '2019-11-02 00:17:47'),
(10, 33, 5, '03:00:00', '02:00:00', 60, 'sdhbsufdhbsf', '2019-11-02 05:10:58', '2019-11-02 05:10:58'),
(11, 29, 1, '03:30:00', '03:04:00', 26, 'ghfjg', '2019-11-02 22:36:34', '2019-11-02 22:36:34'),
(12, 29, 1, '05:17:00', '05:00:00', 17, 'hgkjhgk', '2019-11-02 22:37:28', '2019-11-02 22:37:28'),
(13, 29, 1, '04:00:00', '03:15:00', 45, 'hjguh', '2019-11-03 01:15:12', '2019-11-03 01:15:12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_10_22_112226_create_employees_table', 2),
(4, '2019_10_22_112323_create_employee_tasks_table', 2),
(5, '2019_10_22_112349_create_designations_table', 2),
(6, '2019_10_22_112410_create_assign_projects_table', 3),
(7, '2019_10_22_112432_create_clients_table', 3),
(8, '2019_10_22_112456_create_employee_attendances_table', 4),
(9, '2019_10_22_112519_create_projects_table', 5),
(10, '2019_10_22_112539_create_assign_tasks_table', 5),
(11, '2019_10_22_112559_create_extra_outings_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `deadline_date` datetime NOT NULL,
  `progress` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not started',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `project_name`, `client_id`, `start_date`, `deadline_date`, `progress`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(3, 'OfficeAdmin', 2, '2019-10-02 00:00:00', '2019-10-25 00:00:00', 0, 552, 'running', '2019-10-28 03:27:54', '2019-10-28 03:27:54'),
(4, 'flank', 3, '2019-10-28 00:00:00', '2019-10-31 00:00:00', 0, 72, 'Not started', '2019-10-28 06:12:27', '2019-10-28 06:12:27'),
(9, 'tea-ecommers', 4, '2019-10-01 00:00:00', '2019-10-31 00:00:00', 0, 720, 'completed', '2019-10-29 00:38:47', '2019-10-29 00:38:47'),
(11, 'Django', 4, '2019-10-01 00:00:00', '2019-11-09 00:00:00', 0, 936, 'running', '2019-10-29 00:50:44', '2019-10-29 00:50:44'),
(14, 'Music', 3, '2019-10-08 00:00:00', '2019-11-01 00:00:00', 0, 576, 'Not started', '2019-10-29 00:52:52', '2019-10-29 00:52:52'),
(15, 'dreams -gellery', 3, '2019-10-09 00:00:00', '2019-10-26 00:00:00', 0, 408, 'Not started', '2019-10-29 00:53:59', '2019-10-29 00:53:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `designation_id`, `name`, `email`, `address`, `email_verified_at`, `password`, `phone`, `user_type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 8, 'choity', 'choity@gmail.com', 'sreemangal', NULL, '$2y$10$R6EVdOymz.H6zhjBLX1C6eXj4VyjcIW62z6zeEXITlsU9jTAvDvUe', '123456', 'Admin', NULL, '2019-10-27 04:05:36', '2019-10-27 04:05:36'),
(2, 8, 'nasuha', 'choity@gmail.comnasuha', 'nasuha', NULL, '$2y$10$ag8MHj/jISEwB9CTGX3nG.ZYm9XWEfnFdE.Vp1YYlVSgcfl5moLa2', '123456', NULL, NULL, '2019-10-27 04:07:22', '2019-10-27 04:07:22'),
(3, 8, 'amran', 'amran@gmail.com', 'jjhgjytfydasda', NULL, '$2y$10$l/awacvylAHLX4Fqs2uPpOk3mHSveTISJvgCYfJORUMMNXTsz4ySS', '123456', NULL, NULL, '2019-10-27 04:11:42', '2019-10-27 04:11:42'),
(4, 7, 'any', 'any@gmail.com', 'jjhgjytfyfklj', NULL, '$2y$10$40LL90n2SVCsSKGCYgFP/.z0iGCWRZus091GZd9Y6qrqxyhW1TaiC', '123456', NULL, NULL, '2019-10-27 04:43:24', '2019-10-27 04:43:24'),
(5, 3, 'Bijoya', 'Bijoya@gmail.com', 'jjhgjytfykjk', NULL, '$2y$10$Ia3N3rp1fBxn5o8GHn0Ng.W3kqG4EP0fhwMXidTWUZibcTolqDExG', '123456', NULL, NULL, '2019-10-27 05:18:29', '2019-10-27 05:18:29'),
(6, 4, 'Hachib', 'hachib@gmail.com', 'vjsdvkhjof', NULL, '$2y$10$G1GuDAbvuB1zdLKl22YLTeNeyZqssYjmOooN6IzruQxbQ0O8qf8YG', '123456', NULL, NULL, '2019-10-27 05:19:03', '2019-10-27 05:19:03'),
(7, 7, 'rupali', 'rupali@gmail.com', 'jjhgjytfydsfsjgfs', NULL, '$2y$10$SZO4zHYHLI6gAp97QU5kBeHhrU.klI6SWGKB6IXklZ2lWgG6SHd8S', '12345678', NULL, NULL, '2019-10-28 22:56:33', '2019-10-28 22:56:33'),
(8, 9, 'aabbcc', 'aabbcc@gmail.com', 'jjhgjytfysdfsfg', NULL, '$2y$10$z3WS.noV619/ZZQBV8ycFOX60uDdp8JIOSK6Zw4t1FHQeRzJZiNvy', '12345678', NULL, NULL, '2019-10-29 23:26:47', '2019-10-29 23:26:47'),
(9, 7, 'moumita', 'moumita@gmail.com', 'jjhgjytfydfjgsdfjg', NULL, '$2y$10$AVTWbnn43ZVgp6OVkq/MEeAmZ31zUEgWruF0MDpsLjg6wpYIgKn8.', '12345678', NULL, NULL, '2019-11-03 01:32:36', '2019-11-03 01:32:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assign_projects`
--
ALTER TABLE `assign_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_tasks`
--
ALTER TABLE `assign_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_tasks`
--
ALTER TABLE `employee_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_outings`
--
ALTER TABLE `extra_outings`
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
-- Indexes for table `projects`
--
ALTER TABLE `projects`
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
-- AUTO_INCREMENT for table `assign_projects`
--
ALTER TABLE `assign_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `assign_tasks`
--
ALTER TABLE `assign_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `employee_tasks`
--
ALTER TABLE `employee_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extra_outings`
--
ALTER TABLE `extra_outings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
