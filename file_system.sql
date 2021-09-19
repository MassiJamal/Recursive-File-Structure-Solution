-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2021 at 02:46 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `file_system`
--
CREATE DATABASE IF NOT EXISTS `file_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `file_system`;

-- --------------------------------------------------------

--
-- Table structure for table `child_nodes`
--

CREATE TABLE `child_nodes` (
  `child_node_id` int(11) NOT NULL,
  `child_node` varchar(1000) NOT NULL,
  `child_node_path` varchar(1000) NOT NULL,
  `parent_node_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `child_nodes`
--

INSERT INTO `child_nodes` (`child_node_id`, `child_node`, `child_node_path`, `parent_node_id`) VALUES
(1, 'Documents\r\n', 'C:\\Documents\r\n', 1),
(2, 'Images\r\n', 'C:\\Documents\\Images\r\n', 2),
(3, 'Image1.jpg\r\n', 'C:\\Documents\\Images\\Image1.jpg\r\n', 3),
(4, 'Image2.jpg\r\n', 'C:\\Documents\\Images\\Image2.jpg\r\n', 3),
(5, 'Image3.jpg\r\n', 'C:\\Documents\\Images\\Image3.jpg\r\n', 3),
(6, 'Works\r\n', 'C:\\Documents\\Works\r\n', 2),
(7, 'Letter.doc\r\n', 'C:\\Documents\\Works\\Letter.doc\r\n', 4),
(8, 'Accountant\r\n', 'C:\\Documents\\Works\\Accountant\r\n', 4),
(9, 'Accounting.xls\r\n', 'C:\\Documents\\Works\\Accountant\\Accounting.xls\r\n', 5),
(10, 'AccountReport.xls\r\n', 'C:\\Documents\\Works\\Accountant\\AccountReport.xls\r\n', 5),
(11, 'Program Files\r\n', 'C:\\Program Files\r\n', 1),
(12, 'Skype\r\n', 'C:\\Program Files\\Skype\r\n', 6),
(13, 'Skype.exe\r\n', 'C:\\Program Files\\Skype\\Skype.exe\r\n', 7),
(14, 'Readme.txt\r\n', 'C:\\Program Files\\Skype\\Readme.txt\r\n', 7),
(15, 'Mysql\r\n', 'C:\\Program Files\\Mysql\r\n', 6),
(16, 'Mysql.exe\r\n', 'C:\\Program Files\\Mysql\\Mysql.exe\r\n', 8),
(17, 'Mysql.com', 'C:\\Program Files\\Mysql\\Mysql.com', 8);

-- --------------------------------------------------------

--
-- Table structure for table `parent_nodes`
--

CREATE TABLE `parent_nodes` (
  `parent_node_id` int(11) NOT NULL,
  `parent_node` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parent_nodes`
--

INSERT INTO `parent_nodes` (`parent_node_id`, `parent_node`) VALUES
(1, 'C:'),
(2, 'Documents'),
(3, 'Images'),
(4, 'Works'),
(5, 'Accountant'),
(6, 'Program Files'),
(7, 'Skype'),
(8, 'Mysql');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `child_nodes`
--
ALTER TABLE `child_nodes`
  ADD PRIMARY KEY (`child_node_id`),
  ADD KEY `Test` (`parent_node_id`);

--
-- Indexes for table `parent_nodes`
--
ALTER TABLE `parent_nodes`
  ADD PRIMARY KEY (`parent_node_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `child_nodes`
--
ALTER TABLE `child_nodes`
  MODIFY `child_node_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `parent_nodes`
--
ALTER TABLE `parent_nodes`
  MODIFY `parent_node_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `child_nodes`
--
ALTER TABLE `child_nodes`
  ADD CONSTRAINT `Test` FOREIGN KEY (`parent_node_id`) REFERENCES `parent_nodes` (`parent_node_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
