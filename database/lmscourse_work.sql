-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 09, 2023 at 03:55 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yogeedev_nimesh_lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `lmscourse_work`
--

CREATE TABLE `lmscourse_work` (
  `exid` int NOT NULL,
  `tid` int NOT NULL,
  `class` varchar(400) NOT NULL,
  `subject` int NOT NULL,
  `examname` varchar(200) NOT NULL,
  `edate` datetime NOT NULL,
  `exam_end_date` datetime NOT NULL,
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `edocument` varchar(500) NOT NULL,
  `quizcount` int NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmscourse_work`
--

INSERT INTO `lmscourse_work` (`exid`, `tid`, `class`, `subject`, `examname`, `edate`, `exam_end_date`, `starttime`, `endtime`, `edocument`, `quizcount`, `add_date`, `status`) VALUES
(4, 95, '35', 1, 'test', '2023-07-09 10:00:00', '2023-07-11 12:00:00', NULL, NULL, '592017.jpg', 14, '2023-07-09 03:48:04', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lmscourse_work`
--
ALTER TABLE `lmscourse_work`
  ADD PRIMARY KEY (`exid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lmscourse_work`
--
ALTER TABLE `lmscourse_work`
  MODIFY `exid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
