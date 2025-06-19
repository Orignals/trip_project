-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: יוני 01, 2025 בזמן 12:47 PM
-- גרסת שרת: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tripproject`
--

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `feedbacks`
--

CREATE TABLE `feedbacks` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `feedback_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `feedbacks_users`
--

CREATE TABLE `feedbacks_users` (
  `user_id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` date DEFAULT NULL,
  `order_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- הוצאת מידע עבור טבלה `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `order_number`) VALUES
(1, '2025-05-22', '345'),
(2, '2025-05-26', '567');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `photogallery`
--

CREATE TABLE `photogallery` (
  `photo_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `notification_photo` int(11) NOT NULL,
  `descriptionPhoto` int(11) NOT NULL,
  `photo_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `photographers_photos`
--

CREATE TABLE `photographers_photos` (
  `photographer_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `photos`
--

CREATE TABLE `photos` (
  `image_id` int(11) NOT NULL,
  `photographer_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `tripgallery`
--

CREATE TABLE `tripgallery` (
  `image_id` int(11) NOT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `image_location` varchar(100) DEFAULT NULL,
  `image_description` text DEFAULT NULL,
  `image_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `trips`
--

CREATE TABLE `trips` (
  `trip_id` int(11) NOT NULL,
  `trip_name` varchar(100) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `participants_count` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `triptypes`
--

CREATE TABLE `triptypes` (
  `trip_type_id` int(11) NOT NULL,
  `trip_type_name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `trip_managers`
--

CREATE TABLE `trip_managers` (
  `trip_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `user_orders`
--

CREATE TABLE `user_orders` (
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- אינדקסים לטבלה `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `user_id` (`user_id`);

--
-- אינדקסים לטבלה `feedbacks_users`
--
ALTER TABLE `feedbacks_users`
  ADD PRIMARY KEY (`user_id`,`feedback_id`),
  ADD KEY `feedback_id` (`feedback_id`);

--
-- אינדקסים לטבלה `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- אינדקסים לטבלה `photogallery`
--
ALTER TABLE `photogallery`
  ADD PRIMARY KEY (`photo_id`);

--
-- אינדקסים לטבלה `photographers_photos`
--
ALTER TABLE `photographers_photos`
  ADD PRIMARY KEY (`photographer_id`,`image_id`),
  ADD KEY `image_id` (`image_id`);

--
-- אינדקסים לטבלה `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `photographer_id` (`photographer_id`);

--
-- אינדקסים לטבלה `tripgallery`
--
ALTER TABLE `tripgallery`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- אינדקסים לטבלה `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- אינדקסים לטבלה `triptypes`
--
ALTER TABLE `triptypes`
  ADD PRIMARY KEY (`trip_type_id`);

--
-- אינדקסים לטבלה `trip_managers`
--
ALTER TABLE `trip_managers`
  ADD PRIMARY KEY (`trip_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- אינדקסים לטבלה `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- אינדקסים לטבלה `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`user_id`,`order_id`),
  ADD KEY `order_id` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `triptypes`
--
ALTER TABLE `triptypes`
  MODIFY `trip_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- הגבלות לטבלאות שהוצאו
--

--
-- הגבלות לטבלה `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- הגבלות לטבלה `feedbacks_users`
--
ALTER TABLE `feedbacks_users`
  ADD CONSTRAINT `feedbacks_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `feedbacks_users_ibfk_2` FOREIGN KEY (`feedback_id`) REFERENCES `feedbacks` (`feedback_id`);

--
-- הגבלות לטבלה `photographers_photos`
--
ALTER TABLE `photographers_photos`
  ADD CONSTRAINT `photographers_photos_ibfk_1` FOREIGN KEY (`photographer_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `photographers_photos_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `photos` (`image_id`);

--
-- הגבלות לטבלה `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`photographer_id`) REFERENCES `users` (`user_id`);

--
-- הגבלות לטבלה `tripgallery`
--
ALTER TABLE `tripgallery`
  ADD CONSTRAINT `tripgallery_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`);

--
-- הגבלות לטבלה `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `users` (`user_id`);

--
-- הגבלות לטבלה `trip_managers`
--
ALTER TABLE `trip_managers`
  ADD CONSTRAINT `trip_managers_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`),
  ADD CONSTRAINT `trip_managers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- הגבלות לטבלה `user_orders`
--
ALTER TABLE `user_orders`
  ADD CONSTRAINT `user_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_orders_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
