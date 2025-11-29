-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 29, 2025 at 03:54 AM
-- Server version: 9.5.0
-- PHP Version: 8.5.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mrw_koperasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(25, 'approve-pembelian'),
(15, 'approve-pinjaman'),
(9, 'approve-simpanan'),
(1, 'create-member'),
(21, 'create-pembelian'),
(17, 'create-penjualan'),
(11, 'create-pinjaman'),
(5, 'create-simpanan'),
(27, 'create-user'),
(4, 'delete-member'),
(24, 'delete-pembelian'),
(20, 'delete-penjualan'),
(14, 'delete-pinjaman'),
(8, 'delete-simpanan'),
(30, 'delete-user'),
(31, 'manage-roles'),
(2, 'read-member'),
(22, 'read-pembelian'),
(18, 'read-penjualan'),
(12, 'read-pinjaman'),
(6, 'read-simpanan'),
(28, 'read-user'),
(26, 'reject-pembelian'),
(16, 'reject-pinjaman'),
(10, 'reject-simpanan'),
(3, 'update-member'),
(23, 'update-pembelian'),
(19, 'update-penjualan'),
(13, 'update-pinjaman'),
(7, 'update-simpanan'),
(29, 'update-user');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'superadmin', 'Administrator penuh sistem'),
(2, 'admin', 'Administrator modul tertentu'),
(3, 'staff', 'Operator harian'),
(4, 'user', 'Anggota/Pengguna standar');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`role_id`, `permission_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(1, 3),
(2, 3),
(1, 4),
(2, 4),
(1, 5),
(2, 5),
(3, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(1, 7),
(2, 7),
(1, 8),
(2, 8),
(1, 9),
(2, 9),
(1, 10),
(2, 10),
(1, 11),
(2, 11),
(3, 11),
(1, 12),
(2, 12),
(3, 12),
(4, 12),
(1, 13),
(2, 13),
(1, 14),
(2, 14),
(1, 15),
(2, 15),
(1, 16),
(2, 16),
(1, 17),
(2, 17),
(3, 17),
(1, 18),
(2, 18),
(3, 18),
(4, 18),
(1, 19),
(2, 19),
(1, 20),
(2, 20),
(1, 21),
(2, 21),
(3, 21),
(1, 22),
(2, 22),
(3, 22),
(1, 23),
(2, 23),
(1, 24),
(2, 24),
(1, 25),
(2, 25),
(1, 26),
(2, 26),
(1, 27),
(2, 27),
(3, 27),
(1, 28),
(2, 28),
(1, 29),
(2, 29),
(1, 30),
(2, 30),
(1, 31),
(2, 31);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(72) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '0',
  `_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `email`, `birthday`, `created_at`, `is_active`, `_deleted`) VALUES
(1, 'admin', '$2b$10$nTN1rcDz44VUBx1egX1h/OpefnnoDq7rRKtjavugb3RudapdBUoVK', 'Arie K Ramdhani', 'ak.ramdhani@gmail.com', '1980-07-13', '2025-11-17 02:52:42', 1, 0),
(3, 'bambang13', '$2b$10$u1gVssOlv2a3ucD2NfLsauBsfZCPaZQRGutQaYdUbkRYZcKOwkVL6', 'Bambang Petro Syamsudin', 'bamtro@gmail.com', NULL, '2025-11-17 10:23:11', 1, 0),
(4, 'syiefa01', '$2b$10$EENL3QO1nbxVfZv/A246KeKfSNZXsG2UUCRRhcY2vauuGeuV7r1Mq', 'Syiefa Aja', 'syiefa@marawa.id', NULL, '2025-11-19 03:44:02', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_permission`
--

CREATE TABLE `user_permission` (
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `type` enum('allow','deny') COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(3, 2),
(4, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_usper_name` (`name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `fk_urp_pid` (`permission_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`) USING BTREE;

--
-- Indexes for table `user_permission`
--
ALTER TABLE `user_permission`
  ADD PRIMARY KEY (`user_id`,`permission_id`),
  ADD KEY `fk_ur_rid` (`permission_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `fk_urole_rid` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `fk_urp_pid` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_urp_rid` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `user_permission`
--
ALTER TABLE `user_permission`
  ADD CONSTRAINT `fk_ur_rid` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_ur_uid` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `fk_urole_rid` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_urole_uid` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
