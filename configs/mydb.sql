-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2024 at 05:46 PM
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
-- Table structure for table `build`
--

CREATE TABLE `build` (
  `CompID` int(11) NOT NULL,
  `ProdID` int(11) NOT NULL,
  `QtyComp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `component`
--

CREATE TABLE `component` (
  `CompID` int(11) NOT NULL,
  `CompName` varchar(50) DEFAULT NULL,
  `compqty` int(11) NOT NULL,
  `CompDesp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `component`
--

INSERT INTO `component` (`CompID`, `CompName`, `compqty`, `CompDesp`) VALUES
(0, '45435', 443, 'fgdgdfg');

-- --------------------------------------------------------

--
-- Table structure for table `compsupp`
--

CREATE TABLE `compsupp` (
  `CompID` int(11) NOT NULL,
  `SuppID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProdID` int(11) NOT NULL,
  `ProdName` varchar(50) DEFAULT NULL,
  `QtyonHand` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProdID`, `ProdName`, `QtyonHand`) VALUES
(0, 'Soy Sauce', 12);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SuppID` int(11) NOT NULL,
  `SuppName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SuppID`, `SuppName`) VALUES
(0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `build`
--
ALTER TABLE `build`
  ADD PRIMARY KEY (`CompID`,`ProdID`),
  ADD KEY `ProdID` (`ProdID`);

--
-- Indexes for table `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`CompID`);

--
-- Indexes for table `compsupp`
--
ALTER TABLE `compsupp`
  ADD PRIMARY KEY (`CompID`,`SuppID`),
  ADD KEY `SuppID` (`SuppID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProdID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SuppID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `build`
--
ALTER TABLE `build`
  ADD CONSTRAINT `build_ibfk_1` FOREIGN KEY (`CompID`) REFERENCES `component` (`CompID`),
  ADD CONSTRAINT `build_ibfk_2` FOREIGN KEY (`ProdID`) REFERENCES `product` (`ProdID`);

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
