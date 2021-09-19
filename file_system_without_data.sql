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

-- --------------------------------------------------------

--
-- Table structure for table `parent_nodes`
--

CREATE TABLE `parent_nodes` (
  `parent_node_id` int(11) NOT NULL,
  `parent_node` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  MODIFY `child_node_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parent_nodes`
--
ALTER TABLE `parent_nodes`
  MODIFY `parent_node_id` int(11) NOT NULL AUTO_INCREMENT;

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
