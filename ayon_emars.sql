-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2020 at 05:05 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ayon_emars`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'men\'s fashion', NULL, NULL),
(2, 'women\'s fashion', NULL, NULL),
(3, 'Phones & Tablets', NULL, NULL),
(4, 'Computer & Accesories', NULL, NULL),
(5, 'Electronic Accesories', NULL, NULL),
(6, 'Home & Living', NULL, NULL),
(7, 'Health & Beauty', NULL, NULL),
(8, 'Babies & Toys', NULL, NULL),
(9, 'Sports & Outdoor', NULL, NULL),
(10, 'Automotive', NULL, NULL);

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
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productId` int(11) NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `productId`, `link`, `created_at`, `updated_at`) VALUES
(1, 7, '/uploads/yNMucETc3jurX3p7CaBmmcASQxCjY8XqKJzEaJXP.png', NULL, NULL),
(2, 9, '/uploads/sNwvQqT2JTDa2uu2DIP1m0cT16BimY0KN7j98CGd.png', NULL, NULL),
(3, 9, '/uploads/AU0IIEU6y7rz0WmvmQVa3L8l2HeneQMhPJzZbdis.png', NULL, NULL),
(4, 10, '/uploads/sNwvQqT2JTDa2uu2DIP1m0cT16BimY0KN7j98CGd.png', NULL, NULL),
(5, 10, '/uploads/AU0IIEU6y7rz0WmvmQVa3L8l2HeneQMhPJzZbdis.png', NULL, NULL),
(6, 10, '/uploads/8m9sW7JFjMrRYRolelPxsEO2lpxMEV88BeMEPmGY.png', NULL, NULL),
(7, 10, '/uploads/geNaD10XBEX2HRTxpoCcetaReRVZKAE69fllr36T.png', NULL, NULL),
(26, 31, '/uploads/udhrh2ZwbLasSHrrSTEmIJFTnFSEjSPa1QDQYEYZ.png', NULL, NULL),
(27, 32, '/uploads/udhrh2ZwbLasSHrrSTEmIJFTnFSEjSPa1QDQYEYZ.png', NULL, NULL),
(31, 36, '/uploads/Z529smyqZvevjJtoCoCh8DHzS0iDG3d8ubZnSxuG.png', NULL, NULL),
(32, 37, '/uploads/TR9naS2svJ2n3I57TDQZwiFZgNBJioQWFzXJYdTx.png', NULL, NULL),
(33, 38, '/uploads/RlKzxfozjP70FKhzAs5n5u68wHSHpGkPfL9xzcMa.png', NULL, NULL),
(34, 39, '/uploads/hMUDq8zKwoSAAWU3bo5c4CnSHmLbCbY0HAapTfe0.png', NULL, NULL),
(35, 40, '/uploads/TPnOKcX8RUHfy3i18s6KSB0xV6t5d07IPIV4yADp.png', NULL, NULL),
(36, 41, '/uploads/PtbGF5kJWJDXfxY0zfacCbpUoMvHc0PP6ujUTJUP.png', NULL, NULL),
(40, 44, '/uploads/tltpXBPaWXlbZqxohvlVG1coAOJ6qReLIUFbGU1m.png', NULL, NULL),
(44, 27, '/uploads/GO8Re9MG4j0llmMmonXEE9mW8Dlmv3Aq4NcSDBPp.jpeg', NULL, NULL),
(46, 28, '/uploads/sYxrHITqG1GgyGukOu6TbomdZBw415D0pTaIGxbZ.jpeg', NULL, NULL),
(47, 28, '/uploads/foRKwtEMGZTaiEOpA0XjvUajWbPORgeKKs2ocmWd.jpeg', NULL, NULL),
(49, 29, '/uploads/lUp5Pz5UWP96vUp6oFJSzBKbmkX3mcrPdXCb5Lg1.jpeg', NULL, NULL),
(53, 6, '/uploads/HKGqwhmCdXGS81smA9Z04v65Jfgj84jEU7hr8wwl.png', NULL, NULL),
(54, 31, '/uploads/yD9LjYRlfm2KpXYw6ylAPiz7tB68BfrJV6UxEry4.png', NULL, NULL),
(56, 33, '/uploads/swEeGc4Av2NSzUtDLBdywNlGJpZKzzlAELi1UXl6.png', NULL, NULL),
(58, 34, '/uploads/swEeGc4Av2NSzUtDLBdywNlGJpZKzzlAELi1UXl6.png', NULL, NULL),
(59, 35, '/uploads/Z529smyqZvevjJtoCoCh8DHzS0iDG3d8ubZnSxuG.png', NULL, NULL),
(60, 36, '/uploads/7PMKacrwLh0uJH8M56upD3bSnlSXwiBoCuZrOiOo.png', NULL, NULL),
(61, 38, '/uploads/kxvnd8zxCekzkGDTaR4sGHmXWzDmPZOJ7SHx900u.png', NULL, NULL),
(62, 39, '/uploads/UX20NVUwzSYUaIxnnOSXTcpCT7Vz1rvjam4IpzP9.png', NULL, NULL),
(63, 40, '/uploads/k1e4o8vn2ZiDvB8JesIrlsIDwttRUoJTRAkEZTHf.png', NULL, NULL),
(64, 41, '/uploads/f6WqFHRtaHkpNZ7s0ouv11syTBsR5VzfwVmR6Hdw.png', NULL, NULL),
(69, 42, '/uploads/ASK6JYOul231aXBgUPwDUsMDvlT51mBS5Gicp2OX.png', NULL, NULL),
(70, 42, '/uploads/jMbVPhfkiVSXIq4Wc8x1RH1v1HLbEIs0POQEiiYL.png', NULL, NULL),
(71, 42, '/uploads/lRy67AARhBqBgGDSrnsrBotxeagw4TwZcdkZlr8K.png', NULL, NULL),
(72, 42, '/uploads/OUYPcaxuhtdf2VdoFg3C4gWfuWLhChui0DsO7aAS.png', NULL, NULL),
(73, 44, '/uploads/xjzneZgKkeyWjQwkXE0iKn0OJbJeUHmKoOhGD97c.png', NULL, NULL),
(75, 45, '/uploads/MDAayZDlkIu6tRo9ZHxPtA4kd2FDLqguChN7y13n.png', NULL, NULL),
(77, 46, '/uploads/woczfkCWsxk7wMr6ARZWnboeA1EYGnQzWAbC9n1b.png', NULL, NULL),
(78, 47, '/uploads/DYVwAAVv250ba4kddv9G9RFDa0qg818pHYBNUBq3.png', NULL, NULL),
(79, 48, '/uploads/XbAm4HbOKFtzL5WGpZy6zEM4E7hfzSQIq4rZm3OW.png', NULL, NULL),
(80, 49, '/uploads/NFueHzCuTt48o1WESMft2uwgddk6gTFPxwFVwNDB.png', NULL, NULL),
(81, 30, '/uploads/gBjZTzP8n3Zbs1hlrAk9fv8qgqx9DYZQIxfQeqAL.png', NULL, NULL),
(84, 54, '/uploads/wvJSWwSvl3UgS0PP7PN54hASiCxf186smBTwi5hd.png', NULL, NULL),
(85, 55, '/uploads/dbwTu33r9EJeD15O7L4ex4lI2z3pwZ53rmqpAYgv.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `categoryId` int(11) NOT NULL,
  `subCategoryId` int(11) NOT NULL,
  `isNew` tinyint(1) NOT NULL DEFAULT 0,
  `isFeatured` tinyint(1) NOT NULL DEFAULT 0,
  `totalSale` int(11) UNSIGNED DEFAULT NULL,
  `discount` int(10) NOT NULL DEFAULT 0,
  `warranty` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `price`, `stock`, `categoryId`, `subCategoryId`, `isNew`, `isFeatured`, `totalSale`, `discount`, `warranty`, `created_at`, `updated_at`) VALUES
(54, 'qww', 'asdasda', '/uploads/dGoVx96r6iFHqKIZ94dLQr68J70A35gaH9oUV0aq.png', '3.00', 4, 2, 12, 0, 0, NULL, 4, NULL, '2020-05-27 13:00:27', '2020-05-27 13:00:27'),
(55, 'sdasf', 'sdfsdfgd', '/uploads/dbwTu33r9EJeD15O7L4ex4lI2z3pwZ53rmqpAYgv.png', '3.00', 5, 5, 28, 0, 0, NULL, 4, NULL, '2020-05-28 02:24:02', '2020-05-28 02:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categoryId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categoryId`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jackets & Hoodies', '2019-11-27 23:28:50', '2019-11-27 23:28:50'),
(2, 1, 'Shirts', '2019-11-27 23:29:01', '2019-11-27 23:29:01'),
(3, 1, 'Tees & Polos', NULL, NULL),
(4, 1, 'Panjabees', NULL, NULL),
(5, 1, 'Pants & Trousers', NULL, NULL),
(6, 1, 'Watches', NULL, NULL),
(7, 1, 'Sunglasses & Eyewears', NULL, NULL),
(8, 1, 'Wallets & Belts', NULL, NULL),
(9, 1, 'Bags & Bagpacks', NULL, NULL),
(10, 1, 'Footwear', NULL, NULL),
(11, 1, 'Innerwear', NULL, NULL),
(12, 2, 'Saree', NULL, NULL),
(13, 2, 'Hijab', NULL, NULL),
(14, 2, 'Salwar Kamiz & Kurtis', NULL, NULL),
(15, 2, 'Footwear', NULL, NULL),
(16, 3, 'Phones', NULL, NULL),
(17, 3, 'GSM Phones', NULL, NULL),
(18, 3, 'Tablets', NULL, NULL),
(19, 3, 'Smartwatches', NULL, NULL),
(20, 3, 'Powerbanks', NULL, NULL),
(21, 4, 'Laptops & Notebooks', NULL, NULL),
(22, 4, 'Desktop PC', NULL, NULL),
(23, 4, 'Monitors', NULL, NULL),
(24, 4, 'Keyboards & Mouses', NULL, NULL),
(25, 4, 'Router & Networking', NULL, NULL),
(26, 4, 'Printers & Scanners', NULL, NULL),
(28, 5, 'Telivision', NULL, NULL),
(29, 5, 'Kitchen Appliances', NULL, NULL);

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
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `designation_id`, `name`, `email`, `address`, `email_verified_at`, `password`, `phone`, `user_type`, `isActive`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 8, 'choity', 'choity@gmail.com', 'sreemangal', NULL, '$2y$10$R6EVdOymz.H6zhjBLX1C6eXj4VyjcIW62z6zeEXITlsU9jTAvDvUe', '123456', 'Admin', 1, NULL, '2019-10-27 04:05:36', '2019-10-27 04:05:36'),
(2, 8, 'nasuha', 'choity@gmail.comnasuha', 'nasuha', NULL, '$2y$10$ag8MHj/jISEwB9CTGX3nG.ZYm9XWEfnFdE.Vp1YYlVSgcfl5moLa2', '123456', NULL, 0, NULL, '2019-10-27 04:07:22', '2019-10-27 04:07:22'),
(3, 8, 'amran', 'amran@gmail.com', 'jjhgjytfydasda', NULL, '$2y$10$R6EVdOymz.H6zhjBLX1C6eXj4VyjcIW62z6zeEXITlsU9jTAvDvUe', '123456', 'Seller', 1, NULL, '2019-10-27 04:11:42', '2019-10-27 04:11:42'),
(4, 7, 'any', 'any@gmail.com', 'jjhgjytfyfklj', NULL, '$2y$10$40LL90n2SVCsSKGCYgFP/.z0iGCWRZus091GZd9Y6qrqxyhW1TaiC', '123456', NULL, 0, NULL, '2019-10-27 04:43:24', '2019-10-27 04:43:24'),
(5, 3, 'Bijoya', 'Bijoya@gmail.com', 'jjhgjytfykjk', NULL, '$2y$10$Ia3N3rp1fBxn5o8GHn0Ng.W3kqG4EP0fhwMXidTWUZibcTolqDExG', '123456', NULL, 0, NULL, '2019-10-27 05:18:29', '2019-10-27 05:18:29'),
(6, 4, 'Hachib', 'hachib@gmail.com', 'vjsdvkhjof', NULL, '$2y$10$G1GuDAbvuB1zdLKl22YLTeNeyZqssYjmOooN6IzruQxbQ0O8qf8YG', '123456', NULL, 0, NULL, '2019-10-27 05:19:03', '2019-10-27 05:19:03'),
(7, 7, 'rupali', 'rupali@gmail.com', 'jjhgjytfydsfsjgfs', NULL, '$2y$10$SZO4zHYHLI6gAp97QU5kBeHhrU.klI6SWGKB6IXklZ2lWgG6SHd8S', '12345678', NULL, 0, NULL, '2019-10-28 22:56:33', '2019-10-28 22:56:33'),
(8, 9, 'aabbcc', 'aabbcc@gmail.com', 'jjhgjytfysdfsfg', NULL, '$2y$10$z3WS.noV619/ZZQBV8ycFOX60uDdp8JIOSK6Zw4t1FHQeRzJZiNvy', '12345678', NULL, 0, NULL, '2019-10-29 23:26:47', '2019-10-29 23:26:47'),
(9, 7, 'moumita', 'moumita@gmail.com', 'jjhgjytfydfjgsdfjg', NULL, '$2y$10$AVTWbnn43ZVgp6OVkq/MEeAmZ31zUEgWruF0MDpsLjg6wpYIgKn8.', '12345678', NULL, 0, NULL, '2019-11-03 01:32:36', '2019-11-03 01:32:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
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
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
