-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 01:50 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `patient`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `Admin_id` int(30) NOT NULL,
  `Admin_name` varchar(30) NOT NULL,
  `Admin_username` varchar(30) NOT NULL,
  `Admin_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`Admin_id`, `Admin_name`, `Admin_username`, `Admin_password`) VALUES
(1, 'Amasha Daphnie', 'Amasha', 'Amasha123'),
(2, 'Maleesha Gunathilake', 'Maleesha', 'Mal123'),
(3, 'Anolie Kumarasinghe', 'Anolie', 'Oshi123'),
(4, 'Minoli Isurika', 'Minoli', 'Minoli123'),
(5, 'Nethmini Umayangana', 'Sanju', 'Sanju123');

-- --------------------------------------------------------

--
-- Table structure for table `patientdetails`
--

CREATE TABLE `patientdetails` (
  `patientId` int(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `NIC` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patientdetails`
--

INSERT INTO `patientdetails` (`patientId`, `name`, `gender`, `phone`, `NIC`, `email`, `username`, `password`) VALUES
(53, 'oshini', 'Female', '9877712090', '976110358v', 'oshianolie@gmail.com', 'oshi', 'oshi123'),
(55, 'kasun', 'Male', '9786123456', '876543456v', 'kassa@gmail.com', 'kasun', 'kk123'),
(71, 'Maleesha', 'Male', '0775677840', '976110456v', 'malmalee@gmail.com', 'maleesha', 'mal001'),
(72, 'nethsara', 'Female', '0712345678', '0778123456', 'nethsaraa@gmail.com', 'nethsara123', '12345'),
(73, 'minoli', 'Female', '0778678567', '986110435', 'minolii@gmail.com', 'minolii', '08123');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `userId` int(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`userId`, `email`, `password`) VALUES
(1, 'mal123@gn.com', 'q1'),
(2, 'ama@gmail.com', '234'),
(5, 'ami@gmail.com', '009'),
(6, 'ami@gmail.com', '009'),
(7, 'ami@gmail', '009'),
(8, 'ml@123', '123'),
(9, 'ml@123', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`Admin_id`);

--
-- Indexes for table `patientdetails`
--
ALTER TABLE `patientdetails`
  ADD PRIMARY KEY (`patientId`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `Admin_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patientdetails`
--
ALTER TABLE `patientdetails`
  MODIFY `patientId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `userId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
