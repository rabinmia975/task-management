-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 22, 2024 at 04:51 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 2),
(6, '2024_12_22_095656_create_tasks_table', 3);

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
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'taka-management', '858523f729a447b703e780dfa99095051a2c329e775b67339351124616ecb333', '[\"*\"]', '2024-12-22 07:07:55', NULL, '2024-12-22 06:35:02', '2024-12-22 07:07:55'),
(2, 'App\\Models\\User', 4, 'taka-management', '0d9b0277a8146e535bee7bb96d037f872e3bf2083dd5b5c4ad3b545856690f84', '[\"*\"]', NULL, NULL, '2024-12-22 06:37:01', '2024-12-22 06:37:01'),
(3, 'App\\Models\\User', 5, 'taka-management', 'b2893b7211ca6abf31921febcd8c7d49573fd96e6dc59730cd21a521cbd2646c', '[\"*\"]', '2024-12-22 08:36:52', NULL, '2024-12-22 07:26:36', '2024-12-22 08:36:52'),
(4, 'App\\Models\\User', 4, 'taka-management', '789f6f1623bb0ccbfd5ce03fd67a42b1c9d48c8abbd08f7660350610d6c90aa1', '[\"*\"]', NULL, NULL, '2024-12-22 08:44:58', '2024-12-22 08:44:58'),
(5, 'App\\Models\\User', 4, 'taka-management', 'c2dbff574e538d7b630ffd856c1dd3835405f558adbe01b271ef32fa224e544b', '[\"*\"]', NULL, NULL, '2024-12-22 08:45:52', '2024-12-22 08:45:52');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Pending','In Progress','Completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `due_date` date DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `due_date`, `user_id`, `created_at`, `updated_at`) VALUES
(7, 'Aut qui optio sit s', 'Ea et sint iste sol', 'Pending', NULL, 1, '2024-12-22 05:18:29', '2024-12-22 05:18:29'),
(8, 'Laudantium hic qui', 'Aut ut voluptate eni', 'Completed', NULL, 1, '2024-12-22 05:22:00', '2024-12-22 05:22:00'),
(9, 'Laborum Labore cupi', 'Itaque cupidatat har', 'In Progress', '2024-12-05', 1, '2024-12-22 05:22:14', '2024-12-22 05:22:14'),
(12, 'Dolorem reprehenderi', 'Repellendus Ipsum', 'In Progress', NULL, 2, '2024-12-22 05:35:21', '2024-12-22 06:17:44'),
(13, 'Culpa libero sit i', 'Sunt incididunt inci', 'Pending', NULL, 2, '2024-12-22 06:17:37', '2024-12-22 06:17:37'),
(14, 'Placeat perspiciati', 'Velit distinctio Ci', 'In Progress', NULL, 4, '2024-12-22 06:47:49', '2024-12-22 06:47:49'),
(15, 'My New Task', 'This is a description of the new task.', 'Pending', '2024-12-30', 4, '2024-12-22 06:56:01', '2024-12-22 06:56:01'),
(16, 'My 2', 'This is a description of the new task.', 'Pending', '2024-12-30', 4, '2024-12-22 06:58:17', '2024-12-22 06:58:17'),
(17, '12', '12', 'Pending', '2012-12-12', 4, '2024-12-22 07:07:55', '2024-12-22 07:07:55'),
(18, 'new taks', 'new taks description', 'Pending', NULL, 5, '2024-12-22 07:49:25', '2024-12-22 07:49:25'),
(19, 'new taks', 'new taks description', 'Pending', NULL, 5, '2024-12-22 07:49:29', '2024-12-22 07:49:29'),
(21, 'new taks', 'new taks description', 'Pending', '2012-12-15', 5, '2024-12-22 07:49:58', '2024-12-22 07:49:58'),
(22, 'new taks 3212', 'new taks description', 'Pending', '2012-12-15', 5, '2024-12-22 07:50:11', '2024-12-22 07:50:11'),
(23, 'new taks 3212', 'new taks description', 'Pending', '2012-12-15', 5, '2024-12-22 08:32:15', '2024-12-22 08:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
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
(1, 'user', 'user@gmail.com', NULL, '$2y$12$50X6z4MTjdieraAKkVslQeI.Cnsgl4SU0MK5tiW/IlAgXhvRhMqd6', NULL, '2024-12-22 04:03:01', '2024-12-22 04:03:01'),
(2, 'user2', 'user2@gmail.com', NULL, '$2y$12$gQnC95VQqU70eArAkSpcje1mPFhKurNkK8butys/0mXZbPbSyns2G', 'DmacHcOeeEiFBzvH75jzoIKnKXhOsUJX56jtDh9hkvl0TrX4qh9APtsHMhwB', '2024-12-22 05:28:00', '2024-12-22 05:28:00'),
(3, 'Natalie Cooke', 'qykypizywu@mailinator.com', NULL, '$2y$12$MbsKmXC/Oo92FCGjWJm0cOA9AP0ugKvzS/WUIAPobrUga8KH.jZCy', NULL, '2024-12-22 05:31:46', '2024-12-22 05:31:46'),
(4, 'rabin', 'rabin@gmail.com', NULL, '$2y$12$HzDz.9cIFMi9aEETYtscyeh8/FmFTJzaKCRLbkR4reA/oQ2qht5wq', 'DmacHcOeeEiFBzvH75jzoIKnKXhOsUJX56jtDh9hkvl0TrX4qh9APtsHMhwB', '2024-12-22 06:35:02', '2024-12-22 06:35:02'),
(5, 'new', 'new@gmail.com', NULL, '$2y$12$U.6MQyS.RcqivTAXyoNOnOJ/WDXkDb.8qz8iD7WaP06qNaaA1cBv6', NULL, '2024-12-22 07:26:36', '2024-12-22 07:26:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
