-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 09, 2022 at 12:00 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nad`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_status` int(3) NOT NULL DEFAULT 0,
  `cart_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_status`, `cart_date`, `customer_id`) VALUES
(5, 1, '2022-08-07 18:52:58', 1),
(6, 1, '2022-08-07 19:06:17', 1),
(7, 1, '2022-08-07 19:26:54', 1),
(8, 1, '2022-08-07 20:00:15', 1),
(9, 1, '2022-08-08 11:53:32', 1),
(10, 0, '2022-08-09 09:21:40', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL DEFAULT 1,
  `add_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_id`, `product_id`, `product_quantity`, `add_date`) VALUES
(5, 5, 1, '2022-08-07 18:52:58'),
(6, 8, 1, '2022-08-07 19:23:26'),
(6, 10, 1, '2022-08-07 19:23:29'),
(6, 10, 1, '2022-08-07 19:25:46'),
(7, 5, 1, '2022-08-07 19:26:55'),
(7, 7, 1, '2022-08-07 19:26:57'),
(7, 8, 1, '2022-08-07 19:26:59'),
(7, 10, 1, '2022-08-07 19:27:01'),
(8, 5, 1, '2022-08-07 20:00:15'),
(8, 7, 1, '2022-08-07 20:00:18'),
(8, 8, 1, '2022-08-07 20:00:20'),
(8, 10, 1, '2022-08-07 20:00:23'),
(8, 5, 1, '2022-08-08 11:49:44'),
(8, 7, 1, '2022-08-08 11:49:49'),
(9, 12, 1, '2022-08-08 23:42:46'),
(9, 11, 1, '2022-08-08 23:42:48'),
(9, 7, 1, '2022-08-08 23:42:51'),
(10, 7, 1, '2022-08-09 09:21:40'),
(10, 12, 1, '2022-08-09 09:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `production_line_id` int(11) NOT NULL,
  `category_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `production_line_id`, `category_date`) VALUES
(3, 'Children', 1, '2022-08-07 12:36:23'),
(4, 'Men', 2, '2022-08-07 12:36:38'),
(5, 'Women', 3, '2022-08-07 12:36:54'),
(6, 'Youth', 2, '2022-08-07 12:37:40');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `full_name`, `email`, `location`, `gender`, `password`, `created_at`) VALUES
(1, 'Naomi', 'naomi@gmail.com', 'Kampala', 'F', '172615877915217560892406575915100721237', '2022-08-08 22:21:42'),
(2, 'Fiona', 'fiona@gmail.com', 'Kampala', 'M', '172615877915217560892406575915100721237', '2022-08-09 09:20:08');

-- --------------------------------------------------------

--
-- Table structure for table `daily_production`
--

CREATE TABLE `daily_production` (
  `production_id` int(11) NOT NULL,
  `production_line_id` int(11) NOT NULL,
  `number_of_products` int(11) NOT NULL,
  `production_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daily_production`
--

INSERT INTO `daily_production` (`production_id`, `production_line_id`, `number_of_products`, `production_date`) VALUES
(1, 1, 7, '2022-08-07 10:31:03'),
(2, 2, 14, '2022-08-07 10:31:03'),
(3, 3, 70, '2022-08-07 10:31:03'),
(4, 1, 12, '2022-08-07 10:37:14'),
(5, 2, 24, '2022-08-07 10:37:14'),
(6, 3, 120, '2022-08-07 10:37:14'),
(7, 1, 12, '2022-08-07 10:38:58'),
(8, 2, 24, '2022-08-07 10:38:58'),
(9, 3, 120, '2022-08-07 10:38:58'),
(10, 1, 7, '2022-08-07 10:41:51'),
(11, 2, 14, '2022-08-07 10:41:51'),
(12, 3, 70, '2022-08-07 10:41:51'),
(13, 1, 67, '2022-08-08 11:51:00'),
(14, 2, 134, '2022-08-08 11:51:00'),
(15, 3, 670, '2022-08-08 11:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `production_lines`
--

CREATE TABLE `production_lines` (
  `production_line_id` int(11) NOT NULL,
  `production_line_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `production_lines`
--

INSERT INTO `production_lines` (`production_line_id`, `production_line_name`) VALUES
(1, 'Long Term Production Line'),
(2, 'Mid Term Production Line'),
(3, 'Short Term Production Line');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_price` float NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category_id`, `product_price`, `created_at`) VALUES
(5, 'Clothes', 3, 6700, '2022-08-07 16:03:34'),
(7, 'Pants', 4, 6700, '2022-08-07 16:04:53'),
(11, 'Vests', 3, 12000, '2022-08-08 11:52:09'),
(12, 'Trousers', 5, 12000, '2022-08-08 11:52:38');

-- --------------------------------------------------------

--
-- Table structure for table `product_likes`
--

CREATE TABLE `product_likes` (
  `like_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_likes`
--

INSERT INTO `product_likes` (`like_id`, `product_id`, `created_at`) VALUES
(1, 1, '2022-08-06 06:40:13'),
(2, 2, '2022-08-06 06:40:56'),
(3, 1, '2022-08-06 14:26:54'),
(4, 1, '2022-08-06 14:30:30'),
(5, 5, '2022-08-07 18:14:30'),
(6, 5, '2022-08-07 20:01:39'),
(7, 8, '2022-08-07 21:23:48'),
(8, 7, '2022-08-08 11:56:53'),
(9, 5, '2022-08-08 11:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `cart_id`, `sale_date`) VALUES
(2, 5, '2022-08-07 18:53:08'),
(3, 6, '2022-08-07 19:25:59'),
(4, 7, '2022-08-07 19:27:08'),
(5, 8, '2022-08-08 11:49:59'),
(6, 9, '2022-08-08 23:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_full_name` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 1,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_full_name`, `role_id`, `email`, `created_at`, `password`) VALUES
(1, 'Abaasa Denis', 1, 'denis@gmail.com', '2022-08-09 08:13:30', '172615877915217560892406575915100721237'),
(3, 'Admin', 1, 'admin@gmail.com', '2022-08-09 09:09:32', '172615877915217560892406575915100721237');

-- --------------------------------------------------------

--
-- Table structure for table `worker_allocation`
--

CREATE TABLE `worker_allocation` (
  `allocation_id` int(11) NOT NULL,
  `production_line_id` int(11) NOT NULL,
  `number_of_workers` int(11) NOT NULL,
  `allocation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `worker_allocation`
--

INSERT INTO `worker_allocation` (`allocation_id`, `production_line_id`, `number_of_workers`, `allocation_date`) VALUES
(1, 1, 224, '2022-08-07 08:48:27'),
(2, 2, 112, '2022-08-07 08:48:27'),
(3, 3, 56, '2022-08-07 08:48:27'),
(4, 1, 136, '2022-08-07 09:35:01'),
(16, 1, 312, '2022-08-07 09:45:26'),
(17, 2, 156, '2022-08-07 09:45:26'),
(18, 3, 78, '2022-08-07 09:45:26'),
(19, 1, 8, '2022-08-07 09:45:38'),
(20, 2, 4, '2022-08-07 09:45:38'),
(21, 3, 2, '2022-08-07 09:45:39'),
(22, 1, 28, '2022-08-07 10:00:09'),
(23, 2, 14, '2022-08-07 10:00:10'),
(24, 3, 7, '2022-08-07 10:00:10'),
(25, 1, 2684, '2022-08-07 10:34:21'),
(26, 2, 1342, '2022-08-07 10:34:21'),
(27, 3, 671, '2022-08-07 10:34:22'),
(28, 1, 484, '2022-08-08 11:51:30'),
(29, 2, 242, '2022-08-08 11:51:30'),
(30, 3, 121, '2022-08-08 11:51:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `daily_production`
--
ALTER TABLE `daily_production`
  ADD PRIMARY KEY (`production_id`);

--
-- Indexes for table `production_lines`
--
ALTER TABLE `production_lines`
  ADD PRIMARY KEY (`production_line_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_likes`
--
ALTER TABLE `product_likes`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `worker_allocation`
--
ALTER TABLE `worker_allocation`
  ADD PRIMARY KEY (`allocation_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `daily_production`
--
ALTER TABLE `daily_production`
  MODIFY `production_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `production_lines`
--
ALTER TABLE `production_lines`
  MODIFY `production_line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_likes`
--
ALTER TABLE `product_likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `worker_allocation`
--
ALTER TABLE `worker_allocation`
  MODIFY `allocation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
