-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2026 at 11:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodiego_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`, `image`) VALUES
(1, 'Burger', 'Delicious burgers', 'burger.jpg'),
(2, 'Pizza', 'Fresh and cheesy pizza', 'pizza.jpg'),
(3, 'Pasta', 'Italian pasta dishes', 'pasta.jpg'),
(4, 'Drinks', 'Cold and refreshing drinks', 'drinks.jpg'),
(5, 'Desserts', 'Sweet desserts', 'desserts.jpg'),
(6, 'Sandwich', 'Fresh sandwiches', 'sandwich.jpg'),
(7, 'Fast Food', 'Popular fast food items', 'fastfood.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `food_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `food_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`food_id`, `category_id`, `food_name`, `description`, `price`, `image`, `availability`) VALUES
(1, 1, 'Classic Beef Burger', 'Juicy beef burger with cheese', 250.00, 'beef_burger.jpg', 1),
(2, 1, 'Chicken Burger', 'Crispy chicken burger', 180.00, 'chicken_burger.jpg', 1),
(3, 1, 'Cheese Burger', 'Burger with extra cheese', 280.00, 'cheese_burger.jpg', 1),
(4, 2, 'Margherita Pizza', 'Classic cheese pizza', 450.00, 'margherita.jpg', 1),
(5, 2, 'Chicken Pizza', 'Pizza with chicken toppings', 550.00, 'chicken_pizza.jpg', 1),
(6, 2, 'BBQ Pizza', 'BBQ chicken pizza', 600.00, 'bbq_pizza.jpg', 1),
(7, 3, 'Chicken Pasta', 'Creamy chicken pasta', 300.00, 'chicken_pasta.jpg', 1),
(8, 3, 'White Sauce Pasta', 'Pasta with white sauce', 280.00, 'white_pasta.jpg', 1),
(9, 4, 'Cold Coffee', 'Chilled coffee', 150.00, 'cold_coffee.jpg', 1),
(10, 4, 'Fresh Lemon Juice', 'Fresh lemon drink', 80.00, 'lemon_juice.jpg', 1),
(11, 4, 'Chocolate Milkshake', 'Creamy chocolate shake', 180.00, 'milkshake.jpg', 1),
(12, 5, 'Chocolate Cake', 'Delicious chocolate cake', 120.00, 'chocolate_cake.jpg', 1),
(13, 6, 'Club Sandwich', 'Chicken club sandwich', 200.00, 'club_sandwich.jpg', 1),
(14, 7, 'French Fries', 'Crispy potato fries', 100.00, 'fries.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_number` varchar(30) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_status` enum('pending','accepted','rejected','preparing','ready_for_pickup','completed','canceled') DEFAULT 'pending',
  `payment_status` enum('unpaid','paid') DEFAULT 'unpaid',
  `pickup_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_number`, `total_amount`, `order_status`, `payment_status`, `pickup_time`) VALUES
(16, 9, 'FG-1001', 430.00, 'completed', 'paid', '2026-11-12 12:30:00'),
(17, 10, 'FG-1002', 550.00, 'preparing', 'paid', '2026-11-12 15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `food_id` int(11) DEFAULT NULL,
  `food_name` varchar(150) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `food_id`, `food_name`, `quantity`, `unit_price`, `subtotal`) VALUES
(13, 16, 1, 'Classic Beef Burger', 1, 250.00, 250.00),
(14, 17, 5, 'Chicken Pizza', 1, 550.00, 550.00),
(15, 16, 10, 'Fresh Lemon Juice', 1, 80.00, 80.00),
(16, 16, 14, 'French Fries', 1, 100.00, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `student_id` varchar(30) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer') NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `phone`, `student_id`, `password`, `role`) VALUES
(6, 'Tamanna Ahmed Tasin', 'tamannaahmed19042003@gmail.com', '01997692253', '241400033', 'tasin123', 'admin'),
(7, 'Umme Salma Zimia', 'ummesalmazimia1@gmail.com', '01644711310', '241400055', 'zimia123', 'admin'),
(8, 'Ahmed Musa Al Galib', 'ahmedmusaalgalib@gmail.com', '01876912431', '241400046', 'galib123', 'admin'),
(9, 'Nusrat Jahan', 'nusrat@gmail.com', '01944444444', '2023003', 'nusrat123', 'customer'),
(10, 'Sadia Akter', 'sadia@gmail.com', '01655555555', '2023004', 'sadia123', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`food_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `food_items`
--
ALTER TABLE `food_items`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `food_items`
--
ALTER TABLE `food_items`
  ADD CONSTRAINT `food_items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food_items` (`food_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
