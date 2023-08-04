-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 04, 2023 at 06:13 AM
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
-- Table structure for table `certificate`
--

CREATE TABLE `certificate` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `certificate_status` int NOT NULL DEFAULT '1',
  `issue_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int NOT NULL,
  `uname` varchar(255) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `sub_id` bigint NOT NULL,
  `dt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `uname`, `msg`, `sub_id`, `dt`) VALUES
(16, 'Lindamulage Jude Randika De Silva Wijeyeratne', 'Hi', 50, '23-07-11 02:34pm'),
(17, 'Lindamulage Jude Randika De Silva Wijeyeratne', 'Test\r\n', 50, '23-07-12 01:40pm'),
(18, 'Lindamulage Jude Randika De Silva Wijeyeratne', 'Test 123', 50, '23-07-13 09:53am'),
(19, 'sam fernando', 'hi\r\n', 51, '23-07-13 02:23pm');

-- --------------------------------------------------------

--
-- Table structure for table `course_work_marks`
--

CREATE TABLE `course_work_marks` (
  `mid` int NOT NULL,
  `exam_id` int NOT NULL,
  `user_id` int NOT NULL,
  `marks` tinyint(1) NOT NULL,
  `add_date` datetime NOT NULL,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course_work_submissions`
--

CREATE TABLE `course_work_submissions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `exam_id` int NOT NULL,
  `filename` text NOT NULL,
  `time` datetime NOT NULL,
  `marks` int NOT NULL,
  `remark` text NOT NULL,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_work_submissions`
--

INSERT INTO `course_work_submissions` (`id`, `user_id`, `exam_id`, `filename`, `time`, `marks`, `remark`, `status`) VALUES
(5, 1746, 9, '[\"16892222751746sample.jpg\"]', '2023-07-13 09:54:35', 0, '', 0),
(4, 1750, 7, '[\"16890732181750charlesdeluvio-Lks7vei-eAg-unsplash_(1).jpg\"]', '2023-07-11 16:30:18', 100, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_submissions`
--

CREATE TABLE `exam_submissions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `exam_id` int NOT NULL,
  `filename` text NOT NULL,
  `time` datetime NOT NULL,
  `marks` int NOT NULL,
  `remark` text NOT NULL,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsadmins`
--

CREATE TABLE `lmsadmins` (
  `user_id` int NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `admintype` varchar(20) NOT NULL,
  `admin` varchar(20) NOT NULL,
  `students` varchar(20) NOT NULL,
  `teachers` varchar(20) NOT NULL,
  `class` varchar(20) NOT NULL,
  `subject` varchar(20) NOT NULL,
  `lesson` varchar(20) NOT NULL,
  `payments` varchar(20) NOT NULL,
  `class_schedule` varchar(20) NOT NULL,
  `mail` varchar(20) NOT NULL,
  `joining_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsadmins`
--

INSERT INTO `lmsadmins` (`user_id`, `user_name`, `user_email`, `user_pass`, `admintype`, `admin`, `students`, `teachers`, `class`, `subject`, `lesson`, `payments`, `class_schedule`, `mail`, `joining_date`, `status`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$PO1NRNtexDZlefvtOw/ELe6T/uwDBkpt7JUnMoaS9O1QkDkDJILBa', 'Super Admin', 'True', 'True', 'True', 'True', 'True', 'True', 'True', 'True', 'True', '2022-02-09 03:43:58', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lmsclass`
--

CREATE TABLE `lmsclass` (
  `cid` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsclass`
--

INSERT INTO `lmsclass` (`cid`, `name`, `add_date`, `status`) VALUES
(52, '1999', '2023-07-10 12:21:58', 'Publish'),
(51, '2013', '2023-07-10 12:21:53', 'Publish'),
(50, '2020', '2023-07-10 12:21:49', 'Publish');

-- --------------------------------------------------------

--
-- Table structure for table `lmsclasstute`
--

CREATE TABLE `lmsclasstute` (
  `ctuid` int NOT NULL,
  `tid` int NOT NULL,
  `class` int NOT NULL,
  `subject` int NOT NULL,
  `month` varchar(50) NOT NULL,
  `ctype` varchar(50) NOT NULL,
  `title` text NOT NULL,
  `tdocument` varchar(500) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsclass_schlmsle`
--

CREATE TABLE `lmsclass_schlmsle` (
  `classid` int NOT NULL,
  `level` int NOT NULL,
  `subject` int NOT NULL,
  `tealmsr` varchar(50) NOT NULL,
  `lesson` varchar(1000) NOT NULL,
  `classdate` date NOT NULL,
  `class_start_time` time NOT NULL,
  `class_end_time` time NOT NULL,
  `classlink` text NOT NULL,
  `cpassword` varchar(100) NOT NULL,
  `classtype` varchar(20) NOT NULL,
  `image` varchar(500) NOT NULL,
  `add_date` varchar(20) NOT NULL,
  `classstatus` varchar(20) NOT NULL,
  `add_date2` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsclass_schlmsle`
--

INSERT INTO `lmsclass_schlmsle` (`classid`, `level`, `subject`, `tealmsr`, `lesson`, `classdate`, `class_start_time`, `class_end_time`, `classlink`, `cpassword`, `classtype`, `image`, `add_date`, `classstatus`, `add_date2`) VALUES
(6, 50, 5, '99', 'NEW ABCD', '2023-07-12', '10:09:00', '10:15:00', 'asasascsacfdsvfdvfdbv.com', '12345678', 'Online Class', '', '2023-07-11 10:12:29', '1', '2023-07-11 04:42:29'),
(5, 50, 5, '100', 'qqqq', '2023-07-11', '10:08:00', '10:43:00', 'https://meet.google.com/pnu-fetv-rfx', '123456', 'Online Class', '', '2023-07-11 10:02:25', '1', '2023-07-11 04:32:25'),
(4, 50, 5, '99', 'HHHT', '2023-07-11', '10:05:00', '10:40:00', 'https://meet.google.com/pnu-fetv-rfx', '123456', 'Online Class', '', '2023-07-11 10:00:13', '1', '2023-07-11 04:30:13'),
(7, 49, 4, '99', 'qwwwqwqwq', '2023-07-26', '10:24:00', '10:26:00', 'asdsacxffdsfcsadonsjdnsa.com', '123456', 'Online Class', '', '2023-12-11 10:21:46', '1', '2023-07-11 04:51:46'),
(8, 50, 5, '100', 'ASAS SACSAF DSAV', '2024-01-01', '00:23:00', '00:28:00', 'QWQS', '12345678', 'Free Class', '1689360996sample.jpg', '2023-07-15 00:26:36', '0', '2023-07-14 19:12:06'),
(9, 50, 5, '100', 'qsasa', '2023-07-14', '12:21:00', '12:23:00', 'sasassdsacdascsa.com', '12345678', 'Paper Class', '', '2023-08-11 12:17:25', '1', '2023-07-11 06:47:25'),
(10, 51, 6, '100', 'QQQQ', '2023-07-13', '13:02:00', '15:58:00', 'ASASASA.LK', '12345678', 'Paper Class', '', '2023-08-11 12:58:31', '1', '2023-07-11 07:28:31'),
(11, 49, 7, '100', 'test lesson', '2023-07-12', '23:03:00', '03:03:00', 'https://docs.google.com/spreadsheets/d/1G_HJKQ72FImKIQZGDidF5XykrDcL9iriBzgRHrUU8EA/edit#gid=437408303', '11223344', 'Online Class', '', '-11 13:07:00', '1', '2023-07-11 07:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `lmscomments`
--

CREATE TABLE `lmscomments` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `tealmsr` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `rate` int NOT NULL,
  `review` text NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmscomments`
--

INSERT INTO `lmscomments` (`id`, `uid`, `tealmsr`, `title`, `rate`, `review`, `add_date`, `status`) VALUES
(25, 1748, 98, 'About Class1 Class', 5, 'Awesome.....', '2023-07-11 03:59:18', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lmscoupon`
--

CREATE TABLE `lmscoupon` (
  `id` int NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  `percentage` int NOT NULL,
  `valid_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmscoupon`
--

INSERT INTO `lmscoupon` (`id`, `coupon_code`, `batch`, `percentage`, `valid_date`) VALUES
(2, 'H2L8ICAX', 51, 50, '2023-08-15');

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
  `description` varchar(255) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmscourse_work`
--

INSERT INTO `lmscourse_work` (`exid`, `tid`, `class`, `subject`, `examname`, `edate`, `exam_end_date`, `starttime`, `endtime`, `edocument`, `description`, `add_date`, `status`) VALUES
(5, 100, '50', 5, 'MIND OF DEAMON', '2023-07-21 11:24:00', '2023-07-19 00:27:00', NULL, NULL, '630806.pdf', 'THIS IS A NEW WORLD', '2023-07-11 04:55:00', 1),
(6, 100, '50', 5, 'name course work', '2023-07-19 12:24:00', '2023-07-11 12:26:00', NULL, NULL, '635835.docx', 'this would be ', '2023-07-11 06:50:19', 1),
(7, 100, '51', 6, 'ASASASAS', '2023-07-11 13:03:00', '2023-07-11 14:00:00', NULL, NULL, '585710.pdf', 'HI \r\n', '2023-07-11 07:30:03', 1),
(8, 100, '51', 6, 'Course work new 2', '2023-07-13 08:28:00', '2023-07-13 10:00:00', NULL, NULL, '441508.jpg', 'ddsfsdf', '2023-07-12 10:21:14', 1),
(9, 100, '50', 5, 'Course work new 2.1', '2023-07-13 08:28:00', '2023-07-13 10:00:00', NULL, NULL, '133739.jpg', 'ddsfsdf', '2023-07-12 10:22:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmsdb`
--

CREATE TABLE `lmsdb` (
  `id` int NOT NULL,
  `dbname` varchar(400) NOT NULL,
  `username` varchar(400) NOT NULL,
  `password` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsdb`
--

INSERT INTO `lmsdb` (`id`, `dbname`, `username`, `password`) VALUES
(1, 'yogeedev_nimesh_lms', 'yogeedev_nimesh_lms', 'r^3JU}teRuA]');

-- --------------------------------------------------------

--
-- Table structure for table `lmsebook`
--

CREATE TABLE `lmsebook` (
  `ctuid` int NOT NULL,
  `tid` int NOT NULL,
  `class` int NOT NULL,
  `subject` int NOT NULL,
  `month` varchar(50) NOT NULL,
  `ctype` varchar(50) NOT NULL,
  `title` text NOT NULL,
  `tdocument` varchar(500) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsexpense`
--

CREATE TABLE `lmsexpense` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` bigint NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `lmsexpense`
--

INSERT INTO `lmsexpense` (`id`, `name`, `cost`, `date`) VALUES
(5, 'teacher 1', 1000, '2023-07-11'),
(6, 'teacher 2', 2000, '2023-07-12'),
(7, 'teacher 3', 2500, '2023-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `lmsgallery`
--

CREATE TABLE `lmsgallery` (
  `id` int NOT NULL,
  `image` varchar(500) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsgetway`
--

CREATE TABLE `lmsgetway` (
  `id` int NOT NULL,
  `app_id` varchar(4000) NOT NULL,
  `hash_salt` varchar(4000) NOT NULL,
  `a_token` varchar(4000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmslesson`
--

CREATE TABLE `lmslesson` (
  `lid` int NOT NULL,
  `tid` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `class` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `title` varchar(500) NOT NULL,
  `available_days` varchar(100) NOT NULL,
  `no_of_views_per_day` int NOT NULL,
  `cover` varchar(500) NOT NULL,
  `video` varchar(1000) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsmail`
--

CREATE TABLE `lmsmail` (
  `mid` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` varchar(500) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsonlineexams`
--

CREATE TABLE `lmsonlineexams` (
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
-- Dumping data for table `lmsonlineexams`
--

INSERT INTO `lmsonlineexams` (`exid`, `tid`, `class`, `subject`, `examname`, `edate`, `exam_end_date`, `starttime`, `endtime`, `edocument`, `quizcount`, `add_date`, `status`) VALUES
(7, 100, '50', 5, 'asasasasasa', '2023-08-03 12:15:00', '2023-08-05 12:15:00', NULL, NULL, '998199.jpg', 9, '2023-07-11 06:45:46', 1),
(6, 99, '51', 6, 'mid evil', '2023-07-24 10:59:00', '2023-07-20 10:19:00', NULL, NULL, '546384.docx', 9, '2023-07-11 04:49:27', 1),
(8, 100, '50', 5, 'Exam ', '2023-07-12 13:25:00', '2023-07-12 13:21:00', NULL, NULL, '112098.pdf', 3, '2023-07-11 07:51:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmspayment`
--

CREATE TABLE `lmspayment` (
  `pid` int NOT NULL,
  `fileName` varchar(50) DEFAULT NULL,
  `userID` int NOT NULL,
  `feeID` int NOT NULL,
  `pay_sub_id` int NOT NULL,
  `amount` float NOT NULL,
  `accountnumber` varchar(50) NOT NULL DEFAULT '0',
  `bank` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL DEFAULT 'Online Class',
  `paymentMethod` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `session_id` varchar(20) NOT NULL DEFAULT '0',
  `status` int NOT NULL,
  `order_status` int NOT NULL DEFAULT '0',
  `pay_type` varchar(255) NOT NULL,
  `coupen` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsregister`
--

CREATE TABLE `lmsregister` (
  `reid` int NOT NULL,
  `stnumber` varchar(200) NOT NULL,
  `email` varchar(400) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `dob` varchar(400) NOT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `school` varchar(400) DEFAULT NULL,
  `district` varchar(200) DEFAULT NULL,
  `town` varchar(400) DEFAULT NULL,
  `pcontactnumber` varchar(20) DEFAULT NULL,
  `pemail` varchar(200) DEFAULT NULL,
  `pname` varchar(4000) DEFAULT NULL,
  `contactnumber` varchar(20) NOT NULL,
  `address` text,
  `level` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `ip_address` varchar(20) DEFAULT NULL,
  `relogin` int DEFAULT NULL,
  `reloging_ip` int DEFAULT NULL,
  `payment` int DEFAULT NULL,
  `verifycode` varchar(5) NOT NULL,
  `coupon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsregister`
--

INSERT INTO `lmsregister` (`reid`, `stnumber`, `email`, `fullname`, `dob`, `gender`, `school`, `district`, `town`, `pcontactnumber`, `pemail`, `pname`, `contactnumber`, `address`, `level`, `password`, `image`, `add_date`, `status`, `ip_address`, `relogin`, `reloging_ip`, `payment`, `verifycode`, `coupon`) VALUES
(1746, 'NM-80612', 'randikadesilvawijeyeratne@gmail.com', 'Lindamulage Jude Randika De Silva Wijeyeratne', '1999-10-22', NULL, NULL, 'Ampara', NULL, NULL, NULL, NULL, '774429008', NULL, 51, '25d55ad283aa400af464c76d713c07ad', '1689149283sample.jpg', '2023-07-16 05:17:15', '0', '', 0, 0, 0, '', 'H2L8ICAX'),
(1752, 'NM-69720', 'anyone@gmail.com', 'text123', '2002-06-15', NULL, NULL, 'Gampaha', NULL, NULL, NULL, NULL, '703187365', NULL, 50, '25d55ad283aa400af464c76d713c07ad', '', '2023-07-13 11:33:05', '1', '', 0, 0, 0, '', NULL),
(1751, 'NM-86237', 'samfernando@gmail.com', 'sam fernando', '2000-11-11', NULL, NULL, 'Badulla', NULL, NULL, NULL, NULL, '771234567', NULL, 51, '25d55ad283aa400af464c76d713c07ad', '', '2023-07-13 08:26:20', '1', '', 0, 0, 0, '', NULL),
(1753, 'NM-46051', 'samfernando@gmail.com', 'dam fernando', '2023-07-27', NULL, NULL, 'Ampara', NULL, NULL, NULL, NULL, '771234568', NULL, 50, '25d55ad283aa400af464c76d713c07ad', '', '2023-07-13 13:18:05', '1', '', 0, 0, 0, '', NULL),
(1754, 'NM-71237', 'samfernando@gmail.com', 'sammaniiii', '2023-07-27', NULL, NULL, 'Ampara', NULL, NULL, NULL, NULL, '771234560', NULL, 51, '25d55ad283aa400af464c76d713c07ad', '', '2023-07-13 13:19:14', '1', '', 0, 0, 0, '', NULL),
(1755, 'NM-56253', 'lucianmacwolf@gmail.com', 'ashan', '2023-07-17', 'male', NULL, 'Badulla', NULL, '787200877', NULL, NULL, '787200877', NULL, 51, '25f9e794323b453885f5181f1b624d0b', '', '2023-08-04 06:09:45', '1', '', 0, 0, 0, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lmsrequest_relogin`
--

CREATE TABLE `lmsrequest_relogin` (
  `relog_id` int NOT NULL,
  `relog_user` int NOT NULL,
  `relog_status` int NOT NULL,
  `req_ip_add` varchar(255) NOT NULL,
  `relog_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsreq_subject`
--

CREATE TABLE `lmsreq_subject` (
  `sub_req_id` int NOT NULL,
  `sub_req_reg_no` varchar(50) NOT NULL,
  `sub_req_sub_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsreq_subject`
--

INSERT INTO `lmsreq_subject` (`sub_req_id`, `sub_req_reg_no`, `sub_req_sub_id`) VALUES
(9569, '774429008', 6),
(9570, '771234567', 6),
(9571, '703187365', 5),
(9572, '771234568', 5),
(9573, '771234560', 6),
(9574, '787200877', 6);

-- --------------------------------------------------------

--
-- Table structure for table `lmssms`
--

CREATE TABLE `lmssms` (
  `id` int NOT NULL,
  `sa_token` varchar(4000) NOT NULL,
  `sender_id` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsstudent_subject`
--

CREATE TABLE `lmsstudent_subject` (
  `ssid` int NOT NULL,
  `student` int NOT NULL DEFAULT '0',
  `subject` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsstuden_video_watch`
--

CREATE TABLE `lmsstuden_video_watch` (
  `id` int NOT NULL,
  `reg_no` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `lid` int DEFAULT NULL,
  `allowed_view` int DEFAULT NULL,
  `watched_count` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lmssubject`
--

CREATE TABLE `lmssubject` (
  `sid` int NOT NULL,
  `class_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmssubject`
--

INSERT INTO `lmssubject` (`sid`, `class_id`, `name`, `price`, `add_date`, `status`, `start`, `end`) VALUES
(6, 51, 'New 2023', 8900, '2023-07-10 13:53:06', 'Publish', '2023-07-12', '2023-07-13'),
(8, 51, 'new try one', 4000, '2023-07-13 13:21:52', 'Publish', '2023-07-27', '2023-08-04');

-- --------------------------------------------------------

--
-- Table structure for table `lmssubject_tealmsr`
--

CREATE TABLE `lmssubject_tealmsr` (
  `stid` int NOT NULL,
  `subject` int NOT NULL DEFAULT '0',
  `tealmsr` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmstealmsr`
--

CREATE TABLE `lmstealmsr` (
  `tid` int NOT NULL,
  `systemid` int NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contactnumber` varchar(50) NOT NULL,
  `subdetails` varchar(100) NOT NULL,
  `qualification` text NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(500) NOT NULL,
  `Percentage` float NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmstealmsr`
--

INSERT INTO `lmstealmsr` (`tid`, `systemid`, `fullname`, `address`, `contactnumber`, `subdetails`, `qualification`, `username`, `password`, `image`, `Percentage`, `add_date`, `status`) VALUES
(100, 1688996869, 'teacher 2', '1111/s', '771234566', 'teacher 2 details ', 'Teacher 2 qualifications ', 'teacher2@teacher.com', '25d55ad283aa400af464c76d713c07ad', '', 80, '2023-07-11 07:57:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmstealmsr_multiple`
--

CREATE TABLE `lmstealmsr_multiple` (
  `tealmsr_id` int NOT NULL,
  `tealmsr_system_id` int NOT NULL,
  `tealmsr_type` int NOT NULL,
  `tealmsr_contain_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmstealmsr_multiple`
--

INSERT INTO `lmstealmsr_multiple` (`tealmsr_id`, `tealmsr_system_id`, `tealmsr_type`, `tealmsr_contain_id`) VALUES
(6021, 1688996773, 2, 52),
(6022, 1688996773, 3, 4),
(6023, 1688996869, 2, 49),
(6024, 1688996869, 3, 4),
(6025, 1688991498, 2, 52),
(6026, 1688991498, 2, 51),
(6027, 1688991498, 3, 4),
(6028, 1689067312, 2, 52),
(6029, 1689067312, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `lmsurl`
--

CREATE TABLE `lmsurl` (
  `id` int NOT NULL,
  `url` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsurl`
--

INSERT INTO `lmsurl` (`id`, `url`) VALUES
(1, 'https://ongoing.website/websites/nimesh-lms-new/');

-- --------------------------------------------------------

--
-- Table structure for table `lmsusers`
--

CREATE TABLE `lmsusers` (
  `user_id` int NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `admintype` varchar(20) NOT NULL,
  `admin` varchar(20) NOT NULL,
  `students` varchar(20) NOT NULL,
  `teachers` varchar(20) NOT NULL,
  `class` varchar(20) NOT NULL,
  `subject` varchar(20) NOT NULL,
  `lesson` varchar(20) NOT NULL,
  `payments` varchar(20) NOT NULL,
  `class_schedule` varchar(20) NOT NULL,
  `mail` varchar(20) NOT NULL,
  `joining_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsusers`
--

INSERT INTO `lmsusers` (`user_id`, `user_name`, `user_email`, `user_pass`, `admintype`, `admin`, `students`, `teachers`, `class`, `subject`, `lesson`, `payments`, `class_schedule`, `mail`, `joining_date`, `status`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$PO1NRNtexDZlefvtOw/ELe6T/uwDBkpt7JUnMoaS9O1QkDkDJILBa', 'Super Admin', 'True', 'True', 'True', 'True', 'True', 'True', 'True', 'True', 'True', '2022-02-09 03:43:58', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lmsverbal_exam`
--

CREATE TABLE `lmsverbal_exam` (
  `classid` int NOT NULL,
  `level` int NOT NULL,
  `subject` int NOT NULL,
  `tealmsr` varchar(50) NOT NULL,
  `lesson` varchar(1000) NOT NULL,
  `classdate` date NOT NULL,
  `class_start_time` time NOT NULL,
  `class_end_time` time NOT NULL,
  `classlink` text NOT NULL,
  `cpassword` varchar(100) NOT NULL,
  `classtype` varchar(20) NOT NULL,
  `image` varchar(500) NOT NULL,
  `classstatus` varchar(20) NOT NULL,
  `add_date2` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsverbal_exam`
--

INSERT INTO `lmsverbal_exam` (`classid`, `level`, `subject`, `tealmsr`, `lesson`, `classdate`, `class_start_time`, `class_end_time`, `classlink`, `cpassword`, `classtype`, `image`, `classstatus`, `add_date2`) VALUES
(5, 51, 6, 'teacher 2', 'asasasasasas', '2023-07-20', '20:32:00', '21:32:00', 'asasasasas.com', '12345678', 'Online Class', '', '1', '2023-07-12 10:03:02'),
(6, 50, 5, '100', 'Test Lesson', '2023-07-14', '11:11:00', '22:22:00', 'https://mail.google.com/mail/u/0/#inbox', '11111111', 'Online Class', '1689232780sample.jpg', '1', '2023-07-13 07:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `lms_answer`
--

CREATE TABLE `lms_answer` (
  `lms_answer_id` int NOT NULL,
  `lms_answer_user` int NOT NULL,
  `lms_answer_paper` int NOT NULL,
  `lms_answer_q` int NOT NULL,
  `lms_answer_a` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lms_exam_details`
--

CREATE TABLE `lms_exam_details` (
  `lms_exam_id` int NOT NULL,
  `lms_exam_add_user` int NOT NULL,
  `lms_exam_system_id` int NOT NULL,
  `lms_exam_name` varchar(255) NOT NULL,
  `lms_exam_subject` int NOT NULL,
  `lms_exam_question` int NOT NULL,
  `lms_exam_time_duration` int NOT NULL,
  `lms_exam_start_time` datetime NOT NULL,
  `lms_exam_end_time` datetime NOT NULL,
  `lms_exam_add_time` datetime NOT NULL,
  `lms_exam_pay_type` int NOT NULL COMMENT '1=pay, 0=free'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lms_exam_details`
--

INSERT INTO `lms_exam_details` (`lms_exam_id`, `lms_exam_add_user`, `lms_exam_system_id`, `lms_exam_name`, `lms_exam_subject`, `lms_exam_question`, `lms_exam_time_duration`, `lms_exam_start_time`, `lms_exam_end_time`, `lms_exam_add_time`, `lms_exam_pay_type`) VALUES
(13, 100, 1689050909, '2 exam  aa', 6, 2, 30, '2023-07-14 10:18:00', '2023-07-22 10:45:00', '2023-07-11 10:18:29', 1),
(12, 99, 1689050866, 'new exam for acs', 4, 5, 30, '2023-08-11 10:22:00', '2023-07-11 00:22:00', '2023-07-11 10:17:46', 0),
(14, 100, 1689061476, 'mcq new', 7, 2, 30, '2023-07-21 13:14:00', '2023-07-27 13:14:00', '2023-07-11 13:14:36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lms_exam_report`
--

CREATE TABLE `lms_exam_report` (
  `lms_report_id` int NOT NULL,
  `exam_report_user` int NOT NULL,
  `exam_report_paper` int NOT NULL,
  `exam_report_faced` int NOT NULL,
  `exam_report_corect` int NOT NULL,
  `exam_report_percent` int NOT NULL,
  `exam_report_complet_time` datetime NOT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lms_mcq_questions`
--

CREATE TABLE `lms_mcq_questions` (
  `id` int NOT NULL,
  `exam_id` int NOT NULL,
  `question` text NOT NULL,
  `ans_1` text NOT NULL,
  `ans_2` text NOT NULL,
  `ans_3` text NOT NULL,
  `ans_4` text NOT NULL,
  `ans` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lms_mcq_questions`
--

INSERT INTO `lms_mcq_questions` (`id`, `exam_id`, `question`, `ans_1`, `ans_2`, `ans_3`, `ans_4`, `ans`) VALUES
(13, 16, '<p>asxsaxsa</p>\r\n', 'asxsaxa', 'aaaa', 'ass', 'xcdxc', 2);

-- --------------------------------------------------------

--
-- Table structure for table `lms_teacher_payment_history`
--

CREATE TABLE `lms_teacher_payment_history` (
  `lms_teacher_payment_history_id` int NOT NULL,
  `lms_teacher_payment_history_tid` int NOT NULL,
  `lms_teacher_payment_company_amount` float NOT NULL,
  `lms_teacher_payment_history_amount` float NOT NULL,
  `lms_teacher_payment_history_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paper_image`
--

CREATE TABLE `paper_image` (
  `pi_id` int NOT NULL,
  `pi_exam_id` int NOT NULL,
  `pi_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paper_marks`
--

CREATE TABLE `paper_marks` (
  `mid` int NOT NULL,
  `exam_id` int NOT NULL,
  `user_id` int NOT NULL,
  `quizno` tinyint NOT NULL,
  `answerstatus` tinyint(1) NOT NULL,
  `add_date` datetime NOT NULL,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `reg_prefix` varchar(3) NOT NULL,
  `application_name` varchar(400) NOT NULL,
  `main_logo` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `reg_prefix`, `application_name`, `main_logo`) VALUES
(1, 'NM', 'Nimesh LMS ', 'logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `user_attandance`
--

CREATE TABLE `user_attandance` (
  `id` int NOT NULL,
  `userid` int NOT NULL,
  `subjectid` int NOT NULL,
  `lid` int NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `verbal_exam`
--

CREATE TABLE `verbal_exam` (
  `id` int NOT NULL,
  `userId` bigint NOT NULL,
  `marks` bigint NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certificate`
--
ALTER TABLE `certificate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_work_marks`
--
ALTER TABLE `course_work_marks`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `course_work_submissions`
--
ALTER TABLE `course_work_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_submissions`
--
ALTER TABLE `exam_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lmsclass`
--
ALTER TABLE `lmsclass`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `lmsclasstute`
--
ALTER TABLE `lmsclasstute`
  ADD PRIMARY KEY (`ctuid`);

--
-- Indexes for table `lmsclass_schlmsle`
--
ALTER TABLE `lmsclass_schlmsle`
  ADD PRIMARY KEY (`classid`);

--
-- Indexes for table `lmscomments`
--
ALTER TABLE `lmscomments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lmscoupon`
--
ALTER TABLE `lmscoupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lmscourse_work`
--
ALTER TABLE `lmscourse_work`
  ADD PRIMARY KEY (`exid`);

--
-- Indexes for table `lmsdb`
--
ALTER TABLE `lmsdb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lmsebook`
--
ALTER TABLE `lmsebook`
  ADD PRIMARY KEY (`ctuid`);

--
-- Indexes for table `lmsexpense`
--
ALTER TABLE `lmsexpense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lmsgallery`
--
ALTER TABLE `lmsgallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lmsgetway`
--
ALTER TABLE `lmsgetway`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lmslesson`
--
ALTER TABLE `lmslesson`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `lmsmail`
--
ALTER TABLE `lmsmail`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `lmsonlineexams`
--
ALTER TABLE `lmsonlineexams`
  ADD PRIMARY KEY (`exid`);

--
-- Indexes for table `lmspayment`
--
ALTER TABLE `lmspayment`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `lmsregister`
--
ALTER TABLE `lmsregister`
  ADD PRIMARY KEY (`reid`),
  ADD UNIQUE KEY `contactnumber` (`contactnumber`),
  ADD UNIQUE KEY `fullname` (`fullname`);

--
-- Indexes for table `lmsrequest_relogin`
--
ALTER TABLE `lmsrequest_relogin`
  ADD PRIMARY KEY (`relog_id`);

--
-- Indexes for table `lmsreq_subject`
--
ALTER TABLE `lmsreq_subject`
  ADD PRIMARY KEY (`sub_req_id`);

--
-- Indexes for table `lmssms`
--
ALTER TABLE `lmssms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lmsstudent_subject`
--
ALTER TABLE `lmsstudent_subject`
  ADD PRIMARY KEY (`ssid`);

--
-- Indexes for table `lmsstuden_video_watch`
--
ALTER TABLE `lmsstuden_video_watch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lmssubject`
--
ALTER TABLE `lmssubject`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `lmssubject_tealmsr`
--
ALTER TABLE `lmssubject_tealmsr`
  ADD PRIMARY KEY (`stid`);

--
-- Indexes for table `lmstealmsr`
--
ALTER TABLE `lmstealmsr`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `lmstealmsr_multiple`
--
ALTER TABLE `lmstealmsr_multiple`
  ADD PRIMARY KEY (`tealmsr_id`);

--
-- Indexes for table `lmsurl`
--
ALTER TABLE `lmsurl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lmsusers`
--
ALTER TABLE `lmsusers`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `lmsverbal_exam`
--
ALTER TABLE `lmsverbal_exam`
  ADD PRIMARY KEY (`classid`);

--
-- Indexes for table `lms_answer`
--
ALTER TABLE `lms_answer`
  ADD PRIMARY KEY (`lms_answer_id`);

--
-- Indexes for table `lms_exam_details`
--
ALTER TABLE `lms_exam_details`
  ADD PRIMARY KEY (`lms_exam_id`);

--
-- Indexes for table `lms_exam_report`
--
ALTER TABLE `lms_exam_report`
  ADD PRIMARY KEY (`lms_report_id`);

--
-- Indexes for table `lms_mcq_questions`
--
ALTER TABLE `lms_mcq_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lms_teacher_payment_history`
--
ALTER TABLE `lms_teacher_payment_history`
  ADD PRIMARY KEY (`lms_teacher_payment_history_id`);

--
-- Indexes for table `paper_image`
--
ALTER TABLE `paper_image`
  ADD PRIMARY KEY (`pi_id`);

--
-- Indexes for table `paper_marks`
--
ALTER TABLE `paper_marks`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_attandance`
--
ALTER TABLE `user_attandance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verbal_exam`
--
ALTER TABLE `verbal_exam`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `certificate`
--
ALTER TABLE `certificate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `course_work_marks`
--
ALTER TABLE `course_work_marks`
  MODIFY `mid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `course_work_submissions`
--
ALTER TABLE `course_work_submissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exam_submissions`
--
ALTER TABLE `exam_submissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmsclass`
--
ALTER TABLE `lmsclass`
  MODIFY `cid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `lmsclasstute`
--
ALTER TABLE `lmsclasstute`
  MODIFY `ctuid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `lmsclass_schlmsle`
--
ALTER TABLE `lmsclass_schlmsle`
  MODIFY `classid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `lmscomments`
--
ALTER TABLE `lmscomments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `lmscourse_work`
--
ALTER TABLE `lmscourse_work`
  MODIFY `exid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lmsdb`
--
ALTER TABLE `lmsdb`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmsebook`
--
ALTER TABLE `lmsebook`
  MODIFY `ctuid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `lmsexpense`
--
ALTER TABLE `lmsexpense`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lmsgallery`
--
ALTER TABLE `lmsgallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lmsgetway`
--
ALTER TABLE `lmsgetway`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmslesson`
--
ALTER TABLE `lmslesson`
  MODIFY `lid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=722;

--
-- AUTO_INCREMENT for table `lmsmail`
--
ALTER TABLE `lmsmail`
  MODIFY `mid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lmsonlineexams`
--
ALTER TABLE `lmsonlineexams`
  MODIFY `exid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lmspayment`
--
ALTER TABLE `lmspayment`
  MODIFY `pid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lmsregister`
--
ALTER TABLE `lmsregister`
  MODIFY `reid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1756;

--
-- AUTO_INCREMENT for table `lmsrequest_relogin`
--
ALTER TABLE `lmsrequest_relogin`
  MODIFY `relog_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lmsreq_subject`
--
ALTER TABLE `lmsreq_subject`
  MODIFY `sub_req_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9575;

--
-- AUTO_INCREMENT for table `lmssms`
--
ALTER TABLE `lmssms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmsstudent_subject`
--
ALTER TABLE `lmsstudent_subject`
  MODIFY `ssid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lmsstuden_video_watch`
--
ALTER TABLE `lmsstuden_video_watch`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lmssubject`
--
ALTER TABLE `lmssubject`
  MODIFY `sid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lmssubject_tealmsr`
--
ALTER TABLE `lmssubject_tealmsr`
  MODIFY `stid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lmstealmsr`
--
ALTER TABLE `lmstealmsr`
  MODIFY `tid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `lmstealmsr_multiple`
--
ALTER TABLE `lmstealmsr_multiple`
  MODIFY `tealmsr_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6030;

--
-- AUTO_INCREMENT for table `lmsurl`
--
ALTER TABLE `lmsurl`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmsusers`
--
ALTER TABLE `lmsusers`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmsverbal_exam`
--
ALTER TABLE `lmsverbal_exam`
  MODIFY `classid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lms_answer`
--
ALTER TABLE `lms_answer`
  MODIFY `lms_answer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `lms_exam_details`
--
ALTER TABLE `lms_exam_details`
  MODIFY `lms_exam_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `lms_exam_report`
--
ALTER TABLE `lms_exam_report`
  MODIFY `lms_report_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lms_mcq_questions`
--
ALTER TABLE `lms_mcq_questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `lms_teacher_payment_history`
--
ALTER TABLE `lms_teacher_payment_history`
  MODIFY `lms_teacher_payment_history_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `paper_image`
--
ALTER TABLE `paper_image`
  MODIFY `pi_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paper_marks`
--
ALTER TABLE `paper_marks`
  MODIFY `mid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_attandance`
--
ALTER TABLE `user_attandance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `verbal_exam`
--
ALTER TABLE `verbal_exam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
