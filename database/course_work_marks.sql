-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 09, 2023 at 04:52 AM
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
-- Table structure for table `course_work_marks`
--

CREATE TABLE `course_work_marks` (
  `mid` int NOT NULL,
  `exam_id` int NOT NULL,
  `user_id` int NOT NULL,
  `quizno` tinyint NOT NULL,
  `answerstatus` tinyint(1) NOT NULL,
  `add_date` datetime NOT NULL,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_work_marks`
--

INSERT INTO `course_work_marks` (`mid`, `exam_id`, `user_id`, `quizno`, `answerstatus`, `add_date`, `status`) VALUES
(1, 1, 1732, 1, 1, '2023-07-09 10:01:06', 1),
(2, 1, 1732, 2, 1, '2023-07-09 10:01:06', 1),
(3, 1, 1732, 3, 1, '2023-07-09 10:01:06', 1),
(4, 1, 1732, 4, 1, '2023-07-09 10:01:06', 1),
(5, 1, 1732, 5, 1, '2023-07-09 10:01:06', 1),
(6, 1, 1732, 6, 1, '2023-07-09 10:01:06', 1),
(7, 1, 1732, 7, 1, '2023-07-09 10:01:06', 1),
(8, 1, 1732, 8, 1, '2023-07-09 10:01:06', 1),
(9, 1, 1732, 9, 1, '2023-07-09 10:01:06', 1),
(10, 1, 1732, 10, 1, '2023-07-09 10:01:06', 1),
(11, 1, 1732, 11, 1, '2023-07-09 10:01:06', 1),
(12, 1, 1732, 12, 1, '2023-07-09 10:01:06', 1),
(13, 1, 1732, 13, 1, '2023-07-09 10:01:06', 1),
(14, 1, 1732, 14, 1, '2023-07-09 10:01:06', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course_work_marks`
--
ALTER TABLE `course_work_marks`
  ADD PRIMARY KEY (`mid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course_work_marks`
--
ALTER TABLE `course_work_marks`
  MODIFY `mid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
