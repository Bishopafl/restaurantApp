-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 07, 2021 at 10:13 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurantAppDB`
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
(1, 'early Lunch', '2021-06-21 23:24:13', '2021-07-07 23:29:51'),
(2, 'Breakfast', '2021-06-21 23:24:19', '2021-06-21 23:24:19'),
(4, 'Drinks', '2021-06-21 23:24:28', '2021-06-21 23:24:28'),
(5, 'Brunch Specials', '2021-07-01 00:00:53', '2021-07-01 00:00:53'),
(6, 'Dinner', '2021-07-07 22:50:29', '2021-07-07 22:50:29'),
(7, 'Alcoholic Beverages', '2021-07-07 23:30:08', '2021-07-07 23:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `price`, `image`, `description`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Steak Kabobs', '14.00', '0621202119245260d0e7848b72f.jpg', 'Some delicious steak kabobs', 1, '2021-06-21 23:24:52', '2021-07-07 23:27:48'),
(2, 'Awesome Salmon', '18.00', '0621202119255260d0e7c0515ca.jpg', 'Delicious smoked Alaskan Salmon', 1, '2021-06-21 23:25:52', '2021-07-07 23:30:29'),
(3, 'Breakfast Burrito', '6.00', '0621202119264260d0e7f2ba579.jpg', 'Awesome breakfast burrito with all the fixings', 2, '2021-06-21 23:26:42', '2021-06-21 23:26:42'),
(4, 'Lunch Burrito', '6.00', 'noimage.png', 'Lunch stuffed burrito', 1, '2021-06-21 23:27:10', '2021-06-21 23:27:10'),
(5, 'Eggs For your Legs', '10.00', '0621202119273960d0e82bdfe0d.jpg', 'Signature eggs for your legs', 2, '2021-06-21 23:27:39', '2021-06-21 23:27:39'),
(6, 'Water', '0.00', '0621202119282060d0e85417bf8.jpg', 'water. Dassit.', 4, '2021-06-21 23:28:20', '2021-06-21 23:28:20'),
(7, 'Grilled Cheese', '6.00', '0707202119310460e600f8a525e.jpg', 'Awesome grilled cheese with 7 different cheeses', 1, '2021-07-07 23:31:04', '2021-07-07 23:31:04');

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
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_resets_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2021_06_04_195334_create_categories_table', 1),
(12, '2021_06_07_171153_create_menus_table', 1),
(13, '2021_06_10_124414_create_tables_table', 1),
(14, '2021_06_13_032906_create_sales_table', 1),
(15, '2021_06_21_190614_create_sale_details_table', 2),
(16, '2021_07_01_154644_add_role_field_to_users', 3);

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
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `table_id` int(11) NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `total_received` decimal(8,2) NOT NULL DEFAULT 0.00,
  `change` decimal(8,2) NOT NULL DEFAULT 0.00,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sale_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `table_id`, `table_name`, `user_id`, `user_name`, `total_price`, `total_received`, `change`, `payment_type`, `sale_status`, `created_at`, `updated_at`) VALUES
(4, 1, 'A1', 1, 'adam admin', '36.00', '36.00', '0.00', 'cash', 'paid', '2021-06-29 17:28:57', '2021-06-29 23:35:57'),
(5, 1, 'A1', 1, 'adam admin', '12.00', '15.00', '3.00', 'cash', 'paid', '2021-06-29 23:51:45', '2021-06-29 23:51:59'),
(6, 3, 'B1', 1, 'adam admin', '12.00', '12.00', '0.00', 'cash', 'paid', '2021-06-30 18:43:00', '2021-06-30 18:43:05'),
(7, 1, 'A1', 1, 'adam admin', '10.00', '100.00', '90.00', 'credit card', 'paid', '2021-06-30 18:57:38', '2021-06-30 19:00:23'),
(8, 3, 'B1', 1, 'adam admin', '26.00', '30.00', '4.00', 'cash', 'paid', '2021-06-30 18:57:47', '2021-06-30 18:58:07'),
(9, 1, 'A1', 1, 'adam admin', '16.00', '16.00', '0.00', 'cash', 'paid', '2021-06-30 21:44:30', '2021-06-30 21:44:57'),
(10, 1, 'A1', 1, 'adam admin', '10.00', '10.00', '0.00', 'cash', 'paid', '2021-06-30 21:48:27', '2021-06-30 21:48:49'),
(11, 1, 'A1', 1, 'adam admin', '-18.00', '0.00', '0.00', '', 'unpaid', '2021-07-01 23:34:58', '2021-07-07 23:33:07'),
(13, 2, 'A2', 1, 'adam admin', '12.00', '12.00', '0.00', 'cash', 'paid', '2021-07-02 17:29:42', '2021-07-02 17:44:09'),
(14, 4, 'B2', 2, 'Nancy Poo', '6.00', '6.00', '0.00', 'cash', 'paid', '2021-07-07 23:32:27', '2021-07-07 23:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'noConfirm',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `menu_id`, `menu_name`, `menu_price`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Lunch Burrito', 6, 1, 'confirm', '2021-06-28 19:33:49', '2021-06-29 16:55:36'),
(2, 1, 5, 'Eggs For your Legs', 10, 1, 'confirm', '2021-06-28 19:40:55', '2021-06-29 16:55:36'),
(3, 1, 2, 'Salmon', 14, 1, 'confirm', '2021-06-28 22:08:44', '2021-06-29 16:55:36'),
(4, 1, 4, 'Lunch Burrito', 6, 1, 'confirm', '2021-06-28 22:09:09', '2021-06-29 16:55:36'),
(5, 1, 3, 'Breakfast Burrito', 6, 1, 'confirm', '2021-06-28 22:11:52', '2021-06-29 16:55:36'),
(6, 1, 5, 'Eggs For your Legs', 10, 1, 'confirm', '2021-06-28 22:11:55', '2021-06-29 16:55:36'),
(7, 1, 4, 'Lunch Burrito', 6, 1, 'confirm', '2021-06-28 22:22:54', '2021-06-29 16:55:36'),
(8, 2, 3, 'Breakfast Burrito', 6, 1, 'noConfirm', '2021-06-28 22:25:41', '2021-06-28 22:25:41'),
(9, 3, 6, 'Water', 0, 1, 'confirm', '2021-06-28 22:25:47', '2021-06-29 17:06:39'),
(10, 3, 6, 'Water', 0, 1, 'confirm', '2021-06-28 22:25:49', '2021-06-29 17:06:39'),
(11, 3, 6, 'Water', 0, 1, 'confirm', '2021-06-28 22:25:49', '2021-06-29 17:06:39'),
(12, 3, 4, 'Lunch Burrito', 6, 1, 'confirm', '2021-06-29 16:58:40', '2021-06-29 17:06:39'),
(13, 3, 2, 'Salmon', 14, 1, 'confirm', '2021-06-29 17:06:38', '2021-06-29 17:06:39'),
(16, 3, 5, 'Eggs For your Legs', 10, 1, 'noConfirm', '2021-06-29 17:24:41', '2021-06-29 17:24:41'),
(18, 3, 4, 'Lunch Burrito', 6, 1, 'noConfirm', '2021-06-29 17:24:55', '2021-06-29 17:24:55'),
(22, 4, 6, 'Water', 0, 1, 'confirm', '2021-06-29 17:29:10', '2021-06-29 20:40:35'),
(23, 4, 6, 'Water', 0, 1, 'confirm', '2021-06-29 17:29:10', '2021-06-29 20:40:35'),
(24, 4, 6, 'Water', 0, 1, 'confirm', '2021-06-29 17:29:10', '2021-06-29 20:40:35'),
(27, 4, 4, 'Lunch Burrito', 6, 1, 'confirm', '2021-06-29 20:15:15', '2021-06-29 20:40:35'),
(29, 4, 3, 'Breakfast Burrito', 6, 1, 'confirm', '2021-06-29 20:18:34', '2021-06-29 20:40:35'),
(30, 4, 2, 'Salmon', 14, 1, 'confirm', '2021-06-29 20:38:49', '2021-06-29 20:40:35'),
(31, 4, 5, 'Eggs For your Legs', 10, 1, 'confirm', '2021-06-29 20:40:34', '2021-06-29 20:40:35'),
(32, 5, 4, 'Lunch Burrito', 6, 1, 'confirm', '2021-06-29 23:51:45', '2021-06-29 23:51:52'),
(33, 5, 4, 'Lunch Burrito', 6, 1, 'confirm', '2021-06-29 23:51:46', '2021-06-29 23:51:52'),
(34, 5, 6, 'Water', 0, 1, 'confirm', '2021-06-29 23:51:49', '2021-06-29 23:51:52'),
(35, 6, 1, 'Chicken Kabobs', 12, 1, 'confirm', '2021-06-30 18:43:00', '2021-06-30 18:43:01'),
(36, 7, 5, 'Eggs For your Legs', 10, 1, 'confirm', '2021-06-30 18:57:38', '2021-06-30 19:00:09'),
(38, 8, 4, 'Lunch Burrito', 6, 1, 'confirm', '2021-06-30 18:57:47', '2021-06-30 18:57:57'),
(39, 8, 3, 'Breakfast Burrito', 6, 1, 'confirm', '2021-06-30 18:57:49', '2021-06-30 18:57:57'),
(40, 8, 2, 'Salmon', 14, 1, 'confirm', '2021-06-30 18:57:52', '2021-06-30 18:57:57'),
(42, 7, 6, 'Water', 0, 1, 'confirm', '2021-06-30 19:00:05', '2021-06-30 19:00:09'),
(43, 9, 4, 'Lunch Burrito', 6, 1, 'confirm', '2021-06-30 21:44:30', '2021-06-30 21:44:46'),
(44, 9, 5, 'Eggs For your Legs', 10, 1, 'confirm', '2021-06-30 21:44:33', '2021-06-30 21:44:46'),
(45, 9, 6, 'Water', 0, 1, 'confirm', '2021-06-30 21:44:37', '2021-06-30 21:44:46'),
(47, 9, 6, 'Water', 0, 1, 'confirm', '2021-06-30 21:44:43', '2021-06-30 21:44:46'),
(48, 9, 6, 'Water', 0, 1, 'confirm', '2021-06-30 21:44:44', '2021-06-30 21:44:46'),
(50, 10, 5, 'Eggs For your Legs', 10, 1, 'confirm', '2021-06-30 21:48:29', '2021-06-30 21:48:40'),
(51, 10, 6, 'Water', 0, 1, 'confirm', '2021-06-30 21:48:31', '2021-06-30 21:48:40'),
(52, 10, 6, 'Water', 0, 1, 'confirm', '2021-06-30 21:48:32', '2021-06-30 21:48:40'),
(59, 13, 1, 'Chicken Kabobs', 12, 1, 'confirm', '2021-07-02 17:43:55', '2021-07-02 17:44:04'),
(60, 14, 7, 'Grilled Cheese', 6, 1, 'confirm', '2021-07-07 23:32:27', '2021-07-07 23:32:43'),
(61, 14, 6, 'Water', 0, 3, 'confirm', '2021-07-07 23:32:30', '2021-07-07 23:32:43');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'A1', 'unavailable', '2021-06-21 23:28:30', '2021-07-01 23:34:58'),
(4, 'B2', 'available', '2021-06-21 23:28:43', '2021-07-07 23:32:52'),
(5, 'B1', 'available', '2021-07-07 23:28:50', '2021-07-07 23:28:50'),
(6, 'A2', 'available', '2021-07-07 23:31:23', '2021-07-07 23:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
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

INSERT INTO `users` (`id`, `name`, `role`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'adam admin', 'admin', 'adam@test.com', NULL, '$2y$10$I8opvv1Y54DxaEB7YFsJyeezAk6MJWvDTvYMwHmeixS/L5WBD3kyG', NULL, '2021-06-21 23:23:15', '2021-06-21 23:23:15'),
(2, 'Nancy Poo', 'cashier', 'nancy@poo.com', NULL, '$2y$10$M1SqL1mSbNrTE67EXixOWOInHwD0D1nimEamPfGPcy5ExwxqkmKiC', NULL, '2021-07-01 19:46:01', '2021-07-01 23:23:07'),
(4, 'Spiderman', 'cashier', 'peter@parker.com', NULL, '$2y$10$0YvGyiMFG657ycvh7L.rvuXvlqIsuxIFuFNQWb5szX7W.QdZe82xO', NULL, '2021-07-07 23:31:50', '2021-07-07 23:31:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
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
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
