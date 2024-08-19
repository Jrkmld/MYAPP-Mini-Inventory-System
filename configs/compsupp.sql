-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2024 at 05:48 PM
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
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `compsupp`
--

CREATE TABLE `compsupp` (
  `CompID` int(11) NOT NULL,
  `SuppID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compsupp`
--
ALTER TABLE `compsupp`
  ADD PRIMARY KEY (`CompID`,`SuppID`),
  ADD KEY `SuppID` (`SuppID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compsupp`
--
ALTER TABLE `compsupp`
  ADD CONSTRAINT `compsupp_ibfk_1` FOREIGN KEY (`CompID`) REFERENCES `component` (`CompID`),
  ADD CONSTRAINT `compsupp_ibfk_2` FOREIGN KEY (`SuppID`) REFERENCES `supplier` (`SuppID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
