-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 04, 2023 at 09:11 AM
-- Server version: 5.7.43
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ipdedu_nimesh_lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `certificate`
--

CREATE TABLE `certificate` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `certificate_status` int(11) NOT NULL DEFAULT '1',
  `issue_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `certificate`
--

INSERT INTO `certificate` (`id`, `userId`, `certificate_status`, `issue_date`) VALUES
(2, 1732, 1, '2023-07-07 14:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `sub_id` bigint(20) NOT NULL,
  `dt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `uname`, `msg`, `sub_id`, `dt`) VALUES
(14, 'mac wolf', 'hi', 35, '23-07-09 11:44am'),
(15, 'Test', 'hi', 35, '23-07-09 12:19pm');

-- --------------------------------------------------------

--
-- Table structure for table `course_work_marks`
--

CREATE TABLE `course_work_marks` (
  `mid` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `marks` tinyint(1) NOT NULL,
  `add_date` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course_work_submissions`
--

CREATE TABLE `course_work_submissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `filename` text NOT NULL,
  `time` datetime NOT NULL,
  `marks` int(11) NOT NULL,
  `remark` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_work_submissions`
--

INSERT INTO `course_work_submissions` (`id`, `user_id`, `exam_id`, `filename`, `time`, `marks`, `remark`, `status`) VALUES
(2, 1732, 4, '[\"168887889817321384350.jpg\"]', '2023-07-09 10:31:38', 100, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_submissions`
--

CREATE TABLE `exam_submissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `filename` text NOT NULL,
  `time` datetime NOT NULL,
  `marks` int(11) NOT NULL,
  `remark` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_submissions`
--

INSERT INTO `exam_submissions` (`id`, `user_id`, `exam_id`, `filename`, `time`, `marks`, `remark`, `status`) VALUES
(1, 1732, 4, '[\"168887704617321384350.jpg\"]', '2023-07-09 10:00:46', 100, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmsadmins`
--

CREATE TABLE `lmsadmins` (
  `user_id` int(11) NOT NULL,
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
  `cid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsclass`
--

INSERT INTO `lmsclass` (`cid`, `name`, `add_date`, `status`) VALUES
(44, '2021 O/L Revision', '2021-11-22 11:27:17', 'Publish'),
(43, 'Grade 11', '2021-11-15 17:23:11', 'Publish'),
(35, '2023', '2023-07-07 03:50:02', 'Publish'),
(42, 'Grade 10', '2021-11-15 17:22:43', 'Publish'),
(41, 'Grade 9', '2021-11-15 17:22:19', 'Publish'),
(40, 'Grade 8', '2021-11-15 17:22:08', 'Publish'),
(39, 'Grade 7', '2021-11-15 17:21:53', 'Publish'),
(38, 'Grade 6', '2021-11-15 17:21:40', 'Publish'),
(37, 'Grade 5', '2021-11-15 17:21:27', 'Publish'),
(36, 'Grade 4', '2021-11-15 17:21:09', 'Publish'),
(45, 'Grade 1', '2022-06-03 03:57:57', 'Publish'),
(34, 'Grade 2', '2021-11-15 17:20:37', 'Publish');

-- --------------------------------------------------------

--
-- Table structure for table `lmsclasstute`
--

CREATE TABLE `lmsclasstute` (
  `ctuid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
  `month` varchar(50) NOT NULL,
  `ctype` varchar(50) NOT NULL,
  `title` text NOT NULL,
  `tdocument` varchar(500) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsclasstute`
--

INSERT INTO `lmsclasstute` (`ctuid`, `tid`, `class`, `subject`, `month`, `ctype`, `title`, `tdocument`, `add_date`, `status`) VALUES
(105, 68, 43, 386, 'January', 'Online Class', 'SCIENCE TEXT BOOK PART - 2', '200987.pdf', '2022-01-20 10:57:17', 1),
(104, 68, 43, 386, 'January', 'Online Class', 'SCIENCE TEXT BOOK PART - 1', '837454.pdf', '2022-01-20 10:56:26', 1),
(103, 68, 41, 377, 'January', 'Online Class', 'SCIENCE TEXT BOOK PART - 2', '703134.pdf', '2022-01-20 10:55:46', 1),
(102, 68, 41, 377, 'January', 'Online Class', 'SCIENCE TEXT BOOK PART - 2', '290346.pdf', '2022-01-20 10:55:44', 1),
(101, 68, 42, 382, 'January', 'Online Class', 'SCIENCE TEXT BOOK PART - 2', '593849.pdf', '2022-01-20 10:54:56', 1),
(100, 68, 42, 382, 'January', 'Online Class', 'SCIENCE TEXT BOOK PART - 1', '473715.pdf', '2022-01-20 10:54:01', 1),
(99, 68, 41, 377, 'January', 'Online Class', 'SCIENCE TEXT BOOK PART - 1', '927269.pdf', '2022-01-20 10:52:44', 1),
(98, 68, 40, 373, 'January', 'Online Class', 'SCIENCE TEXT BOOK PART - 2', '513859.pdf', '2022-01-20 10:52:01', 1),
(97, 68, 40, 373, 'January', 'Online Class', 'SCIENCE TEXT BOOK PART - 1', '961351.pdf', '2022-01-20 10:51:10', 1),
(96, 68, 39, 369, 'January', 'Online Class', 'SCIENCE TEXT BOOK PART -  2', '759394.pdf', '2022-01-20 10:50:28', 1),
(95, 68, 39, 369, 'January', 'Online Class', 'SCIENCE TEXT BOOK PART - 1', '871125.pdf', '2022-01-20 10:49:47', 1),
(94, 68, 38, 365, 'January', 'Online Class', 'SCIENCE TEXT BOOK', '547089.pdf', '2022-01-20 10:48:56', 1),
(93, 50, 40, 394, 'January', 'Select Class Type', 'GRADE8 PUPILS BOOK', '247522.pdf', '2022-01-02 17:05:47', 1),
(92, 50, 41, 396, 'January', 'Free Class', 'GRADE9', '617770.pdf', '2022-01-02 17:01:20', 1),
(91, 50, 42, 398, 'January', 'Free Class', 'GRADE 10', '828035.pdf', '2022-01-02 16:59:05', 1),
(90, 50, 39, 392, 'January', 'Free Class', 'PUPILS BOOK', '495301.pdf', '2022-01-02 16:55:51', 1),
(89, 53, 41, 485, 'December', 'Online Class', 'Session 01', '993448.pdf', '2021-12-30 05:43:57', 1),
(88, 53, 42, 488, 'December', 'Online Class', '01 session', '261701.pdf', '2021-12-26 13:40:41', 1),
(87, 53, 40, 483, 'December', 'Online Class', 'Solar System session 02', '694134.pdf', '2021-12-19 03:40:31', 1),
(86, 53, 40, 483, 'December', 'Online Class', 'Solar System 1st session', '978869.pdf', '2021-12-19 03:38:13', 1),
(84, 59, 43, 695, 'December', 'Paper Class', '2019 OL Commerce Paper', '888064.pdf', '2021-12-18 06:52:30', 1),
(82, 53, 41, 485, 'December', 'Online Class', 'Mahadweepa', '201269.jpg', '2021-12-16 16:04:57', 1),
(83, 59, 44, 761, 'December', 'Free Class', '2019 OL Commerce Paper', '414396.pdf', '2021-12-18 07:16:39', 1),
(81, 56, 40, 517, 'December', 'Online Class', 'Number system - Binary to Decimal', '737490.pdf', '2021-12-15 05:43:08', 1),
(80, 56, 40, 529, 'December', 'Online Class', 'Number system - Binary to Decimal', '923723.pdf', '2021-12-15 05:42:31', 1),
(79, 56, 40, 517, 'December', 'Online Class', 'Number system Home Work', '248204.pdf', '2021-12-15 05:40:41', 1),
(77, 56, 40, 529, 'December', 'Online Class', 'Number system Home Work', '729357.pdf', '2021-12-15 05:37:43', 1),
(76, 76, 40, 585, 'December', 'Online Class', 'à·à·à¶±à·Šà¶­à·’à¶šà¶»à·Šà¶¸ à¶†à·à·Šâ€à¶»à·’à¶­ à¶¯à·˜à·à·Šâ€à¶º à¶šà¶½à· à¶…à¶‚à¶œ', '453577.pdf', '2021-12-14 08:03:54', 1),
(74, 73, 43, 430, 'December', 'Online Class', 'Chapter 02 - Establishment of British Power in Sri Lanka', '10666.pdf', '2021-12-12 17:53:42', 1),
(73, 73, 42, 429, 'December', 'Online Class', 'Renaissance', '875110.pdf', '2021-12-12 17:51:52', 1),
(71, 53, 42, 488, 'December', 'Online Class', 'à¶´à·˜à¶®à·’à·€à·’à¶ºà·š à·ƒà¶‚à¶ºà·”à¶­à·’à¶º à·„à·à¶¯à·’à¶±à·Šà·€à·“à¶¸.', '497673.pdf', '2021-12-11 19:13:44', 1),
(64, 76, 41, 587, 'December', 'Online Class', 'à·€à·™à·ƒà·Šà¶¸à·”à·„à·”à¶«à·” à¶šà¶½à·à·€à·š à·€à¶­ à¶œà·œà¶­', '952978.pdf', '2021-12-04 16:07:08', 1),
(63, 76, 40, 585, 'December', 'Online Class', 'à·à·à¶±à·Šà¶­à·’à¶šà¶»à·Šà¶¸ à¶†à·à·Šâ€à¶»à·’à¶­ à¶¯à·˜à·à·Šâ€à¶º à¶šà¶½à· à¶…à¶‚à¶œ', '271848.pdf', '2021-12-04 16:01:07', 1),
(66, 59, 43, 695, 'December', 'Paper Class', 'Paper 01-Accounting Equation & Double Entry System', '467106.pdf', '2021-12-10 01:06:49', 1),
(108, 68, 38, 367, 'January', 'Online Class', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à·™à·…à¶´à·œà¶­', '174865.pdf', '2022-01-20 11:11:47', 1),
(107, 68, 39, 371, 'January', 'Online Class', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à·™à·…à¶´à·œà¶­ - 1 à¶šà·œà¶§à·ƒ', '584457.pdf', '2022-01-20 11:09:11', 1),
(109, 68, 39, 371, 'January', 'Online Class', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à·™à·…à¶´à·œà¶­ - 2 à¶šà·œà¶§à·ƒ', '971247.pdf', '2022-01-20 11:13:17', 1),
(110, 68, 40, 375, 'January', 'Online Class', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à·™à·…à¶´à·œà¶­ - 1 à¶šà·œà¶§à·ƒ', '682172.pdf', '2022-01-20 11:13:53', 1),
(111, 68, 40, 375, 'January', 'Online Class', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à·™à·…à¶´à·œà¶­ - 2 à¶šà·œà¶§à·ƒ', '702590.pdf', '2022-01-20 11:14:20', 1),
(112, 68, 41, 379, 'January', 'Online Class', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à·™à·…à¶´à·œà¶­ - 1 à¶šà·œà¶§à·ƒ', '271875.pdf', '2022-01-20 11:15:15', 1),
(113, 68, 41, 379, 'January', 'Online Class', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à·™à·…à¶´à·œà¶­ - 2 à¶šà·œà¶§à·ƒ', '689421.pdf', '2022-01-20 11:15:47', 1),
(114, 68, 42, 383, 'January', 'Online Class', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à·™à·…à¶´à·œà¶­ - 1 à¶šà·œà¶§à·ƒ', '420664.pdf', '2022-01-20 11:16:22', 1),
(115, 68, 42, 383, 'January', 'Online Class', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à·™à·…à¶´à·œà¶­ - 2 à¶šà·œà¶§à·ƒ', '279206.pdf', '2022-01-20 11:17:12', 1),
(116, 68, 43, 387, 'January', 'Online Class', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à·™à·…à¶´à·œà¶­ - 1 à¶šà·œà¶§à·ƒ', '665040.pdf', '2022-01-20 11:17:57', 1),
(117, 68, 43, 387, 'January', 'Online Class', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à·™à·…à¶´à·œà¶­ - 2 à¶šà·œà¶§à·ƒ', '919536.pdf', '2022-01-20 11:20:55', 1),
(118, 68, 43, 387, 'January', 'Online Class', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à·™à·…à¶´à·œà¶­ - 2 à¶šà·œà¶§à·ƒ', '719181.pdf', '2022-01-20 11:20:57', 1),
(131, 95, 37, 792, 'June', 'Free Class', 'Test', '735747.pdf', '2022-06-09 08:00:27', 1),
(121, 56, 41, 519, 'January', 'Online Class', 'Grade 9 EM work book', '168673.pdf', '2022-01-20 17:00:47', 1),
(122, 56, 41, 531, 'January', 'Online Class', 'Grade 9 SM text book', '737557.pdf', '2022-01-20 17:02:15', 1),
(123, 56, 41, 531, 'January', 'Online Class', 'Grade 9SM Work Book', '166090.pdf', '2022-01-20 17:03:24', 1),
(124, 56, 39, 515, 'January', 'Online Class', 'Grade 7 EM text book', '670039.pdf', '2022-01-21 15:32:21', 1),
(125, 56, 39, 515, 'January', 'Online Class', 'Grade 7 EM Work book', '293819.pdf', '2022-01-21 15:34:03', 1),
(126, 58, 43, 691, 'January', 'Paper Class', 'à·€à·™à·…à¶¯à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à· Revision Tute (Part 3)', '282019.pdf', '2022-01-25 01:21:03', 1),
(127, 58, 44, 736, 'January', 'Online Class', 'à·€à·™à·…à¶¯à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à· Revision Tute (Part 3)', '657719.pdf', '2022-01-25 01:22:42', 1),
(128, 56, 39, 527, 'January', 'Online Class', 'Grade 7SM Text book ', '21246.pdf', '2022-01-26 12:02:10', 1),
(129, 56, 39, 527, 'January', 'Online Class', 'Grade 7SM Work book ', '80891.pdf', '2022-01-26 12:03:33', 1),
(133, 95, 37, 792, 'June', 'Free Class', 'New 2 ', '244413.pdf', '2022-06-09 08:14:54', 1),
(132, 95, 37, 792, 'June', 'Free Class', 'test 2', '238662.pdf', '2022-06-09 04:30:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmsclass_schlmsle`
--

CREATE TABLE `lmsclass_schlmsle` (
  `classid` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
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
(1, 35, 1, '95', 'test', '2023-07-09', '10:00:00', '12:00:00', 'asdad', 'asdsd', 'Online Class', '', '-09 08:48:11', '1', '2023-07-09 03:18:11');

-- --------------------------------------------------------

--
-- Table structure for table `lmscomments`
--

CREATE TABLE `lmscomments` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `tealmsr` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `rate` int(11) NOT NULL,
  `review` text NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmscomments`
--

INSERT INTO `lmscomments` (`id`, `uid`, `tealmsr`, `title`, `rate`, `review`, `add_date`, `status`) VALUES
(24, 1370, 68, 'About the sir and his qualities', 5, 'Sir is very kind and He is explain the lessons very well.He is very smart', '2022-01-13 15:09:53', '1'),
(23, 1370, 73, 'About the teacher ', 5, 'Teacher is very kind and she is explain the lessons very well', '2022-01-13 15:06:12', '1'),
(21, 1304, 51, 'Adithya Mendis', 5, 'one of the best teachers in the institute explains everything clearly and makes the lessons go to our mind swiftly\r\nTherefore i recommend her for anyone who does civics ', '2021-12-24 04:08:39', '1'),
(22, 1683, 68, 'Science ', 5, 'This is my 1rst class , You were teach very well I like the class sir\r\nThank you ', '2022-01-11 14:31:28', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lmscoupon`
--

CREATE TABLE `lmscoupon` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  `percentage` int(11) NOT NULL,
  `valid_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmscourse_work`
--

CREATE TABLE `lmscourse_work` (
  `exid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `class` varchar(400) NOT NULL,
  `subject` int(11) NOT NULL,
  `examname` varchar(200) NOT NULL,
  `edate` datetime NOT NULL,
  `exam_end_date` datetime NOT NULL,
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `edocument` varchar(500) NOT NULL,
  `description` varchar(255) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmscourse_work`
--

INSERT INTO `lmscourse_work` (`exid`, `tid`, `class`, `subject`, `examname`, `edate`, `exam_end_date`, `starttime`, `endtime`, `edocument`, `description`, `add_date`, `status`) VALUES
(4, 96, '35', 1, 'test', '2023-07-09 10:00:00', '2023-07-11 12:00:00', NULL, NULL, '592017.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien velit, aliquet eget commodo nec, auctor a sapien. Nam eu neque vulputate diam rhoncus faucibus. Curabitur quis varius libero. Lorem.', '2023-07-09 05:47:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmsdb`
--

CREATE TABLE `lmsdb` (
  `id` int(11) NOT NULL,
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
  `ctuid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
  `month` varchar(50) NOT NULL,
  `ctype` varchar(50) NOT NULL,
  `title` text NOT NULL,
  `tdocument` varchar(500) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsebook`
--

INSERT INTO `lmsebook` (`ctuid`, `tid`, `class`, `subject`, `month`, `ctype`, `title`, `tdocument`, `add_date`, `status`) VALUES
(130, 37, 42, 590, 'January', 'Online Class', 'test', '972634.pdf', '2022-02-09 07:32:24', 1),
(131, 68, 43, 387, 'February', 'Ebook', 'test', '525339.pdf', '2022-02-09 07:53:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmsexpense`
--

CREATE TABLE `lmsexpense` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` bigint(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lmsexpense`
--

INSERT INTO `lmsexpense` (`id`, `name`, `cost`, `date`) VALUES
(2, 'mac', 1500, '2023-07-07');

-- --------------------------------------------------------

--
-- Table structure for table `lmsgallery`
--

CREATE TABLE `lmsgallery` (
  `id` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsgetway`
--

CREATE TABLE `lmsgetway` (
  `id` int(11) NOT NULL,
  `app_id` varchar(4000) NOT NULL,
  `hash_salt` varchar(4000) NOT NULL,
  `a_token` varchar(4000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsgetway`
--

INSERT INTO `lmsgetway` (`id`, `app_id`, `hash_salt`, `a_token`) VALUES
(1, 'O3RP1189E0E4B71049D0F', '3PP41189E0E4B71049D3B', 'ec18f1ad505692f18d988fc3bd55ff923f514609cc0260b59f313a8b45a9815b8f358981a0f48bbf.IOD11189E0E4B71049D5F');

-- --------------------------------------------------------

--
-- Table structure for table `lmslesson`
--

CREATE TABLE `lmslesson` (
  `lid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `class` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `title` varchar(500) NOT NULL,
  `available_days` varchar(100) NOT NULL,
  `no_of_views_per_day` int(11) NOT NULL,
  `cover` varchar(500) NOT NULL,
  `video` varchar(1000) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmslesson`
--

INSERT INTO `lmslesson` (`lid`, `tid`, `type`, `class`, `subject`, `title`, `available_days`, `no_of_views_per_day`, `cover`, `video`, `add_date`, `status`) VALUES
(181, 68, 'Paid', '43', '667', 'Resultant Force (05/12/2021)', '365', 2, '149652.jpg', '\"https://player.vimeo.com/video/654998520?h=368cd6df6d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11 Paper Revision EM Abhiman Sir 1\"', '2021-12-16 07:29:43', 1),
(297, 64, 'Paid', '43', '556', 'Western Music  December Week  2', '7', 2, '677517.jpg', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/657902653?h=a263802f7f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1584907471\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-18 16:27:46', 1),
(296, 64, 'Paid', '41', '552', 'Western Music Week 2', '7', 2, '787237.jpg', '<div style=\"padding:53.97% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/657905849?h=cbf201493d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1212925248\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-18 15:41:03', 1),
(182, 68, 'Free', '43', '667', 'Science Paper Revision Class First Day', '365', 2, '981407.jpg', '\"https://player.vimeo.com/video/654998520?h=368cd6df6d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11 Paper Revision EM Abhiman Sir 1\"', '2021-12-16 07:32:00', 1),
(183, 68, 'Paid', '44', '749', 'Resultant Force', '365', 2, '738542.jpg', '\"https://player.vimeo.com/video/654998520?h=368cd6df6d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11 Paper Revision EM Abhiman Sir 1\"', '2021-12-16 07:32:35', 1),
(178, 68, 'Paid', '44', '750', 'à¶´à·Šâ€à¶»à·à·Šà¶± à¶´à¶­à·Šâ€à¶» à¶´à¶±à·Šà¶­à·’à¶º - (2021/12/05)', '365', 2, '117582.jpg', '\"https://player.vimeo.com/video/655004324?h=fb6cf55bdb&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 Paper Revision SM Abhiman Sir 1\"', '2021-12-16 07:32:58', 1),
(295, 64, 'Paid', '39', '548', 'Western Music December week 2', '7', 2, '564525.jpg', '<div style=', '2021-12-18 15:43:10', 1),
(177, 68, 'Free', '44', '750', 'à¶´à·Šâ€à¶»à·à·Šà¶± à¶´à¶­à·Šâ€à¶» à¶´à¶±à·Šà¶­à·’à¶º - à¶†à¶»à¶¸à·Šà¶·à¶š à¶¯à·’à¶±à¶º', '365', 2, '544087.jpg', '\"https://player.vimeo.com/video/655004324?h=fb6cf55bdb&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 Paper Revision SM Abhiman Sir 1\"', '2021-12-16 07:33:17', 1),
(176, 68, 'Free', '39', '369', 'Science Class First Day', '365', 2, '442239.jpg', '\"https://player.vimeo.com/video/654988824?h=1a5f5b522f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 7 Science EM Abhiman Sir 1\"', '2021-12-16 07:33:34', 1),
(175, 68, 'Paid', '39', '369', 'UNIT 01 - Plant Diversity - Day 1 (07/12/2021)', '365', 2, '776861.jpg', '\"https://player.vimeo.com/video/654988824?h=1a5f5b522f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 7 Science EM Abhiman Sir 1\"', '2021-12-16 07:34:11', 1),
(174, 68, 'Free', '44', '733', 'à¶´à·”à¶«à¶»à·“à¶šà·Šà·‚à¶« à¶´à¶±à·Šà¶­à·’à¶º à¶†à¶»à¶¸à·Šà¶·à¶š à¶¯à·’à¶±à¶º', '365', 2, '763117.jpg', '\"https://player.vimeo.com/video/655057959?h=d526a2fdbd&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021 OL Revision SM Abhiman Sir 1\"', '2021-12-16 07:34:37', 1),
(294, 57, 'Paid', '39', '347', '2021-12-18 7 à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º-03.à¶´à·–à¶»à·Šà¶« à·ƒà¶‚à¶›à·Šâ€à¶ºà· à¶¸à¶­ à¶œà¶«à·’à¶­ à¶šà¶»à·Šà¶¸', '21', 2, '64105.png', '\"https://player.vimeo.com/video/658124818?h=4781063e99&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"20211218 -à¶œà¶«à·’à¶­à¶º-7 à·€à·ƒà¶»-03à¶´à·–à¶»à·Šà¶« à·ƒà¶‚à¶›à·Š&amp;zwj;à¶ºà· à¶¸à¶­ à¶œà¶«à·’à¶­ à¶šà¶»à·Šà¶¸\"', '2021-12-18 13:38:32', 1),
(173, 68, 'Paid', '44', '733', 'à¶­à¶»à¶‚à¶œ à·ƒà·„ à¶’à·€à·à¶ºà·š à¶ºà·™à¶¯à·“à¶¸à·Š - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2021/12/05)', '365', 2, '44190.jpg', '\"https://player.vimeo.com/video/655057959?h=d526a2fdbd&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021 OL Revision SM Abhiman Sir 1\"', '2021-12-16 07:34:53', 1),
(169, 68, 'Free', '40', '375', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à¶±à·Šà¶­à·’à¶º à¶†à¶»à¶¸à·Šà¶·à¶š à¶¯à·’à¶±à¶º', '365', 2, '885430.jpg', '\"https://player.vimeo.com/video/654984649?h=e3e0d6a9f7&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G8 Science SM Abhiman Sir 1\"', '2021-12-16 07:35:12', 1),
(168, 68, 'Paid', '40', '375', '01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Šâ€à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à·€à·à¶¯à¶œà¶­à·Šà¶šà¶¸ - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2021/12/04)', '365', 2, '702950.jpg', '\"https://player.vimeo.com/video/654984649?h=e3e0d6a9f7&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G8 Science SM Abhiman Sir 1\"', '2021-12-16 07:35:31', 1),
(167, 68, 'Free', '41', '379', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à¶±à·Šà¶­à·’à¶º à¶†à¶»à¶¸à·Šà¶·à¶š à¶¯à·’à¶±à¶º', '365', 2, '771266.jpg', '\"https://player.vimeo.com/video/654985605?h=b4903295d5&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9 Science SM Abhiman Sir 1\"', '2021-12-16 07:35:55', 1),
(166, 68, 'Paid', '41', '379', '01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Šâ€à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2021/12/04)', '365', 2, '641826.jpg', '\"https://player.vimeo.com/video/654985605?h=b4903295d5&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9 Science SM Abhiman Sir 1\"', '2021-12-16 07:36:15', 1),
(293, 57, 'Paid', '41', '355', '2021-12-18 9 à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º-03.à¶·à·à¶œ 2 à¶šà·œà¶§à·ƒ', '21', 2, '214118.png', '\"https://player.vimeo.com/video/658123247?h=e92a744b3f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-18 9 à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º-03à¶·à·à¶œ 2 à¶šà·œà¶§à·ƒ\"', '2021-12-18 13:33:30', 1),
(165, 68, 'Free', '42', '668', 'Paper Revision class à¶´à·…à¶¸à·” à¶¯à·’à¶±à¶º', '365', 2, '302391.jpg', '\"https://player.vimeo.com/video/655000947?h=32052c9af2&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Paper Revision SM Abhiman Sir 1\"', '2021-12-16 07:36:34', 1),
(164, 68, 'Paid', '42', '668', 'à¶¸à·–à¶½à¶¯à·Šâ€à¶»à·€à·Šâ€à¶º , à·ƒà¶‚à¶ºà·à¶œ , à¶†à·€à¶»à·Šà¶®à·’à¶­à· à·€à¶œà·”à·€ , à·ƒà¶¸à·“à¶šà¶»à¶« à¶·à·à·€à·’à¶­à¶ºà·™à¶±à·Š à¶œà·à¶§à¶½à·” à·€à·’à·ƒà¶¯à·“à¶¸ (2021/12/07)', '365', 2, '231064.jpg', '\"https://player.vimeo.com/video/655000947?h=32052c9af2&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Paper Revision SM Abhiman Sir 1\"', '2021-12-16 07:36:52', 1),
(171, 68, 'Free', '39', '371', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à¶±à·Šà¶­à·’à¶º à¶†à¶»à¶¸à·Šà¶·à¶š à¶¯à·’à¶±à¶º', '365', 2, '77294.jpg', '\"https://player.vimeo.com/video/654983721?h=f38ec8328e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7 Science SM Abhiman Sir 1\"', '2021-12-16 07:37:10', 1),
(292, 57, 'Paid', '41', '355', '2021-12-18 9 à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º- .à¶·à·à¶œ 1 à¶šà·œà¶§à·ƒ', '21', 2, '436660.png', '\"https://player.vimeo.com/video/658122424?h=030d951563&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-18-à¶œà¶«à·’à¶­à¶º- 9 à·€à·ƒà¶» -03à¶·à·à¶œ 1 à¶šà·œà¶§à·ƒ\"', '2021-12-18 13:23:25', 1),
(161, 68, 'Free', '42', '383', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à¶±à·Šà¶­à·’à¶º à¶†à¶»à¶¸à·Šà¶·à¶š à¶¯à·’à¶±à¶º', '365', 2, '717609.jpg', '\"https://player.vimeo.com/video/654986525?h=ea8ade3221&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10 SM Theory Abhiman Sir 1\"', '2021-12-16 07:37:53', 1),
(160, 68, 'Paid', '42', '383', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2021/12/04)', '365', 2, '718654.jpg', '\"https://player.vimeo.com/video/654986525?h=ea8ade3221&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10 SM Theory Abhiman Sir 1\"', '2021-12-16 07:38:09', 1),
(172, 48, 'Paid', '44', '742', '02 à¶´à·à¶©à¶¸ - à·à·Šâ€à¶»à·“ à¶½à¶‚à¶šà·à·€à·š à¶¶à·Šâ€à¶»à·’à¶­à·à¶±à·Šâ€à¶º à¶¶à¶½à¶º à¶´à·’à·„à·’à¶§à·”à·€à·“à¶¸ 02 à·€à¶± à¶¯à·’à¶±à¶º 2021.12.09 ', '365 ', 2, '829595.jpg', '\"https://player.vimeo.com/video/655288571?h=9d14f62a15&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1484711451\"', '2021-12-16 07:38:33', 1),
(291, 57, 'Paid', '41', '355', '2021-12-11  9 à·€à·ƒà¶» à¶œà¶«à·’à¶­à¶º- 02.à¶¯à·Šà·€à·“à¶¸à¶º à·ƒà¶‚à¶›à·Šâ€à¶ºà·', '21', 2, '90390.png', '\"https://player.vimeo.com/video/658118553?h=ec3b3e471a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-11 9 à·€à·ƒà¶» à¶œà¶«à·’à¶­à¶º-02à¶¯à·Šà·€à·“à¶¸à¶º à·ƒà¶‚à¶›à·Š&amp;zwj;à¶ºà·\"', '2021-12-18 13:09:31', 1),
(158, 68, 'Free', '43', '669', 'Paper Revision class à¶´à·…à¶¸à·” à¶¯à·’à¶±à¶º', '365', 2, '744982.jpg', '\"https://player.vimeo.com/video/655004324?h=fb6cf55bdb&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 Paper Revision SM Abhiman Sir 1\"', '2021-12-16 07:39:00', 1),
(290, 57, 'Paid', '44', '751', '2021-12-17 à¶œà¶«à·’à¶­à¶º 2021 Rev G11- 2018 I-A- à¶­à·Šâ€à¶»à·’à¶šà·à¶«à¶¸à·’à¶­à·’à¶º,à¶¯à·’à¶œà¶‚à·à¶º', '21', 2, '818116.png', '\"https://player.vimeo.com/video/658106268?h=b5373a4076&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-17 2021 Rev Grade 11 - 2018 I-A-  à¶­à·Š&amp;zwj;à¶»à·’à¶šà·à¶«à¶¸à·’à¶­à·’à¶º,à¶¯à·’à¶œà¶‚à·à¶º\"', '2021-12-18 12:25:40', 1),
(157, 68, 'Paid', '43', '669', 'à·ƒà¶¸à·Šà¶´à·Šâ€à¶»à¶ºà·”à¶šà·Šà¶­ à¶¶à¶½à¶º (2021/12/05)', '365', 2, '354173.jpg', '\"https://player.vimeo.com/video/655004324?h=fb6cf55bdb&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 Paper Revision SM Abhiman Sir 1\"', '2021-12-16 07:39:17', 1),
(170, 68, 'Paid', '39', '371', '01 à¶´à·à¶©à¶¸ - à·à·à¶š à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2021/12/04)', '365', 2, '769733.jpg', '\"https://player.vimeo.com/video/654983721?h=f38ec8328e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7 Science SM Abhiman Sir 1\"', '2021-12-16 07:39:43', 1),
(153, 48, 'Paid', '44', '742', '02  à¶´à·à¶©à¶¸ -  à·à·Šâ€à¶»à·“ à¶½à¶‚à¶šà·à·€à·š à¶¶à·Šâ€à¶»à·’à¶­à·à¶±à·Šâ€à¶º à¶¶à¶½à¶º à¶´à·’à·„à·’à¶§à·”à·€à·“à¶¸ . 01 à¶¯à·’à¶±à¶º 2021.12.02 ', '365 ', 2, '998258.jpg', '', '2021-12-16 07:39:55', 1),
(284, 48, 'Paid', '43', '441', '01 à¶´à·à¶©à¶¸ - 10 à·à·Šâ€à¶»à·šà¶«à·’à¶º - à¶´à·”à¶±à¶»à·“à¶šà·Šà·‚à¶«à¶º ', '365 ', 2, '211750.jpg', '\"https://player.vimeo.com/video/657929187?h=ab37735505&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1008291162\"', '2021-12-17 18:21:50', 1),
(216, 68, 'Paid', '40', '373', 'Unit 01 - Importance of Micro Organisms - Day 1 (06/12/2021)', '365', 2, '281274.jpg', '\"https://player.vimeo.com/video/654991447?h=f8e1daad8d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 8 Science EM Abhiman Sir 1\"', '2021-12-16 07:47:37', 1),
(156, 68, 'Free', '43', '387', 'à·€à·’à¶¯à·Šâ€à¶ºà·à·€ à¶´à¶±à·Šà¶­à·’à¶º à¶†à¶»à¶¸à·Šà¶·à¶š à¶¯à·’à¶±à¶º', '365', 2, '934425.jpg', '\"https://player.vimeo.com/video/654987702?h=bfc6a2ae67&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11 SM Theory Abhiman Sir 1\"', '2021-12-16 07:47:56', 1),
(184, 68, 'Free', '44', '749', 'Paper Class First Day', '365', 2, '244920.jpg', '\"https://player.vimeo.com/video/654998520?h=368cd6df6d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11 Paper Revision EM Abhiman Sir 1\"', '2021-12-16 07:48:07', 1),
(185, 48, 'Paid', '41', '437', '01 à¶´à·à¶©à¶¸ - à·à·Šâ€à¶»à·“ à¶½à¶‚à¶šà·à·€à·š à¶¸à·”à·„à·”à¶¯à·”à¶¶à¶© à¶´à·Šâ€à¶»à¶¯à·šà· à¶½à¶±à·Šà¶¯à·šà·ƒà·“à¶±à·Š à¶ºà¶§à¶­à¶§ à¶´à¶­à·Šà·€à·“à¶¸ . 01 à¶¯à·€à·ƒ 2021.12.10 ', '365 ', 2, '771683.jpg', '\"https://player.vimeo.com/video/655552011?h=a8962fca29&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1044194021\"', '2021-12-16 07:48:17', 1),
(186, 48, 'Paid', '39', '433', '01 à¶´à·à¶©à¶¸ - à¶…à¶´à·š à¶´à·à¶»à¶«à·’ à¶¢à·“à·€à·’à¶­à¶º - 01 à¶¯à·’à¶±à¶º ', '365 ', 2, '20288.jpg', '\"https://player.vimeo.com/video/655556977?h=287c30b612&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1759281445\"', '2021-12-16 07:48:30', 1),
(187, 68, 'Paid', '43', '386', 'Unit 01 - Living Tissues - Day 1 (05/12/2021)', '365', 2, '168283.jpg', '\"https://player.vimeo.com/video/654997425?h=aa01206f2c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 Science EM Abhiman Sir 1\"', '2021-12-16 07:48:41', 1),
(289, 57, 'Paid', '40', '351', '2021.12.11 - G8 -01. à·ƒà¶‚à¶›à·Šâ€à¶ºà· à¶»à¶§à· 2 à¶šà·œà¶§à·ƒ', '7', 2, '305625.png', '\"https://player.vimeo.com/video/658098602?h=4011d0f261&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"20211211 - G8 -01 à·ƒà¶‚à¶›à·Š&amp;zwj;à¶ºà· à¶»à¶§à· 2 à¶šà·œà¶§à·ƒ\"', '2021-12-18 11:10:58', 1),
(224, 68, 'Free', '43', '386', 'Science Class - Day 1', '365', 2, '974157.jpg', '\"https://player.vimeo.com/video/654997425?h=aa01206f2c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 Science EM Abhiman Sir 1\"', '2021-12-16 07:48:53', 1),
(622, 48, 'Paid', '44', '757', '2021.01.20 o/l revision', '365', 2, '600019.jpg', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/668648820?h=1b224a92a3&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video2826971918\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2022-01-21 15:10:43', 1),
(189, 68, 'Paid', '42', '382', 'Unit - 01 Chemical Basis of Life - Day 01 (05/12/2021)', '365', 2, '320355.jpg', '\"https://player.vimeo.com/video/654994173?h=12dc739995&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Science EM Abhiman Sir 1\"', '2021-12-16 07:49:07', 1),
(190, 68, 'Free', '42', '382', 'Science Class - First Day', '365', 2, '510222.jpg', '\"https://player.vimeo.com/video/654994173?h=12dc739995&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Science EM Abhiman Sir 1\"', '2021-12-16 07:49:18', 1),
(193, 68, 'Paid', '42', '666', 'About Elements, Compounds, Periodic Table and Solving Equations (08/12/2021)', '365', 2, '241445.jpg', '\"https://player.vimeo.com/video/654995244?h=04aa548692&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10 Paper Revision EM Abhiman Sir 1\"', '2021-12-16 07:49:30', 1),
(288, 57, 'Paid', '40', '351', '2021.12.04 - G8 -01. à·ƒà¶‚à¶›à·Šâ€à¶ºà· à¶»à¶§à· - 1 à¶šà·œà¶§à·ƒ', '7', 2, '215087.png', '\"https://player.vimeo.com/video/658077597?h=503e828841&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"20211004 - G8 -01 à·ƒà¶‚à¶›à·Š&amp;zwj;à¶ºà· à¶»à¶§à· - 1 à¶šà·œà¶§à·ƒ\"', '2021-12-18 10:28:37', 1),
(192, 68, 'Free', '42', '666', 'Science Paper Class Day 01', '365', 2, '490504.jpg', '\"https://player.vimeo.com/video/654995244?h=04aa548692&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10 Paper Revision EM Abhiman Sir 1\"', '2021-12-16 07:49:46', 1),
(194, 57, 'Free', '44', '751', 'Maths December Week 1 à·€à¶»à·Šà¶œà¶µà¶½à¶º', '7', 2, '827849.png', '', '2021-12-16 07:49:51', 1),
(195, 57, 'Free', '44', '751', 'Maths December Week 2 - à¶·à·à¶œ 1', '7', 2, '802554.png', '\"https://player.vimeo.com/video/655625594?h=cd40542842&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021 Rev 20211210 - 1\"', '2021-12-16 07:50:08', 1),
(196, 57, 'Free', '44', '751', 'Maths December Week 2 - à¶·à·à¶œ 2', '7', 2, '90790.png', '\"https://player.vimeo.com/video/655628596?h=ced04d223e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021 Rev 20211210 - 2\"', '2021-12-16 07:50:24', 1),
(197, 57, 'Free', '43', '676', 'Maths December Week 1 -  à·€à¶»à·Šà¶œà¶µà¶½à¶º', '7', 2, '948903.png', '\"https://player.vimeo.com/video/655559513?h=c5eb73a9fa&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021 Rev grade 11- 20211203\"', '2021-12-16 07:50:38', 1),
(303, 59, 'Paid', '44', '761', 'RP1 Accounting Equation & Double Entry System Day 1 (04.12.2021)', '365', 2, '751817.jpg', '\"https://player.vimeo.com/video/655033271?h=58e98282f8&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"RP1 Accounting Equation &amp;amp; Double Entry System Day 01 (04.12.2021)\"', '2021-12-19 04:01:57', 1),
(287, 68, 'Paid', '41', '379', '01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Šâ€à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (2021.12.18)', '365', 2, '442479.jpg', '\"https://player.vimeo.com/video/658070548?h=d0de85da4f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Š&amp;zwj;à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (20211218)\"', '2021-12-18 09:07:54', 1),
(302, 59, 'Paid', '42', '538', 'Chapter 1 Background of Business Day 2 (17.12.2021)', '365', 2, '92487.jpg', '\"https://player.vimeo.com/video/658238604?h=a8dd9ac0cf&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Chapter 1 Background of Business Day 2 (17.12.2021)\"', '2021-12-19 03:52:48', 1),
(301, 59, 'Paid', '42', '538', 'Chapter 1 Background of Business Day 1 (10.12.2021)', '365', 2, '128698.jpg', '\"https://player.vimeo.com/video/655554992?h=fcbff87b95&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Chapter 1 Background of Business Day 1 (10.12.2021)\"', '2021-12-19 03:50:00', 1),
(201, 70, 'Paid', '42', '678', 'Paper Class week 01(07th Dec)', '365', 2, '898852.jpg', '\"https://player.vimeo.com/video/655703254?h=65128c1fae&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10_Paper_Dec_01\"', '2021-12-16 07:51:31', 1),
(285, 57, 'Paid', '42', '359', '2021.12.11 -G10 - 01.à¶´à¶»à·’à¶¸à·’à¶­à·’à¶º', '7', 2, '714726.png', '\"https://player.vimeo.com/video/658070088?h=89cc04185a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"20211211 -G10 - 01à¶´à¶»à·’à¶¸à·’à¶­à·’à¶º\"', '2021-12-18 08:02:51', 1),
(202, 70, 'Paid', '43', '364', 'à¶­à·à¶­à·Šà·€à·’à¶š à·ƒà¶‚à¶›à·Šâ€à¶ºà· - 05-12-2021', '365', 2, '228141.jpg', '\"https://player.vimeo.com/video/655717298?h=dbf6f5a6d9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11_L1_\"', '2021-12-16 07:51:45', 1),
(203, 64, 'Paid', '39', '548', 'Western Music December Week 1', '7', 2, '277013.jpg', '\"https://player.vimeo.com/video/655409606?h=350e169cf6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1674941002\"', '2021-12-16 07:51:58', 1),
(204, 64, 'Paid', '43', '556', 'Western Music December Week 1', '7', 2, '660540.jpg', '\"https://player.vimeo.com/video/655410891?h=da5d26d48b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1851139348\"', '2021-12-16 07:52:10', 1),
(205, 64, 'Paid', '42', '554', 'Wester Music December Week 1', '7', 2, '305491.jpg', '\"https://player.vimeo.com/video/655816017?h=34323c9db2&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"GMT20211206-143343_Recording_1686x738\"', '2021-12-16 07:52:23', 1),
(286, 68, 'Paid', '42', '383', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (2021.12.18)', '365', 2, '365494.jpg', '\"https://player.vimeo.com/video/658070257?h=583c5f17e1&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (20211218)\"', '2021-12-18 08:48:53', 1),
(206, 64, 'Paid', '41', '552', 'Western Music December Week 1', '7', 2, '709544.jpg', '\"https://player.vimeo.com/video/655411481?h=645224e8f0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1451245771\"', '2021-12-16 07:52:34', 1),
(623, 48, 'Paid', '44', '742', 'grade 10 2 nd lesson revision 2021.1.20', '365', 2, '974142.jpg', '<iframe src=\"https://player.vimeo.com/video/668644599?h=5be2686d08&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1826971918\">', '2022-01-21 15:13:28', 1),
(282, 48, 'Paid', '42', '439', '01 à¶´à·à¶©à¶¸ - à¶‰à¶­à·’à·„à·à·ƒà¶º à·„à·à¶¯à·’à¶±à·Šà·€à·“à¶¸à·š à¶¸à·”à¶½à·à·à·Šâ€à¶» - 02 à·€à¶± à¶¯à·€à·ƒ 2021.12.16 ', '365 ', 2, '997093.jpg', '\"https://player.vimeo.com/video/657912115?h=df195789bc&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1175821639\"', '2021-12-17 17:35:33', 1),
(212, 48, 'Paid', '40', '435', 'à·à·Šâ€à¶»à·“ à¶½à¶‚à¶šà·à·€à·š à·ƒà·à¶¸à·Šà¶´à·Šâ€à¶»à¶°à·à¶ºà·’à¶š à¶­à·à¶šà·Šà·‚à¶«à¶º à·„à· à¶šà¶½à·à·€ - à¶¯à·’à¶±à¶º 01 ', '365', 2, '36556.jpg', '', '2021-12-16 07:52:46', 1),
(241, 70, 'Paid', '40', '352', 'à¶´à¶»à·’à¶¸à·’à¶­à·’à¶º - 13th December', '365', 2, '238870.jpg', '\"https://player.vimeo.com/video/656855459?h=878810fa1b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"grade_08_13dec\"', '2021-12-16 07:53:08', 1),
(215, 70, 'Paid', '40', '352', 'à·ƒà¶‚à¶›à·Šâ€à¶ºà· à¶»à¶§à· -06th December', '365', 2, '535449.jpg', '\"https://player.vimeo.com/video/655976883?h=1de3efc485&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G_08_Lesson1\"', '2021-12-16 07:53:22', 1),
(283, 48, 'Paid', '41', '437', '01 à¶´à·à¶©à¶¸ - à·à·Šâ€à¶»à·“ à¶½à¶‚à¶šà·à·€à·š à¶¸à·”à·„à·”à¶¯à·”à¶¶à¶© à¶´à·Šâ€à¶»à¶¯à·šà· à¶½à¶±à·Šà¶¯à·šà·ƒà·“à¶±à·Š à¶ºà¶§à¶­à¶§ à¶´à¶­à·Šà·€à·“à¶¸ - 02 à·€à¶± à¶¯à·’à¶±à¶º 2021.12. 17 ', '365 ', 2, '532724.jpg', '\"https://player.vimeo.com/video/657921769?h=cbabee2b08&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1113119196\"', '2021-12-17 18:00:56', 1),
(214, 70, 'Paid', '41', '356', 'à·ƒà¶‚à¶›à·Šâ€à¶ºà· à¶»à¶§à· - 07th December', '365', 2, '919378.jpg', '\"https://player.vimeo.com/video/655904069?h=2ee0a859c5&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G_09_Lesson1\"', '2021-12-16 07:53:36', 1),
(217, 68, 'Free', '40', '373', 'Science Class First Day', '365', 2, '527402.jpg', '\"https://player.vimeo.com/video/654991447?h=f8e1daad8d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 8 Science EM Abhiman Sir 1\"', '2021-12-16 07:53:50', 1),
(218, 68, 'Paid', '41', '377', 'Unit 01 - Applications of Micro - Organisms (08.12.2021)', '365', 2, '370172.jpg', '\"https://player.vimeo.com/video/654992294?h=e3b4fd012a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9 Science EM Abhiman Sir 1\"', '2021-12-16 07:54:04', 1),
(219, 68, 'Free', '41', '377', 'Science Class First Day', '365', 2, '608313.jpg', '\"https://player.vimeo.com/video/654992294?h=e3b4fd012a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9 Science EM Abhiman Sir 1\"', '2021-12-16 07:54:15', 1),
(220, 44, 'Free', '40', '406', 'How to write an essay', '365', 2, '846278.jpg', 'https://youtu.be/vR2pimWHV8U', '2021-12-13 14:41:46', 1),
(221, 68, 'Paid', '44', '732', 'Waves and Their Applications - Day 01 (05.12.2021)', '365', 2, '292335.jpg', '\"https://player.vimeo.com/video/655060931?h=d25c65b803&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021 OL Revision EM Abhiman Sir 1\"', '2021-12-16 07:54:29', 1),
(281, 48, 'Paid', '44', '742', '2019 mcq discussion 2021.12 .16 ', '365', 2, '455896.jpg', '\"https://player.vimeo.com/video/657891315?h=97f817ce7a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1601276777\"', '2021-12-17 17:37:53', 1),
(222, 68, 'Free', '44', '732', '2021 O/L Revision Science Class first day', '365', 2, '722396.jpg', '\"https://player.vimeo.com/video/655060931?h=d25c65b803&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021 OL Revision EM Abhiman Sir 1\"', '2021-12-16 07:54:43', 1),
(225, 68, 'Paid', '42', '383', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2021.12.11)', '365', 2, '880076.jpg', '\"https://player.vimeo.com/video/656497033?h=cae4209395&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20211211)\"', '2021-12-16 07:55:14', 1),
(227, 68, 'Paid', '40', '375', '01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Šâ€à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à·€à·à¶¯à¶œà¶­à·Šà¶šà¶¸ - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2021.12.11)', '365', 2, '302744.jpg', '\"https://player.vimeo.com/video/656499402?h=6b108041c0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Š&amp;zwj;à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à·€à·à¶¯à¶œà¶­à·Šà¶šà¶¸ - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20211211)\"', '2021-12-16 07:55:44', 1),
(228, 68, 'Paid', '39', '371', '01 à¶´à·à¶©à¶¸ - à·à·à¶š à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2021.12.11)', '365', 2, '269072.jpg', '\"https://player.vimeo.com/video/656500001?h=46e04041d6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à·à·à¶š à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20211211)\"', '2021-12-16 07:55:59', 1),
(278, 68, 'Paid', '40', '373', 'Unit 01 - Importance of Micro Organisms - Day 2 (13.12.2021)', '365', 2, '718855.jpg', '\"https://player.vimeo.com/video/656510820?h=373458fd01&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Importance of Micro Organisms - Day 2 (13122021)\"', '2021-12-17 16:49:39', 1),
(279, 68, 'Paid', '43', '387', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à·“ à¶´à¶§à¶š - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2021.12.04)', '365', 2, '864746.jpg', '\"https://player.vimeo.com/video/654987702?h=bfc6a2ae67&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11 SM Theory Abhiman Sir 1\"', '2021-12-17 16:52:32', 1),
(230, 68, 'Paid', '43', '667', 'Equilibrium of Forces & Structure of Matter - Day 01 (11.12.2021)', '365', 2, '213766.jpg', '\"https://player.vimeo.com/video/656502430?h=023cd0a5b0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Equilibrium of Forces &amp;amp; Structure of Matter - Day 01 (11122021)\"', '2021-12-16 07:56:30', 1),
(231, 68, 'Paid', '44', '749', 'Equilibrium of Forces & Structure of Matter - Day 01 (11.12.2021)', '365', 2, '596274.jpg', '\"https://player.vimeo.com/video/656502430?h=023cd0a5b0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Equilibrium of Forces &amp;amp; Structure of Matter - Day 01 (11122021)\"', '2021-12-16 07:56:46', 1),
(232, 68, 'Paid', '44', '733', 'à¶­à¶»à¶‚à¶œ à·ƒà·„ à¶’à·€à·à¶ºà·š à¶ºà·™à¶¯à·“à¶¸à·Š - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2021.12.12)', '365', 2, '770035.jpg', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/656503000?h=bc7489c318&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶­à¶»à¶‚à¶œ à·ƒà·„ à¶’à·€à·à¶ºà·š à¶ºà·™à¶¯à·“à¶¸à·Š - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20211212)\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-14 11:08:17', 1),
(233, 68, 'Paid', '44', '732', 'Waves and Their Applications - Day 02 (12.12.2021)', '365', 2, '489561.jpg', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/656503742?h=3f9d65d360&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Waves and Their Applications - Day 02 (12122021)\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-14 11:14:22', 1),
(234, 68, 'Paid', '43', '386', 'Unit 01 - Living Tissues - Day 2 (12.12.2021)', '365', 2, '563324.jpg', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/656518148?h=a714f8243c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Living Tissues - Day 2 (12122021)\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-14 11:18:46', 1),
(674, 68, 'Paid', '42', '382', 'Unit - 01 Chemical Basis of Life - Day 2 (12.12.2021)', '365', 2, '840120.jpg', '\"https://player.vimeo.com/video/656519611?h=3ade3adc0d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 02 (12122021)\"', '2021-12-26 12:02:42', 1),
(236, 64, 'Paid', '42', '554', 'Western Music December Week 2', '7', 2, '435954.jpg', '<div style=\"padding:53.97% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/656430370?h=f58b7a8e2e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1134162108\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-14 11:26:11', 1),
(237, 68, 'Paid', '43', '669', 'à¶¶à¶½ à·ƒà¶¸à¶­à·”à¶½à·’à¶­à¶­à·à·€, à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Šâ€à¶ºà·–à·„à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2021.12.12)', '365', 2, '367224.jpg', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/656522330?h=a6ee1d2f45&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶¶à¶½ à·ƒà¶¸à¶­à·”à¶½à·’à¶­à¶­à·à·€, à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Š&amp;zwj;à¶ºà·–à·„à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20211212)\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-14 11:27:08', 1),
(238, 68, 'Paid', '44', '750', 'à¶¶à¶½ à·ƒà¶¸à¶­à·”à¶½à·’à¶­à¶­à·à·€, à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Šâ€à¶ºà·–à·„à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2021.12.12)', '365', 2, '917143.jpg', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/656522330?h=a6ee1d2f45&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶¶à¶½ à·ƒà¶¸à¶­à·”à¶½à·’à¶­à¶­à·à·€, à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Š&amp;zwj;à¶ºà·–à·„à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20211212)\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-14 11:28:58', 1),
(239, 64, 'Paid', '38', '546', 'Western Music December Week 1', '7', 2, '735643.jpg', '<div style=\"padding:52.71% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/656431107?h=c2d5ba9c0f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1676123437\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-14 12:09:40', 1),
(240, 48, 'Paid', '42', '439', '01 à¶´à·à¶©à¶¸ - à¶‰à¶­à·’à·„à·à·ƒà¶º à·„à·à¶¯à·‘à¶»à·“à¶¸à·š à¶¸à·”à¶½à·à·à·Šâ€à¶»à¶º - 01 à¶¯à·’à¶±à¶º ', '365 ', 2, '165887.jpg', '<div style=\"padding:53.44% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/656815664?h=c63e71ad62&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1500392214\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-15 00:54:44', 1),
(245, 56, 'Paid', '40', '529', '01 Lesson - Number system', '365', 2, '945335.jpg', 'https://drive.google.com/file/d/1mli07-2QBS2nV70QpTWPGd90-c0iW9Hc/view?usp=sharing', '2021-12-15 05:13:58', 1),
(564, 58, 'Paid', '43', '543', 'à·ƒà·”à·…à·” à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (16.01.2022 - Day 01) Unit 08 (2021)', '365', 2, '335693.jpg', '\"https://player.vimeo.com/video/666455416?h=a010083d17&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà·”à·…à·” à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (16012022 - Day 01) Unit 08 (2021)\"', '2022-01-16 13:17:46', 1),
(244, 56, 'Paid', '39', '515', '01 Lesson - UPS', '365', 2, '689591.jpg', 'https://drive.google.com/file/d/1mli07-2QBS2nV70QpTWPGd90-c0iW9Hc/view?usp=sharing', '2021-12-15 05:05:50', 1),
(246, 44, 'Free', '44', '760', '2021 model paper', '365', 2, '706304.png', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/656868432?h=c21896b64c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1013439574\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-15 05:14:37', 1),
(247, 56, 'Paid', '40', '517', '01 Lesson - Number system', '365', 2, '906278.jpg', 'https://drive.google.com/file/d/1mli07-2QBS2nV70QpTWPGd90-c0iW9Hc/view?usp=sharing', '2021-12-15 05:15:42', 1),
(248, 56, 'Paid', '41', '531', '01 Lesson - Computer Specification', '365', 2, '821948.jpg', 'https://drive.google.com/file/d/1mli07-2QBS2nV70QpTWPGd90-c0iW9Hc/view?usp=sharing', '2021-12-15 05:19:00', 1),
(249, 56, 'Paid', '41', '519', '01 Lesson - Computer Specification', '365', 2, '320464.jpg', 'https://drive.google.com/file/d/1mli07-2QBS2nV70QpTWPGd90-c0iW9Hc/view?usp=sharing', '2021-12-15 05:22:15', 1),
(250, 56, 'Paid', '42', '533', '01 Lesson - ICT', '365', 2, '846900.jpg', 'https://drive.google.com/file/d/1mli07-2QBS2nV70QpTWPGd90-c0iW9Hc/view?usp=sharing', '2021-12-15 05:24:31', 1),
(254, 56, 'Paid', '43', '523', '01 Lesson - Programming', '365', 2, '337976.jpg', 'https://drive.google.com/file/d/1mli07-2QBS2nV70QpTWPGd90-c0iW9Hc/view?usp=sharing', '2021-12-15 07:41:32', 1),
(252, 68, 'Paid', '39', '369', 'UNIT 01 - Plant Diversity - Day 2 (14.12.2021)', '365', 2, '872657.jpg', '\"https://player.vimeo.com/video/656874349?h=680ea79112&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"UNIT 01 - Plant Diversity - Day 2 (14.12.2021)\"', '2021-12-16 07:57:10', 1),
(280, 68, 'Paid', '43', '387', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à·“ à¶´à¶§à¶š - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2021.12.11)', '365', 2, '291603.jpg', '\"https://player.vimeo.com/video/656500682?h=e442b2882e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à·“ à¶´à¶§à¶š - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20211211)\"', '2021-12-17 16:54:11', 1),
(253, 68, 'Paid', '42', '668', 'à¶´à¶»à¶¸à·à¶«à·”à·€à¶š à·€à·Šâ€à¶ºà·–à·„à¶º, à¶´à¶»à¶¸à·à¶«à·”à¶š à¶šà·Šâ€à¶»à¶¸à·à¶‚à¶šà¶º, à·ƒà·Šà¶šà¶±à·Šà¶° à¶šà·Šâ€à¶»à¶¸à·à¶‚à¶šà¶º (2021.12.14)', '365', 2, '112770.jpg', '\"https://player.vimeo.com/video/656875168?h=320b639566&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à¶»à¶¸à·à¶«à·”à·€à¶š à·€à·Š&amp;zwj;à¶ºà·–à·„à¶º, à¶´à¶»à¶¸à·à¶«à·”à¶š à¶šà·Š&amp;zwj;à¶»à¶¸à·à¶‚à¶šà¶º, à·ƒà·Šà¶šà¶±à·Šà¶° à¶šà·Š&amp;zwj;\"', '2021-12-16 07:57:25', 1),
(255, 56, 'Paid', '42', '521', '01 Lesson - ICT', '365', 2, '625007.jpg', 'https://drive.google.com/file/d/1mli07-2QBS2nV70QpTWPGd90-c0iW9Hc/view?usp=sharing', '2021-12-15 07:44:04', 1),
(256, 70, 'Paid', '39', '348', 'à·ƒà¶¸à¶¸à·’à¶­à·’à¶º-10th December', '365', 2, '781487.png', '\"https://player.vimeo.com/video/656851791?h=fcc440649d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G_7_L_1_10Dec\"', '2021-12-16 07:57:45', 1),
(257, 70, 'Paid', '42', '678', 'Paper Class - Week 02', '365', 2, '497847.jpg', '\"https://player.vimeo.com/video/656854457?h=d45769a027&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10paper_14dec\"', '2021-12-16 07:58:00', 1),
(258, 70, 'Paid', '42', '678', 'Paper Class - Week 02', '365', 2, '400111.jpg', '\"https://player.vimeo.com/video/656854457?h=d45769a027&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10paper_14dec\"', '2021-12-16 07:58:14', 1),
(259, 70, 'Paid', '43', '364', 'Paper class -week 01', '365', 2, '967280.jpg', '\"https://player.vimeo.com/video/656856067?h=efb590f9ae&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"g11paper1\"', '2021-12-16 07:58:28', 1);
INSERT INTO `lmslesson` (`lid`, `tid`, `type`, `class`, `subject`, `title`, `available_days`, `no_of_views_per_day`, `cover`, `video`, `add_date`, `status`) VALUES
(273, 56, 'Paid', '41', '519', '1 Lesson - Computer Specification', '365', 2, '435309.jpg', 'https://drive.google.com/file/d/1mli07-2QBS2nV70QpTWPGd90-c0iW9Hc/view?usp=sharing', '2021-12-17 06:00:25', 1),
(260, 48, 'Paid', '39', '767', ' 01 à·€à¶± à¶´à·à¶©à¶¸ -  à¶…à¶´à·š à¶´à·à¶»à¶«à·’ à¶¢à¶± à¶¢à·“à·€à·’à¶­à¶º - 02 à·€à¶± à¶¯à·’à¶±à¶º ', '365 ', 2, '205141.jpg', '', '2021-12-16 07:58:56', 1),
(261, 48, 'Paid', '40', '435', '01 à¶´à·à¶©à¶¸ - à·à·Šâ€à¶»à·“ à¶½à¶‚à¶šà·à·€à·š à·ƒà·à¶¸à·Šà¶´à·Šâ€à¶»à¶°à·à¶ºà·’à¶š à¶­à·à¶šà·Šà·‚à¶«à¶º à·„à· à¶šà¶½à·à·€  - 02 à·€à¶± à¶¯à·’à¶±à¶º  2021.12. 15 ', '365 ', 2, '492742.jpg', '', '2021-12-16 07:59:00', 1),
(262, 56, 'Paid', '39', '527', '02 Lesson - Operating system', '365', 2, '357812.jpg', 'https://drive.google.com/file/d/1mli07-2QBS2nV70QpTWPGd90-c0iW9Hc/view?usp=sharing', '2021-12-16 03:08:12', 1),
(263, 56, 'Paid', '41', '531', '01 lesson - Computer specification', '365', 2, '879172.jpg', 'https://drive.google.com/file/d/1mli07-2QBS2nV70QpTWPGd90-c0iW9Hc/view?usp=sharing', '2021-12-16 03:11:37', 1),
(264, 70, 'Paid', '41', '356', 'Grade 9 - Lesson 02- à¶¯à·Šà·€à·’à¶¸à¶º à·ƒà¶‚à¶›à·Šâ€à¶ºà·-15th Dec', '365', 2, '310149.jpg', '', '2021-12-16 07:59:06', 1),
(265, 70, 'Paid', '41', '356', 'Grade 9 - Lesson 02- à¶¯à·Šà·€à·’à¶¸à¶º à·ƒà¶‚à¶›à·Šâ€à¶ºà·-15th Dec', '365', 2, '428725.jpg', '\"https://player.vimeo.com/video/657271778?h=9d1b742f0f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Gr_09_L02\"', '2021-12-16 07:59:35', 1),
(266, 70, 'Paid', '41', '356', 'Grade 9 - Lesson 02- à¶¯à·Šà·€à·’à¶¸à¶º à·ƒà¶‚à¶›à·Šâ€à¶ºà·-15th Dec', '365', 2, '757378.jpg', '\"https://player.vimeo.com/video/657271778?h=9d1b742f0f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Gr_09_L02\"', '2021-12-16 07:59:47', 1),
(271, 70, 'Paid', '42', '360', 'à¶´à¶»à·’à¶¸à·’à¶­à·’à¶º - 1st week', '365', 2, '693801.jpg', '\"https://player.vimeo.com/video/657699114?h=5eb3b0913c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade_10-_Lesson_01-à¶´à¶»à·’à¶¸à·’à¶­à·’à¶º_-_Part_01__1__AdobeCreativeCloudExpress\"', '2021-12-17 05:19:43', 1),
(267, 70, 'Paid', '41', '356', 'Grade 9 - Lesson 02- à¶¯à·Šà·€à·’à¶¸à¶º à·ƒà¶‚à¶›à·Šâ€à¶ºà·', '365', 2, '650138.jpg', '\"https://player.vimeo.com/video/657271778?h=9d1b742f0f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Gr_09_L02\"', '2021-12-16 07:59:58', 1),
(385, 68, 'Paid', '41', '377', 'Unit 01 - Applications of Micro - Organisms - Day 2 (15.12.2021)', '365', 2, '162635.jpg', '\"https://player.vimeo.com/video/657294303?h=6a4a12a7dc&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Applications of Micro - Organisms - Day 2 (16122021)\"', '2021-12-22 17:45:08', 1),
(272, 56, 'Paid', '40', '517', '1 Lesson - Binary to Decimal day 2 (16Dec2021)', '365', 2, '754820.jpg', 'https://drive.google.com/file/d/1mli07-2QBS2nV70QpTWPGd90-c0iW9Hc/view?usp=sharing', '2021-12-17 05:56:54', 1),
(269, 68, 'Paid', '42', '666', 'Structure of an atom, Atomic Number, Mass Number (15.12.2021)', '365', 2, '822448.jpg', '\"https://player.vimeo.com/video/657295206?h=4cc957f28c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Structure of an atom, Atomic Number, Mass Number (15122021)\"', '2021-12-16 08:00:17', 1),
(298, 64, 'Paid', '40', '550', 'Western Music December Week 2', '7', 2, '136225.jpg', '<div style=\"padding:53.97% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/657897674?h=88579c89b2&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1602433895\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-18 16:40:28', 1),
(299, 56, 'Paid', '39', '515', 'G7En_ICT_L2_OS_17Dec2021', '365', 2, '821900.jpg', '\"https://player.vimeo.com/video/658034838?h=2e9b5b175e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7E_L2_OS_17Dec2021\"', '2021-12-19 01:30:38', 1),
(300, 56, 'Paid', '42', '521', 'G10E_L1_ICT_18Dec2021', '365', 2, '9218.jpg', '\"https://player.vimeo.com/video/658233058?h=9ccecc8bd4&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10E_L1_ICT_18Dec2021\"', '2021-12-19 02:06:54', 1),
(304, 59, 'Paid', '43', '695', 'RP1 Accounting Equation & Double Entry System Day 1 (04.12.2021)', '365', 2, '846624.jpg', '\"https://player.vimeo.com/video/655033271?h=58e98282f8&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"RP1 Accounting Equation &amp;amp; Double Entry System Day 01 (04.12.2021)\"', '2021-12-19 04:03:37', 1),
(307, 59, 'Paid', '44', '761', 'RP1 Accounting Equation & Double Entry System Day 2 (10.12.2021)', '365', 2, '890999.jpg', '\"https://player.vimeo.com/video/655557259?h=af1a3aed5d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"RP1 Accounting Equation &amp;amp; Double Entry System Day 02 (10.12.2021)\"', '2021-12-19 04:10:22', 1),
(306, 59, 'Paid', '43', '695', 'RP1 Accounting Equation & Double Entry System Day 2 (10.12.2021)', '365', 2, '245113.jpg', '\"https://player.vimeo.com/video/655557259?h=af1a3aed5d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"RP1 Accounting Equation &amp;amp; Double Entry System Day 02 (10.12.2021)\"', '2021-12-19 04:08:55', 1),
(308, 59, 'Paid', '44', '761', 'RP1 Accounting Equation & Double Entry System Day 3 (17.12.2021)', '365', 2, '882911.jpg', '\"https://player.vimeo.com/video/658238982?h=c3beedddb6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"RP1 Accounting Equation &amp;amp; Double Entry System Day 03 (17.12.2021)\"', '2021-12-19 04:13:47', 1),
(309, 59, 'Paid', '43', '695', 'RP1 Accounting Equation & Double Entry System Day 3 (17.12.2021)', '365', 2, '790274.jpg', '\"https://player.vimeo.com/video/658238982?h=c3beedddb6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"RP1 Accounting Equation &amp;amp; Double Entry System Day 03 (17.12.2021)\"', '2021-12-19 04:15:07', 1),
(310, 59, 'Paid', '44', '761', 'RP1 Accounting Equation & Double Entry System Day 04 (18.12.2021)', '365', 2, '349558.jpg', '\"https://player.vimeo.com/video/658239643?h=a356e0fc33&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"RP1 Accounting Equation &amp;amp; Double Entry System Day 04 (18.12.2021)\"', '2021-12-19 04:19:19', 1),
(311, 59, 'Paid', '43', '695', 'RP1 Accounting Equation & Double Entry System Day4 (18.12.2021)', '365', 2, '773365.jpg', '\"https://player.vimeo.com/video/658239643?h=a356e0fc33&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"RP1 Accounting Equation &amp;amp; Double Entry System Day 04 (18.12.2021)\"', '2021-12-19 04:21:20', 1),
(312, 58, 'Paid', '42', '537', 'Background of Business - Day 02 (14.12.2021)', '365', 2, '729758.jpg', '\"https://player.vimeo.com/video/657800413?h=4f6825e9aa&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-14 Grade 10 Commerce Theory EM (Day 02 - 14122021)\"', '2021-12-19 13:26:05', 1),
(313, 58, 'Paid', '42', '537', 'Background of Business - Day 01 (07.12.2021)', '365', 2, '71935.jpg', '\"https://player.vimeo.com/video/657680769?h=1caadc3bb6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-07 Grade 10 Commerce EM - Theory (Day 01 - 07122021)\"', '2021-12-19 13:45:44', 1),
(314, 41, 'Paid', '40', '574', 'Dancing Grade 8 Lesson 1 (à¶šà·€à·’ à¶œà·à¶ºà¶±à¶º) 2021/12/10', '365', 2, '159118.jpeg', '\"https://player.vimeo.com/video/658311495?h=e8e3e4e528&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 8 Kavi Gayanaya\"', '2021-12-19 14:56:13', 1),
(315, 68, 'Paid', '40', '375', '01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Šâ€à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à·€à·à¶¯à¶œà¶­à·Šà¶šà¶¸ - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (2021.12.18)', '365', 2, '31879.jpg', '\"https://player.vimeo.com/video/658321111?h=16138f8fd8&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Š&amp;zwj;à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à·€à·à¶¯à¶œà¶­à·Šà¶šà¶¸ - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (202\"', '2021-12-19 15:02:56', 1),
(316, 68, 'Paid', '39', '371', '01 à¶´à·à¶©à¶¸ - à·à·à¶š à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (2021.12.18)', '365', 2, '873322.jpg', '\"https://player.vimeo.com/video/658321425?h=c11e2636f4&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à·à·à¶š à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (20211218)\"', '2021-12-19 15:06:10', 1),
(317, 68, 'Paid', '43', '387', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à·“ à¶´à¶§à¶š - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (2021.12.18)', '365', 2, '642176.jpg', '\"https://player.vimeo.com/video/658321710?h=fb27d5a9bb&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à·“ à¶´à¶§à¶š - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (20211218)\"', '2021-12-19 15:09:04', 1),
(447, 68, 'Paid', '44', '749', 'Structure of Matter - Day 2 (18.12.2021)', '365', 2, '832288.jpg', '\"https://player.vimeo.com/video/658326330?h=5fc3dbe951&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Structure of Matter - Day 3 (18122021)\"', '2021-12-04 03:41:19', 1),
(446, 68, 'Paid', '43', '667', 'Structure of Matter - Day 2 (18.12.2021)', '365', 2, '482107.jpg', '\"https://player.vimeo.com/video/658326330?h=5fc3dbe951&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Structure of Matter - Day 3 (18122021)\"', '2021-12-04 03:28:12', 1),
(320, 43, 'Paid', '43', '362', 'LESSON 1 PART 1  - 12TH DEC', '365', 2, '716102.jpg', '\"https://player.vimeo.com/video/658360893?h=2d424a4c6a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"GRADE 11 MATHS- LESSON 1\"', '2021-12-19 19:56:35', 1),
(321, 44, 'Free', '42', '680', 'Revision paper', '365', 2, '699092.png', 'https://vimeo.com/658131458', '2021-12-20 03:54:51', 1),
(322, 68, 'Paid', '44', '733', 'à¶­à¶»à¶‚à¶œ à·ƒà·„ à¶’à·€à·à¶ºà·š à¶ºà·™à¶¯à·“à¶¸à·Š - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ à·ƒà·„ à¶¢à·“à·€à·“ à¶´à¶§à¶š - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2021.12.19)', '365', 2, '905946.jpg', '\"https://player.vimeo.com/video/658467522?h=1eea9fdd96&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶­à¶»à¶‚à¶œ à·ƒà·„ à¶’à·€à·à¶ºà·š à¶ºà·™à¶¯à·“à¶¸à·Š - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ à·ƒà·„ à¶¢à·“à·€à·“ à¶´à¶§à¶š - à¶´à·…à¶¸\"', '2021-12-20 06:01:53', 1),
(323, 68, 'Paid', '44', '732', 'Waves and Their Applications - Day 3 & Living Tissues Day 1 (20.12.2021)', '365', 2, '690394.jpg', '\"https://player.vimeo.com/video/658467858?h=f55f2c530d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Waves and Their Applications - Day 3 &amp;amp; Living Tissues Day 1 (20122021)\"', '2021-12-20 06:06:08', 1),
(324, 68, 'Paid', '43', '386', 'Unit 01 - Living Tissues - Day 3 (19122021)', '365', 2, '287098.jpg', '\"https://player.vimeo.com/video/658468243?h=0e36efcb8a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Living Tissues - Day 3 (19122021)\"', '2021-12-20 06:10:55', 1),
(325, 68, 'Paid', '42', '382', 'Unit - 01 Chemical Basis of Life - Day 3 (19.12.2021)', '365', 2, '223472.jpg', '\"https://player.vimeo.com/video/658468843?h=bd8372b7c6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 3 (19122021)\"', '2021-12-20 06:13:25', 1),
(326, 68, 'Paid', '43', '669', 'à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Šâ€à¶ºà·–à·„à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20211219)', '365', 2, '157824.jpg', '\"https://player.vimeo.com/video/658469155?h=df7958100b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Š&amp;zwj;à¶ºà·–à·„à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20211219)\"', '2021-12-20 06:25:27', 1),
(327, 68, 'Paid', '44', '749', 'à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Šâ€à¶ºà·–à·„à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20211219)', '365', 2, '431841.jpg', '\"https://player.vimeo.com/video/658469155?h=df7958100b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Š&amp;zwj;à¶ºà·–à·„à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20211219)\"', '2021-12-20 06:26:14', 1),
(328, 70, 'Paid', '39', '348', 'à¶šà·”à¶½à¶š - 17 th December', '365', 2, '720762.jpg', '\"https://player.vimeo.com/video/658535637?h=795c513080&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7_Lesson2\">', '2021-12-20 11:01:13', 1),
(329, 70, 'Paid', '43', '679', 'Paper class -week 03', '365', 2, '875875.jpg', '\"https://player.vimeo.com/video/658537115?h=f42a0a8ae0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade11_paper_\"', '2021-12-20 11:04:59', 1),
(330, 70, 'Paid', '42', '360', 'à¶·à·à¶œ ', '365', 2, '413307.jpg', '\"https://player.vimeo.com/video/658537459?h=221e78117b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade10_L3\"', '2021-12-20 11:07:15', 1),
(331, 48, 'Paid', '43', '441', '10 à·€à·ƒà¶» à¶´à·…à¶¸à·” à¶´à·à¶©à¶¸ 01 à¶šà·œà¶§à·ƒ ', '365 ', 2, '820879.jpg', '\"https://player.vimeo.com/video/656815664?h=c63e71ad62&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1500392214\"', '2021-12-20 15:44:35', 1),
(332, 48, 'Paid', '43', '441', '10 à·€à·ƒà¶» à¶´à·…à¶¸à·” à¶´à·à¶©à¶¸ -2 à¶šà·œà¶§à·ƒ ', '365 ', 2, '363125.jpg', '\"https://player.vimeo.com/video/657912115?h=df195789bc&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1175821639\"', '2021-12-20 15:48:18', 1),
(353, 73, 'Free', '43', '430', 'Map Marking - Kandyan Kingdom', '365', 2, '343079.jpg', '\"https://player.vimeo.com/video/659078713?h=acafc235e0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Map marking - Kandyan Kingdo m\"', '2021-12-21 19:28:18', 1),
(352, 73, 'Paid', '43', '430', 'Chapter 02 -  Establishment of British Power in Sri Lanka - Part 1', '365', 2, '420495.jpg', '\"https://player.vimeo.com/video/659079412?h=80c7147b96&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 - Chapter 02 -I\"', '2021-12-21 19:24:21', 1),
(335, 73, 'Paid', '40', '436', '8 à·€à·ƒà¶» - 01 à¶´à·à¶©à¶¸ -III à¶šà·œà¶§à·ƒ', '365', 2, '855480.jpg', '\"https://player.vimeo.com/video/658701518?h=b9b61f9d4c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"8 à·€à·ƒà¶» - 01 à¶´à·à¶©à¶¸ -III à¶šà·œà¶§à·ƒ\"', '2021-12-20 19:06:54', 1),
(336, 73, 'Paid', '40', '436', '8 à·€à·ƒà¶» - 01 à¶´à·à¶©à¶¸ - II à¶šà·œà¶§à·ƒ', '365', 2, '906997.jpg', '\"https://player.vimeo.com/video/658701264?h=23d0d1ddd4&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"8 à·€à·ƒà¶» - 01 à¶´à·à¶©à¶¸ - II à¶šà·œà¶§à·ƒ\"', '2021-12-20 19:10:03', 1),
(337, 73, 'Paid', '40', '436', '8 à·€à·ƒà¶» - 01 à¶´à·à¶©à¶¸ - I à¶šà·œà¶§à·ƒ', '365', 2, '580366.jpg', '\"https://player.vimeo.com/video/658701004?h=ccb79da608&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"8 à·€à·ƒà¶» - 01 à¶´à·à¶©à¶¸ -I à¶šà·œà¶§à·ƒ\"', '2021-12-20 19:12:18', 1),
(338, 73, 'Paid', '40', '436', '8 à·€à·ƒà¶» - 01 à¶´à·à¶©à¶¸ - IVà¶šà·œà¶§à·ƒ', '365', 2, '523756.jpg', '\"https://player.vimeo.com/video/658701636?h=373fc47681&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"8 à·€à·ƒà¶» - 01 à¶´à·à¶©à¶¸ - IVà¶šà·œà¶§à·ƒ\"', '2021-12-20 19:14:33', 1),
(339, 58, 'Paid', '43', '543', 'à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à· - Day 01 (2021.12.10) 2022 Grade 11', '365', 2, '469855.jpg', '\"https://player.vimeo.com/video/658323098?h=ea6d955c34&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-10 Grade 11 Commerce 2022 SM (10122021) - Day 01\"', '2021-12-21 00:45:10', 1),
(340, 48, 'Paid', '39', '433', '01 à¶´à·à¶©à¶¸ - à¶…à¶´à·š à¶´à·à¶»à¶«à·’ à¶¢à¶± à¶¢à·“à·€à·’à¶­à¶º - 03 à·€à¶± à¶¯à·’à¶±à¶º 2021.12.20 ', '365 ', 2, '855323.jpg', '\"https://player.vimeo.com/video/658788376?h=f459b0f399&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1679692152\"', '2021-12-21 00:47:56', 1),
(341, 48, 'Paid', '39', '433', '01 à¶´à·à¶©à¶¸ à¶…à¶´à·š à¶´à·à¶»à¶«à·’ à¶¢à¶± à¶¢à·“à·€à·’à¶­à¶º  2021.12 .20 part 2', '365', 2, '77083.jpg', '\"https://player.vimeo.com/video/658789766?h=2244f232a1&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1978484202\"', '2021-12-21 00:51:15', 1),
(342, 58, 'Paid', '43', '543', 'à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à· Day 02 (17.12.2021) Grade 11 2022', '365', 2, '97979.jpg', '\"https://player.vimeo.com/video/658306096?h=86a112bd9a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-17 Grade 11 Commercec (Day 02 - à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à·) 17122021\"', '2021-12-21 00:53:53', 1),
(343, 48, 'Paid', '43', '441', '02 à·à·Šâ€à¶»à·“ à¶½à¶‚à¶šà·à·€à·š à¶¶à·Šâ€à¶»à·’à¶­à·à¶±à·Šâ€à¶º à¶¶à¶½à¶º à¶´à·’à·„à·’à¶§à·”à·€à·“à¶¸ - 01 à¶¯à·’à¶±à¶º  2021.12.20 ', '365 ', 2, '216897.jpg', '\"https://player.vimeo.com/video/658790568?h=f5e229c704&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1858149042\"', '2021-12-21 00:56:51', 1),
(344, 58, 'Paid', '44', '736', 'à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à· - Day 12 (15.12.2021) 2021 Grade 11 Morning Revision Class ', '365', 2, '843767.jpg', '\"https://player.vimeo.com/video/658434662?h=85702a9cfb&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-15  Garde11MorningRevisionClass (1stLesson-Day12)15122021\"', '2021-12-21 01:00:13', 1),
(345, 73, 'Free', '39', '434', '01 à¶´à·à¶©à¶¸ - à¶œà·œà¶© à¶œà·œà·€à·’à¶­à·à¶± à·„à·™à·€à¶­à·Š à·„à·šà¶±à·Š à¶œà·œà·€à·’à¶­à·à¶± ', '365', 2, '113792.jpg', '\"https://player.vimeo.com/video/658849292?h=987214f75a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"7 à·€à·ƒà¶» - 01 à¶´à·à¶©à¶¸ - Ià¶šà·œà¶§à·ƒ\"', '2021-12-21 06:25:09', 1),
(346, 73, 'Paid', '39', '434', '01 à¶´à·à¶©à¶¸ - à¶œà·œà¶© à¶œà·œà·€à·’à¶­à·à¶± à·„à·™à·€à¶­à·Š à·„à·šà¶±à·Š à¶œà·œà·€à·’à¶­à·à¶± - II', '365', 2, '938986.jpg', '\"https://player.vimeo.com/video/658849380?h=dc9f8391f0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"7 à·€à·ƒà¶» - 01 à¶´à·à¶©à¶¸ -  IIà¶šà·œà¶§à·ƒ\"', '2021-12-21 06:28:57', 1),
(347, 73, 'Paid', '39', '434', '01 à¶´à·à¶©à¶¸ - à¶œà·œà¶© à¶œà·œà·€à·’à¶­à·à¶± à·„à·™à·€à¶­à·Š à·„à·šà¶±à·Š à¶œà·œà·€à·’à¶­à·à¶± - III', '365', 2, '503892.jpg', '\"https://player.vimeo.com/video/658849503?h=7c84d3d084&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"7 à·€à·ƒà¶» - 01 à¶´à·à¶©à¶¸ -  III à¶šà·œà¶§à·ƒ\"', '2021-12-21 06:30:56', 1),
(348, 58, 'Paid', '43', '543', 'à¶¶à·à¶‚à¶šà·” à¶œà·’à¶«à·”à¶¸ (2021 Grade 10 - Day 05) 2021.12.19', '365', 2, '318666.jpg', '\"https://player.vimeo.com/video/658939862?h=868409fb97&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-19 Grade 10 Commerce Thoery - 19122021\"', '2021-12-21 14:53:44', 1),
(349, 58, 'Paid', '44', '736', 'à¶¶à·à¶‚à¶šà·” à¶œà·’à¶«à·”à¶¸ (2021 Grade 10 - Day 05) 2021.12.19', '365', 2, '877672.jpg', '\"https://player.vimeo.com/video/658939862?h=868409fb97&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-19 Grade 10 Commerce Thoery - 19122021\"', '2021-12-21 14:55:00', 1),
(350, 58, 'Paid', '44', '736', 'à·€à·Šâ€à¶ºà·à¶´à·à¶»à¶ºà¶š à¶¸à·”à¶½à·Šâ€à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶± - à¶…à¶·à·Šâ€à¶ºà·à·ƒ (2021 Grade 11 - Day 13) 2021.12.19', '365', 2, '987575.jpg', '\"https://player.vimeo.com/video/658578643?h=54eb46a465&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-19  Grade 11 Theory - 19122021 (à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶»à¶ºà¶š à¶…à·€à·ƒà·à¶± à¶¸à·”à¶½à·Š&amp;zwj;à¶º à¶´à·Š&amp;zwj;à¶»à¶šà·à·\"', '2021-12-21 14:59:38', 1),
(351, 58, 'Paid', '42', '537', 'Grade 10 Commerce EM - Heshan Sir (Day 03 - 21.12.2021) Background of Business', '365', 2, '973146.jpg', '\"https://player.vimeo.com/video/658996421?h=8c3b35b4ac&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-21 Grade 10 Commerce EM - Heshan Sir (Day 03 - 21122021) Background of Business\"', '2021-12-21 17:01:06', 1),
(354, 73, 'Paid', '43', '430', 'Map marking - Kingdoms ', '365', 2, '689469.jpg', '\"https://player.vimeo.com/video/659079269?h=84685e918f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"MAPMARKING -Kingdoms\"', '2021-12-21 19:30:48', 1),
(355, 73, 'Paid', '43', '430', 'Chapter 9 - Part 1 - Grade 10 Revision with Map Marking', '365', 2, '489618.jpg', '\"https://player.vimeo.com/video/659078884?h=947573b263&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Chapter 9 - Part I\"', '2021-12-21 19:33:17', 1),
(356, 73, 'Paid', '43', '430', 'Chapter 9 - Part I Grade 10 Revision ', '365', 2, '771476.jpg', '\"https://player.vimeo.com/video/659079073?h=e81875f9d9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Chapter 9 - Part 2\"', '2021-12-21 19:37:34', 1),
(357, 43, 'Paid', '39', '346', 'GRADE 7 - LESSON 1 PART 1 ', '365', 2, '405034.jpg', '\"https://player.vimeo.com/video/659066788?h=7438d73fc0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"GRADE 7 MATHS - LESSON 1\"', '2021-12-21 20:41:11', 1),
(358, 68, 'Paid', '40', '373', 'Unit 01 - Importance of Micro Organisms - Day 3 (20.12.2021)', '365', 2, '886457.jpg', '\"https://player.vimeo.com/video/659186209?h=6c50b9f67b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Importance of Micro Organisms - Day 3 (20122021)\"', '2021-12-22 03:40:40', 1),
(359, 68, 'Paid', '39', '369', 'UNIT 01 - Plant Diversity - Day 3 (21.12.2021)', '365', 2, '323433.jpg', '\"https://player.vimeo.com/video/659186800?h=e876665a52&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"UNIT 01 - Plant Diversity - Day 3 (21122021)\"', '2021-12-22 03:42:28', 1),
(360, 68, 'Paid', '42', '668', 'à·ƒà¶¸à·ƒà·Šà¶®à·à¶±à·’à¶š , à¶…à¶ºà¶± (2021.12.21)', '365', 2, '467873.jpg', '\"https://player.vimeo.com/video/659187087?h=27f0a71973&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà¶¸à·ƒà·Šà¶®à·à¶±à·’à¶š , à¶…à¶ºà¶± (20211221)\"', '2021-12-22 03:46:11', 1),
(361, 68, 'Paid', '43', '386', 'Grade 10 | Unit - 01 Chemical Basis of Life - Day 1 (05.12.2021)', '365', 2, '498359.jpg', '\"https://player.vimeo.com/video/654994173?h=12dc739995&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Science EM Abhiman Sir 1\"', '2021-12-22 03:54:50', 1),
(448, 68, 'Paid', '43', '667', 'GRADE 10 Structure of an atom, Atomic Number, Mass Number (15.12.2021)', '365', 2, '510588.jpg', '\"https://player.vimeo.com/video/657295206?h=4cc957f28c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Structure of an atom, Atomic Number, Mass Number (15122021)\"', '2021-12-04 03:49:56', 1),
(375, 68, 'Paid', '43', '387', 'Grade 10 | 01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2021.12.04)', '365', 2, '543829.jpg', '\"https://player.vimeo.com/video/654986525?h=ea8ade3221&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10 SM Theory Abhiman Sir 1\"', '2021-12-22 05:02:58', 1),
(373, 68, 'Paid', '43', '667', 'Grade 10 | About Elements, Compounds, Periodic Table and Solving Equations (08.12.2021)', '365', 2, '265857.jpg', '\"https://player.vimeo.com/video/654995244?h=04aa548692&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10 Paper Revision EM Abhiman Sir 1\"', '2021-12-22 04:59:47', 1),
(371, 68, 'Paid', '43', '386', 'Grade 10 | Unit - 01 Chemical Basis of Life - Day 2 (12.12.2021)', '365', 2, '664107.jpg', '\"https://player.vimeo.com/video/656519611?h=3ade3adc0d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 02 (12122021)\"', '2021-12-22 04:56:42', 1),
(372, 68, 'Paid', '43', '386', 'Grade 10 | Unit - 01 Chemical Basis of Life - Day 3 (19.12.2021)', '365', 2, '860824.jpg', '\"https://player.vimeo.com/video/658468843?h=bd8372b7c6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 3 (19122021)\"', '2021-12-22 04:58:04', 1),
(376, 68, 'Paid', '43', '387', 'Grade 10 | 01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2021.12.11)', '365', 2, '416756.jpg', '\"https://player.vimeo.com/video/656497033?h=cae4209395&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20211211)\"', '2021-12-22 05:04:20', 1),
(377, 68, 'Paid', '43', '387', 'Grade 10 | 01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (2021.12.18)', '365', 2, '818152.jpg', '\"https://player.vimeo.com/video/658070257?h=583c5f17e1&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (20211218)\"', '2021-12-22 05:06:34', 1),
(378, 68, 'Paid', '43', '669', 'Grade 10 | à¶¸à·–à¶½à¶¯à·Šâ€à¶»à·€à·Šâ€à¶º , à·ƒà¶‚à¶ºà·à¶œ , à¶†à·€à¶»à·Šà¶®à·’à¶­à· à·€à¶œà·”à·€ , à·ƒà¶¸à·“à¶šà¶»à¶« à¶·à·à·€à·’à¶­à¶ºà·™à¶±à·Š à¶œà·à¶§à¶½à·” à·€à·’à·ƒà¶¯à·“à¶¸ (2021.12.07)', '365', 2, '21179.jpg', '\"https://player.vimeo.com/video/655000947?h=32052c9af2&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Paper Revision SM Abhiman Sir 1\"', '2021-12-22 05:08:27', 1),
(379, 68, 'Paid', '43', '669', 'Grade 10 | à¶´à¶»à¶¸à·à¶«à·”à·€à¶š à·€à·Šâ€à¶ºà·–à·„à¶º, à¶´à¶»à¶¸à·à¶«à·”à¶š à¶šà·Šâ€à¶»à¶¸à·à¶‚à¶šà¶º, à·ƒà·Šà¶šà¶±à·Šà¶° à¶šà·Šâ€à¶»à¶¸à·à¶‚à¶šà¶º (2021.12.14)', '365', 2, '673626.jpg', '\"https://player.vimeo.com/video/656875168?h=320b639566&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à¶»à¶¸à·à¶«à·”à·€à¶š à·€à·Š&amp;zwj;à¶ºà·–à·„à¶º, à¶´à¶»à¶¸à·à¶«à·”à¶š à¶šà·Š&amp;zwj;à¶»à¶¸à·à¶‚à¶šà¶º, à·ƒà·Šà¶šà¶±à·Šà¶° à¶šà·Š&amp;zwj;\"', '2021-12-22 05:11:18', 1),
(380, 68, 'Paid', '43', '669', 'Grade 10 | à·ƒà¶¸à·ƒà·Šà¶®à·à¶±à·’à¶š , à¶…à¶ºà¶± (2021.12.21)', '365', 2, '270535.jpg', '\"https://player.vimeo.com/video/659187087?h=27f0a71973&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà¶¸à·ƒà·Šà¶®à·à¶±à·’à¶š , à¶…à¶ºà¶± (20211221)\"', '2021-12-22 05:13:33', 1),
(381, 44, 'Free', '40', '406', 'Tenses', '365', 2, '247059.png', 'https://vimeo.com/658455065', '2021-12-22 05:59:24', 1),
(382, 44, 'Free', '43', '681', '2021 O/L paper ', '365', 2, '856782.png', 'https://vimeo.com/659211354', '2021-12-22 06:25:25', 1),
(383, 58, 'Paid', '44', '736', 'Garde 11 Commerce Morning Revision Class (1st Lesson- Day13) 2021-12-22 ', '365', 2, '123612.jpg', '\"https://player.vimeo.com/video/659167779?h=9cb2f5f4fe&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-22 Garde 11 Commerce Morning Revision Class (1st Lesson- Day13) 22122021 -Heshan Sir\"', '2021-12-22 13:02:47', 1),
(384, 48, 'Paid', '40', '435', '01 à¶´à·à¶©à¶¸ - 8 à·à·Šâ€à¶»à·šà¶«à·’à¶º  03 à·€à¶± à¶¯à·’à¶±à¶º ', '365', 2, '750232.jpg', '\"https://player.vimeo.com/video/659366697?h=3ffba76c5d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1567778515\"', '2021-12-22 16:39:36', 1),
(386, 68, 'Paid', '41', '377', 'Unit 01 - Applications of Micro - Organisms - Day 3 (22.12.2021)', '365', 2, '351644.jpg', '\"https://player.vimeo.com/video/659540046?h=bad4682fe3&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Applications of Micro - Organisms - Day 3 (22122021)\"', '2021-12-23 05:04:05', 1),
(387, 68, 'Paid', '42', '666', 'ISOTOPES, IONS (22.12.2021)', '365', 2, '295663.jpg', '\"https://player.vimeo.com/video/659540463?h=a24a6cd0d0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"ISOTOPES, IONS (22122021)\"', '2021-12-23 05:07:15', 1),
(388, 68, 'Paid', '43', '667', 'Grade 10 | ISOTOPES, IONS (22.12.2021)', '365', 2, '537075.jpg', '\"https://player.vimeo.com/video/659540463?h=a24a6cd0d0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"ISOTOPES, IONS (22122021)\"', '2021-12-23 05:09:03', 1),
(389, 64, 'Paid', '38', '546', 'Western Music Grade December Week 3', '7', 2, '484227.jpg', '<div style=\"padding:52.71% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/659841912?h=4e8617d42d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1676123437\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-24 04:46:54', 1),
(390, 64, 'Paid', '39', '548', 'Western Music December Week 3', '7', 2, '769456.jpg', '<div style=\"padding:53.97% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/659652431?h=fcfc8dc073&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1388243547\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-24 04:50:33', 1),
(391, 64, 'Paid', '43', '592', 'Western Music December Week 3', '7', 2, '931444.jpg', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/659653689?h=0cce7f0f6b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1739120813\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-24 04:53:45', 1),
(392, 58, 'Paid', '43', '543', 'Grade 11 Commerce Sinhala Medium - à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à·  (Day 03 - 24.12,2021)', '365', 2, '745700.jpg', '\"https://player.vimeo.com/video/659948564?h=48b3a91259&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-24 Grade 11 Commerce Sinhala Medium - Heshan Sir (Day 03 - 24122021) à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·š\"', '2021-12-24 17:39:03', 1),
(393, 43, 'Paid', '41', '407', 'GRADE 9- ENGLISH LANGUAGE- WEEK 2 - LESSON 1', '365', 2, '886945.jpg', '\"https://player.vimeo.com/video/660086285?h=029b873192&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"GRADE 9- ENGLISH WEEK 2\"', '2021-12-25 12:56:03', 1),
(394, 43, 'Paid', '39', '403', 'GRADE 7 -ENGLISH LAN- WEEK 2 ', '365', 2, '116547.jpg', '\"https://player.vimeo.com/video/660088461?h=27ff543856&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"GRADE 07-ENGLISH LANGUAGE- WEEK 2\"', '2021-12-25 13:22:01', 1),
(395, 64, 'Paid', '40', '550', 'Western Music December Week 3', '7', 2, '389978.jpg', '<div style=\"padding:53.97% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/660164928?h=f00d44ce43&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1960270464\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2021-12-26 03:39:31', 1),
(396, 51, 'Paid', '40', '460', 'à¶´à·œà¶¯à·” à·ƒà·šà·€à· 2021.12.04 part  1', '365', 2, '110764.jpg', '\"https://player.vimeo.com/video/660172568?h=24fd3d8ac7&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"zoom_0\"', '2021-12-26 05:46:27', 1),
(397, 51, 'Paid', '40', '460', 'à¶´à·œà¶¯à·” à·ƒà·šà·€à· 2021.12.26 part  2', '365', 2, '449654.jpg', '\"https://player.vimeo.com/video/660177921?h=61952852ab&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à·œà¶¯à·” à·ƒà·šà·€à· PART 2\"', '2021-12-26 06:38:47', 1),
(398, 51, 'Paid', '39', '458', 'à¶…à¶´à·š à¶´à·€à·”à¶½ PART  1  09.12.12', '365', 2, '191088.jpg', '\"https://player.vimeo.com/video/660181698?h=ac7a60d2ff&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7 à¶…à¶´à·š à¶´à·€à·”à¶½ PART 1\"', '2021-12-26 07:32:55', 1),
(399, 58, 'Paid', '43', '691', 'Grade 10 Morning Revision Class - à·€à·Šâ€à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 02 - 25.12.2021)', '365', 2, '132763.jpg', '\"https://player.vimeo.com/video/660198158?h=8588942824&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-25 Grade 10 Morning Revision Class - à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 02 - 25122021)\"', '2021-12-26 13:33:10', 1),
(400, 58, 'Paid', '44', '736', 'Grade 10 Morning Revision Class - à·€à·Šâ€à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 02 - 25.12.2021)', '365', 2, '254571.jpg', '\"https://player.vimeo.com/video/660198158?h=8588942824&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-25 Grade 10 Morning Revision Class - à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 02 - 25122021)\"', '2021-12-26 13:34:43', 1),
(401, 58, 'Paid', '43', '543', 'à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (Day 01 -26.12.2021) Grade 10 (2021)', '365', 2, '879261.jpg', '\"https://player.vimeo.com/video/660208675?h=1d42bfdcab&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-26 à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (Day 01 -26122021) Grade 10 (2021)\"', '2021-12-26 13:38:00', 1),
(402, 58, 'Paid', '44', '736', 'à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (Day 01 -26.12.2021) Grade 10 (2021)', '365', 2, '539583.jpg', '\"https://player.vimeo.com/video/660208675?h=1d42bfdcab&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-26 à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (Day 01 -26122021) Grade 10 (2021)\"', '2021-12-26 13:39:45', 1),
(403, 58, 'Paid', '44', '736', 'à¶œà·à¶½à¶´à·”à¶¸à·Š à·ƒà¶§à·„à¶±à·Š à·ƒà·„à·’à¶­ à¶¸à·”à¶½à·Šâ€à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶±  (Day 01 -26.12.2021) Grade 11 (2021)', '365', 2, '161613.jpg', '\"https://player.vimeo.com/video/660211550?h=1fc628f1e4&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-26 à¶œà·à¶½à¶´à·”à¶¸à·Š à·ƒà¶§à·„à¶±à·Š à·ƒà·„à·’à¶­ à¶¸à·”à¶½à·Š&amp;zwj;à¶º à¶´à·Š&amp;zwj;à¶»à¶šà·à·à¶±  (Day 01 -26122021) Gr\"', '2021-12-26 13:42:22', 1),
(404, 51, 'Paid', '41', '462', 'à·ƒà¶¸à·à¶¢ à·ƒà·”à¶»à¶šà·Šà·‚à·’à¶­à¶­à·à·€à¶º part  1     10/12/2021', '365', 2, '951939.jpg', '\"https://player.vimeo.com/video/660299616?h=b6754dbc2f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà¶¸à·à¶¢ à·ƒà·”à¶»à¶šà·Šà·‚à·’à¶­à¶­à·à·€à¶º part  1\"', '2021-12-27 02:49:16', 1),
(405, 51, 'Paid', '41', '462', 'à·ƒà¶¸à·à¶¢ à·ƒà·”à¶»à¶šà·Šà·‚à·’à¶­à¶­à·à·€à¶º part  2     24/12/2021', '365', 2, '866417.jpg', '\"https://player.vimeo.com/video/660305963?h=3517cf95d6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà¶¸à·à¶¢ à·ƒà·”à¶»à¶šà·Šà·‚à·’à¶­à¶­à·à·€à¶º part  2\"', '2021-12-27 02:52:53', 1),
(406, 48, 'Paid', '42', '439', '02 à·€à¶± à¶´à·à¶©à¶¸ à¶´à·…à¶¸à·” à¶¯à·’à¶±à¶º ', '365 ', 2, '158918.jpg', '\"https://player.vimeo.com/video/660423000?h=e19c6f72cd&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1654313704\">', '2021-12-27 14:42:13', 1);
INSERT INTO `lmslesson` (`lid`, `tid`, `type`, `class`, `subject`, `title`, `available_days`, `no_of_views_per_day`, `cover`, `video`, `add_date`, `status`) VALUES
(407, 48, 'Paid', '43', '441', '10 à·à·Šâ€à¶»à·šà¶«à·’à¶º à¶´à·”à¶±à¶»à·“à¶šà·Šà·‚à¶«à¶º 02 à·€à¶± à¶´à·à¶©à¶¸ ', '365 ', 2, '169313.jpg', '\"https://player.vimeo.com/video/660423000?h=e19c6f72cd&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1654313704\">', '2021-12-27 14:43:52', 1),
(408, 73, 'Paid', '40', '436', 'à¶‡à·… à¶¸à·à¶»à·Šà¶œ à·ƒà·„ à¶´à·œà¶šà·”à¶«à·” à¶­à·à¶±à·“à¶¸ ', '365', 2, '84202.jpg', '\"https://player.vimeo.com/video/660573375?h=719e17aa72&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"1227\"', '2021-12-28 05:04:57', 1),
(409, 73, 'Paid', '39', '434', 'à¶¸à¶© à¶œà·œà·€à·™à¶­à·à¶± à·ƒà·„ à·ƒà¶­à·Šà·€ à¶´à·à¶½à¶±à¶º - I', '365', 2, '362765.jpg', 'https://player.vimeo.com/video/660574545?h=6acd8936e5&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G 7 - 1\"', '2021-12-28 05:11:08', 1),
(410, 73, 'Paid', '39', '434', 'à¶¸à¶© à¶œà·œà·€à·’à¶­à·à¶± à·ƒà·„ à·ƒà¶­à·Šà·€ à¶´à·à¶½à¶±à¶º  -II', '365', 2, '948738.jpg', 'https://player.vimeo.com/video/660574838?h=94e9686414&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7 - 2\"', '2021-12-28 05:13:41', 1),
(411, 70, 'Paid', '43', '364', 'à¶¯à¶»à·Šà·à¶š à·„à· à¶½à¶à·”à¶œà¶«à¶š - I', '365', 2, '306269.jpg', '\"https://player.vimeo.com/video/660580924?h=3fe5a4a72f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade11_l2\"', '2021-12-28 05:53:14', 1),
(412, 70, 'Paid', '40', '352', 'à¶šà·à¶« -II', '365', 2, '413233.jpg', '\"https://player.vimeo.com/video/660582144?h=9a19d4bac1&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade8L3_2\"', '2021-12-28 06:54:43', 1),
(413, 58, 'Paid', '43', '543', 'Extra Class - à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (Day 02 -27.12.2021) Grade 10 (2021)', '365', 2, '486280.jpg', '\"https://player.vimeo.com/video/660533386?h=afcaf1e65b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-27 Extra Class - à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (Day 02 -27122021) Grade 10 (202\"', '2021-12-29 01:21:53', 1),
(414, 58, 'Paid', '44', '736', 'Extra Class - à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (Day 02 -27.12.2021) Grade 10 (2021)', '365', 2, '130486.jpg', '\"https://player.vimeo.com/video/660533386?h=afcaf1e65b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-27 Extra Class - à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (Day 02 -27122021) Grade 10 (202\"', '2021-12-29 01:22:39', 1),
(415, 58, 'Paid', '42', '537', 'Grade 10 Commerce EM - Heshan Sir (Day 04 - 28.12.2021) Background of Business', '365', 2, '391613.jpg', '\"https://player.vimeo.com/video/660670166?h=8a5f451ab0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-28 Grade 10 Commerce EM - Heshan Sir (Day 04 - 28122021) Background of Business\"', '2021-12-29 01:24:02', 1),
(416, 51, 'Paid', '40', '460', 'à¶´à·œà¶¯à·” à·ƒà·šà·€à· PART  3         29/12/2021', '365', 2, '524152.jpg', '\"https://player.vimeo.com/video/661067301?h=9939a0da68&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à·œà¶¯à·”  à·ƒà·šà·€à· part 3\"', '2021-12-30 01:45:03', 1),
(417, 56, 'Paid', '39', '527', 'G7 ICT Sinhala medium - Lesson 2 - O/S 2nd day 29thDec2021', '365', 2, '254036.jpg', '\"https://player.vimeo.com/video/661076124?h=d426b76300&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7S_L2_OS_2ndDay_29Dec21\"', '2021-12-30 02:24:20', 1),
(418, 51, 'Paid', '41', '462', 'à·ƒà¶¸à·à¶¢ à·ƒà·”à¶»à¶šà·Šà·‚à·’à¶­à¶­à·à·€ part 3     28/12/2021', '365', 2, '554513.jpg', '\"https://player.vimeo.com/video/661073079?h=5f869f76ca&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà¶¸à·à¶¢ à·ƒà·”à¶»à¶šà·Šà·‚à·’à¶­à¶­à·à·€ part 3\"', '2021-12-30 02:24:57', 1),
(419, 56, 'Paid', '41', '531', 'G9 Sinhala Medium - L1_Specification_2ndDay 29Dec2021', '365', 2, '545051.jpg', '\"https://player.vimeo.com/video/661076196?h=7c600ab49e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9S_L1_Specification_2ndDay_29Dec2021\"', '2021-12-30 02:28:01', 1),
(420, 70, 'Paid', '39', '348', 'à¶´à·–à¶»à·Šà¶« à·ƒà¶‚à¶›à·Šâ€à¶ºà· à¶¸à¶­ à¶œà¶«à·’à¶­ à¶šà¶»à·Šà¶¸ ', '365', 2, '316237.jpg', '\"https://player.vimeo.com/video/660583026?h=735782eeae&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7_L3\"', '2021-12-30 06:42:00', 1),
(421, 55, 'Paid', '39', '493', 'Lesson 1- Health promotion- 2021/12/15', '365', 2, '960261.jpg', '\"https://player.vimeo.com/video/661315944?h=d8dd72c917&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1846847838\"', '2021-12-31 00:22:39', 1),
(422, 56, 'Paid', '41', '519', 'G9 EM L2.Excel day 1 at 30th Dec 2021', '365', 2, '400212.jpg', '\"https://player.vimeo.com/video/661333463?h=1a22ed3ffe&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9E_L2_Excel_30Dec2021\"', '2021-12-31 01:59:58', 1),
(423, 56, 'Paid', '40', '517', 'G8 EM L2.Configure & Format day 1 30th Dec 2021', '365', 2, '145335.jpg', '\"https://player.vimeo.com/video/661333309?h=b50bf3b733&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G8E_L2_Config&amp;amp;Format_30Dec2021\"', '2021-12-31 02:06:29', 1),
(424, 70, 'Paid', '43', '364', 'à¶¯à¶»à·Šà·à¶š à·„à· à¶½à¶à·”à¶œà¶«à¶š - 2 à¶šà·œà¶§à·ƒ (à¶½à¶à·”à¶œà¶«à¶š à¶±à·“à¶­à·“ )', '365', 2, '423119.jpg', '\"https://player.vimeo.com/video/661346991?h=6d0e7711eb&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11\"', '2021-12-31 03:51:08', 1),
(425, 70, 'Paid', '42', '360', 'à¶¯à·Šà·€à·’à¶´à¶¯ à¶´à·Šâ€à¶»à¶šà·à·à¶± ', '365', 2, '382971.jpg', '\"https://player.vimeo.com/video/661347145?h=6953d013cb&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10_L4\"', '2021-12-31 03:54:17', 1),
(426, 70, 'Paid', '42', '678', 'Grade 10-Paper class- Week 04-Dec', '365', 2, '480410.jpg', '\"https://player.vimeo.com/video/661347255?h=da50751605&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10_P1\"', '2021-12-31 09:05:24', 1),
(427, 70, 'Paid', '41', '356', 'à¶·à·à¶œ (4th week_Dec)', '365', 2, '418507.jpg', '\"https://player.vimeo.com/video/661347388?h=34fd09950b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9_L3\"', '2021-12-31 09:07:34', 1),
(428, 58, 'Paid', '43', '543', 'Grade 11 Commerce SM - Day 04 (à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à·) 31.12.2021', '365', 2, '688453.jpg', '\"https://player.vimeo.com/video/661446503?h=091c6ad00f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-31 Grade 11 Commerce SM - Day 04 (à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à·) 31122021\"', '2021-12-31 17:17:21', 1),
(429, 53, 'Paid', '41', '485', 'Lesson 01 (part 01) 21-12-14', '365', 2, '683565.jpg', '\"https://player.vimeo.com/video/661472285?h=6f1ffe8922&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G 09 date 12-14 part 01\"', '2021-11-30 19:05:38', 1),
(430, 53, 'Paid', '41', '485', 'Lesson 01 (part 02) 21-12-14', '365', 2, '85747.jpg', '\"https://player.vimeo.com/video/661475265?h=4110868337&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G 09 date 12-14 part 02\"', '2021-11-30 19:11:15', 1),
(431, 53, 'Paid', '41', '485', 'Lesson 01 (part 03) 21-12-14', '365', 2, '278932.jpg', '\"https://player.vimeo.com/video/661477569?h=d4b560b6aa&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G 09 date 12-14 part 03\"', '2021-11-30 19:14:31', 1),
(432, 56, 'Paid', '39', '515', 'G7 English Medium L.2.Operating System 2ndDay 31stDec2021', '365', 2, '131048.jpg', '\"https://player.vimeo.com/video/661535259?h=5772d063e9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7E_L2_OS_2ndDay_31Dec21\"', '2021-12-01 02:43:29', 1),
(433, 59, 'Paid', '42', '538', 'Background of Business Day 3 (24.12.2021)', '365', 2, '40534.jpg', '\"https://player.vimeo.com/video/661333535?h=220659b56d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Chapter 01 Background of Business Day 3 (24.12.2021)\"', '2022-12-02 02:44:45', 1),
(434, 59, 'Paid', '42', '538', 'Chapter 2 Background of Business Day 01 (31.12.2021)', '365', 2, '344670.jpg', '\"https://player.vimeo.com/video/661670788?h=860f33ca1d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Chapter 2 Background of Business Day 01 (31122021)\"', '2022-12-02 03:31:41', 1),
(435, 51, 'Paid', '41', '462', 'à·ƒà¶¸à·à¶¢ à·ƒà·”à¶»à¶šà·Šà·‚à·’à¶­à¶­à·à·€ part 4      31/04/2021', '365', 2, '910.jpg', '\"https://player.vimeo.com/video/661672378?h=bad212d557&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà¶¸à·à¶¢ à·ƒà·”à¶»à¶šà·Šà·‚à·’à¶­à¶­à·à·€à¶º part 4\"', '2022-01-02 03:52:09', 1),
(436, 51, 'Paid', '40', '460', 'à¶´à·œà¶¯à·” à·ƒà·šà·€à· PART 4   31/12/2021', '365', 2, '350473.jpg', '\"https://player.vimeo.com/video/661671030?h=2572f0d5a9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à·œà¶¯à·” à·ƒà·šà·€à· PART 4\"', '2022-01-02 03:56:29', 1),
(437, 51, 'Paid', '39', '458', 'à¶…à¶´à·š à¶´à·€à·”à¶½ part 2(i )     23/12/2021', '365', 2, '663185.jpg', 'https://player.vimeo.com/video/661670441?h=1e53cc3d4e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶…à¶´à·š à¶´à·€à·”à¶½ part 2(i )', '2022-01-02 03:59:43', 1),
(438, 51, 'Paid', '39', '458', 'à¶…à¶´à·š à¶´à·€à·”à¶½ part 2(ii)    23/12/2021', '365', 2, '745186.jpg', 'https://player.vimeo.com/video/661676918?h=597c82251b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶…à¶´à·š à¶´à·€à·”à¶½ part 2(ii )', '2022-01-02 04:30:44', 1),
(442, 44, 'Paid', '39', '404', 'How to write an essay', '365', 2, '577267.png', 'https://vimeo.com/661738481', '2022-01-02 15:00:04', 1),
(443, 58, 'Free', '43', '543', ' Grade 10 Commerce (2021) - 02.01.2022 (à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ à·ƒà·„ à¶¶à·à¶‚à¶šà·” à¶œà·’à¶«à·”à¶¸ Unit 08 â€“ Day  03)', '365', 2, '375378.jpg', '\"https://player.vimeo.com/video/661721899?h=c4d6d9549b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-02 Grade 10 Commerce - 02012022 (à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ à·ƒà·„ à¶¶à·à¶‚\"', '2022-01-04 01:16:43', 1),
(441, 44, 'Paid', '40', '406', 'Monthly test paper discussion', '365', 2, '301979.png', 'https://vimeo.com/661732574', '2022-01-02 14:45:49', 1),
(444, 58, 'Free', '44', '736', 'Grade 10 Commerce (2021) - 02.01.2022 (à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ à·ƒà·„ à¶¶à·à¶‚à¶šà·” à¶œà·’à¶«à·”à¶¸ Unit 08 â€“ Day  03)', '365', 2, '344172.jpg', '\"https://player.vimeo.com/video/661721899?h=c4d6d9549b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-02 Grade 10 Commerce - 02012022 (à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ à·ƒà·„ à¶¶à·à¶‚\"', '2022-01-04 01:19:29', 1),
(445, 58, 'Free', '44', '736', 'Grade 11 Commerce (2021) - 02.01.2022 (à¶œà·à¶½à¶´à·”à¶¸à·Š à·ƒà¶§à·„à¶±à·Š à·ƒà·„à·’à¶­ à¶¸à·”à¶½à·Šâ€à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶±  Unit 05 - Day 02)', '365', 2, '276873.jpg', '\"https://player.vimeo.com/video/661725284?h=58d06e7eb1&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-02 Grade 11 Commerce - 02012022 (à¶œà·à¶½à¶´à·”à¶¸à·Š à·ƒà¶§à·„à¶±à·Š à·ƒà·„à·’à¶­ à¶¸à·”à¶½à·Š&amp;zwj;à¶º à¶´à·Š&amp;zwj;à¶»à¶š\"', '2022-01-04 01:21:49', 1),
(449, 68, 'Paid', '42', '383', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.01)', '365', 2, '986170.jpg', '\"https://player.vimeo.com/video/662154509?h=5f551fd15a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (20220101)\"', '2022-01-04 05:25:48', 1),
(450, 68, 'Paid', '43', '387', 'Grade 10 | 01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.01)', '365', 2, '353588.jpg', '\"https://player.vimeo.com/video/662154509?h=5f551fd15a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (20220101)\"', '2022-01-04 05:30:22', 1),
(451, 68, 'Paid', '41', '379', '01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Šâ€à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.01)', '365', 2, '885641.jpg', '\"https://player.vimeo.com/video/662155340?h=83f95a7817&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Š&amp;zwj;à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (20220101)\"', '2022-01-04 05:35:18', 1),
(452, 68, 'Paid', '40', '375', '01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Šâ€à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à·€à·à¶¯à¶œà¶­à·Šà¶šà¶¸ - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.01)', '365', 2, '260790.jpg', '\"https://player.vimeo.com/video/662155596?h=a2dcf5746f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Š&amp;zwj;à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à·€à·à¶¯à¶œà¶­à·Šà¶šà¶¸ - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (202\"', '2022-01-04 05:41:11', 1),
(453, 68, 'Paid', '40', '375', '02 à¶´à·à¶©à¶¸ - à·ƒà¶­à·Šà¶­à·Šà·€ à·€à¶»à·Šà¶œà·“à¶šà¶»à¶«à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.01)', '365', 2, '145713.jpg', '\"https://player.vimeo.com/video/662155721?h=05d308600e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"02 à¶´à·à¶©à¶¸ - à·ƒà¶­à·Šà¶­à·Šà·€ à·€à¶»à·Šà¶œà·“à¶šà¶»à¶«à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220101)\"', '2022-01-04 05:42:29', 1),
(454, 68, 'Paid', '39', '371', '01 à¶´à·à¶©à¶¸ - à·à·à¶š à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.01)', '365', 2, '602821.jpg', '\"https://player.vimeo.com/video/662156151?h=e1605c6b01&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à·à·à¶š à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (20220101)\"', '2022-01-04 05:47:49', 1),
(455, 68, 'Paid', '43', '387', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à·“ à¶´à¶§à¶š - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.01)', '365', 2, '362439.jpg', '\"https://player.vimeo.com/video/662156656?h=04d0cd90f8&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à·“ à¶´à¶§à¶š - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (20220101)\"', '2022-01-04 05:52:43', 1),
(456, 68, 'Paid', '43', '667', 'Structure of Matter - Day 3 (01.01.2022)', '365', 2, '651554.jpg', '\"https://player.vimeo.com/video/662157315?h=e868a2527d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Structure of Matter - Day 3 (01012022)\"', '2022-01-04 05:55:08', 1),
(457, 68, 'Paid', '44', '749', 'Structure of Matter - Day 3 (01.01.2022)', '365', 2, '442158.jpg', '\"https://player.vimeo.com/video/662157315?h=e868a2527d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Structure of Matter - Day 3 (01012022)\"', '2022-01-04 05:55:46', 1),
(458, 68, 'Paid', '40', '373', 'Unit 01 - Importance of Micro Organisms - Day 4 (03.01.2022)', '365', 2, '849419.jpg', '\"https://player.vimeo.com/video/662157540?h=33f32eb4e9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Importance of Micro Organisms - Day 4 (03012022)\"', '2022-01-04 05:59:32', 1),
(459, 68, 'Paid', '40', '373', 'Unit 02 - Animal Classification - Day 1 (03.01.2022)', '365', 2, '502057.jpg', '\"https://player.vimeo.com/video/662157692?h=858886733e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 02 - Animal Classification - Day 1 (03012022)\"', '2022-01-04 06:01:00', 1),
(460, 70, 'Paid', '39', '348', 'à·ƒà·à¶°à¶š à·„à· à¶œà·”à¶«à·à¶šà·à¶» -1', '365', 2, '356011.jpg', '\"https://player.vimeo.com/video/662165575?h=ba256d96e9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7_Dec_W4\"', '2022-01-04 06:11:15', 1),
(461, 70, 'Paid', '40', '352', 'à·ƒà¶¯à·“à· à·ƒà¶‚à¶›à·Šâ€à¶ºà·', '365', 2, '125560.jpg', '\"https://player.vimeo.com/video/662165728?h=aacd113ba1&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G8_Jan_W1\"', '2022-01-04 06:15:26', 1),
(462, 70, 'Paid', '43', '679', 'Grade 11 -Paper class -Dec_Week 04', '365', 2, '1880.jpg', '\"https://player.vimeo.com/video/662165844?h=6c82a23a56&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11_PC_W4\"', '2022-01-04 06:18:00', 1),
(463, 70, 'Paid', '42', '678', 'Paper class-January Week 01', '365', 2, '262452.jpg', '\"https://player.vimeo.com/video/662499339?h=a0b2efd642&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"g10_pc-W1\"', '2022-01-05 04:53:21', 1),
(464, 70, 'Paid', '41', '356', 'à¶´à·Šâ€à¶»à¶­à·’à·à¶­ ', '365', 2, '386806.jpg', '\"https://player.vimeo.com/video/662499444?h=4c583c8682&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9_Jan_W1\"', '2022-01-05 04:55:41', 1),
(465, 70, 'Paid', '42', '360', 'à·€à¶»à·Šà¶œà¶¸à·–à¶½à¶º ', '365', 2, '648877.jpg', '\"https://player.vimeo.com/video/662503043?h=28c660da02&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"g10p2\"', '2022-01-05 05:16:10', 1),
(466, 48, 'Paid', '43', '441', '02 lesson day 02', '365', 2, '456651.jpg', '\"https://player.vimeo.com/video/662590679?h=026a82a4fd&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1833188064\">', '2022-01-05 12:16:46', 1),
(467, 44, 'Paid', '44', '737', '2010 past paper', '365', 2, '75542.png', 'https://vimeo.com/662632635', '2022-01-05 14:41:35', 1),
(468, 51, 'Paid', '39', '458', 'à¶…à¶´à·š à¶´à·€à·”à¶½ part 3(i )           30/12/2021', '365', 2, '85643.jpg', 'https://player.vimeo.com/video/661776413?h=b940a7df31&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶…à¶´à·š à¶´à·€à·”à¶½ part 3 (i)', '2022-01-05 18:36:47', 1),
(469, 51, 'Paid', '39', '458', 'à¶…à¶´à·š à¶´à·€à·”à¶½ part 3(ii)     30/12/2021', '365', 2, '962546.jpg', 'https://player.vimeo.com/video/661776724?h=2f77df7c80&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶…à¶´à·š à¶´à·€à·”à¶½ part 3 (ii)', '2022-01-05 18:40:46', 1),
(470, 51, 'Paid', '39', '458', 'à¶…à¶´à·š à¶´à·€à·”à¶½ part 3(iii)     30/12/2021', '365', 2, '774761.jpg', 'https://player.vimeo.com/video/661776130?h=97be66d505&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶…à¶´à·š à¶´à·€à·”à¶½ part 3 (iii)\"', '2022-01-05 18:44:04', 1),
(485, 44, 'Free', '42', '680', '2019 western province paper', '365', 2, '778195.png', 'https://vimeo.com/663600150', '2022-01-08 08:30:41', 1),
(472, 56, 'Paid', '41', '519', 'Grade 9 EM L2.Excel day-2,  6Jan2022', '365', 2, '524940.jpg', '\"https://player.vimeo.com/video/663224369?h=a599c76e46&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9E_L2_Excel_day2_6Jan2022\"', '2022-01-07 05:25:23', 1),
(473, 56, 'Paid', '40', '517', 'Grade 8 EM L2-Configurating & Formatting - 6Jan2022', '365', 2, '299381.jpg', '\"https://player.vimeo.com/video/663224056?h=7bde37b4f5&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G8E_L2_Config&amp;amp;Format_6Jan2022\"', '2022-01-07 05:29:16', 1),
(474, 56, 'Paid', '39', '527', 'Grade 7 SM L3-ComputerSecurity - 5Jan2022', '365', 2, '446176.jpg', '\"https://player.vimeo.com/video/663224784?h=5cbd1d1ee7&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7S_L3_ComputerSecurity_5Jan2022\"', '2022-01-07 05:37:16', 1),
(475, 68, 'Paid', '39', '369', 'UNIT 01 - Plant Diversity - Day 4 (04.01.2022)', '365', 2, '508708.jpg', '\"https://player.vimeo.com/video/663274828?h=356f8b8c77&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"UNIT 01 - Plant Diversity - Day 4 (04012022)\"', '2022-01-07 10:56:51', 1),
(484, 68, 'Paid', '43', '669', 'GRADE 10 à¶…à¶ºà¶± à¶›à¶«à·Šà¶©à¶š , à¶´à·Šâ€à¶»à·ƒà·Šà¶­à·à¶» , à¶¯à·”à¶» , à·€à·’à·ƒà·Šà¶®à·à¶´à¶±à¶º , à·€à·šà¶œà¶º , à¶´à·Šâ€à¶»à·€à·šà¶œà¶º (2022.01.04)', '365', 2, '311949.jpg', '\"https://player.vimeo.com/video/663275215?h=0ec727cbdf&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶…à¶ºà¶± à¶›à¶«à·Šà¶©à¶š , à¶´à·Š&amp;zwj;à¶»à·ƒà·Šà¶­à·à¶» , à¶¯à·”à¶» , à·€à·’à·ƒà·Šà¶®à·à¶´à¶±à¶º , à·€à·šà¶œà¶º , à¶´à·Š&amp;zwj;à¶»\"', '2022-01-07 14:21:01', 1),
(483, 68, 'Paid', '42', '668', 'à¶…à¶ºà¶± à¶›à¶«à·Šà¶©à¶š , à¶´à·Šâ€à¶»à·ƒà·Šà¶­à·à¶» , à¶¯à·”à¶» , à·€à·’à·ƒà·Šà¶®à·à¶´à¶±à¶º , à·€à·šà¶œà¶º , à¶´à·Šâ€à¶»à·€à·šà¶œà¶º (2022.01.04)', '365', 2, '100180.jpg', '\"https://player.vimeo.com/video/663275215?h=0ec727cbdf&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶…à¶ºà¶± à¶›à¶«à·Šà¶©à¶š , à¶´à·Š&amp;zwj;à¶»à·ƒà·Šà¶­à·à¶» , à¶¯à·”à¶» , à·€à·’à·ƒà·Šà¶®à·à¶´à¶±à¶º , à·€à·šà¶œà¶º , à¶´à·Š&amp;zwj;à¶»\"', '2022-01-07 14:19:56', 1),
(540, 68, 'Paid', '41', '377', 'Unit 01 - Applications of Micro - Organisms - Day 4 (05..01.2022)', '365', 2, '246781.jpg', '\"https://player.vimeo.com/video/665987533?h=4eb3062240&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Applications of Micro - Organisms - Day 4 (05012022)\"', '2022-01-14 13:32:54', 1),
(481, 68, 'Paid', '42', '666', 'Radicals , Graphs , Distance , Displacement , Speed , Velocity (05.01.2022)', '365', 2, '416247.jpg', '\"https://player.vimeo.com/video/663276107?h=b1f1ae1f4b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Radicals , Graphs , Distance , Displacement , Speed , Velocity (05012022)\"', '2022-01-07 11:11:19', 1),
(482, 68, 'Paid', '43', '667', 'Grade 10 | Radicals , Graphs , Distance , Displacement , Speed , Velocity (05.01.2022)', '365', 2, '172499.jpg', '\"https://player.vimeo.com/video/663276107?h=b1f1ae1f4b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Radicals , Graphs , Distance , Displacement , Speed , Velocity (05012022)\"', '2022-01-07 11:12:11', 1),
(486, 57, 'Paid', '44', '743', '2022-01-08 2021 Maths Rev 2016 I-B, à·ƒà¶¸à·”à¶ à·Šà¶ à·’à¶­ à·ƒà¶‚à¶›à·Šâ€à¶ºà·à¶­ à·€à¶šà·Šâ€à¶»', '21', 2, '375588.png', '\"https://player.vimeo.com/video/663608756?h=2523b03ec4&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-08 2021 Maths Rev 2016 I-B, à·ƒà¶¸à·”à¶ à·Šà¶ à·’à¶­ à·ƒà¶‚à¶›à·Š&amp;zwj;à¶ºà·à¶­ à·€à¶šà·Š&amp;zwj;à¶»\"', '2022-01-08 13:33:09', 1),
(488, 57, 'Paid', '44', '751', '2021-12-31 -2021 Maths Rev 2017 I-A , à¶¯à¶­à·Šà¶­ à¶±à·’à¶»à·–à¶´à¶«à¶º', '21', 2, '133735.png', '\"https://player.vimeo.com/video/663606270?h=0fb0546606&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-31 -2021 Maths Rev 2017 I-A , à¶¯à¶­à·Šà¶­ à¶±à·’à¶»à·–à¶´à¶«à¶º\"', '2022-01-08 13:45:20', 1),
(489, 57, 'Paid', '40', '351', '2021-12-25  08-à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º-03 à¶šà·à¶« 1', '21', 2, '281742.png', '\"https://player.vimeo.com/video/663643042?h=54d4678aaf&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-25 08 à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º-03 à¶šà·à¶« 1\"', '2022-01-08 13:51:41', 1),
(490, 57, 'Free', '40', '351', '2022-01-01 08 à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º-03 à¶šà·à¶« 2', '7', 2, '18026.png', '\"https://player.vimeo.com/video/663611543?h=92baeb6331&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-01 08 à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º-03 à¶šà·à¶« 2\"', '2022-01-08 13:56:29', 1),
(491, 57, 'Free', '40', '351', '2022-01-08   08 à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º-04 à·ƒà¶¯à·’à· à·ƒà¶‚à¶›à·Šâ€à¶ºà·', '7', 2, '645594.png', '\"https://player.vimeo.com/video/663612664?h=b1ab02d438&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-08 08 à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º-04 à·ƒà¶¯à·’à· à·ƒà¶‚à¶›à·Š&amp;zwj;à¶ºà·\"', '2022-01-08 14:00:02', 1),
(492, 57, 'Paid', '39', '347', '2021-12-25   07-à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º - 03.à¶´à·–à¶»à·Šà¶« à·ƒà¶‚à¶›à·Šâ€à¶ºà· à¶¸à¶­ à¶œà¶«à·’à¶­ à¶šà¶»à·Šà¶¸ 2', '7', 2, '238488.png', '\"https://player.vimeo.com/video/663614144?h=9c532a1b99&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2021-12-25 07 à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º-03à¶´à·–à¶»à·Šà¶« à·ƒà¶‚à¶›à·Š&amp;zwj;à¶ºà· à¶¸à¶­ à¶œà¶«à·’à¶­ à¶šà¶»à·Šà¶¸ 2\"', '2022-01-08 14:08:50', 1),
(493, 57, 'Free', '39', '347', '2022-01-01   07-à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º - 04.à·ƒà·à¶°à¶š à·„à· à¶œà·”à¶«à·à¶šà·à¶» 1 â£à¶šà·œà¶§à·ƒ', '7', 2, '55653.png', 'id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-01 07 à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º- 04à·ƒà·à¶°à¶š à·„à· à¶œà·”à¶«à·à¶šà·à¶» 1 â£à¶šà·œà¶§à·ƒ\"', '2022-01-08 14:13:09', 1),
(494, 57, 'Free', '39', '347', '2022-01-08   07 à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º - 04.à·ƒà·à¶°à¶š à·„à· à¶œà·”à¶«à·à¶šà·à¶» 2 â£à¶šà·œà¶§à·ƒ', '7', 2, '488598.png', '\"https://player.vimeo.com/video/663615881?h=ae8791f013&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-08 07 à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º-04à·ƒà·à¶°à¶š à·„à· à¶œà·”à¶«à·à¶šà·à¶» 2 â£à¶šà·œà¶§à·ƒ\"', '2022-01-08 14:26:52', 1),
(495, 57, 'Free', '42', '359', '2022-01-08  10-à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º - 02.à·€à¶»à·Šà¶œà¶¸à·–à¶½à¶º', '7', 2, '758565.png', '\"https://player.vimeo.com/video/663676638?h=59c9029fd4&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-08 10 à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º- 02à·€à¶»à·Šà¶œà¶¸à·–à¶½à¶º\"', '2022-01-08 14:35:37', 1),
(496, 53, 'Paid', '41', '485', 'Lesson part 04', '365', 2, '1380.jpg', '\"https://player.vimeo.com/video/661488738?h=c8331ef29d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G 09 date 12-21 part 04\"', '2022-01-09 05:34:16', 1),
(497, 53, 'Paid', '41', '485', 'Lesson part 05', '365', 2, '849992.jpg', '\"https://player.vimeo.com/video/663870189?h=84219bdc75&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9 12-21 part 05\"', '2022-01-09 06:09:21', 1),
(498, 53, 'Paid', '41', '485', '12-20 (part 01)', '365', 2, '18394.jpg', '\"https://player.vimeo.com/video/663874649?h=2a878c4ed7&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G 09 date 12-28 part 01\"', '2022-01-09 07:02:36', 1),
(499, 44, 'Free', '40', '406', 'pronouns', '365', 2, '373955.png', 'https://vimeo.com/663892584', '2022-01-09 09:36:26', 1),
(500, 58, 'Free', '42', '537', 'Grade 10 Commerce EM - Heshan Sir (Day 05 - 04012022) Background of Business', '365', 2, '394471.jpg', '\"https://player.vimeo.com/video/662308290?h=f457343f8d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Commerce EM - Heshan Sir (Day 05 - 04012022) Background of Business\"', '2022-01-10 01:03:06', 1),
(501, 58, 'Free', '44', '736', 'Garde 11 Commerce Morning Revision Class (1st Lesson- Day14) à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à·', '365', 2, '356111.jpg', '\"https://player.vimeo.com/video/664064495?h=17a24c3e7b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Garde 11 Commerce Morning Revision Class (1st Lesson- Day14) 05012022 -Heshan Sir\"', '2022-01-10 01:50:52', 1),
(502, 70, 'Paid', '39', '348', 'à·ƒà·à¶°à¶š à·ƒà·„ à¶œà·”à¶«à·à¶šà·à¶» -2', '365', 2, '808668.jpg', '\"https://player.vimeo.com/video/664092157?h=fb22ae2c0d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade7_w1\"', '2022-01-10 04:31:32', 1),
(503, 70, 'Paid', '42', '360', 'à¶­à·Šâ€à¶»à·’à¶šà·à¶« à¶…à¶‚à¶œà·ƒà·à¶¸à·Šâ€à¶º ', '365', 2, '147792.png', '\"https://player.vimeo.com/video/664092290?h=bdc5fd184c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade10_W1\"', '2022-01-10 04:35:31', 1),
(504, 70, 'Paid', '43', '364', 'à¶¯à¶»à·Šà·à¶š à·„à· à¶½à¶à·”à¶œà¶«à¶š 2', '365', 2, '393522.jpg', '\"https://player.vimeo.com/video/664092419?h=d92a2a8f1a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade11W1\"', '2022-01-10 04:38:25', 1),
(505, 70, 'Paid', '43', '679', 'Grade11 Paper class- January Week 01', '365', 2, '745139.jpg', '\"https://player.vimeo.com/video/664092791?h=b446a7a64a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade11_W1_paper\"', '2022-01-10 04:40:21', 1),
(506, 56, 'Paid', '39', '515', 'Grade 7 EM L3-ComputerSecurity held on 7th Jan.2022', '365', 2, '751257.jpg', '\"https://player.vimeo.com/video/664104255?h=6e693491ed&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7E_L3_ComputerSecurity_7Jan2022\"', '2022-01-10 06:14:34', 1),
(507, 56, 'Paid', '42', '521', 'Grade 10 EM L2-Fundamental of Computer System held on 8Jan2022', '365', 2, '216837.jpg', '\"https://player.vimeo.com/video/664119300?h=61ce3980e3&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10E_L2-Fundam_of_Computer_8Jan2022\"', '2022-01-10 06:39:26', 1),
(508, 56, 'Paid', '43', '523', 'Grade 11 EM L1-Programming held on 8Jan2022 part-1', '365', 2, '981619.jpg', '\"https://player.vimeo.com/video/664121869?h=3328b95c7d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11E_L1-Programming_8Jan2022_1\"', '2022-01-10 06:48:55', 1),
(509, 56, 'Paid', '43', '523', 'Grade 11 EM L1-Programming held on 8Jan2022 part-2', '365', 2, '472709.jpg', '\"https://player.vimeo.com/video/664121962?h=151e4718c4&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11E_L1-Programming_8Jan2022_2\"', '2022-01-10 06:50:24', 1),
(510, 68, 'Paid', '42', '383', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶´à·ƒà·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.08)', '365', 2, '885048.jpg', '\"https://player.vimeo.com/video/664191801?h=607de34eb3&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶´à·ƒà·Šà·€à¶± à¶¯à·€à·ƒ (20220108)\"', '2022-01-10 11:58:00', 1),
(511, 68, 'Paid', '43', '387', 'Grade 10 | 01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶´à·ƒà·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.08)', '365', 2, '830008.jpg', '\"https://player.vimeo.com/video/664191801?h=607de34eb3&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶´à·ƒà·Šà·€à¶± à¶¯à·€à·ƒ (20220108)\"', '2022-01-10 11:58:49', 1),
(512, 68, 'Paid', '41', '379', '01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Šâ€à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à¶´à·ƒà·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.08)', '365', 2, '402220.jpg', '\"https://player.vimeo.com/video/664192594?h=067156d5f2&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Š&amp;zwj;à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à¶´à·ƒà·Šà·€à¶± à¶¯à·€à·ƒ (20220108)\"', '2022-01-10 12:50:07', 1),
(513, 68, 'Paid', '40', '375', '02 à¶´à·à¶©à¶¸ - à·ƒà¶­à·Šà¶­à·Šà·€ à·€à¶»à·Šà¶œà·“à¶šà¶»à¶«à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2022.01.08)', '365', 2, '444588.jpg', '\"https://player.vimeo.com/video/664193250?h=9cad7eba15&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"02 à¶´à·à¶©à¶¸ - à·ƒà¶­à·Šà¶­à·Šà·€ à·€à¶»à·Šà¶œà·“à¶šà¶»à¶«à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20220108)\"', '2022-01-10 12:54:03', 1),
(514, 68, 'Paid', '39', '371', '01 à¶´à·à¶©à¶¸ - à·à·à¶š à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º - à¶´à·ƒà·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.08)', '365', 2, '314910.jpg', '\"https://player.vimeo.com/video/664193986?h=9c0898d6c0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à·à·à¶š à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º - à¶´à·ƒà·Šà·€à¶± à¶¯à·€à·ƒ (20220108)\"', '2022-01-10 12:55:55', 1),
(515, 68, 'Paid', '43', '387', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à·“ à¶´à¶§à¶š - à¶´à·ƒà·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.08)', '365', 2, '806451.jpg', '\"https://player.vimeo.com/video/664194648?h=d2cc05e883&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à·“ à¶´à¶§à¶š - à¶´à·ƒà·Šà·€à¶± à¶¯à·€à·ƒ (20220108)\"', '2022-01-10 12:57:44', 1),
(518, 68, 'Paid', '43', '667', 'Structure of Matter - Day 4 (08.01.2022)', '365', 2, '102574.jpg', '\"https://player.vimeo.com/video/664330288?h=2604a286ca&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Structure of Matter - Day 4 (08012022)\"', '2022-01-10 17:19:55', 1),
(519, 68, 'Paid', '44', '749', 'Structure of Matter - Day 4 (08.01.2022)', '365', 2, '592000.jpg', '\"https://player.vimeo.com/video/664330288?h=2604a286ca&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Structure of Matter - Day 4 (08012022)\"', '2022-01-10 17:20:52', 1),
(520, 58, 'Free', '43', '543', 'à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (Extra Class - 10.01.2022) Day 04 - Unit 08 (2021)', '365', 2, '196401.jpg', '\"https://player.vimeo.com/video/664296899?h=0a6e395a68&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (Extra Class - 10012022) Day 04 - Unit 08 (2021)\"', '2022-01-11 00:20:08', 1),
(521, 58, 'Free', '44', '736', 'à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (Extra Class - 10.01.2022) Day 04 - Unit 08 (2021)', '365', 2, '590796.jpg', '\"https://player.vimeo.com/video/664296899?h=0a6e395a68&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·€à¶§à·Šà¶§à¶¸à·Š à¶­à·“à¶»à·” à·ƒà·„à·’à¶­ à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (Extra Class - 10012022) Day 04 - Unit 08 (2021)\"', '2022-01-11 00:21:34', 1),
(522, 70, 'Paid', '40', '352', 'à·ƒà¶¯à·“à· à·ƒà¶‚à¶›à·Šâ€à¶ºà· - 2 à¶šà·œà¶§à·ƒ ', '365', 2, '576626.jpg', '\"https://player.vimeo.com/video/664559941?h=be2b4ce667&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade8_jan_w2\"', '2022-01-11 05:01:48', 1),
(563, 68, 'Paid', '43', '386', 'GRADE 10 Unit - 01 Chemical Basis of Life - Day 4 (02.01.2022)', '365', 2, '755610.jpg', '\"https://player.vimeo.com/video/664648874?h=71b680127b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 4 (02012022)\"', '2022-01-16 11:37:37', 1),
(562, 68, 'Paid', '42', '382', 'Unit - 01 Chemical Basis of Life - Day 4 (02.01.2022)', '365', 2, '605215.jpg', '\"https://player.vimeo.com/video/664648874?h=71b680127b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 4 (02012022)\"', '2022-01-16 11:36:46', 1);
INSERT INTO `lmslesson` (`lid`, `tid`, `type`, `class`, `subject`, `title`, `available_days`, `no_of_views_per_day`, `cover`, `video`, `add_date`, `status`) VALUES
(561, 68, 'Paid', '43', '386', 'Unit 01 - Living Tissues - Day 4 (02.01.2022)', '365', 2, '490570.jpg', '\"https://player.vimeo.com/video/664647166?h=6be9dc5a8e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Living Tissues - Day 4 (02012022)\"', '2022-01-16 11:33:40', 1),
(559, 68, 'Paid', '44', '733', 'à¶¢à·“à·€à·“ à¶´à¶§à¶š - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2022.01.02)', '365', 2, '714255.jpg', '\"https://player.vimeo.com/video/664644979?h=dada9b31ab&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶¢à·“à·€à·“ à¶´à¶§à¶š - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20220101)\"', '2022-01-16 11:29:29', 1),
(560, 68, 'Paid', '44', '732', 'Living Tissues Day 2 (02.01.2022)', '365', 2, '90549.jpg', '\"https://player.vimeo.com/video/664646045?h=ec60202336&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Living Tissues Day (02012022)\"', '2022-01-16 11:31:54', 1),
(528, 68, 'Paid', '43', '669', 'à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Šâ€à¶ºà·–à·„à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.02)', '365', 2, '995394.jpg', '\"https://player.vimeo.com/video/664649683?h=cef8a03123&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Š&amp;zwj;à¶ºà·–à·„à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (20220102)\"', '2022-01-11 09:25:27', 1),
(529, 68, 'Paid', '44', '750', 'à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Šâ€à¶ºà·–à·„à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.02)', '365', 2, '788804.jpg', '\"https://player.vimeo.com/video/664649683?h=cef8a03123&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Š&amp;zwj;à¶ºà·–à·„à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (20220102)\"', '2022-01-11 09:24:41', 1),
(530, 68, 'Paid', '40', '373', 'Unit 02 - Animal Classification - Day 2 (10.01.2022)', '365', 2, '564926.jpg', '\"https://player.vimeo.com/video/664650397?h=0591f541bf&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 02 - Animal Classification - Day 2 (10012022)\"', '2022-01-11 09:27:46', 1),
(531, 64, 'Paid', '42', '554', 'Western Music January Week 1', '7', 2, '741641.jpg', '<div style=\"padding:53.97% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/662945743?h=8727827949&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1438667920\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2022-01-11 14:40:01', 1),
(532, 64, 'Paid', '42', '554', 'Western Music January Week 2', '7', 2, '459969.jpg', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/664748549?h=04030d5f5a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1085352481\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2022-01-11 14:43:43', 1),
(533, 58, 'Paid', '44', '736', 'Garde 11 Commerce Morning Revision Class (1st Lesson- Day15) 12.01.2022 -Heshan Sir', '365', 2, '545165.jpg', '\"https://player.vimeo.com/video/665038252?h=d55e2dfb3f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Garde 11 Commerce Morning Revision Class (1st Lesson- Day15) 12012022 -Heshan Sir\"', '2022-01-12 01:20:38', 1),
(534, 58, 'Paid', '42', '537', 'Grade 10 Commerce EM - Heshan Sir (Day 06 - 11.01.2022) Background of Business', '365', 2, '421811.jpg', '\"https://player.vimeo.com/video/665037759?h=46bf8f40ef&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Commerce EM - Heshan Sir (Day 06 - 11012022) Background of Business\"', '2022-01-12 01:25:03', 1),
(578, 68, 'Paid', '39', '369', 'UNIT 01 - Plant Diversity - Day 5 (11.01.2022)', '365', 2, '718047.jpg', '\"https://player.vimeo.com/video/665156090?h=e1cda288c7&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"UNIT 01 - Plant Diversity - Day 5 (11012022)\"', '2022-01-19 01:26:35', 1),
(536, 43, 'Paid', '40', '405', 'GRADE 8 ENGLISH LAN JANUARY W1 LESSON', '365', 2, '570189.jpg', '\"https://player.vimeo.com/video/665403124?h=453caa48a7&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"GRADE 08 ENGLISH LAN JANUARY W1\"', '2022-01-13 00:47:13', 1),
(537, 43, 'Paid', '42', '409', 'GRADE 10 ENGLISH LAN DEC W1- PUNCTUATION MARKS LESSON', '365', 2, '243168.jpg', '\"https://player.vimeo.com/video/665405636?h=cd3dcb12d0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"GRADE 10 ENGLISH LAN DEC W1\"', '2021-12-13 00:54:19', 1),
(538, 56, 'Paid', '39', '527', 'Grade 7 SM-L3.ComputerSecurity_day2 on12th Jan 2022', '365', 2, '191377.jpg', '\"https://player.vimeo.com/video/665441432?h=abd0e2bcbd&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7S_L3_ComputerSecurity_day2_12Jan2022\"', '2022-01-13 03:26:46', 1),
(539, 58, 'Paid', '42', '541', 'Grade 10 Commerce (à·ƒà·’à¶‚à·„à¶½ à¶¸à·à¶°à·Šâ€à¶º) - Day 01 à·€à·Šâ€à¶ºà·à¶´à·à¶» à¶´à·ƒà·”à¶¶à·’à¶¸ 13.01.2022', '365', 2, '76142.jpg', '\"https://player.vimeo.com/video/665666319?h=62f3dbb09d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Commerce (à·ƒà·’à¶‚à·„à¶½ à¶¸à·à¶°à·Š&amp;zwj;à¶º) - Day 01 à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à¶´à·ƒà·”à¶¶à·’à¶¸ 13012022\"></iframe></div><script src=\"', '2022-01-13 15:39:47', 1),
(541, 68, 'Paid', '41', '377', 'Unit 01 - Applications of Micro - Organisms - Day 5 (12..01.2022)', '365', 2, '554439.jpg', '\"https://player.vimeo.com/video/665992000?h=efdd386baf&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Applications of Micro - Organisms - Day 5 (12012022)\"', '2022-01-14 13:36:26', 1),
(542, 58, 'Paid', '43', '543', 'Grade 11 Commerce SM - Day 05 (à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à·) 14.01.2022', '365', 2, '296635.jpg', '\"https://player.vimeo.com/video/665976751?h=b2dd555809&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 Commerce SM - Day 05 (à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à·) 14012022\"', '2022-01-14 17:50:17', 1),
(543, 58, 'Paid', '44', '736', 'Grade 11 Commerce - 14.01.2022 Extra Class (à¶œà·à¶½à¶´à·”à¶¸à·Š à·ƒà¶§à·„à¶±à·Š à·ƒà·„à·’à¶­ à¶¸à·”à¶½à·Šâ€à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶±  Unit 05 - Day 03)', '365', 2, '478883.jpg', '\"https://player.vimeo.com/video/665969616?h=4d1745c4b9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 Commerce - 14012022  Extra Class (à¶œà·à¶½à¶´à·”à¶¸à·Š à·ƒà¶§à·„à¶±à·Š à·ƒà·„à·’à¶­ à¶¸à·”à¶½à·Š&amp;zwj;à¶º à¶´à·Š&amp;zwj;à¶»à¶š\"', '2022-01-14 17:54:42', 1),
(544, 58, 'Paid', '43', '691', 'Grade 10 Morning Revision Class - à·€à·Šâ€à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 03 - 14.01.2022)', '365', 2, '199770.jpg', '\"https://player.vimeo.com/video/665858167?h=c94193bb6b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Morning Revision Class - à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 03 - 14012022)\"', '2022-01-14 17:58:51', 1),
(545, 58, 'Paid', '44', '736', 'Grade 10 Morning Revision Class - à·€à·Šâ€à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 03 - 14.01.2022)', '365', 2, '224938.jpg', '\"https://player.vimeo.com/video/665858167?h=c94193bb6b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Morning Revision Class - à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 03 - 14012022)\"', '2022-01-14 17:59:36', 1),
(546, 70, 'Paid', '42', '678', 'Grade 10 _January_2nd week', '365', 2, '46655.jpg', '\"https://player.vimeo.com/video/666096989?h=5d3285fd2f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10_Jan_W2_PaperClass\"', '2022-01-14 19:30:25', 1),
(547, 70, 'Paid', '39', '348', 'à·ƒà·à¶°à¶š à·„à· à¶œà·”à¶«à·à¶šà·à¶» - 2 à¶šà·œà¶§à·ƒ ', '365', 2, '433637.png', '\"https://player.vimeo.com/video/666097231?h=d5ead0a55b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"grade7_jan_w2', '2022-01-14 19:34:22', 1),
(548, 70, 'Free', '43', '679', 'à¶´à·Šâ€à¶»à·à·Šà¶± à¶´à¶­à·Šâ€à¶»à¶º- à¶šà·à¶½ à¶šà·…à¶¸à¶«à·à¶šà¶»à¶«à¶º ', '365', 2, '233720.png', '\"https://player.vimeo.com/video/666097602?h=0ef3acd95e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\"', '2022-01-14 19:43:58', 1),
(549, 57, 'Paid', '39', '347', '2022-01-15  07à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º - 04.à¶´à·à¶©à¶¸- à¶¸à·„à· à¶´à·œà¶¯à·” à·ƒà·à¶°à¶šà¶º', '21', 2, '896875.png', '\"https://player.vimeo.com/video/666246206?h=88751d34ef&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-15  07 à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º- 04à¶´à·à¶©à¶¸- à¶¸à·„à· à¶´à·œà¶¯à·” à·ƒà·à¶°à¶šà¶º\"', '2022-01-15 11:56:26', 1),
(550, 57, 'Paid', '41', '355', '2022-01-15  09à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º - 04à¶´à·Šâ€à¶»à¶­à·’à·à¶­ - 1 à¶šà·œà¶§à·ƒ', '21', 2, '927288.png', '\"https://player.vimeo.com/video/666248554?h=0a24680b56&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-15  09à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º - 04à¶´à·Š&amp;zwj;à¶»à¶­à·’à·à¶­ - 1 à¶šà·œà¶§à·ƒ\"', '2022-01-15 12:33:33', 1),
(551, 57, 'Paid', '44', '751', '2022-01-14   2021-Maths_Rev O_L à¶šà·”à¶½à¶š', '21', 2, '467478.png', '\"https://player.vimeo.com/video/666261317?h=91387e711d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-14   2021-Maths_Rev O_L à¶šà·”à¶½à¶š\"', '2022-01-15 12:59:11', 1),
(552, 57, 'Paid', '44', '751', '2022-01-14   2021-Maths_Rev O_L à·ƒà¶¸à·Šà¶·à·à·€à·’à¶­à·à·€', '21', 2, '413188.png', '\"https://player.vimeo.com/video/666247999?h=7943408b10&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-14 2021 Maths Rev O_L à·ƒà¶¸à·Šà¶·à·à·€à·’à¶­à·à·€\"', '2022-01-15 12:55:02', 1),
(553, 57, 'Paid', '40', '351', '2022-01-15   08à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º- 04.à·ƒà¶¯à·’à· à·ƒà¶‚à¶›à·Šâ€à¶ºà·-05à·€à·“à¶¢à·“à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶±', '21', 2, '594702.png', '\"https://player.vimeo.com/video/666271023?h=9dba9ad723&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-15  08 à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º- 04à·ƒà¶¯à·’à· à·ƒà¶‚à¶›à·Š&amp;zwj;à¶ºà·-05à·€à·“à¶¢à·“à¶º à¶´à·Š&amp;zwj;à¶»à¶šà·à·à¶±\"', '2022-01-15 13:06:03', 1),
(554, 57, 'Paid', '42', '359', '2022-01-15  10à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º - 03à¶·à·à¶œ', '21', 2, '180735.png', '\"https://player.vimeo.com/video/666276996?h=2e119dfaa9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-15 10 à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º-03à¶·à·à¶œ\"', '2022-01-15 13:39:51', 1),
(555, 58, 'Paid', '43', '691', 'Grade 10 Morning Revision Class - à·€à·Šâ€à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 04 - 15.01.2022)', '365', 2, '770819.jpg', '\"https://player.vimeo.com/video/666299883?h=cf2eae745f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Morning Revision Class - à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 04 - 15012022)\"', '2022-01-15 17:17:10', 1),
(556, 58, 'Paid', '44', '736', 'Grade 10 Morning Revision Class - à·€à·Šâ€à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 04 - 15.01.2022)', '365', 2, '916431.jpg', '\"https://player.vimeo.com/video/666299883?h=cf2eae745f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Morning Revision Class - à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 04 - 15012022)\"', '2022-01-15 17:17:59', 1),
(557, 43, 'Paid', '40', '405', 'GRADE 8 ENGLISH LANGUAGE DECEMBER WEEK 1 CLASS', '365', 2, '256659.jpg', '\"https://player.vimeo.com/video/666310853?h=d7ae38140b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"GRADE 8 ENGLISH LANGUAGE DECEMBER WEEK 1 CLASS\"', '2022-01-15 21:37:06', 1),
(558, 43, 'Paid', '40', '350', 'GRADE 8 MATHEMATICS- LESSON 1 PART 1 - NUMBER PATTERNS', '365', 2, '490870.jpg', '\"https://player.vimeo.com/video/666364704?h=b207e4d700&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"GRADE 8 MATHEMATICS DECEMBER W1\"', '2022-01-16 01:42:46', 1),
(565, 58, 'Paid', '44', '736', 'à·ƒà·”à·…à·” à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (16.01.2022 - Day 01) Unit 08 (2021)', '365', 2, '979078.jpg', '\"https://player.vimeo.com/video/666455416?h=a010083d17&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà·”à·…à·” à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (16012022 - Day 01) Unit 08 (2021)\"', '2022-01-16 13:18:34', 1),
(566, 43, 'Paid', '43', '362', 'GRADE 11 MATHS JAN W2- LESSON 2 PART 2', '365', 2, '62444.jpg', '\"https://player.vimeo.com/video/666524605?h=c73a75ab66&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"GRADE 11 MATHS JAN W2- LESSON 2 PART 2\"', '2022-01-16 19:03:50', 1),
(567, 58, 'Paid', '42', '537', 'Grade 10 EM Commerce (Extra Class) Online Test 01 - 17.01.2022', '365', 2, '747863.jpg', '\"https://player.vimeo.com/video/666633796?h=fed6565374&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 EM Commerce (Extra Class) Online Test 01 - 17012022\"', '2022-01-17 06:55:23', 1),
(568, 58, 'Paid', '44', '736', 'Grade 11 Commerce - 16.01.2022 (à¶œà·à¶½à¶´à·”à¶¸à·Š à·ƒà¶§à·„à¶±à·Š à·ƒà·„à·’à¶­ à¶¸à·”à¶½à·Šâ€à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶±  Unit 05 - Day 04)', '365', 2, '22299.jpg', '\"https://player.vimeo.com/video/666629711?h=d2811f62e4&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 Commerce - 16012022 (à¶œà·à¶½à¶´à·”à¶¸à·Š à·ƒà¶§à·„à¶±à·Š à·ƒà·„à·’à¶­ à¶¸à·”à¶½à·Š&amp;zwj;à¶º à¶´à·Š&amp;zwj;à¶»à¶šà·à·à¶±  Un\"', '2022-01-17 06:58:48', 1),
(569, 70, 'Paid', '42', '360', 'à¶­à·Šâ€à¶»à·’à¶šà·à¶« à¶…à¶‚à¶œà·ƒà·à¶¸à·Šâ€à¶º -à¶…à·€à·ƒà¶±à·Š à¶šà·œà¶§à·ƒ ', '365', 2, '366204.png', '\"https://player.vimeo.com/video/667062060?h=6eddf3d44f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10_W2\"', '2022-01-18 03:56:57', 1),
(570, 70, 'Paid', '43', '364', 'à¶¯à¶»à·Šà·à¶š à·„à· à¶½à¶à·”à¶œà¶«à¶š - à¶…à·€à·ƒà¶±à·Š à¶šà·œà¶§à·ƒ ', '365', 2, '806026.jpg', '\"https://player.vimeo.com/video/667061822?h=037bccab8c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11_W2\"', '2022-01-18 03:59:00', 1),
(571, 70, 'Paid', '40', '352', 'à·€à·“à¶¢à·“à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶± -1', '365', 2, '470506.jpg', '\"https://player.vimeo.com/video/667062348?h=b0b9a3d450&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G8_W3\"', '2022-01-18 04:00:43', 1),
(572, 56, 'Paid', '39', '515', 'Grade 7EM L3_ComputerSecurity 2ndDay 14Jan2022\"', '365', 2, '710117.jpg', '\"https://player.vimeo.com/video/666392981?h=8cf5b4a8dd&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7E_L3_ComputerSecurity_2ndDay_14Jan2022\"', '2022-01-18 04:19:57', 1),
(573, 56, 'Paid', '40', '517', 'Grade 8EM L2_Config & Format Day3- Ports 12th Jan. 2022', '365', 2, '372165.jpg', '\"https://player.vimeo.com/video/666391543?h=bcff10ebf4&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G8E_L2_Config&amp;amp;Format_Day3-Ports_12Jan2022\"', '2022-01-18 04:24:02', 1),
(574, 56, 'Paid', '41', '519', 'Grade 9EM L2.Excel  - day3 on 13Jan2022', '365', 2, '419686.jpg', '\"https://player.vimeo.com/video/666391839?h=704862b6e8&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9E_L2_Excel_day3_13Jan2022\"', '2022-01-18 04:28:11', 1),
(575, 56, 'Paid', '42', '521', 'Grade 10EM L2-Fund.Computer_Devices on15Jan2022', '365', 2, '567929.jpg', '\"https://player.vimeo.com/video/666392347?h=98f984358d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10E_L2-FundComputer_Devices15Jan2022\"', '2022-01-18 04:33:21', 1),
(576, 53, 'Paid', '41', '485', 'Session 02', '365', 2, '11133.jpg', '\"https://player.vimeo.com/video/667113006?h=ba10d3fa8a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Session 02\"', '2022-01-18 06:49:16', 1),
(577, 43, 'Paid', '40', '405', 'GRADE 8 EGLISH LANG JAN W3- OPPOSITE WORDS', '365', 2, '875692.jpg', '\"https://player.vimeo.com/video/667452756?h=30312f4053&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"GRADE 08 ENGLISH LAN JAN W3\"', '2022-01-18 21:16:21', 1),
(579, 68, 'Paid', '42', '383', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à·„à¶ºà·€à¶± à¶¯à·€à·ƒ (2022.01.15)', '365', 2, '165471.jpg', '\"https://player.vimeo.com/video/667372936?h=3f6843dd7a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à·„à¶ºà·€à¶± à¶¯à·€à·ƒ (20220115)\"', '2022-01-19 03:30:42', 1),
(580, 68, 'Paid', '43', '387', 'Grade 10 | 01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à·„à¶ºà·€à¶± à¶¯à·€à·ƒ (2022.01.15)', '365', 2, '194256.jpg', '\"https://player.vimeo.com/video/667372936?h=3f6843dd7a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à·„à¶ºà·€à¶± à¶¯à·€à·ƒ (20220115)\"', '2022-01-19 03:31:34', 1),
(581, 68, 'Paid', '41', '379', '01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Šâ€à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à·„à¶ºà·€à¶± à¶¯à·€à·ƒ (2022.01.15)', '365', 2, '153233.jpg', '\"https://player.vimeo.com/video/667375642?h=7262b2a47b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Š&amp;zwj;à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à·„à¶ºà·€à¶± à¶¯à·€à·ƒ (20220115)\"', '2022-01-19 03:33:09', 1),
(582, 68, 'Paid', '40', '375', '02 à¶´à·à¶©à¶¸ - à·ƒà¶­à·Šà¶­à·Šà·€ à·€à¶»à·Šà¶œà·“à¶šà¶»à¶«à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.15)', '365', 2, '380587.jpg', '\"https://player.vimeo.com/video/667377166?h=6917dcdbce&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"02 à¶´à·à¶©à¶¸ - à·ƒà¶­à·Šà¶­à·Šà·€ à·€à¶»à·Šà¶œà·“à¶šà¶»à¶«à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (20220115)\"', '2022-01-19 03:35:04', 1),
(583, 68, 'Paid', '39', '371', '01 à¶´à·à¶©à¶¸ - à·à·à¶š à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º - à·„à¶ºà·€à¶± à¶¯à·€à·ƒ (2022.01.15)', '365', 2, '869608.jpg', '\"https://player.vimeo.com/video/667378369?h=d61f03c5d7&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à·à·à¶š à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º - à·„à¶ºà·€à¶± à¶¯à·€à·ƒ (20220115)\"', '2022-01-19 03:37:18', 1),
(584, 68, 'Paid', '39', '371', '02 à¶´à·à¶©à¶¸ - à·ƒà·Šà¶®à·’à¶­à·’ à·€à·’à¶¯à·Šâ€à¶ºà·”à¶­à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.15)', '365', 2, '274727.jpg', '\"https://player.vimeo.com/video/667379090?h=31f78deaed&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"02 à¶´à·à¶©à¶¸ - à·ƒà·Šà¶®à·’à¶­à·’ à·€à·’à¶¯à·Š&amp;zwj;à¶ºà·”à¶­à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220115)\"', '2022-01-19 03:38:51', 1),
(585, 68, 'Paid', '43', '387', '02 à¶´à·à¶©à¶¸ - à¶´à·Šâ€à¶»à¶·à·à·ƒà¶‚à·ƒà·Šà¶½à·šà·‚à¶«à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.15)', '365', 2, '623090.jpg', '\"https://player.vimeo.com/video/667379653?h=13eb8803ae&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"02 à¶´à·à¶©à¶¸ - à¶´à·Š&amp;zwj;à¶»à¶·à·à·ƒà¶‚à·ƒà·Šà¶½à·šà·‚à¶«à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220115)\"', '2022-01-19 03:40:32', 1),
(586, 68, 'Paid', '43', '667', 'Motion In a Straight Line - Day 1 (15.01.2022)', '365', 2, '218880.jpg', '\"https://player.vimeo.com/video/667381221?h=44c2fa2473&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Motion In a Straight Line - Day 1 (15012022)\"', '2022-01-19 03:42:43', 1),
(587, 68, 'Paid', '44', '749', 'Motion In a Straight Line - Day 1 (15.01.2022)', '365', 2, '989350.jpg', '\"https://player.vimeo.com/video/667381221?h=44c2fa2473&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Motion In a Straight Line - Day 1 (15012022)\"', '2022-01-19 03:43:25', 1),
(595, 68, 'Paid', '43', '386', 'Unit 01 - Living Tissues - Day 5 (09.01.2022)', '365', 2, '498038.jpg', '\"https://player.vimeo.com/video/667390842?h=e718b070bc&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Living Tissues - Day 5 (09012022)\"', '2022-01-19 04:20:14', 1),
(593, 68, 'Paid', '44', '733', 'à¶´à·Šâ€à¶»à¶šà·à· à·€à·’à¶¯à·Šâ€à¶ºà·à·€ - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.09)', '365', 2, '570872.jpg', '\"https://player.vimeo.com/video/667383836?h=38b33c74f0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à·Š&amp;zwj;à¶»à¶šà·à· à·€à·’à¶¯à·Š&amp;zwj;à¶ºà·à·€ - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220109)\"', '2022-01-19 04:17:29', 1),
(594, 68, 'Paid', '44', '732', 'Geometrical Optics - Day 01 (09.01.2022)', '365', 2, '641832.jpg', '\"https://player.vimeo.com/video/667387380?h=a65ebb705d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Geometrical Optics - Day 01 (09012022)\"', '2022-01-19 04:18:39', 1),
(591, 70, 'Paid', '41', '356', 'à¶´à·Šâ€à¶»à¶­à·’à·à¶­ -à¶…à·€à·ƒà¶±à·Š à¶šà·œà¶§à·ƒ (à·€à¶§à·Šà¶§à¶¸à·Š à·„à· à¶šà·œà¶¸à·’à·ƒà·Š)', '365', 2, '468103.jpg', '\"https://player.vimeo.com/video/667580139?h=e07f9631ad&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9_w2\"', '2022-01-19 04:02:27', 1),
(592, 70, 'Paid', '42', '678', 'Grade10 Paper class week 03', '365', 2, '11359.jpg', '\"https://player.vimeo.com/video/667580410?h=250c5aa504&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10_Paper_w3\"', '2022-01-19 04:05:30', 1),
(596, 68, 'Paid', '42', '382', 'Unit - 01 Chemical Basis of Life - Day 5 (09.01.2022)', '365', 2, '703421.jpg', '\"https://player.vimeo.com/video/667392515?h=8f9079de8f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 5 (09012022)\"', '2022-01-19 04:22:26', 1),
(597, 68, 'Paid', '43', '386', 'Grade 10 | Unit - 01 Chemical Basis of Life - Day 5 (09.01.2022)', '365', 2, '861156.jpg', '\"https://player.vimeo.com/video/667392515?h=8f9079de8f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 5 (09012022)\"', '2022-01-19 04:23:19', 1),
(598, 68, 'Paid', '43', '669', 'à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Šâ€à¶ºà·–à·„à¶º - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.09)', '365', 2, '647841.jpg', '\"https://player.vimeo.com/video/667393886?h=a3c8ba416e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Š&amp;zwj;à¶ºà·–à·„à¶º - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (20220109)\"', '2022-01-19 04:25:20', 1),
(599, 68, 'Paid', '44', '750', 'à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Šâ€à¶ºà·–à·„à¶º - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.09)', '365', 2, '624266.jpg', '\"https://player.vimeo.com/video/667393886?h=a3c8ba416e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à¶¯à·à¶»à·Šà¶®à¶ºà·š à·€à·Š&amp;zwj;à¶ºà·–à·„à¶º - à·ƒà·’à·€à·Šà·€à¶± à¶¯à·€à·ƒ (20220109)\"', '2022-01-19 04:25:55', 1),
(600, 68, 'Paid', '43', '669', 'à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.16)', '365', 2, '342029.jpg', '\"https://player.vimeo.com/video/667396252?h=a578880a6f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220116)\"', '2022-01-19 04:28:13', 1),
(601, 68, 'Paid', '44', '750', 'à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.16)', '365', 2, '110392.jpg', '\"https://player.vimeo.com/video/667396252?h=a578880a6f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220116)\"', '2022-01-19 04:28:45', 1),
(602, 68, 'Paid', '43', '386', 'Unit 02 - Photosynthesis - Day 1 (16.01.2022)', '365', 2, '38118.jpg', '\"https://player.vimeo.com/video/667397141?h=40815fd078&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 02 - Photosynthesis - Day 1 (16012022)\"', '2022-01-19 04:30:11', 1),
(603, 68, 'Paid', '42', '382', 'Unit - 01 Chemical Basis of Life - Day 6 (16.01.2022)', '365', 2, '323882.jpg', '\"https://player.vimeo.com/video/667399541?h=36c45105a9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 6 (16012022)\"', '2022-01-19 04:32:08', 1),
(604, 68, 'Paid', '43', '386', 'Grade 10 | Unit - 01 Chemical Basis of Life - Day 6 (16.01.2022)', '365', 2, '283366.jpg', '\"https://player.vimeo.com/video/667399541?h=36c45105a9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 6 (16012022)\"', '2022-01-19 04:32:49', 1),
(611, 68, 'Paid', '42', '668', 'à¶´à·Šâ€à¶»à·ƒà·Šà¶­à·à¶»à¶ºà¶š à¶…à¶±à·”à¶šà·Šâ€à¶»à¶¸à¶«à¶º à·ƒà·™à·€à·“à¶¸ - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.11)', '365', 2, '23334.jpg', '\"https://player.vimeo.com/video/667400784?h=e2dc23930a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à·Š&amp;zwj;à¶»à·ƒà·Šà¶­à·à¶»à¶ºà¶š à¶…à¶±à·”à¶šà·Š&amp;zwj;à¶»à¶¸à¶«à¶º à·ƒà·™à·€à·“à¶¸ - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220111)\"', '2022-01-19 04:45:14', 1),
(606, 68, 'Paid', '43', '669', 'Grade 10 | à¶´à·Šâ€à¶»à·ƒà·Šà¶­à·à¶»à¶ºà¶š à¶…à¶±à·”à¶šà·Šâ€à¶»à¶¸à¶«à¶º à·ƒà·™à·€à·“à¶¸ - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.11)', '365', 2, '907314.jpg', '\"https://player.vimeo.com/video/667400784?h=e2dc23930a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à·Š&amp;zwj;à¶»à·ƒà·Šà¶­à·à¶»à¶ºà¶š à¶…à¶±à·”à¶šà·Š&amp;zwj;à¶»à¶¸à¶«à¶º à·ƒà·™à·€à·“à¶¸ - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220111)\"', '2022-01-19 04:44:01', 1),
(607, 68, 'Paid', '44', '733', 'à¶´à·Šâ€à¶»à¶šà·à· à·€à·’à¶¯à·Šâ€à¶ºà·à·€ -  à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2022.01.16)', '365', 2, '320335.jpg', '\"https://player.vimeo.com/video/667401577?h=77ea6ee113&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à·Š&amp;zwj;à¶»à¶šà·à· à·€à·’à¶¯à·Š&amp;zwj;à¶ºà·à·€ -  à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20220116)\"', '2022-01-19 04:36:34', 1),
(608, 68, 'Paid', '40', '373', 'Unit 02 - Animal Classification - Day 3 (17.01.2022)', '365', 2, '933241.jpg', '\"https://player.vimeo.com/video/667403313?h=26b30b4ec9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 02 - Animal Classification - Day 3 (17012022)\"', '2022-01-19 04:38:06', 1),
(609, 68, 'Paid', '39', '369', 'UNIT 01 - Plant Diversity - Day 6 (18.01.2022)', '365', 2, '343621.jpg', '\"https://player.vimeo.com/video/667548362?h=30abca5164&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"UNIT 01 - Plant Diversity - Day 6 (18012022)\"', '2022-01-19 04:40:16', 1),
(610, 68, 'Paid', '39', '369', 'Unit 02 - Static Electricity - Day 1 (18.01.2022)', '365', 2, '732035.jpg', '\"https://player.vimeo.com/video/667549422?h=f72d83d353&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 02 - Static Electricity - Day 1 (18012022)\"', '2022-01-19 04:41:30', 1),
(675, 68, 'Paid', '42', '668', 'à¶´à·Šâ€à¶»à·ƒà·Šà¶­à·à¶»à¶ºà¶š à¶…à¶±à·”à¶šà·Šâ€à¶»à¶¸à¶«à¶º à·ƒà·™à·€à·“à¶¸ -  à¶¯à·™à·€à¶± à¶¯à·€à·ƒ à·ƒà·„ à¶´à·Šâ€à¶»à·ƒà·Šà¶­à·à¶»à¶ºà¶š à·€à¶»à·Šà¶œà¶µà¶½à¶º à·ƒà·™à·€à·“à¶¸ (2022.01.18)', '365', 2, '739374.jpg', '\"https://player.vimeo.com/video/667550063?h=6f530e2623&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à·Š&amp;zwj;à¶»à·ƒà·Šà¶­à·à¶»à¶ºà¶š à¶…à¶±à·”à¶šà·Š&amp;zwj;à¶»à¶¸à¶«à¶º à·ƒà·™à·€à·“à¶¸ -  à¶¯à·™à·€à¶± à¶¯à·€à·ƒ à·ƒà·„ à¶´à·Š&amp;zwj;à¶»à·ƒà·Šà¶­à·à¶»à¶ºà¶š à·€à¶»à·Šà¶œà¶µà¶½à¶º à·ƒà·™à·€à·“à¶¸ (2022.01.18)\"', '2022-01-26 17:49:19', 1),
(676, 68, 'Paid', '43', '669', 'GRADE 10 à¶´à·Šâ€à¶»à·ƒà·Šà¶­à·à¶»à¶ºà¶š à¶…à¶±à·”à¶šà·Šâ€à¶»à¶¸à¶«à¶º à·ƒà·™à·€à·“à¶¸ -  à¶¯à·™à·€à¶± à¶¯à·€à·ƒ à·ƒà·„ à¶´à·Šâ€à¶»à·ƒà·Šà¶­à·à¶»à¶ºà¶š à·€à¶»à·Šà¶œà¶µà¶½à¶º à·ƒà·™à·€à·“à¶¸ (2022.01.18)', '365', 2, '537034.jpg', '\"https://player.vimeo.com/video/667550063?h=6f530e2623&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶´à·Š&amp;zwj;à¶»à·ƒà·Šà¶­à·à¶»à¶ºà¶š à¶…à¶±à·”à¶šà·Š&amp;zwj;à¶»à¶¸à¶«à¶º à·ƒà·™à·€à·“à¶¸ -  à¶¯à·™à·€à¶± à¶¯à·€à·ƒ à·ƒà·„ à¶´à·Š&amp;zwj;à¶»à·ƒà·Šà¶­à·à¶»à¶ºà¶š à·€à¶»à·Šà¶œà¶µà¶½à¶º à·ƒà·™à·€à·“à¶¸ (2022.01.18)\"', '2022-01-26 17:50:19', 1),
(614, 58, 'Paid', '42', '537', 'Grade 10 Commerce EM - Heshan Sir (Day 07 - 18.01.2022) Background of Business', '365', 2, '709771.jpg', '\"https://player.vimeo.com/video/667623582?h=c0b3f73fe2&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Commerce EM - Heshan Sir (Day 07 - 18012022) Background of Business\"', '2022-01-19 09:09:23', 1),
(615, 50, 'Paid', '42', '698', 'paper 1 grade10 part 1', '365', 2, '510381.jpeg', '\"https://player.vimeo.com/video/667400021?h=b503893f29&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1106823121\"', '2022-01-19 18:33:53', 1),
(616, 50, 'Paid', '42', '398', 'lesson 1 grade 10 (part1)', '365', 2, '163085.jpeg', '\"https://player.vimeo.com/video/667919499?h=807fe173e3&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video3264348265\"', '2022-01-19 18:56:52', 1),
(617, 50, 'Paid', '42', '398', 'lesson  01 grade 10 (2022.01.01) ', '365', 2, '464854.jpeg', '\"https://player.vimeo.com/video/667930506?h=4a0052ed25&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1493334727\"', '2022-01-19 19:58:03', 1),
(618, 56, 'Paid', '39', '527', 'Grade 7SM L1.Workbook  held on19Jan2022', '365', 2, '109292.jpg', '\"https://player.vimeo.com/video/668038171?h=501f9583ca&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7S_L1_Workbook_19Jan2022\"', '2022-01-20 02:17:04', 1),
(619, 68, 'Paid', '41', '377', 'Unit 01 - Applications of Micro - Organisms - Day 6 (19..01.2022)', '365', 2, '357097.jpg', '\"https://player.vimeo.com/video/668085311?h=84a053460f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Applications of Micro - Organisms - Day 6 (19012022)\"', '2022-01-20 10:11:40', 1),
(620, 58, 'Paid', '42', '541', 'Grade 10 Commerce (à·ƒà·’à¶‚à·„à¶½ à¶¸à·à¶°à·Šâ€à¶º) - Day 02 à·€à·Šâ€à¶ºà·à¶´à·à¶» à¶´à·ƒà·”à¶¶à·’à¶¸ 20.01.2022', '365', 2, '762064.jpg', '\"https://player.vimeo.com/video/668248228?h=e35359856d&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Commerce (à·ƒà·’à¶‚à·„à¶½ à¶¸à·à¶°à·Š&amp;zwj;à¶º) - Day 02 à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à¶´à·ƒà·”à¶¶à·’à¶¸ 20012022\"', '2022-01-21 01:04:54', 1),
(621, 68, 'Paid', '41', '379', '01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Šâ€à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2021.12.11)', '365', 2, '981946.jpg', '\"https://player.vimeo.com/video/656498034?h=e56c371947&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Š&amp;zwj;à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20211211)\"', '2021-12-21 09:53:09', 1),
(624, 48, 'Paid', '42', '439', '2021.01.20', '365', 2, '560519.jpg', '<iframe src=\"https://player.vimeo.com/video/668644599?h=5be2686d08&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1826971918\">', '2022-01-21 15:14:54', 1),
(625, 50, 'Paid', '42', '398', 'LESSON 2 GRADE 10', '365', 2, '65278.jpeg', '\"https://player.vimeo.com/video/668749671?h=22eab2ac8b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1848002253\"', '2022-01-21 20:27:39', 1),
(626, 50, 'Paid', '42', '398', 'LESSON 2 PART 2 GRADE10', '365', 2, '86859.jpeg', '\"https://player.vimeo.com/video/668766839?h=2d034e8252&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1934335754\"', '2022-01-21 20:45:48', 1),
(627, 57, 'Paid', '44', '751', '2022-01-21 2021 Maths Rev OL- à¶¸à¶°à·Šâ€à¶ºà¶±à·Šâ€à¶ºà¶º, à¶šà·œà¶§à·ƒà·Š à·€à·™à·…à·™à¶³à¶´à·œà·…, à·€à·à¶½à·Šà¶´à·œà¶½à·’', '21', 2, '493529.png', '\"https://player.vimeo.com/video/668862268?h=c3be40e660&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-21 2021 Maths Rev OL- à¶¸à¶°à·Š&amp;zwj;à¶ºà¶±à·Š&amp;zwj;à¶ºà¶º, à¶šà·œà¶§à·ƒà·Š à·€à·™à·…à·™à¶³à¶´à·œà·…, à·€à·à¶½à·Šà¶´à·œà¶½à·’\"', '2022-01-22 08:51:00', 1),
(628, 57, 'Paid', '40', '351', '2022-01-22  08à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º - 05à·€à·“à¶¢à·“à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶± 2 à¶šà·œà¶§à·ƒ', '21', 2, '238367.png', '\"https://player.vimeo.com/video/668883137?h=0a30ad5ae5&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-22 08à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º - 05à·€à·“à¶¢à·“à¶º à¶´à·Š&amp;zwj;à¶»à¶šà·à·à¶± 2 à¶šà·œà¶§à·ƒ\"', '2022-01-22 09:07:45', 1),
(629, 57, 'Paid', '39', '347', '2022-01-22  07à·€à·ƒà¶»-à¶œà¶«à·’à¶­à¶º - 04.à¶šà·”.à¶´à·œ.à¶œà·”', '21', 2, '325459.png', '\"https://player.vimeo.com/video/668886690?h=cccc84e528&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"2022-01-22 07 à·€à·ƒà¶» - à¶œà¶«à·’à¶­à¶º - 04 à¶šà·”à¶´à·œà¶œà·”\"', '2022-01-22 09:17:16', 1),
(630, 58, 'Paid', '43', '543', 'Grade 11 Commerce SM - Day 06 (à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à·) 21.01.2022', '365', 2, '831570.jpg', '\"https://player.vimeo.com/video/668697030?h=a1f2abc4b2&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 Commerce SM - Day 06 (à·€à·™à·…à¶³à·à¶¸ à·ƒà·„ à¶‹à¶´à¶šà·à¶»à¶š à·ƒà·šà·€à·) 21012022\"', '2022-01-22 12:52:10', 1),
(631, 58, 'Paid', '43', '691', 'Grade 10 Morning Revision Class - à·€à·Šâ€à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 05 - 22.01.2022)', '365', 2, '236813.jpg', '\"https://player.vimeo.com/video/668919648?h=005b270ba9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Morning Revision Class - à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 05 - 22012022)\"', '2022-01-22 15:45:13', 1),
(632, 58, 'Paid', '44', '736', 'Grade 10 Morning Revision Class - à·€à·Šâ€à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 05 - 22.01.2022)', '365', 2, '834769.jpg', '\"https://player.vimeo.com/video/668919648?h=005b270ba9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Morning Revision Class - à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 05 - 22012022)\"', '2022-01-22 15:45:45', 1),
(633, 64, 'Paid', '39', '548', 'Western Music January Week 3', '7', 2, '41676.jpg', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/668950600?h=4fdef4a31c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1608368928\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2022-01-22 16:16:11', 1),
(634, 64, 'Paid', '39', '548', 'Western Music January Week 3', '7', 2, '691863.jpg', '<div style=\"padding:54.06% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/668950842?h=ab946866d8&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1200212267\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2022-01-22 16:18:57', 1),
(635, 64, 'Paid', '41', '552', 'Western Music January Week 3', '7', 2, '362162.jpg', '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/668951125?h=6f22b93ea8&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1788361551\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2022-01-22 16:20:51', 1);
INSERT INTO `lmslesson` (`lid`, `tid`, `type`, `class`, `subject`, `title`, `available_days`, `no_of_views_per_day`, `cover`, `video`, `add_date`, `status`) VALUES
(636, 55, 'Paid', '39', '493', 'Family Health promotion (2022/01/15)', '365', 2, '161623.jpg', '<div style=\"padding:56.16% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/669034115?h=a8abf8ec96&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1979137884\"></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>', '2022-01-23 02:14:26', 1),
(637, 58, 'Paid', '44', '736', 'Grade 11 Commerce - 23.01.2022 (à¶œà·à¶½à¶´à·”à¶¸à·Š à·ƒà¶§à·„à¶±à·Š à·ƒà·„à·’à¶­ à¶¸à·”à¶½à·Šâ€à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶±  Unit 05 - Day 05)', '365', 2, '681126.jpg', '\"https://player.vimeo.com/video/669121531?h=3a0f61df6e&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 Commerce - 23012022 (à¶œà·à¶½à¶´à·”à¶¸à·Š à·ƒà¶§à·„à¶±à·Š à·ƒà·„à·’à¶­ à¶¸à·”à¶½à·Š&amp;zwj;à¶º à¶´à·Š&amp;zwj;à¶»à¶šà·à·à¶±  Un\"', '2022-01-24 01:15:53', 1),
(638, 58, 'Paid', '43', '543', 'à·ƒà·”à·…à·” à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (23.01.2022 - Day 02) Unit 08 (2021)', '365', 2, '469381.jpg', '\"https://player.vimeo.com/video/669105866?h=8413b9821c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà·”à·…à·” à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (23012022 - Day 02) Unit 08 (2021)\"', '2022-01-24 01:18:45', 1),
(639, 58, 'Paid', '44', '736', 'à·ƒà·”à·…à·” à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (23.01.2022 - Day 02) Unit 08 (2021)', '365', 2, '439043.jpg', '\"https://player.vimeo.com/video/669105866?h=8413b9821c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà·”à·…à·” à¶¸à·”à¶¯à¶½à·Š à¶´à·œà¶­ (23012022 - Day 02) Unit 08 (2021)\"', '2022-01-24 01:19:41', 1),
(640, 70, 'Paid', '42', '360', 'à·€à¶»à·Šà¶œà¶µà¶½à¶º', '365', 2, '214938.jpg', '\"https://player.vimeo.com/video/669268117?h=4a25d96d62&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1447870817\"', '2022-01-24 04:13:38', 1),
(641, 70, 'Paid', '43', '364', 'à¶à¶«à·€à·ƒà·Šà¶­à·” à·€à¶½ à¶´à·˜à·‚à·Šà¶¨à·€à¶»à·Šà¶œà¶µà¶½à¶º ', '365', 2, '520816.jpg', '\"https://player.vimeo.com/video/669268311?h=1cf86a60f8&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1734614702\"', '2022-01-24 04:26:20', 1),
(642, 70, 'Paid', '43', '679', 'Grade 11 Paper class _Jan _Week 03', '365', 2, '734869.jpg', '\"https://player.vimeo.com/video/669268472?h=aed8b40870&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1573544430\"', '2022-01-24 04:29:03', 1),
(643, 70, 'Paid', '39', '348', 'à·ƒà·à¶°à¶š à·„à· à¶œà·”à¶«à·à¶šà·à¶» -à¶…à·€à·ƒà¶±à·Š à¶šà·œà¶§à·ƒ ', '365', 2, '13506.jpg', '\"https://player.vimeo.com/video/669270762?h=c49eb857e4&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"g7\"', '2022-01-24 04:31:37', 1),
(644, 68, 'Paid', '42', '383', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à·„à¶­à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.22)', '365', 2, '501596.jpg', '\"https://player.vimeo.com/video/669316450?h=5c41be7e30&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à·„à¶­à·Šà·€à¶± à¶¯à·€à·ƒ (20220122)\"', '2022-01-24 10:22:16', 1),
(645, 68, 'Paid', '43', '387', 'Grade 10 | 01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à·„à¶­à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.22)', '365', 2, '307039.jpg', '\"https://player.vimeo.com/video/669316450?h=5c41be7e30&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à·„à¶­à·Šà·€à¶± à¶¯à·€à·ƒ (20220122)\"', '2022-01-24 10:23:07', 1),
(646, 68, 'Paid', '41', '379', '01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Šâ€à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à·„à¶­à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.22)', '365', 2, '665931.jpg', '\"https://player.vimeo.com/video/669316901?h=4178fe873f&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶šà·Šà·‚à·”à¶¯à·Š&amp;zwj;à¶» à¶¢à·“à·€à·“à¶±à·Šà¶œà·š à¶·à·à·€à·’à¶­ - à·„à¶­à·Šà·€à¶± à¶¯à·€à·ƒ (20220122)\"', '2022-01-24 10:25:21', 1),
(647, 68, 'Paid', '41', '379', '02 à¶´à·à¶©à¶¸ - à¶‡à·ƒ à·„à· à¶šà¶± - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.22)', '365', 2, '453619.jpg', '\"https://player.vimeo.com/video/669317137?h=97a6645888&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"02 à¶´à·à¶©à¶¸ - à¶‡à·ƒ à·„à· à¶šà¶± - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220122)\"', '2022-01-24 10:26:39', 1),
(648, 68, 'Paid', '40', '375', '03 à¶´à·à¶©à¶¸ - à·à·à¶š à¶šà·œà¶§à·ƒà·Š à·€à¶½ à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º à·„à· à¶šà·˜à¶­à·Šâ€à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.22)', '365', 2, '673985.jpg', '\"https://player.vimeo.com/video/669317271?h=d2d1978428&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"03 à¶´à·à¶©à¶¸ - à·à·à¶š à¶šà·œà¶§à·ƒà·Š à·€à¶½ à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º à·„à· à¶šà·˜à¶­à·Š&amp;zwj;à¶º - à¶´à·…à¶¸à·” à¶¯à·€\"', '2022-01-24 10:28:12', 1),
(649, 68, 'Paid', '39', '371', '02 à¶´à·à¶©à¶¸ - à·ƒà·Šà¶®à·’à¶­à·’ à·€à·’à¶¯à·Šâ€à¶ºà·”à¶­à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2022.01.22)', '365', 2, '45961.jpg', '\"https://player.vimeo.com/video/669318287?h=a3e13d4c0c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"02 à¶´à·à¶©à¶¸ - à·ƒà·Šà¶®à·’à¶­à·’ à·€à·’à¶¯à·Š&amp;zwj;à¶ºà·”à¶­à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20220122)\"', '2022-01-24 10:34:13', 1),
(650, 68, 'Paid', '43', '387', '02 à¶´à·à¶©à¶¸ - à¶´à·Šâ€à¶»à¶·à·à·ƒà¶‚à·ƒà·Šà¶½à·šà·‚à¶«à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2022.01.22)', '365', 2, '830474.jpg', '\"https://player.vimeo.com/video/669319186?h=53f18b49d1&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"02 à¶´à·à¶©à¶¸ - à¶´à·Š&amp;zwj;à¶»à¶·à·à·ƒà¶‚à·ƒà·Šà¶½à·šà·‚à¶«à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20220122)\"', '2022-01-24 10:41:19', 1),
(651, 68, 'Paid', '43', '667', 'Motion In a Straight Line - Day 2 (22.01.2022)', '365', 2, '345456.jpg', '\"https://player.vimeo.com/video/669320438?h=e091c70a06&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Motion In a Straight Line - Day 2 (22012022)\"', '2022-01-24 10:42:58', 1),
(652, 68, 'Paid', '44', '749', 'Motion In a Straight Line - Day 2 (22.01.2022)', '365', 2, '935259.jpg', '\"https://player.vimeo.com/video/669320438?h=e091c70a06&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Motion In a Straight Line - Day 2 (22012022)\"', '2022-01-24 10:58:13', 1),
(653, 68, 'Paid', '44', '733', 'à¶…à¶¸à·Šà¶½ , à¶·à·ƒà·Šà¶¸ à·„à· à¶½à·€à¶« (2022.01.23)', '365', 2, '989718.jpg', '\"https://player.vimeo.com/video/669321114?h=9e7ed10f33&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶…à¶¸à·Šà¶½ , à¶·à·ƒà·Šà¶¸ à·„à· à¶½à·€à¶« (20220123)\"', '2022-01-24 10:45:39', 1),
(654, 68, 'Paid', '44', '733', 'à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à·Šâ€à¶»à¶­à·’à¶šà·Šâ€à¶»à·’à¶ºà· à¶†à·à·Šâ€à¶»à·’à¶­ à¶­à·à¶´ à·€à·’à¶´à¶»à·Šà¶ºà·à·ƒ (2022.01.23)', '365', 2, '659751.jpg', '\"https://player.vimeo.com/video/669320846?h=3a036eecbc&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à·Š&amp;zwj;à¶»à¶­à·’à¶šà·Š&amp;zwj;à¶»à·’à¶ºà· à¶†à·à·Š&amp;zwj;à¶»à·’à¶­ à¶­à·à¶´ à·€à·’à¶´à¶»à·Šà¶ºà·à·ƒ (20220123\"', '2022-01-24 10:46:48', 1),
(655, 68, 'Paid', '44', '732', 'Geometrical Optics - Day 02 (16.01.2022)', '365', 2, '737349.jpg', '\"https://player.vimeo.com/video/669321921?h=c72fed08de&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Geometrical Optics - Day 02 (16012022)\"', '2022-01-24 10:48:41', 1),
(656, 68, 'Paid', '43', '386', 'Unit 02 - Photosynthesis - Day 2 (23.01.2022)', '365', 2, '94822.jpg', '\"https://player.vimeo.com/video/669322483?h=8ee07165b2&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 02 - Photosynthesis - Day 2 (23012022)\"', '2022-01-24 10:50:59', 1),
(657, 68, 'Paid', '42', '382', 'Unit - 01 Chemical Basis of Life - Day 7 (23.01.2022)', '365', 2, '243664.jpg', '\"https://player.vimeo.com/video/669348206?h=a3a7350bb6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 7 (23012022)\"', '2022-01-24 10:52:58', 1),
(658, 68, 'Paid', '43', '386', 'Grade 10 | Unit - 01 Chemical Basis of Life - Day 7 (23.01.2022)', '365', 2, '658507.jpg', '\"https://player.vimeo.com/video/669348206?h=a3a7350bb6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 7 (23012022)\"', '2022-01-24 10:53:53', 1),
(659, 68, 'Paid', '43', '669', 'à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2022.01.23)', '365', 2, '557281.jpg', '\"https://player.vimeo.com/video/669348786?h=f1dff24afa&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20220123)\"', '2022-01-24 10:55:40', 1),
(660, 68, 'Paid', '44', '750', 'à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2022.01.23)', '365', 2, '585809.jpg', '\"https://player.vimeo.com/video/669348786?h=f1dff24afa&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20220123)\"', '2022-01-24 10:56:24', 1),
(661, 43, 'Paid', '42', '409', 'GRADE 10 ENGLISH LAN THEORY JAN W4', '365', 2, '265750.jpg', '\"https://player.vimeo.com/video/669527868?h=6164c4ee84&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"GRADE 10 ENGLISH LAN THEORY JAN W4\"', '2022-01-24 22:38:07', 1),
(662, 68, 'Paid', '40', '373', 'Unit 03 - Diversity and Functions of Plant Parts - Day 01 (24.01.2022)', '365', 2, '425979.jpg', '\"https://player.vimeo.com/video/669792651?h=9cbd70b16a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 03 - Diversity and Functions of Plant Parts - Day 01 (24012022)\"', '2022-01-25 12:26:29', 1),
(663, 68, 'Paid', '42', '666', 'How to calculate the Gradient of a graph - Part 2 and calculate the area of a graph (19.01.2022)', '365', 2, '395605.jpg', '\"https://player.vimeo.com/video/669793124?h=dc5eaa78d0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"How to calculate the Gradient of a graph - Part 2 and calculate the area of a graph (19012022)\"', '2022-01-25 12:30:40', 1),
(664, 68, 'Paid', '43', '667', 'Grade 10 | How to calculate the Gradient of a graph - Part 2 and calculate the area of a graph (19.01.2022)', '365', 2, '763801.jpg', '\"https://player.vimeo.com/video/669793124?h=dc5eaa78d0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"How to calculate the Gradient of a graph - Part 2 and calculate the area of a graph (19012022)\"', '2022-01-25 12:31:20', 1),
(665, 59, 'Paid', '42', '538', 'Chapter 2 Business Environment Day 2 07.01.2022', '365', 2, '997937.jpg', '\"https://player.vimeo.com/video/668032482?h=08a8863081&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10 Chapter 2 07012022\"', '2022-01-25 17:33:08', 1),
(666, 59, 'Paid', '42', '538', 'Chapter 2 Business Environment Day 03 14.01.2022', '365', 2, '636894.jpg', '\"https://player.vimeo.com/video/668033748?h=8d93cbe7af&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G10 Chapter 2 14012022\"', '2022-01-25 17:37:07', 1),
(667, 56, 'Paid', '39', '515', 'G7E_L3_ComputerSecurity_3rdDay_25Jan2022', '365', 2, '477860.jpg', '\"https://player.vimeo.com/video/670084685?h=67e70eded2&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7E_L3_ComputerSecurity_3rdDay_25Jan2022\"', '2022-01-26 04:52:07', 1),
(668, 70, 'Paid', '42', '678', 'Grade 10 Paper class -Week 03', '365', 2, '382674.jpg', '\"https://player.vimeo.com/video/670096434?h=d8fc3f5b60&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"encode20220126105756\"', '2022-01-26 06:10:13', 1),
(669, 70, 'Paid', '40', '352', 'à·€à·“à¶¢à·“à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶± -2 à¶šà·œà¶§à·ƒ ', '365', 2, '680926.jpg', '\"https://player.vimeo.com/video/670097658?h=1bb8bf6e45&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"encode20220126105934\"', '2022-01-26 06:24:49', 1),
(670, 70, 'Paid', '41', '356', 'à·€à·“à¶¢à·“à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶±-1 à¶šà·œà¶§à·ƒ  ', '365', 2, '208453.jpg', '\"https://player.vimeo.com/video/670097223?h=b8174a20b4&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"encode20220126110038\"', '2022-01-26 06:27:58', 1),
(671, 68, 'Paid', '42', '668', 'à·à·à¶š à·„à· à·ƒà¶­à·Šà¶­à·Šà·€ à·ƒà·›à¶½à¶º (2022.01.25)', '365', 2, '816641.jpg', '\"https://player.vimeo.com/video/670174233?h=78d37192ca&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·à·à¶š à·„à· à·ƒà¶­à·Šà¶­à·Šà·€ à·ƒà·›à¶½à¶º (20220125)\"', '2022-01-26 11:47:45', 1),
(677, 68, 'Paid', '43', '669', 'GRADE 10 à·à·à¶š à·„à· à·ƒà¶­à·Šà¶­à·Šà·€ à·ƒà·›à¶½à¶º (2022.01.25)', '365', 2, '872098.jpg', '\"https://player.vimeo.com/video/670174233?h=78d37192ca&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·à·à¶š à·„à· à·ƒà¶­à·Šà¶­à·Šà·€ à·ƒà·›à¶½à¶º (20220125)\"', '2022-01-26 17:57:50', 1),
(673, 68, 'Paid', '39', '369', 'Unit 02 - Static Electricity - Day 2 (25.01.2022)', '365', 2, '775464.jpg', '\"https://player.vimeo.com/video/670173322?h=ccc9a1091a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 02 - Static Electricity - Day 2 (25012022)\"', '2022-01-26 11:55:18', 1),
(678, 68, 'Paid', '41', '377', 'Unit 01 - Applications of Micro - Organisms - Day 7 (26..01.2022)', '365', 2, '290874.jpg', '\"https://player.vimeo.com/video/670543121?h=b35b0485c6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 01 - Applications of Micro - Organisms - Day 7 (26012022)\"', '2022-01-27 06:42:52', 1),
(679, 68, 'Paid', '41', '377', 'Unit 02 - Eye and Ear (26.01.2022)', '365', 2, '331732.jpg', '\"https://player.vimeo.com/video/670543500?h=d7cc5c1afb&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 02 - Eye and Ear (26012022)\"', '2022-01-27 06:44:04', 1),
(680, 68, 'Paid', '42', '666', 'Animal and Plant Cell (26.01.2022)', '365', 2, '996796.jpg', '\"https://player.vimeo.com/video/670544613?h=23e5c8ceeb&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Animal and Plant Cell (26012022)\"', '2022-01-27 06:46:45', 1),
(681, 68, 'Paid', '43', '667', 'Grade 10 | Animal and Plant Cell (26.01.2022)', '365', 2, '753832.jpg', '\"https://player.vimeo.com/video/670544613?h=23e5c8ceeb&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Animal and Plant Cell (26012022)\"', '2022-01-27 06:47:33', 1),
(682, 56, 'Paid', '41', '519', 'Grade 9 EM L2_Excel_day4_20Jan2022', '365', 2, '623712.jpg', '\"https://player.vimeo.com/video/670784463?h=a5e2d07be9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9E_L2_Excel_day4_20Jan2022\"', '2022-01-27 16:37:55', 1),
(683, 48, 'Paid', '44', '742', '2021.01.27 paper discussion & maps', '365', 2, '588492.jpg', '<iframe src=\"https://player.vimeo.com/video/671006154?h=daaec42d1a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1939382182\">', '2022-01-28 07:40:07', 1),
(684, 58, 'Paid', '42', '541', 'Grade 10 Commerce (à·ƒà·’à¶‚à·„à¶½ à¶¸à·à¶°à·Šâ€à¶º) - Day 03 à·€à·Šâ€à¶ºà·à¶´à·à¶» à¶´à·ƒà·”à¶¶à·’à¶¸ 27.01.2022', '365', 2, '205360.jpg', '\"https://player.vimeo.com/video/670752293?h=1d1e738914&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Commerce (à·ƒà·’à¶‚à·„à¶½ à¶¸à·à¶°à·Š&amp;zwj;à¶º) - Day 03 à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à¶´à·ƒà·”à¶¶à·’à¶¸ 27012022\"', '2022-01-28 15:21:35', 1),
(685, 58, 'Paid', '44', '736', 'Garde 11 Commerce Morning Revision Class (1st Lesson- Day16) 25.01.2022 -Heshan Sir', '365', 2, '950105.jpg', '\"https://player.vimeo.com/video/670751454?h=3b1c173841&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Garde 11 Commerce Morning Revision Class (1st Lesson- Day16) 25012022 -Heshan Sir\"', '2022-01-28 15:37:58', 1),
(686, 58, 'Paid', '43', '691', 'Grade 10 Morning Revision Class - à·€à·Šâ€à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 06 - 29.01.2022)', '365', 2, '277531.jpg', '\"https://player.vimeo.com/video/671612313?h=b43f7d2819&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Morning Revision Class - à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 06 - 29012022)\"', '2022-01-30 12:38:28', 1),
(687, 58, 'Paid', '44', '736', 'Grade 10 Morning Revision Class - à·€à·Šâ€à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 06 - 29.01.2022)', '365', 2, '348356.jpg', '\"https://player.vimeo.com/video/671612313?h=b43f7d2819&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Morning Revision Class - à·€à·Š&amp;zwj;à¶ºà·à¶´à·à¶» à·ƒà¶‚à·€à·’à¶°à·à¶± (Day 06 - 29012022)\"', '2022-01-30 12:39:28', 1),
(688, 58, 'Paid', '43', '543', 'à¶¶à·à¶‚à¶šà·” à·ƒà·à·ƒà¶³à·”à¶¸à·Š à·€à·’à·ƒà·Šà¶­à¶»à¶º  (30.01.2022 - Day 01) Unit 09 - 2021', '365', 2, '497624.jpg', '\"https://player.vimeo.com/video/671642985?h=9dd0e0bbdc&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶¶à·à¶‚à¶šà·” à·ƒà·à·ƒà¶³à·”à¶¸à·Š à·€à·’à·ƒà·Šà¶­à¶»à¶º  (30012022 - Day 01) Unit 09 - 2021\"', '2022-01-30 13:00:20', 1),
(689, 58, 'Paid', '44', '736', 'à¶¶à·à¶‚à¶šà·” à·ƒà·à·ƒà¶³à·”à¶¸à·Š à·€à·’à·ƒà·Šà¶­à¶»à¶º  (30.01.2022 - Day 01) Unit 09 - 2021', '365', 2, '482771.jpg', '\"https://player.vimeo.com/video/671642985?h=9dd0e0bbdc&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶¶à·à¶‚à¶šà·” à·ƒà·à·ƒà¶³à·”à¶¸à·Š à·€à·’à·ƒà·Šà¶­à¶»à¶º  (30012022 - Day 01) Unit 09 - 2021\"', '2022-01-30 13:00:53', 1),
(690, 58, 'Paid', '44', '736', 'Grade 11 Commerce - 30.01.2022 (à¶œà·à¶½à¶´à·”à¶¸à·Š à·ƒà¶§à·„à¶±à·Š à·ƒà·„à·’à¶­ à¶¸à·”à¶½à·Šâ€à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶±  Unit 05 - Day 06)', '365', 2, '274561.jpg', '\"https://player.vimeo.com/video/671646049?h=911c1ff842&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 11 Commerce - 30012022 (à¶œà·à¶½à¶´à·”à¶¸à·Š à·ƒà¶§à·„à¶±à·Š à·ƒà·„à·’à¶­ à¶¸à·”à¶½à·Š&amp;zwj;à¶º à¶´à·Š&amp;zwj;à¶»à¶šà·à·à¶±  Un\"', '2022-01-30 16:56:28', 1),
(691, 70, 'Paid', '43', '679', 'Grade 11_Paper class _Jan_4th week', '365', 2, '66508.jpg', '\"https://player.vimeo.com/video/671799241?h=73f558d3fd&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11_P\"', '2022-01-31 03:17:42', 1),
(692, 70, 'Paid', '39', '348', 'à¶¯à¶»à·Šà·à¶š', '365', 2, '415018.jpg', '\"https://player.vimeo.com/video/671799769?h=9a76be66b5&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G7_w4\"', '2022-01-31 03:20:46', 1),
(693, 70, 'Paid', '42', '360', 'à·€à·“à¶¢à·“à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶±à·€à¶½ à·ƒà·à¶°à¶š ', '365', 2, '765704.jpg', '\"https://player.vimeo.com/video/671799849?h=085ebed0f9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"g10\"', '2022-01-31 03:24:37', 1),
(694, 70, 'Paid', '43', '364', 'à¶à¶« à·€à·ƒà·Šà¶­à·”à·€à¶½ à¶´à¶»à·’à¶¸à·à·€ ', '365', 2, '151599.jpg', '\"https://player.vimeo.com/video/671799165?h=d0fb2251b9&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G11\"', '2022-01-31 03:27:34', 1),
(695, 68, 'Paid', '42', '383', '01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶…à¶§à·€à¶± à¶¯à·€à·ƒ (2022.01.29)', '365', 2, '630619.jpg', '\"https://player.vimeo.com/video/671822268?h=95da9310f6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶…à¶§à·€à¶± à¶¯à·€à·ƒ (20220129)\"', '2022-01-31 05:38:51', 1),
(696, 68, 'Paid', '43', '387', 'Grade 10 | 01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶…à¶§à·€à¶± à¶¯à·€à·ƒ (2022.01.29)', '365', 2, '122618.jpg', '\"https://player.vimeo.com/video/671822268?h=95da9310f6&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"01 à¶´à·à¶©à¶¸ - à¶¢à·“à·€à¶ºà·š à¶»à·ƒà·à¶ºà¶±à·’à¶š à¶´à¶¯à¶±à¶¸ - à¶…à¶§à·€à¶± à¶¯à·€à·ƒ (20220129)\"', '2022-01-31 05:39:27', 1),
(697, 68, 'Paid', '42', '383', '02 à¶´à·à¶©à¶¸ - à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.29)', '365', 2, '620588.jpg', '\"https://player.vimeo.com/video/671822124?h=3aeef2a431&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"02 à¶´à·à¶©à¶¸ - à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220129)\"', '2022-01-31 05:41:02', 1),
(698, 68, 'Paid', '43', '387', 'Grade 10 | 02 à¶´à·à¶©à¶¸ - à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.29)', '365', 2, '765163.jpg', '\"https://player.vimeo.com/video/671822124?h=3aeef2a431&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"02 à¶´à·à¶©à¶¸ - à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220129)\"', '2022-01-31 05:41:46', 1),
(699, 68, 'Paid', '41', '379', '02 à¶´à·à¶©à¶¸ - à¶‡à·ƒ à·„à· à¶šà¶± - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2022.01.29)', '365', 2, '518074.jpg', '\"https://player.vimeo.com/video/671822557?h=735d7fd553&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"02 à¶´à·à¶©à¶¸ - à¶‡à·ƒ à·„à· à¶šà¶± - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (20220129)\"', '2022-01-31 05:43:13', 1),
(700, 68, 'Paid', '40', '375', '03 à¶´à·à¶©à¶¸ - à·à·à¶š à¶šà·œà¶§à·ƒà·Š à·€à¶½ à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º à·„à· à¶šà·˜à¶­à·Šâ€à¶º - à¶¯à·™à·€à¶± à¶¯à·€à·ƒ (2022.01.29)', '365', 2, '676909.jpg', '\"https://player.vimeo.com/video/671823228?h=734afc409a&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"03 à¶´à·à¶©à¶¸ - à·à·à¶š à¶šà·œà¶§à·ƒà·Š à·€à¶½ à·€à·’à·€à·’à¶°à¶­à·Šà·€à¶º à·„à· à¶šà·˜à¶­à·Š&amp;zwj;à¶º - à¶¯à·™à·€à¶± à¶¯à·€\"', '2022-01-31 05:45:00', 1),
(701, 68, 'Paid', '39', '371', '02 à¶´à·à¶©à¶¸ - à·ƒà·Šà¶®à·’à¶­à·’ à·€à·’à¶¯à·Šâ€à¶ºà·”à¶­à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.29)', '365', 2, '721988.jpg', '\"https://player.vimeo.com/video/671823585?h=57bb6a2674&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"02 à¶´à·à¶©à¶¸ - à·ƒà·Šà¶®à·’à¶­à·’ à·€à·’à¶¯à·Š&amp;zwj;à¶ºà·”à¶­à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (20220129)\"', '2022-01-31 05:46:38', 1),
(702, 68, 'Paid', '43', '387', '03 à¶´à·à¶©à¶¸ - à¶¸à·’à·à·Šâ€à¶»à¶« - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.29)', '365', 2, '731451.jpg', '\"https://player.vimeo.com/video/671823923?h=cabd9dd878&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"03 à¶´à·à¶©à¶¸ - à¶¸à·’à·à·Š&amp;zwj;à¶»à¶« - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220129)\"', '2022-01-31 05:48:01', 1),
(703, 68, 'Paid', '43', '667', 'Motion In a Straight Line - Day 3 (29.01.2022)', '365', 2, '278346.jpg', '\"https://player.vimeo.com/video/671824432?h=f6cc87cc08&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Motion In a Straight Line - Day 3 (29012022)\"', '2022-01-31 05:49:41', 1),
(704, 68, 'Paid', '44', '749', 'Motion In a Straight Line - Day 3 (29.01.2022)', '365', 2, '823206.jpg', '\"https://player.vimeo.com/video/671824432?h=f6cc87cc08&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Motion In a Straight Line - Day 3 (29012022)\"', '2022-01-31 05:50:15', 1),
(705, 55, 'Paid', '39', '493', '2022/01/29  - Second lesson', '365', 2, '516104.jpg', '\"https://player.vimeo.com/video/672072956?h=a28cabe3c3&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"video1783623488\"', '2021-12-31 19:51:01', 1),
(706, 68, 'Paid', '44', '733', 'à¶­à·à¶´à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (2022.01.30)', '365', 2, '193633.jpg', '\"https://player.vimeo.com/video/671927755?h=599793cf01&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à¶­à·à¶´à¶º - à¶´à·…à¶¸à·” à¶¯à·€à·ƒ (20220130)\"', '2022-02-01 03:20:46', 1),
(707, 68, 'Paid', '44', '732', 'Acids , Bases and salts (23.01.2022)', '365', 2, '125389.jpg', '\"https://player.vimeo.com/video/671929088?h=a66f4f6d09&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Acids , Bases and salts (23012022)\"', '2022-02-01 03:39:11', 1),
(708, 68, 'Paid', '44', '732', 'Heat Changes Associated with Chemical Reactions (23.01.2022)', '365', 2, '899278.jpg', '\"https://player.vimeo.com/video/671929619?h=90c315c48c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Heat Changes Associated with Chemical Reactions (23012022)\"', '2022-02-01 03:40:33', 1),
(709, 68, 'Paid', '43', '386', 'Unit 03 - Mixtures - Day 1 (30.01.2022)', '365', 2, '423934.jpg', '\"https://player.vimeo.com/video/671929965?h=1f8d44635c&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 03 - Mixtures - Day 1 (30012022)\"', '2022-02-01 04:02:32', 1),
(710, 68, 'Paid', '42', '382', 'Unit - 01 Chemical Basis of Life - Day 8 (30.01.2022)', '365', 2, '361648.jpg', '\"https://player.vimeo.com/video/671930502?h=443cf980ac&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 8 (30012022)\"', '2022-02-01 04:05:30', 1),
(711, 68, 'Paid', '43', '386', 'Grade 10 | Unit - 01 Chemical Basis of Life - Day 8 (30.01.2022)', '365', 2, '175180.jpg', '\"https://player.vimeo.com/video/671930502?h=443cf980ac&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit - 01 Chemical Basis of Life - Day 8 (30012022)\"', '2022-02-01 04:06:30', 1),
(712, 68, 'Paid', '42', '382', 'Unit 02 - Mortion In Straight Line - Day 01 (30.01.2022)', '365', 2, '612869.jpg', '\"https://player.vimeo.com/video/671930950?h=e1d6ba605b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 02 - Mortion In Straight Line - Day 01 (30012022)\"', '2022-02-01 07:29:04', 1),
(713, 68, 'Paid', '43', '386', 'Grade 10 | Unit 02 - Mortion In Straight Line - Day 01 (30.01.2022)', '365', 2, '645043.jpg', '\"https://player.vimeo.com/video/671930950?h=e1d6ba605b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 02 - Mortion In Straight Line - Day 01 (30012022)\"', '2022-02-01 07:29:47', 1),
(714, 68, 'Paid', '43', '669', 'à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.30)', '365', 2, '809925.jpg', '\"https://player.vimeo.com/video/671931195?h=447088431b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (20220130)\"', '2022-02-01 04:14:45', 1),
(715, 68, 'Paid', '44', '750', 'à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (2022.01.30)', '365', 2, '117902.jpg', '\"https://player.vimeo.com/video/671931195?h=447088431b&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"à·ƒà¶»à¶½ à¶»à·šà¶›à·“à¶º à¶ à¶½à·’à¶­à¶º - à¶­à·”à¶±à·Šà·€à¶± à¶¯à·€à·ƒ (20220130)\"', '2022-02-01 04:15:18', 1),
(716, 70, 'Paid', '40', '352', 'à·€à·“à¶¢à·“à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶± -à¶…à·€à·ƒà¶±à·Š à¶šà·œà¶§à·ƒ ', '365', 2, '604893.jpg', '\"https://player.vimeo.com/video/672212493?h=80fd0d7506&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G8\"', '2022-02-01 05:12:46', 1),
(717, 68, 'Paid', '40', '373', 'Unit 03 - Diversity and Functions of Plant Parts - Day 02 (31.01.2022)', '365', 2, '449792.jpg', '\"https://player.vimeo.com/video/672244730?h=0ac55a1ba0&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Unit 03 - Diversity and Functions of Plant Parts - Day 02 (31012022)\"', '2022-02-01 07:59:33', 1),
(718, 58, 'Free', '42', '537', 'Grade 10 Commerce EM - Heshan Sir (Day 01 - 01.02.2022) Business Environment', '365', 2, '953703.jpg', '\"https://player.vimeo.com/video/672546453?h=598160b1de&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Grade 10 Commerce EM - Heshan Sir (Day 01 - 01022022) Business Environment\"', '2022-02-02 00:40:30', 1),
(719, 58, 'Free', '44', '736', 'Garde 11 Commerce Morning Revision Class (1st Lesson- Day17) 02.02.2022 -Heshan Sir', '365', 2, '516900.jpg', '\"https://player.vimeo.com/video/672571608?h=625aad4266&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Garde 11 Commerce Morning Revision Class (1st Lesson- Day17) 02022022 -Heshan Sir\"', '2022-02-02 01:07:16', 1),
(720, 70, 'Paid', '41', '356', 'à·€à·’à¶¢à·“à¶º à¶´à·Šâ€à¶»à¶šà·à·à¶±à·€à¶½ à·ƒà·à¶°à¶š ', '365', 2, '196616.jpg', '\"https://player.vimeo.com/video/672607148?h=0a288ca7da&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"G9\"', '2022-02-02 05:19:26', 1),
(721, 70, 'Paid', '42', '678', 'Grade 10 -Maths Paper class_Feb_1st week', '365', 2, '241844.jpg', '\"https://player.vimeo.com/video/672607290?h=ff84f6f205&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"g10paper\"', '2022-02-02 05:22:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmsmail`
--

CREATE TABLE `lmsmail` (
  `mid` int(11) NOT NULL,
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
  `exid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `class` varchar(400) NOT NULL,
  `subject` int(11) NOT NULL,
  `examname` varchar(200) NOT NULL,
  `edate` datetime NOT NULL,
  `exam_end_date` datetime NOT NULL,
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `edocument` varchar(500) NOT NULL,
  `quizcount` int(11) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsonlineexams`
--

INSERT INTO `lmsonlineexams` (`exid`, `tid`, `class`, `subject`, `examname`, `edate`, `exam_end_date`, `starttime`, `endtime`, `edocument`, `quizcount`, `add_date`, `status`) VALUES
(4, 95, '35', 1, 'test', '2023-07-08 10:00:00', '2023-07-11 12:00:00', NULL, NULL, '201542.jpg', 14, '2023-07-09 04:08:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmspayment`
--

CREATE TABLE `lmspayment` (
  `pid` int(11) NOT NULL,
  `fileName` varchar(50) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `feeID` int(11) NOT NULL,
  `pay_sub_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `accountnumber` varchar(50) NOT NULL DEFAULT '0',
  `bank` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL DEFAULT 'Online Class',
  `paymentMethod` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `session_id` varchar(20) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT '0',
  `pay_type` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmspayment`
--

INSERT INTO `lmspayment` (`pid`, `fileName`, `userID`, `feeID`, `pay_sub_id`, `amount`, `accountnumber`, `bank`, `branch`, `paymentMethod`, `created_at`, `session_id`, `status`, `order_status`, `pay_type`) VALUES
(1, 'DKC6DaKml5.jpg', 1732, 95, 1, 6000, '0', 'Pay Bank', 'Online Class', 'Bank', '2023-07-06 18:42:18', '0', 1, 1, 'half'),
(2, 'DKC6DaKml5.jpg', 1732, 95, 1, 6000, '0', 'Pay Bank', 'Online Class', 'Bank', '2023-07-08 18:42:18', '0', 1, 1, 'half');

-- --------------------------------------------------------

--
-- Table structure for table `lmsregister`
--

CREATE TABLE `lmsregister` (
  `reid` int(11) NOT NULL,
  `stnumber` varchar(200) NOT NULL,
  `email` varchar(400) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `dob` varchar(400) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `school` varchar(400) NOT NULL,
  `district` varchar(200) NOT NULL,
  `town` varchar(400) DEFAULT NULL,
  `pcontactnumber` varchar(20) DEFAULT NULL,
  `pemail` varchar(200) DEFAULT NULL,
  `pname` varchar(4000) DEFAULT NULL,
  `contactnumber` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `level` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(500) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `relogin` int(11) NOT NULL,
  `reloging_ip` int(11) NOT NULL,
  `payment` int(11) NOT NULL,
  `verifycode` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsregister`
--

INSERT INTO `lmsregister` (`reid`, `stnumber`, `email`, `fullname`, `dob`, `gender`, `school`, `district`, `town`, `pcontactnumber`, `pemail`, `pname`, `contactnumber`, `address`, `level`, `password`, `image`, `add_date`, `status`, `ip_address`, `relogin`, `reloging_ip`, `payment`, `verifycode`) VALUES
(1297, 'GNI-45826', 'susanshehani@gmail.com', 'Yenuja sheheran ', '2015-07-09', 'male', 'St.joseph college nugegoda ', 'Colombo', 'Boralesgamuwa ', '769724488', '', '', '769724488', '43/17,pubudu mw boralesgamuwa ', 34, 'e52e2909394b28df4d466d6aee8f895e', '', '2021-11-23 02:23:33', '1', '', 0, 0, 0, ''),
(1296, 'GNI-49972', 'surekafernando304@gmail.com', 'M. D. Romasha Shehari Fernando ', '2007-07-10', 'female', 'All Saints\' College ', 'Colombo', 'Colombo 15', '721854163', '', '', '721854163', '55/8,st. Jude lane, modara, Colombo15 ', 42, 'd5c137c46d0e7f27081f43f841de93af', '1641119705IMG-20211229-WA0016.jpg', '2022-01-02 10:35:06', '1', '', 0, 0, 0, '1180'),
(1364, 'GNI-00074', 'anuradhahapu@gmail.com', 'Rakhitha Haputhanthri', '2009-10-10', 'male', 'Ananda College', 'Kalutara', 'Panadura', '784447822', '', '', '784447822', 'bekkegama,bogaha road', 40, '768f27189c79bb2a49e315a50386922a', '', '2021-11-29 12:18:29', '1', '', 0, 0, 0, ''),
(1298, 'GNI-65925', 'wasanthirenuka7@gmail.com', 'Wijerathna Mudiyanselage don Tashen Chalangna', '2010-05-05', 'male', 'D.S. Senanayake College ', 'Colombo', 'Nugegoda', '774624259', '', '', '774624259', 'No: 32/2 A , Wekanda lane , Jambugasmulla mawatha , Nugegoda.', 39, 'df756d99863a6af9ce019d1233815d35', '1638077808IMG_20210628_111220.jpg', '2021-12-04 10:35:43', '1', '', 0, 0, 0, '8631'),
(1299, 'GNI-82031', 'tharulib@gmail.com', 'Tharuli thesanga ', '2007-10-24', 'female', 'Lindsay girl school ', 'Colombo', 'Boralesgamuwa ', '772432050', '', '', '772432050', '325,1st lane,rathanapitiya ,boralesgamuwa ', 42, '5a24a271d10a21778ea8f1cb9c9e12e4', '', '2021-11-23 05:25:07', '1', '', 0, 0, 0, ''),
(1300, 'GNI-12226', 'GinuraVinvath@gmail.com', 'Ginura Vinvath', '2005-11-09', 'male', 'Prince of wales college', 'Colombo', 'Moratuwa', '716550636', '', '', '716550636', '34/1 Lake view garden', 44, '8b930b0672f9b34bfc1021fcb2134f00', '', '2021-11-23 06:08:17', '1', '', 0, 0, 0, ''),
(1301, 'GNI-46602', 'hima099@gmail.com', 'Rithika Dinsara Abeysekara ', '2016-07-11', 'male', 'Leeds International School ', 'Ampara', 'Horana', '94777426496', '', '', '94777426496', '21/2, Hegalla Road, Horana.', 33, '255872c25c0d04a6a08d2bf5099203fc', '', '2021-11-23 06:41:55', '1', '', 0, 0, 0, ''),
(1302, 'GNI-63366', 'dinushasubhashini1983@gmail.com', 'S .Methsara pahan ', '2013-10-29', 'male', 'Bulathsinhala primary school', 'Kalutara', 'Bulathsinhala', '766360809', '', '', '766360809', 'Wawe Kade, Galahena, bulathsinhala', 35, '93c664c1c4b141e3e20f4e9877e5d307', '', '2021-11-23 07:44:36', '1', '', 0, 0, 0, ''),
(1303, 'GNI-56905', 'productionbm18@gmail.com', 'Neha kaumadi herath', '2006-11-21', 'female', 'Galagedara central college ', 'Colombo', 'Maharagama ', '716103121', '', '', '773068552', '520/5,High level Rd,navinna,maharagama', 43, 'd54d1702ad0f8326224b817c796763c9', '163816674320210930_111721.jpg', '2022-01-29 04:31:59', '1', '', 0, 0, 0, ''),
(1304, 'GNI-39625', 'mendisadithya1@gmail.com', 'Waranakula Ansh Adithya Mendis', '2007-03-12', 'male', 'Science College Mt lavinia', 'Colombo', 'Moratuwa,Katubedda', '716202999', '', '', '767802811', 'No 4 Ramya place sri rahula mw Katubedda ', 42, '6b20039ac7f1fbfc954ee475cb10bff0', '', '2021-11-23 10:51:29', '1', '', 0, 0, 0, ''),
(1305, 'GNI-02252', 'dishanmandis2@gmail.com', 'Waranakula Desh Dhakshina Mendis', '2013-08-29', 'male', 'Science college mt lavinia', 'Colombo', 'Moratuwa,katubedda', '716202999', '', '', '779882999', 'No 4 ramya place sri rahula mw Katubedda ', 36, 'f83fd7fdbb02034f949912cfefd104dd', '', '2021-11-23 11:08:37', '1', '', 0, 0, 0, ''),
(1306, 'GNI-05292', 'husainz3.hj@gmail.com', 'Hussein', '2010-05-18', 'male', 'thulhiri', 'Kegalle', 'warakapola', '756870303', '', '', '756870303', 'thulhiriya warakapola', 38, '25f9e794323b453885f5181f1b624d0b', '', '2021-12-31 08:06:52', '1', '', 0, 0, 0, ''),
(1307, 'GNI-71151', 'Jayaminiwathsala7@gmail.com', 'Gurusigha arachchige iduwara buddima', '2015-06-05', 'male', 'Lumbini college colombo ', 'Colombo', 'Nugegoda ', '774814219', '', '', '774814219', '43/69 poorwarama road ,kirulapana ,colombo ,05.', 34, 'c6589e8cf8e4974b36b040291baf8c73', '1637758291FB_IMG_1624479125622.jpg', '2021-11-24 12:51:32', '1', '', 0, 0, 0, ''),
(1308, 'GNI-13684', 'methmadissanayaka4@gmail.com', 'Chamath Prabasha ', '2006-11-24', 'male', 'Ananda Sastralaya Kotte', 'Colombo', 'dematagoda', '779982307', '', '', '779699912', '1A/F02/U12 Siyapath sewana,Aramaya PLC,Dematagoda Colombo 09', 42, 'a63a918a28280a5e7acc40199c09a686', '', '2021-11-24 14:10:15', '1', '', 0, 0, 0, ''),
(1309, 'GNI-64858', 'buddhikadeshapriya9615@gmail.com', 'Buddhika Abenayake', '2000-01-06', 'male', 'Blabas', 'Colombo', 'Jaffna', '774598115', '', '', '774598115', '292/D, Pepiliyana, Boralesgamuwa', 43, 'ecbbec415b9f6b7f223d626513a9b811', '', '2021-12-02 14:53:27', '1', '', 0, 0, 0, ''),
(1310, 'GNI-43330', 'dilinipriyan26@gmail.com ', 'Karawitage Nisandi Sehansa Piyarathna ', '2009-09-19', 'female', 'Hanwella Rajasinghe Central College', 'Colombo', 'Kosgama', '772651510', '', '', '772651510', '443/1/A, Ihala Kosgama, Kosgama.', 40, '397ab2779716c69a80486759925907eb', '', '2022-01-02 10:52:32', '1', '', 0, 0, 0, '7480'),
(1311, 'GNI-62483', 'computersmastertech267@gmail.com', 'Tevin Bashwara Chandrasiri ', '2008-10-25', 'male', 'Rewatha collage madatugama ', 'Matale', 'dambulla', '775448485', '', '', '775448485', '8 Canel road  sathipola place  Dambulla', 41, '3fc6bf0602a8fc4349f9bcce935ea695', '1639655681photo_2021-12-12_06-43-15.jpg', '2021-12-16 11:54:41', '1', '', 0, 0, 0, ''),
(1312, 'GNI-73079', 'jayinduperera@gmail.com', 'Jayindu Bethmin Perera', '2005-08-17', 'male', 'Ananda College', 'Colombo', 'Borella', '768692992', '', '', '768692992', 'No.8 , kithyakara Road , Colombo 10', 44, '246d2c8208bda9b4c068e553dc12d0e7', '1637856697Cinnamon_Lakeside_2.jpg', '2021-12-01 10:08:10', '1', '', 0, 0, 0, ''),
(1313, 'GNI-56864', 'silvapoorna1983@gmail.com', 'D.M.D.Ranumi Ranara', '2006-06-07', 'female', 'Samudradevi Balika Vidyalaya Nugegoda', 'Ampara', 'Kotte', '775356942', '', '', '775356942', '16/2A,Jayanthi mawatha,Mirihana,Kotte', 43, 'b70dec839a5b520eb9b6bb55feade695', '163785332684D4DD48-6F69-49BA-9CED-361B6C147F32.jpeg', '2021-11-25 15:15:27', '1', '', 0, 0, 0, ''),
(1314, 'GNI-47010', 'ondg902@gmail.com', 'D.G.Onitha nethvidu', '2006-09-22', 'male', 'carey collage', 'Colombo', 'boralasgamuwa', '779143013', '', '', '703004398', '197/3,sirimal uyana,werahara,boralesgamuwa ', 43, 'd3647c8b1b7690b3eb1565daefbd9d3b', '', '2021-11-25 14:50:23', '1', '', 0, 0, 0, ''),
(1315, 'GNI-82782', 'lakinduwijesingha@gmail.com', 'Lakindu Nimsara Wijesingha', '2008-09-19', 'male', 'A/Shantha joseph maha vidyalaya', 'Anuradhapura', 'Anuradhapura', '711941303', '', '', '717363442', 'Chandima Lakmini Bowalgaha 21st canel Diwulwewa Hidogama Anuradhapura', 41, '308c10e35d260b5624e6b7b47df00db5', '', '2021-11-26 06:31:59', '1', '', 0, 0, 0, ''),
(1316, 'GNI-79127', 'faneesharuhin@gmail.mail.com', 'Mohamed Ruhin  Mohamed Rayan', '2016-07-27', 'male', 'B/Uva college Badulla', 'Badulla', 'Badulla ', '779118872', '', '', '779118872', '61 Karunapura Badulla', 33, 'a330f5875e8a0df312c530f47673a6ca', '', '2021-11-26 00:31:58', '1', '', 0, 0, 0, ''),
(1317, 'GNI-20278', 'madu.thenuwara@gmail.com', 'Nemitha Aradhya Hansana', '2015-01-16', 'male', 'Somaweera Chandrasiri Primary School', 'Colombo', 'Kesbewa', '772071713', '', '', '772071713', '291/27,4th Lane, Mandawila Road , .Kesbawa', 35, 'e1065a53aa8f5647bac0b4a18b248757', '', '2021-11-26 07:37:51', '1', '', 0, 0, 0, ''),
(1318, 'GNI-75479', 'lc.wijekumara@gmail.com', 'L. Chanudi Prabhashi Dinnendra Wijekumara.', '2009-01-02', 'female', 'Good Shephard Convent , Panadura.', 'Kalutara', 'Bandaragama', '778293479', '', '', '778293479', '193/A/2,Rukgahathotupolla Road,Aluthgama , Bandaragama', 40, '3853f1cd7a1203301c9d1bbe95837d77', '', '2021-11-26 12:26:10', '1', '', 0, 0, 0, ''),
(1319, 'GNI-05242', 'malshikavindi15@gmail.com', 'Malshi kavindi', '2005-04-15', 'female', 'Samudra devi balika vidyalaya nugegoda ', 'Colombo', 'Nugegoda ', '112769063', '', '', '762043885', '37/ wakanda road , jumbugalmulla mawatha, nugegoda ', 44, '26506bfed6c22b3343a99d160aaf5529', '', '2022-01-06 11:01:38', '1', '', 0, 0, 0, ''),
(1320, 'GNI-73696', 'sadew.ps@gmail.com', 'Sadew pahasara', '2007-10-22', 'male', 'Rangiri Dambulla central college ', 'Ampara', 'Dambulla', '760514696', '', '', '776705192', '2/3, Egodawewa Road,Kimbissa,Sigiriya ', 42, '1bf9526fc25612500a4ecd3dae980114', '', '2021-11-26 13:21:45', '1', '', 0, 0, 0, ''),
(1321, 'GNI-91407', 'managaladsbd@gmail.com', 'Senudi Damsara', '2010-02-16', 'female', 'B/Vihara Maha Devi girls college', 'Badulla', 'Budulla', '714953280', '', '', '714953280', 'T1/27 Ulpotha road Kandaketiya', 39, 'ba57bd9c11471b254468f89becbec168', '1638678344images_(10).jpg', '2021-12-05 04:25:44', '1', '', 0, 0, 0, ''),
(1322, 'GNI-10074', '1@', 'RANSI', '2021-03-23', 'male', 'DAA', 'Kandy', 'AA', '705577487', '', '', '705588778', 'AAA', 43, '25d55ad283aa400af464c76d713c07ad', '', '2021-12-01 08:03:35', '1', '', 0, 0, 0, ''),
(1323, 'GNI-56692', 'Oshadhihettiarachchi30@gmail.com', 'Oshadhi hettiarachchi', '2008-07-16', 'female', 'Lindsay girl\'s school', 'Colombo', 'Colombo 2', '773584031', '', '', '716683852', '125,church street,colombo 2 ', 41, 'c98f6b0b83bbaea379ca645088f302ed', '', '2021-11-26 14:46:15', '1', '', 0, 0, 0, ''),
(1324, 'GNI-00726', 'pinkylacky@gmail.com ', 'Adikarige vihas bometh perera', '2010-08-06', 'male', 'S\'t john\'s college', 'Colombo', 'KOHUWALA ', '776464901', '', '', '776464901', '10/5A,first lane,wickramarathna  Mawatha,Kohuwala,Nugegoda', 39, '139ec141de4a8275a3e2501d049b018e', '', '2021-12-13 02:06:01', '1', '', 0, 0, 0, '8281'),
(1325, 'GNI-08749', 'sasmithasubasingha@gmail.com', 'Sasmitha Yashasvi Subasingha', '2007-06-04', 'male', 'A/Niwaththaka Chethiya Maha Vidyalaya', 'Anuradhapura', 'Anuradhapura', '714886612', '', '', '714886612', 'Anuradhapura', 42, 'e216eb699f45331628d7bd931e1019a1', '16379396301.jpeg', '2021-11-26 15:13:50', '1', '', 0, 0, 0, ''),
(1326, 'GNI-54795', 'mahesh9910@gmail.com', 'Chelaka Amarasiri', '2007-11-02', 'male', 'Ananda College', 'Colombo', 'PANNIPITIYA', '722480996', '', '', '722480996', '20/10 Salamal Pedesa Devala Road Depanama Pannipitiya', 42, 'b9009e5a1f1ccbeb662611d62486cf3f', '', '2021-11-26 16:43:13', '1', '', 0, 0, 0, ''),
(1327, 'GNI-03278', 'wijendraamantha123@gmail.com', 'W.A.D.Amantha Madunuwan', '2007-06-09', 'male', 'St.Benedict\'s college ', 'Colombo', 'Colombo', '768909024', '', '', '713359312', '147/9-B Madampitiya Rod,Colombo 15', 42, '8ac096aa05d613f9e7a608af19c4fd4e', '1637996585WhatsApp_Image_2021-11-27_at_12.31.26.jpeg', '2022-01-10 13:01:44', '1', '', 0, 0, 0, ''),
(1328, 'GNI-13637', 'chandeesharavihari@gmail.com', 'P.A.Kaveesha Dilshan Pitumpe ', '2008-07-29', 'male', 'Hanwella Rajasingha Central College', 'Colombo', 'Kosgama ', '777161747', '', '', '784917309', '29/2,Bollathawa junction,Kanampella,Kosgama.', 41, 'a1aff9b877b2ebb99794f0f2487e65ff', '', '2021-11-26 20:49:20', '1', '', 0, 0, 0, ''),
(1329, 'GNI-70402', 'surangilakmalisenadeera@gmail.com', 'Daham hasarel wickramathilaka', '2009-07-18', 'male', 'Sirimawo bandaranayaka school.', 'Matale', 'Matale', '774768082', '', '', '774069760', '51,Daham mawatha,wariyapola watta,Matale.', 39, 'd9e5203a6a424e75273146fb389c0f50', '', '2021-11-27 02:30:57', '1', '', 0, 0, 0, ''),
(1631, 'GNI-08948', 'guruniwasanugegoda@gmail.com', 'Abiman withakshana TEST PROFILE', '2003-10-08', 'male', 'Dssc', 'Colombo', 'Nugegoda.', '773225351', '', '', '703238556', '61/4, Wekanda RD ,Nugegoda', 42, 'ad20a2680238c11524f698e5a1a04cc2', '1640797557ABHIMAN_SIR.jpeg', '2022-01-31 16:13:52', '1', '', 0, 0, 0, ''),
(1331, 'GNI-26289', 'shali.upamali@gmail.com', 'Buwani Veneesha Edirisinghe', '2007-05-07', 'female', 'Vidyakara Girls\' School', 'Colombo', 'Maharagama', '718222089', '', '', '718222089', 'No. 110, 5th Lane , Kendahena Estate, Pannipitiya.', 42, '880f39fef4522167837722c14f6bb198', '1638332603IMG-20191227-WA0014_(3).jpg', '2021-12-01 04:23:23', '1', '', 0, 0, 0, ''),
(1332, 'GNI-06155', 'GPyenura356nethmika@gmail.com', 'G.P. Yenura Nethmika', '2007-03-12', 'male', 'H/Abeysekaragama M.V.', 'Hambantota', 'Embilipitiya', '724231270', '', '', '760439372', 'Gamunupura, Barawakumbuka.', 42, '3452eb80e629443e82ff2e8e36f549da', '', '2021-11-27 08:48:44', '1', '', 0, 0, 0, ''),
(1333, 'GNI-25760', 'nalanid813@gmail.com', 'Sahan Sandeeptha', '2009-02-14', 'male', 'Mo/Obbegoda secondary school', 'Monaragala', 'Monaragala', '721840046', '', '', '712692230', '05/B Alhenpitiya,Obbegoda,Monaragala.', 40, 'ca6453970e1d1d41844acf2c78741757', '1638587391learning-education-word-letters.jpg', '2021-12-05 11:06:58', '1', '', 0, 0, 0, ''),
(1334, 'GNI-64387', 'Kosalagomes@gmail.com', 'Ramiru  Dihas Amarasinghe ', '2010-09-29', 'male', 'Kottawa  Dharmapala Maha Vidyala ', 'Colombo', 'Kottawa ', '777315582', '', '', '777315582', '1158/8,Wasalawatta ,Kottawa , Pannipitiya ', 39, '56bf058a6ec01eef3b912973c85ccbdd', '', '2021-11-27 10:44:05', '1', '', 0, 0, 0, ''),
(1335, 'GNI-37724', 'melanimadurika82@gmail.com', 'bawanya methpani purankumbura', '2010-05-29', 'female', 'VIHARA MAHA DEVI GIRLS COLLAGE KANDY', 'Kandy', 'Kandy', '713742577', '', '', '713742577', '76/E NAGASTHANNA RODE KANDY', 39, '06dbc6261fb8fd6401515988322cf870', '1643379661IMG_20160405_064521.jpg', '2022-01-28 14:21:01', '1', '', 0, 0, 0, ''),
(1336, 'GNI-90046', 'viruna2009gunasekera@gmail.com', 'N.A.Vihari Ayansa Gunasekara ', '2010-10-16', 'female', 'St.Anne\'s Convent Waththala', 'Gampaha', 'K', '762666502', '', '', '779064019', '362/1 Jinasena Mawatha Mahara Kadawatha', 39, '02345c5af3806ca471d71d294a76cc9e', '', '2021-11-27 12:30:56', '1', '', 0, 0, 0, ''),
(1337, 'GNI-42051', 'bethminperera@gmail.com', 'Jayesh Veeran Perera', '2009-05-25', 'male', 'Ananda College', 'Colombo', 'Borella', '716099910', '', '', '716099910', 'No.8 , Kithyakara Road , Colombo 10', 40, 'a529d8b19b55d60c776e07c39b1268a7', '1638073288EDrUlbGU8AE3QVp.jpg', '2021-11-28 04:21:28', '1', '', 0, 0, 0, ''),
(1338, 'GNI-88179', 'ridmijayawardana2006@gmail.com', 'Ridmi Nishara Jayawardhana ', '2006-11-10', 'female', 'WP/JAYA Samudradevi Balika vidyalaya ', 'Colombo', 'Nugegoda ', '770389976', '', '', '778520056', '11/A Maddumagewatta housing scheme , Gangodawila ,Nugegoda ', 43, '66e602c44dba33315692a6d58f7bf013', '', '2022-01-12 12:25:39', '1', '', 0, 0, 0, ''),
(1339, 'GNI-64280', 'ruwandi.lakshika2005@gmail.com', 'Ruwandi Lakshika', '2005-08-08', 'male', 'Mahamaya Balika Vidyalaya Nugegoda ', 'Colombo', 'Nugegoda', '717647874', '', '', '0', '61 1st Ln', 44, 'd41d8cd98f00b204e9800998ecf8427e', '', '2021-11-28 02:07:08', '1', '', 0, 0, 0, ''),
(1340, 'GNI-04714', 'mtsperera899@yahoo.com', 'sanuli yohansa', '2021-08-19', 'female', 'Maha maya balika maha vidyalaya', 'Gampaha', 'Kadawatha ', '779090713', '', '', '779090713', '258/c pahala biyanvila kadawatha ', 35, '25d55ad283aa400af464c76d713c07ad', '', '2021-11-28 02:43:40', '1', '', 0, 0, 0, ''),
(1341, 'GNI-70207', 'lakalanka77@gmail.com', 'Lahiru Akalanka', '2004-11-25', 'male', 'WP/PILI/Dharmaraja maha viddayalaya', 'Colombo', 'Piliyanbala', '704176628', '', '', '704176628', '59/6/B1, Gagabada Road, Wewala, Piliyanbala', 42, '65e30fba592f7f4c86bb8885840f2786', '', '2021-11-28 04:02:19', '1', '', 0, 0, 0, ''),
(1342, 'GNI-34695', 'mitharaganegoda@gmail.com', 'Upani Mithara Ganegoda', '2005-02-07', 'female', 'Mahamaya Girls\' College', 'Polonnaruwa', 'Minneriya', '775682791', '', '', '775682791', 'No 5/5,Habarana road,Minneriya', 44, 'de2bc7b8cb30cfb5064d32c9d95c9fd1', '1639649142FB_IMG_1632045081276.jpg', '2021-12-16 10:05:42', '1', '', 0, 0, 0, ''),
(1343, 'GNI-02722', 'dulsaraashinsa@gmail.com', 'K.M.Dulsara Ashinsa', '2010-07-04', 'male', 'Royal College, Polonnaruwa', 'Polonnaruwa', 'Hingurakgoda', '715151748', '', '', '751435651', '773/2, 4th Lane, Church Road, Hingurakgoda.', 39, '6dcca4e9052f263d70587a9b81c1d0b4', '', '2021-11-28 05:12:07', '1', '', 0, 0, 0, ''),
(1344, 'GNI-74278', 'gsrlokugamage@gmail .com', 'Nikila nimsara ', '2009-07-04', 'male', 'Dudley senanayaka college colombo 5', 'Colombo', 'Colombo 15', '702413272', '', '', '789626027', '275/6,à¶…à¶½à·”à¶­à·Š à¶¸à·à·€à¶­,colombo 15', 40, '208ebb129651c5ebb39169e39a726360', '', '2021-12-18 04:14:27', '1', '', 0, 0, 0, ''),
(1345, 'GNI-93744', 'randikakrishan1971@gmail.com', 'I.A.D Randika krishan', '2009-02-06', 'male', 'ST John college nugegoda', 'Colombo', 'nugegoda', '756968123', '', '', '722112991', '72 Kadawatha road Kalubowila Dehiwala', 40, 'ac919b160e8d9009064ff2f25c54b876', '1638089986d7496f3c-4b17-4e9a-b921-38b39f3a1184.jpg', '2021-12-15 05:16:52', '1', '', 0, 0, 0, '4578'),
(1346, 'GNI-01039', 'ransikamandiv25@gmail.com', 'P.Ransika mandiv', '2005-11-18', 'male', 'presidents college kotte', 'Colombo', 'dehiwala', '770531051', '', '', '770531051', '46/2c/wimalasara rd,kalubowila,dehiwala.', 44, '400ba809a33e50e2502b685ee01574b8', '', '2021-11-28 09:04:07', '1', '', 0, 0, 0, ''),
(1347, 'GNI-22326', 'sugathpieris167@gmail.com', 'P.sansika mindiv pieris', '2010-03-20', 'male', 'prince of wales moratuwa', 'Colombo', 'Dehiwala', '768819665', '', '', '768819665', '46/2c/wimalasara rd,kalubowila,dehiwala.', 39, '400ba809a33e50e2502b685ee01574b8', '', '2021-11-28 09:14:14', '1', '', 0, 0, 0, ''),
(1348, 'GNI-54034', 'akawshi@gmail.com ', 'Kahandawita Gamage Don Demitrious Natheniyal ', '2012-08-24', 'male', 'St. Lusiyas college Colombo 13', 'Ampara', 'Dematagoda ', '779123870', '', '', '779123870', '288/64,Baseline Road dematagoda colombo 9', 37, '537fd8ba9f8a26719cf779fc0a9e97d4', '', '2021-12-05 12:47:16', '1', '', 0, 0, 0, ''),
(1349, 'GNI-25944', 'indunilsolangaarchchi@gmail.com', 'N.A.Viruna Yugith Gunasekara ', '2009-03-04', 'male', 'Mahanama College Colombo ', 'Ampara', 'Kadawatha', '779064019', '', '', '762666502', '362/1 Jinasena Mawatha Mahara Kadawatha', 40, '0ff12d2fe86fe1774b87f12f2f85a75a', '1639453138images.jpg', '2021-12-14 03:38:58', '1', '', 0, 0, 0, ''),
(1350, 'GNI-05789', 'Nethsare21@gmail.com', 'D.M nethsare hirudaya dissanayaka', '2010-06-24', 'male', 'B/ wangiyakumbura jathika pasala', 'Ampara', 'Boralanda', '777031677', '', '', '775621677', 'No 13 Naranweldowa boralanda', 39, '25d55ad283aa400af464c76d713c07ad', '1639060587IMG-20211209-WA0014.jpg', '2021-12-09 14:36:27', '1', '', 0, 0, 0, ''),
(1351, 'GNI-48570', 'Shamainfaiz14@gmail.com', 'Sanudi vimarsha', '2014-09-13', 'female', 'Methodist college  colombo ', 'Gampaha', 'Kandana ', '770627023', '', '', '770627023', '360/1 kapuwagara road Batagama south Kandana ', 35, '46aa48281d95459177d3d72b845f5665', '', '2021-11-29 01:55:33', '1', '', 0, 0, 0, ''),
(1352, 'GNI-36025', 'Shamainfaiz14@gmail.com', 'Theveen randula', '2012-10-17', 'male', 'Mahanama college Colombo ', 'Gampaha', 'Kandana ', '723634616', '', '', '723634616', '360/1 kapuwagara road Batagama south Kandana ', 36, '7a39a88015c9e3af5dae14b2b92b0e5e', '', '2021-11-29 02:12:13', '1', '', 0, 0, 0, ''),
(1353, 'GNI-38982', 'Kmsgbandara109@gmail.com', 'Diduli Akarsha ', '2007-08-12', 'female', 'Mo/Obbegoda Secondary School', 'Monaragala', 'Monaragala', '710495147', '', '', '704382241', 'Elhenpitiya,Obbegoda,Monaragala', 42, 'e6cd10c3186a3fb694cfba250b421756', '1638667507IMG-20211204-WA0025.jpg', '2021-12-05 01:25:07', '1', '', 0, 0, 0, ''),
(1354, 'GNI-62035', 'pchaminda757@gmail.com', 'J.Sachini Hesara Weerathunga', '2009-03-03', 'female', 'Vishaka Girl\'s College Bandarawela', 'Badulla', 'boralanda', '767349975', '', '', '767349975', 'J.C.P.Weerathunga thennekumbura boralanda', 40, '629281f90569a45c5d8706b141e57236', '', '2021-11-29 04:00:03', '1', '', 0, 0, 0, ''),
(1355, 'GNI-03105', 'warunisilva126@gmail.com', 'K.Waruni Maduwanthi Silva', '2006-04-02', 'female', 'Anula Vidyalaya', 'Colombo', 'Nugegoda', '760349368', '', '', '760349368', '19/B 4th Lane Jambugassmulla Mawatha Nugegoda', 43, 'f15c7079bde03af80ce9aa8aada80895', '1640501337images_(12).jpeg', '2021-12-26 06:48:57', '1', '', 0, 0, 0, ''),
(1356, 'GNI-93152', 'onelidilan@gmail.com', 'Oneli Vayanija ', '2009-12-30', 'male', 'Mayurapadha National school', 'Kegalle', 'Mawanella', '711575858', '', '', '711575858', '\"Sudisi\" Demadahiriya Aranayaka', 40, '25f9e794323b453885f5181f1b624d0b', '', '2021-11-29 07:18:20', '1', '', 0, 0, 0, ''),
(1357, 'GNI-16012', 'chamindawickramasinghe.1980@gmail.com', 'Tenura Bometh', '2008-05-14', 'male', 'Nalanda College ', 'Gampaha', 'Ragama', '775231592', '', '', '762396247', '119/4,Kurukulawa Ragama ', 41, 'a1906d2e19e885a4c0c04d6458078e75', '163817103822227e1-a4d1-4ad7-8bcc-b6141ea77fcf.jpg', '2021-11-29 07:30:38', '1', '', 0, 0, 0, ''),
(1358, 'GNI-15136', 'shamachampika87@gmail.com', 'U.D.Kalani Upeksha Jayaweera ', '2009-01-02', 'female', 'St/Anthony Girl\'s School ', 'Kalutara', 'Panadura ', '774030764', '', '', '774030764', '75/D/01,Batewela Road,Aruggoda,Alubomulla.', 41, '475e3583b71af87e7b6decd9b5691617', '', '2021-11-29 07:28:37', '1', '', 0, 0, 0, ''),
(1359, 'GNI-07896', 'kushisesadi@gamil.com', 'M.D.Thewni dahamsa', '2008-05-19', 'female', 'Anula vidyalaya', 'Colombo', 'maharagama', '779383457', '', '', '776846179', '253/1/B ,Galwala rode, nilammahara, boralasgamuwa,', 41, '3b97475a5a35d6c5f5e6ba3f72538bbc', '', '2021-11-29 08:00:34', '1', '', 0, 0, 0, ''),
(1732, 'ATL-07133', 'lucianmacwolf@gmail.com', 'mac wolf', '2022-05-31', 'male', 'DCB', 'Badulla', 'badulla', '787200877', 'asd@gmail.com', 'asd1', '787200877', 'asd', 35, '25f9e794323b453885f5181f1b624d0b', '', '2023-07-06 12:53:54', '1', '', 0, 0, 0, ''),
(1361, 'GNI-07332', 'binulirbv8@gmail.com', 'BINULI BIHANSA RAJAPAKSHA', '2008-09-10', 'female', 'Rathnawali Balika Vidyalaya Gampaha', 'Gampaha', 'Gampaha', '714800036', '', '', '704800036', '48/A Vijaya Road Gampaha', 41, '35cf032c52210b1ebe38902f171cc14c', '1639563514IMG-20210714-WA0003.jpg', '2021-12-30 07:55:45', '1', '', 0, 0, 0, ''),
(1362, 'GNI-71795', 'Dimanthi2009@gmail.com', 'M.D Dimanthi sesadi gunathilaka', '2009-07-26', 'female', 'Anula vidyalaya', 'Colombo', 'Maharagama', '779383457', '', '', '760376134', '253/1B galwala para , neelammahara, boralesgamuwa', 40, 'ca6c3235fc31ba27008ca7c1459acd80', '', '2021-11-29 09:54:43', '1', '', 0, 0, 0, ''),
(1363, 'GNI-50206', 'Ajanthakumara@gmail.com', 'Wenasara miniduni ranathunga', '2007-06-11', 'female', 'à·€/à·€à¶¯/à¶¶à·à¶œà·ƒà·Š à·€à·à·€ à¶¸à·„à· à·€à·’à¶¯à·Šâ€à¶ºà·à¶½à¶º', 'Vavuniya', 'Vavuniyava', '778430482', '', '', '778430482', 'No1514,6 lane,bogasveva 2,vavuniyava ', 42, '25d55ad283aa400af464c76d713c07ad', '', '2021-11-29 10:52:01', '1', '', 0, 0, 0, ''),
(1365, 'GNI-70050', 'hagk98@gmail.com', 'M.P.A.KEVIN PEIRIS', '2007-01-22', 'male', 'St. Peter\'s College', 'Colombo', 'Wellawatte', '762045698', '', '', '773442198', '20,Vijitha Road ,Colombo 06', 43, '489eef4ce074c1cecab352f361c8630e', '', '2021-11-29 13:21:22', '1', '', 0, 0, 0, ''),
(1366, 'GNI-71762', 'Umangajayathilaka@gmail.com', 'A.D.S.U. DISSANAYAKE', '2006-10-17', 'female', 'A/central college', 'Anuradhapura', 'Nochchiyagama', '714513735', '', '', '715387110', 'No,228,agalum road,nochchiyagama', 43, 'd6acc76f62c92b38b3e78000437e8566', '', '2021-11-29 13:27:53', '1', '', 0, 0, 0, ''),
(1367, 'GNI-35856', 'hagk98@gmail.com', 'Channeli Peiris', '2016-07-29', 'female', 'Holy Family Convent', 'Colombo', 'Wellawatte', '762045698', '', '', '702591454', '20,Vijitha Road ,Colombo 06', 33, '489eef4ce074c1cecab352f361c8630e', '', '2021-11-29 13:39:24', '1', '', 0, 0, 0, ''),
(1368, 'GNI-48897', 'cnithushi@gmail.com', 'Nithushi Colonne', '2009-04-13', 'female', 'Royal Central College Polonnaruwa ', 'Polonnaruwa', 'Polonnaruwa ', '777886043', '', '', '777889594', 'No13,Hospital Junction,Polonnaruwa', 40, '40f0e18fd9bebcbaf51b77a8f49e9cf6', '16381983344D060040-7581-465D-9E18-81BE09B7767D.jpeg', '2021-11-29 15:05:34', '1', '', 0, 0, 0, ''),
(1369, 'GNI-76200', 'v121.cbg@gmail.com', 'A R W M R K Senevirathne', '2006-07-04', 'male', 'Mahinda Rajapaksha College', 'Colombo', 'Homogama', '716530536', '', '', '716530536', 'Moonamale Rd, Kiriwaththuduwa, Homagama', 43, 'bae638c646739c4d916505a688a9f33a', '', '2021-12-26 16:32:28', '1', '', 0, 0, 0, ''),
(1370, 'GNI-75634', 'nimalidissanayaka910@gmail.com', 'W.M.Hiruka Miyuranda ', '2009-02-17', 'male', 'Mo/Nisshanka central college ', 'Monaragala', 'Badalkumbura', '715494587', '', '', '715494587', 'Suramya,Pussallawa,Badalkumbura', 40, 'e0af21a18b3197a995783cadb0e25150', '1638251834IMG-20210128-WA0018.jpg', '2022-01-13 07:33:45', '1', '', 0, 0, 0, ''),
(1371, 'GNI-22213', 'shenushiv9@gmail.com', 'D.M.G Shenushi Vihanga ', '2009-05-06', 'female', 'Sumedha College Gampaha ', 'Gampaha', 'Ganemulla', '741462125', '', '', '769017122', '149/F/2, pahala yagoda, Ganemulla ', 40, '0fa65d2e05af38130e01c3fd1732d4c7', '16385446683CE29213-4EDC-41A2-ADF9-7CB59DA0E902.jpeg', '2021-12-03 15:17:48', '1', '', 0, 0, 0, ''),
(1372, 'GNI-32325', 'suneethaf75@gmail.com', 'Shinali Ogasteena Morayas', '2008-04-03', 'female', 'Dankotuwa Girls\' College.', 'Gampaha', 'Negombo', '774654567', '', '', '774654567', 'No.32/4,Dostarawaththa,Thibirigaskatuwa,Negombo.', 41, 'd7d6180fbe545e093a290e2f23542674', '', '2021-11-30 07:33:00', '1', '', 0, 0, 0, ''),
(1373, 'GNI-52278', 'iresha418@gmail.com ', 'Onaya Christine ', '2011-04-05', 'female', 'Good Shepherd Convent ', 'Kandy', 'Kandy', '775656063', '', '', '775656063', 'No.93/56,Vihara lane, Suduhumpola, kqndy', 39, '766bb1662288475252eb15496a3f579b', '163826105720211130_114141.jpg', '2021-11-30 08:30:57', '1', '', 0, 0, 0, ''),
(1374, 'GNI-45970', 'sasindu.sen997@gmail.com', 'Sasindu Senaratne', '2007-12-16', 'male', 'Ananda College', 'Colombo', 'Nugegoda', '773876823', '', '', '702866826', '137/A, Kandawatte Road, Nugegoda', 42, '331bfca3b3709f0605534fa1cb1f0fb3', '', '2021-11-30 11:22:16', '1', '', 0, 0, 0, ''),
(1375, 'GNI-60633', 'Sherini0811@gmail.com', 'H.A sherini chamathka ', '2006-11-08', 'female', 'Rotary international school delkanda ', 'Colombo', 'Homagama', '774802707', '', '', '741394055', '10/47/c galawila road nilupul uyana homagama ', 42, '6f728c3d9041971252e49dbc507da0c0', '', '2021-11-30 11:45:33', '1', '', 0, 0, 0, ''),
(1376, 'GNI-98242', 'shenushasethmina2008@gmail.com', 'shenusha sethmina', '2009-11-03', 'male', 'Holy cross collage kalutara', 'Kalutara', 'kalutara', '716299245', '', '', '716299245', '349 A/10Godalla watha,Allegaha road,Maggona', 40, 'd59de33729cc4ee4e8456d75fea8a0c4', '', '2021-12-01 12:03:21', '1', '', 0, 0, 0, ''),
(1377, 'GNI-10843', 'nadeemadurapperuma81@gmail.com', 'Dewanmi sudamsa madurapperuma ', '2008-09-24', 'female', 'st.pauls milagiri ', 'Colombo', 'Narahenpita ', '761145554', '', '', '761145554', 'C/5,elvitigala mawatha ,narahenpita ,colombo 5', 41, 'b7a2c3b25c9441b0a38d0a874ace268b', '1643203211135352.jpg', '2022-01-26 13:20:11', '1', '', 0, 0, 0, '3695'),
(1378, 'GNI-39703', 'sihasininanayakkara@gmail.com', 'Sihasini Nanayakkara', '2007-05-06', 'female', 'Lyceum International School Rathnapura', 'Ratnapura', 'Pellmadulla(Rathnapura)', '779414000', '', '', '779414000', 'P/57/1 Denawaka rd,Pellmadulla', 43, 'f17aa12b219f1795232d103d897d9b05', '1640077359Image20211010154145.jpg', '2021-12-21 09:02:39', '1', '', 0, 0, 0, ''),
(1379, 'GNI-60850', 'kanthukorala@gmail.com', 'A.A.Thathsara Mihiranga', '2007-06-27', 'male', 'G/Siridhamma College', 'Galle', 'Elpitiya', '713821334', '', '', '713821334', 'Cinnamon Garden, Pituwala Road, Elpitiya', 42, '47d57195e29180ee065370b19e79af42', '', '2021-12-01 01:53:21', '1', '', 0, 0, 0, ''),
(1380, 'GNI-83636', 'tgeorandi.17@gmail.com', 'Sheroni Rebeca kumarathunga ', '2009-01-05', 'male', 'Super kingsway international school ', 'Ampara', 'Habarana ', '717293502', '', '', '717293502', 'Aanuradhapura road ,Habarana ', 41, '7dccf6358c790a3414604046aef1c2b0', '1638325667title_1636597478528.jpg', '2021-12-04 04:56:28', '1', '', 0, 0, 0, ''),
(1381, 'GNI-59727', 'gbgnbotejue@gmail.com ', 'Binada Perera ', '2007-09-30', 'male', 'Christ king college pannipitiya ', 'Colombo', 'Kottawa ', '776945079', '', '', '776945079', '1662/5 Malabe Road Kottawa South Pannipitiya ', 42, '25d55ad283aa400af464c76d713c07ad', '', '2021-12-01 02:58:32', '1', '', 0, 0, 0, ''),
(1382, 'GNI-39546', 'ruwansamarawickrama1@gmail.com', 'Tharul Minruka samarawickrama ', '2010-08-30', 'male', 'Guidance International school', 'Colombo', 'Kesbewa', '704419206', '', '', '763705537', '32/9B ,Sarwodaya Mawatha, Honnanthara Kesbewa', 39, 'b691b4026a50df4d71ca8c17f875acb0', '163833269920210624_120633.jpg', '2022-01-07 05:05:02', '1', '', 0, 0, 0, ''),
(1383, 'GNI-04396', 'gayanina75@gmail.com', 'Amodya Imandi welagedara', '2009-02-12', 'female', 'Holly Cross college gampaha ', 'Gampaha', 'Gampaha ', '777241377', '', '', '777241377', '105/C,Ja- ela Road,gampaha ', 40, '80fede11dc9baf8eca77ea7420452d85', '1638334482V_20210613_1225453076132424231205241.jpg', '2021-12-01 04:54:43', '1', '', 0, 0, 0, ''),
(1452, 'GNI-12043', 'dilaninava@gmail.com', 'Mindinu Nisal Navaratne', '2008-06-28', 'male', 'Boy\'s school - Malabe', 'Colombo', 'Malabe', '773574570', '', '', '773574570', '486/1/J, Halbarawa cross road, Malabe', 41, '2520ec1fff6685379f71099d14b3bd3e', '', '2021-12-04 18:17:33', '1', '', 0, 0, 0, ''),
(1385, 'GNI-94195', 'nadeeka_sunmed@yahoo.com', 'I . Niketh Harshal Perera', '2010-09-14', 'male', 'Vidura College', 'Colombo', 'Thalawathugoda', '710960198', '', '', '751890686', 'No. 245/13, Keells Houses, Jalthara, Ranala', 39, 'f12e5d09d560fa317d3b9b89e06d4e6b', '', '2021-12-01 08:39:34', '1', '', 0, 0, 0, ''),
(1386, 'GNI-02564', 'lakmaliudawela234@gmail.com', 'Thamadee Kohilawaththa ', '2006-10-23', 'female', 'Lyceum International school Rathnapura ', 'Ratnapura', 'Pelmadulla ', '713216789', '', '', '713216789', 'No 479/4, walaw waththa, Ganegama, pelmadulla, Rathnapura ', 43, 'bba506e8486e1a3eb3907c21e3fd43c2', '1640495832184574189_642276773840551_6126888379275971959_n.jpg', '2022-01-17 06:46:26', '1', '', 0, 0, 0, ''),
(1387, 'GNI-12000', 'dinalidulya01@gmail.com', 'Dinali Dulya Dissanayake', '2008-04-30', 'female', 'Sri Sumangala Girls\' School', 'Kalutara', 'Wadduwa', '718256561', '', '', '719303025', 'No.18 Kakunagahathuduwa,Mellagama Wadduwa', 41, '58d1cd6db99155eeebf18e0475ebe8af', '', '2021-12-01 10:24:51', '1', '', 0, 0, 0, ''),
(1388, 'GNI-70520', 'ranujaherath5@gmail.com', 'H M Ranuja Luthmika Herath', '2006-05-01', 'male', 'Wesly College ', 'Colombo', 'Borella ', '777329210', '', '', '777063370', '510/C,Weliketiya,Pamunugama,JaEla', 43, '99a9ea4c37b2944e0325b25c30bce622', '', '2021-12-01 13:51:05', '1', '', 0, 0, 0, ''),
(1389, 'GNI-62577', 'Onashadilmi5752@gmail.com', 'K.G.Onasha Dilmi', '2007-12-11', 'female', 'Buonavista college', 'Galle', 'Galle', '779828666', '', '', '779828666', 'Seraburegodawatta,Kalahe,Wanchawala', 42, '3e8fae6ecd37b36d6f7c84b8da66bed6', '', '2021-12-01 13:57:18', '1', '', 0, 0, 0, ''),
(1390, 'GNI-19952', 'atthanayakamali79@gmail.com', 'Sadew demiyan fernando', '2007-08-28', 'male', 'kandyChandananda buddist college kandy', 'Kandy', 'Peradeniya', '773500533', '', '', '706050121', 'walauwwa wattha naranwala handessa kandy', 42, 'a67b7f78af7d971dd5597df73ba4388a', '1639310040IMG-20211009-WA0000.jpg', '2021-12-12 11:54:00', '1', '', 0, 0, 0, ''),
(1391, 'GNI-77838', 'stalisha2020@gmail.com', 'Mahawaththa Nayanananda Basnayaka Mudalige Dewmi Talisha Siriwardana', '2005-05-04', 'female', 'St.Joseph\'s Girls\' School, Nugegoda', 'Colombo', 'Padukka', '772662712', '', '', '772662712', '84/B, Poregedara, Padukka', 44, 'abea044eeb69056e825a2827786b32f2', '', '2022-01-16 11:37:45', '1', '', 0, 0, 0, '1729'),
(1392, 'GNI-68675', 'tharuvisamarathunge@gmail.com', 'Tharuvi Samarathunge', '2010-11-11', 'female', 'Hillwood collage Kandy', 'Kandy', 'kandy', '714521297', '', '', '764541453', 'NO 149 Kandyencity  Amunugama Rd ,Yakgahapitiya', 39, 'd201146868d38d80aad4fd2c5c8c6ae5', '1638633232IMG-8678_(1).JPG', '2021-12-04 15:53:52', '1', '', 0, 0, 0, ''),
(1394, 'GNI-88777', 'Malin imalka1500@gmail.com', 'Meepa gamage chunali shaheena', '2009-09-08', 'female', 'Ga/ rajapaksha national college', 'Galle', 'Uragasmanhandiya', '774006208', '', '', '772533916', 'M.g.i.lakmali.793/2 .boralukatiya..uragasmanhandiya', 40, '0b4a779ac00b975f9bb86635f076750d', '1638420403IMG-20211202-WA0000.jpg', '2021-12-15 18:39:40', '1', '', 0, 0, 0, ''),
(1395, 'GNI-63209', 'sathsaranikawisha50@gmail. Com', 'G. Kaveesha Mehendi Sathsarani', '2005-12-13', 'female', 'K/ pothuwilla natinol school', 'Kalutara', 'Maggona', '711121888', '', '', '714629540', 'Duwegoda near the temple, Halkandawilla', 44, 'aec6b931f71a39f1114a5e24f96da5cb', '', '2021-12-02 05:19:45', '1', '', 0, 0, 0, ''),
(1396, 'GNI-65123', 'samarasinghedulanjana2007@gmail.com', 'Dulanjana Samarasinghe ', '2007-09-20', 'male', 'Thelijjawila Central College ', 'Matara', 'Pitabeddara ', '766625872', '', '', '766625872', '65/B,Kaduruwana,Pitabeddara ', 42, 'da16f2624215ee4917bd1021c0c43898', '', '2021-12-02 06:34:55', '1', '', 0, 0, 0, ''),
(1397, 'GNI-60082', 'melasharandani@gmail.com', 'P.G.Melasha Randini Suneetharathna ', '2008-06-23', 'female', 'A/Kahatagasdigiliya c.c', 'Anuradhapura', 'Horowpathana', '783678140', '', '', '763053133', 'Dekethipothana ,Mahapothana ', 41, 'b5db5c77dc1caa4259bff59e2deddb37', '', '2021-12-02 07:33:12', '1', '', 0, 0, 0, ''),
(1398, 'GNI-94258', 'sandudeniyaya@gmail.com', 'A.G.HESANDU VIDATH DAMVIN', '2010-06-15', 'male', 'MR/DENIYAYA CENTRAL COLLEGE', 'Matara', 'DENIYAYA', '774877315', '', '', '774877315', 'no.117 main street deniyaya', 39, 'f03684fa4e08b57b447a36d73dbb28a7', '', '2021-12-02 07:51:06', '1', '', 0, 0, 0, ''),
(1399, 'GNI-25640', 'nishlakmali123@gmail.com', 'Tharul dulen athukorala', '2009-11-19', 'male', 'Ananda sastralaya kotte', 'Colombo', 'NUGEGODAo', '775510084', '', '', '775510084', '86,old kesbewa road,nugegoda', 40, '25f9e794323b453885f5181f1b624d0b', '', '2021-12-10 06:44:54', '1', '', 0, 0, 0, ''),
(1400, 'GNI-67805', 'Anuththarawedasingha@gmail.com', 'Anuththara Wedasinghe', '2008-11-13', 'female', 'Good shepherd convent kandy', 'Kandy', 'kandy', '765441158', '', '', '765441158', 'No.6 Kalalpitiya Ukuwela', 41, '4e656f1e81680fde65d19ed7313dee99', '1638442229photo-1471899236350-e3016bf1e69e.jpg', '2021-12-23 10:40:49', '1', '', 0, 0, 0, ''),
(1401, 'GNI-31992', 'priyadarshanarohitha@gmail.com', 'Mihindi chamya senanayaka', '2009-09-01', 'female', 'Clayton college', 'Gampaha', ' close Negombo', '776586566', '', '', '741449839', '164 /1 kadavala ,kudumirisa,katana', 40, '8e6491c7b08805c000546d391acc0c33', '', '2021-12-02 11:07:52', '1', '', 0, 0, 0, ''),
(1402, 'GNI-08424', 'hansanikumarasingha06@gmail.com', 'Hansani Methsika ', '2006-04-09', 'female', 'Ku/Nalandodaya National School.', 'Kurunegala', 'Kurunegala', '771747678', '', '', '771747678', 'Wegolla,Maspotha,Kurunegala', 43, '6501ff3c813c92a6a01f9480574159bf', '1642160684sf01102161.jpg', '2022-01-14 11:44:44', '1', '', 0, 0, 0, ''),
(1403, 'GNI-01033', 'd2ekanayaka@gmail.com', 'Binuthi sithunadhi', '2016-08-04', 'male', 'not selected yet', 'Ampara', 'beliatta', '712888951', '', '', '712888951', 'ransithu, getamanna north, geatamanna', 33, 'ff6c58c164f5554de93bd85a1cfcfc1e', '1638459309IMG_20191231_125425.jpg', '2021-12-02 15:35:09', '1', '', 0, 0, 0, ''),
(1404, 'GNI-50959', 'shehaniwijetunga96@gmail.com', 'Chathumila Hasandi  Wijetunga', '2003-06-10', 'female', 'Southlands College Galle', 'Galle', 'Galle', '718703224', '', '', '719384845', '293/1 Morris Road,Galle', 44, '25d55ad283aa400af464c76d713c07ad', '1638460094download.jpg', '2021-12-02 16:43:21', '1', '', 0, 0, 0, ''),
(1405, 'GNI-84617', 'Sinaracaldera@gmail.com', 'Sinara Sithuki Yehansa Caldera', '2009-09-10', 'female', 'Ananda Balika Maha Vidyalaya Kotte', 'Colombo', 'Nugegoda', '766406868', '', '', '711914377', '104 B Jambugasmulla Mawatha Nugegoda', 40, '9309b7dc50fea88ea2dc896b89c06fd2', '1638462089BeautyPlus_20211202214336123_save.jpg', '2021-12-02 16:21:29', '1', '', 0, 0, 0, ''),
(1406, 'GNI-05109', 'jayawardanadulane@gmail.com', 'Dulen Ranhiru Jayawardana', '2005-11-01', 'male', 'President\'s college kotte', 'Colombo', 'Battaramulla', '719251915', '', '', '752826858', '54/5,bogahahena road,battaramulla', 44, '1aff4b37dec44bc9bf9f70d0072e496f', '', '2021-12-03 00:00:59', '1', '', 0, 0, 0, ''),
(1407, 'GNI-96013', 'eesaraeesara1@gmail.com', 'Eesara Wikumpriya ', '2005-05-01', 'male', 'Kekirawa Central College ', 'Anuradhapura', 'Mahailuppallama', '775294527', '', '', '779306215', 'No.37,Puliyankulama,Mahailuppallama', 44, '8d8b2869ec1a5d16f81801ebdaf79bc2', '1638546140c3a969e81683972376b19a057a5aca2d.jpg', '2021-12-03 15:42:20', '1', '', 0, 0, 0, ''),
(1408, 'GNI-43455', 'Himaliudayangani1550@gmail.com', 'Hidallana Rajakaruna Oshadi Umanga Bandara Senavirathna.', '2009-03-15', 'female', 'Anula Vidyalaya Nugegoda', 'Colombo', 'Pannipitiya', '759427835', '', '', '759427835', '1550/2,à¶…à¶¸à·”à¶‡à¶§à¶¸à·”à¶½à·Šà¶½ à¶´à·à¶», à¶šà·œà¶§à·Šà¶§à·à·€, à¶´à¶±à·Šà¶±à·’à¶´à·’à¶§à·’à¶º.', 40, '3494d36385fba8e624a9906838bea2cb', '1638531800IMG-20211120-WA0034.jpg', '2021-12-03 11:43:20', '1', '', 0, 0, 0, ''),
(1409, 'GNI-63142', 'Chamilajayasinghe2009@gmail.com', 'Benthota pathiranage sithika sandes ', '2009-02-25', 'male', 'G/ Richmond college ', 'Galle', 'Galle', '712356491', '', '', '712580444', '28/3, 2nd lane, maitipe , galle', 40, 'a994286a7b587c7d2d35fd1241b9a99f', '', '2021-12-03 14:32:07', '1', '', 0, 0, 0, ''),
(1410, 'GNI-08899', 'Dilanidulsriya@gmail.com', 'Dilani dulsriya', '2009-02-16', 'male', 'Yoshida iinternational school ', 'Gampaha', 'Kalaniya ', '771517752', '', '', '771517752', '732/2 udayamavatha gonawala kalaniya ', 40, '744b1c8d83e91f12b375fa1b53a5ba87', '', '2022-01-20 12:16:35', '1', '', 0, 0, 0, ''),
(1411, 'GNI-33464', 'Shakilasenevirathna0@gmail.com', 'Kavishka Gaveen Panditha Wickramasekara ', '2009-07-29', 'male', 'Ananda college ', 'Colombo', 'Piliyandala ', '777296361', '', '', '777296361', '207/28B , Rathna Mawatha , Dulammahara , Bokundara , Piliyandala .', 40, 'a9d6e5e32d5aa061896305e402d3a3f5', '1639297331IMG_20210720_123859_kindlephoto-131845315.jpg', '2021-12-12 08:22:11', '1', '', 0, 0, 0, ''),
(1412, 'GNI-34987', 'malshalakhan288@gmail.com', 'Malsha Lakhan', '2021-12-30', 'male', 'à¶¸à·à¶» /à¶…à¶½à¶´à¶½à·à¶¯à·™à¶«à·’à¶º à¶¸.à·€à·’', 'Matara', '1213', '762088259', '', '', '762088259', '388/Aà¶±à¶ºà·à¶¯à·œà¶½,à¶…à¶½à¶´à¶½à·à¶¯à·™à¶«à·’à¶º', 41, 'e74be65e8e9c88e34761d255d3b59cb3', '', '2021-12-04 01:06:25', '1', '', 0, 0, 0, '5393'),
(1413, 'GNI-76729', 'dasunt403@gmail.com', 'B.V.D.Dasun thathsara', '2005-12-22', 'male', 'G/saralankara national college', 'Galle', 'Hikkaduwa', '779304969', '', '', '779304969', '4th post gonapinuwala', 43, '9a5790dd10974a794cb5f7d351e7f560', '1639318587WhatsApp_Image_2021-12-12_at_7.45.32_PM.jpeg', '2021-12-12 14:16:27', '1', '', 0, 0, 0, ''),
(1680, 'GNI-05681', 'yethumnethunila2010@gmail.com', 'W.G.Yethum nethunila', '2010-09-09', 'male', 'MR/D.C.C.', 'Matara', ' Kotapola', '711500308', '', '', '711500238', 'Pathum\' Godakumbura,Kotapola', 39, '25d55ad283aa400af464c76d713c07ad', '', '2022-01-08 13:57:45', '1', '', 0, 0, 0, ''),
(1415, 'GNI-75362', 'Priyanthawickramage@gmail.com', 'Imeth Methsara ', '2010-07-18', 'male', 'Deniyaya Central College ', 'Matara', 'Deniyaya ', '779797185', '', '', '719797185', '114/C Sathmala Alla Para Kolawenigama.Deniyaya ', 39, 'bd36092fc3e31030bbd25e411c30328e', '1638549333IMG-20211203-WA0035.jpg', '2021-12-03 16:35:33', '1', '', 0, 0, 0, ''),
(1416, 'GNI-63490', 'deepthiperera1978@gmail.com', 'Jethro Kurby Koys ', '2007-09-01', 'male', 'st peter\'s college ', 'Gampaha', 'Gampaha ', '716094334', '', '', '716094334', '14/2 Obeysekara Mawatha Pitiyegedara Bemmulla', 42, 'a30131190cd06bee031865741a5b0758', '1639186037WhatsApp_Image_2021-10-25_at_9.33.25_AM.jpeg', '2021-12-11 01:27:17', '1', '', 0, 0, 0, ''),
(1417, 'GNI-57090', 'dealwis.nimalka@gmail.com', 'Chenuka Sahabandu', '2011-07-23', 'male', 'D S Senanayaka College Colombo', 'Colombo', 'Colombo 07', '768175476', '', '', '768175476', '30A 4th Lane Rathmalana ', 38, 'd6ca3bcde314e56a053fd8cbcad478f3', '1638587557IMG-20211127-WA0002.jpg', '2022-01-10 08:39:12', '1', '', 0, 0, 0, ''),
(1418, 'GNI-26089', 'ldilanka 033@gmail. com', 'U. N. W. A. Kaveesha Madumali', '2005-11-14', 'male', 'Wp/M Nawuththuduwa National school ', 'Kalutara', 'à¶¸à¶­à·”à¶œà¶¸ ', '343440051', '', '', '773669601', 'à¶±à·œ.75à¶šà¶´à·’à¶­à·à¶±à·Š à¶¸à·”à¶«à·’à¶¯à·à·ƒ à¶¸à·à·€à¶­ à¶…à·…à·”à¶­à·Šà¶œà¶¸à·Šà¶œà·œà¶© à¶±à·€à·”à¶­à·Šà¶­à·”à¶©à·”à·€ ', 44, 'bf28b086269e07471be4a2127eb40d2a', '1643594813Screenshot_20220116_161528.jpg', '2022-01-31 02:06:54', '1', '', 0, 0, 0, '5965'),
(1419, 'GNI-26919', 'dealwis.nimalka@gmail.com', 'Ihansa Sahabandu', '2009-03-12', 'female', 'Bishop\'s College', 'Colombo', 'Kollupitiya', '768175476', '', '', '776364553', '30A 4th Lane Ratmalana', 40, 'f98b23b6fbf6efec09282df3bb726412', '16415588705e2363d760b97ed51dba072d8f9da887.jpg', '2022-01-07 12:34:30', '1', '', 0, 0, 0, ''),
(1420, 'GNI-80526', 'Sitharadisanayaka8gmali.com', 'Hansi sithara', '1990-11-25', 'female', 'B yaharalawa maha viduhala', 'Badulla', 'Welimada ', '765794996', '', '', '765794996', 'Hagiliella .puhulpola .welimada ', 33, '27e3e8a65cf7af48ab7c8b39bc2982c5', '', '2021-12-04 00:27:56', '1', '', 0, 0, 0, ''),
(1421, 'GNI-63187', 'dinusha.jkh@keells.com', 'G Maadev Methmika Perera', '2010-01-31', 'male', 'Highbrow College International ', 'Kalutara', 'Panadura', '772491285', '', '', '772491285', '105/3, Mdakissa Road, Horethuduwa, Moratuwa', 40, '80e105e7068730911dbc07a1006b8276', '', '2021-12-04 01:38:53', '1', '', 0, 0, 0, ''),
(1422, 'GNI-02536', 'sandungayantha8@gmail.com', 'Sandun Gayantha', '2005-08-20', 'male', 'ST.Jhon\'s College', 'Colombo', 'Nugegoda', '777037151', '', '', '702084129', 'NO:23/8 5 th lane,jambugasmulla mawatha, nugegoda.', 44, '83ab3e96bfb09ec943da93b7c99e6c36', '', '2022-01-09 01:56:06', '1', '', 0, 0, 0, ''),
(1423, 'GNI-55502', 'priyadarshanianu26@gmail.com ', 'D.M Janidu Mathesha Disanayake ', '2022-09-07', 'male', 'A/Kandulugamuwa viduhala', 'Anuradhapura', 'Galneva ', '717585778', '', '', '717585778', 'No:36 South Siyambalangamuwa Negampaha ', 41, '16b75b900dc592fba8af841ac359bb54', '', '2021-12-04 01:53:00', '1', '', 0, 0, 0, ''),
(1424, 'GNI-84934', 'dinushapf@gmail.com', 'G Disansa Dahamlee Perera', '2012-07-11', 'female', 'Highbrow College International ', 'Kalutara', 'Panadura', '772491286', '', '', '772491286', '105/3, Madakissa Road, Horethuduwa, Moratuwa', 37, '833b4758024b264d8dd716ba21c26339', '', '2021-12-14 11:00:07', '1', '', 0, 0, 0, ''),
(1425, 'GNI-81723', 'Manuthwickramanayaka75@gmail.com', 'Manuth Methlitha Wejesiriwardhana Wickramanayaka', '2007-09-10', 'male', 'Christ king college pannipitiya', 'Colombo', 'City', '722814947', '', '', '757186657', '1606/1A kottawa pannipitiya.', 42, 'fa808246dca6929924571e95485eadb0', '', '2021-12-04 02:16:58', '1', '', 0, 0, 0, ''),
(1426, 'GNI-98147', 'mallikawickramaarachchi.601@gmail.com', 'H.M.Adisha Nimsara Eshan Amarasingha ', '2010-03-09', 'male', 'CP/GM/Kurunduwatte Royal College ', 'Kandy', 'Gampola ', '760351908', '', '', '760351908', '116/A/4/Bowala Gampola', 39, '5075822bc2e01deb657ee8d2ad22775b', '1641308265images.jpg', '2022-01-04 14:57:45', '1', '', 0, 0, 0, ''),
(1427, 'GNI-52986', 'rasikarupasinghe9@gmail.com', 'H.R.Sadeep Sankalpa Rupasinghe', '2007-08-01', 'male', 'Ruwanwella Rajasinghe Central Collage', 'Kegalle', 'Ruwanwella', '717769980', '', '', '766469510', 'C 3/4,Hathagoda,Ampagala', 42, 'f6fc2b73297e7b285e405073480d38c2', '163872500820497227.jpg', '2021-12-05 17:23:28', '1', '', 0, 0, 0, ''),
(1428, 'GNI-30662', 'Pathmakanthi453@gmail.com', 'R.M.Sasindu Oshadha ', '2010-05-08', 'male', 'à¶¸à·œ/à¶¸à·„à·à¶±à·à¶¸ à¶¸à¶°à·Šâ€à¶º à¶¸à·„à· à·€à·’à¶¯à·Šâ€à¶ºà·à¶½à¶º ', 'Monaragala', 'à¶¸à·œà¶±à¶»à·à¶œà¶½ ', '711535549', '', '', '716650298', '479/B badalwela kalamulla kaluthara ', 39, '25d55ad283aa400af464c76d713c07ad', '16409402281634121231992.jpg', '2021-12-31 08:43:48', '1', '', 0, 0, 0, '1622'),
(1429, 'GNI-68039', 'rajapakshaamadhi@gmail.com', 'Amadhi Rajapaksha', '2008-08-24', 'female', 'wattegama girls college', 'Kandy', 'wattegama', '716375903', '', '', '716375903', '52/A dewatagama makkanigama', 41, '9617927eb832b01186f97f7f072fb796', '164221893819cf789a8e216dc898043489c16cec00.jpg', '2022-01-15 03:55:38', '1', '', 0, 0, 0, ''),
(1431, 'GNI-72773', 'np450969@gmail.com', 'Chamithu Wathsada perera', '2007-05-19', 'male', 'S.T. Jones College ', 'Ampara', 'Colombo', '764489792', '', '', '764489792', 'No.601, Piriwena road, Boralasgamuwa', 42, '13972b0b70080f87cb28d1749afa64bd', '1640019643Screenshot_2021-12-12-19-13-44-29.jpg', '2021-12-24 07:11:19', '1', '', 0, 0, 0, ''),
(1430, 'GNI-50043', 'Induwaradinethkumara@gamail.lk', 'W.R.Induwara dineth kumara', '2007-03-26', 'male', 'R/Eheliyagoda m.m.v', 'Kegalle', 'Rueanwella', '777469521', '', '', '703815172', 'B/139/2/thelkumuduwala,ampagala', 42, 'a241f22361855dc1d460c62427d13d44', '', '2021-12-04 04:54:52', '1', '', 0, 0, 0, ''),
(1432, 'GNI-22589', 'tgppkumara.mo@gmail.com ', 'T. G. Sanuji Esanya Malmanthi ', '2010-07-16', 'male', 'Gampaha Rathnavali Balika Vidyalaya ', 'Ampara', 'Homagama ', '776706761', '', '', '776706761', 'No. 184 /A TEMPLE JUNCTION PITIPANA NORTH HOMAGAMA ', 39, '0e3a00b86117f9478f6d9e9e382ca13c', '', '2022-01-09 07:32:14', '1', '', 0, 0, 0, ''),
(1570, 'GNI-25327', 'nilminithushari896@gmail.com', 'Ameli Nissel', '2021-12-24', 'female', 'Holy Family Convent', 'Gampaha', 'Hanwella', '714135345', '', '', '714135345', '162/11,Samanabedda, Thitthapatthara', 42, '3acf3db5a6e88eea188539d17d1ba562', '1640871013IMG20211225201756.jpg', '2022-01-12 13:00:46', '1', '', 0, 0, 0, ''),
(1434, 'GNI-37854', 'yuthminisinharage34@gmail.com', 'Yuthmini Shaakya', '2005-03-04', 'female', 'Asian Grammar School', 'Colombo', 'IDH', '112410489', '', '', '724040033', '125,Kajugahawatta,Gothatuwa,Angoda.', 44, '435d828e59cee4bc40ca52d50e4eead7', '', '2021-12-04 07:35:25', '1', '', 0, 0, 0, ''),
(1435, 'GNI-27680', 'fathimanasliya697@gmail.com', 'Nisamdeen Izhatul Nazhataara', '2006-09-13', 'female', 'Kiribathgoda Sussex college', 'Gampaha', 'Wattala', '761974948', '', '', '761974948', '105/4/A pinnamadha Enderamulla wattala.', 43, '03a2d490a1e66a767af75e4c7d131b81', '', '2022-01-06 18:25:41', '1', '', 0, 0, 0, '3147'),
(1436, 'GNI-26217', 'dilrukshiabethunga@gmail.com', 'S.D.Dulathmi Nimnara ', '2006-11-30', 'male', 'WP/JP Mahamaya Balika Vidyalaya ', 'Colombo', 'Boralesgamuwa', '775354570', '', '', '775354570', '267/3A Suriyamal mawatha,Divulpitiya,Boralesgamuwa', 43, '44280f327030fc02f4d71b037afc717b', '', '2021-12-04 07:43:01', '1', '', 0, 0, 0, ''),
(1437, 'GNI-72197', 'nemisanu@gmail.com', 'D.R. Dunitha Nemindu Bandara Henegama ', '2008-01-14', 'male', 'Royal International School', 'Kurunegala', 'Kurunegala ', '761286928', '', '', '761286928', 'lihiniguriya , pothuhera ', 42, '7a64312f14c0bea05b3e60b8bf643bed', '', '2021-12-04 07:43:49', '1', '', 0, 0, 0, ''),
(1438, 'GNI-34325', 'nemisanu@gmail.com', 'D.R. Sanuthi Thimansa Henegama ', '2012-05-24', 'female', 'Royal International School', 'Kurunegala', 'Kurunegala ', '711250213', '', '', '711250213', 'lihiniguriya , pothuhera ', 37, '847d7542265a2df400e70922726dda45', '', '2021-12-04 07:54:33', '1', '', 0, 0, 0, ''),
(1439, 'GNI-37354', 'randitha1982@gmail.com', 'Welliwita Angoda Liyanage Poojani Nethara Welliwita', '2010-06-20', 'female', 'St. Joseph\'s Girls\' School - Nugegoda', 'Colombo', 'Pitakotte', '767074458', '', '', '767074458', '19/6, Janatha Mawatha, Mirihana, Pitakotte', 39, '25d55ad283aa400af464c76d713c07ad', '1638609275WIN_20211024_06_53_26_Pro.jpg', '2021-12-21 12:16:09', '1', '', 0, 0, 0, ''),
(1440, 'GNI-94095', 'warunisilva126@gmail.com', 'k warsha nuwanthi silva', '2009-03-21', 'female', 'Anula vidyalaya', 'Colombo', 'nugegode', '751859368', '', '', '751859368', '19/B 4 th lane jambugasmulla mw. nugegegode', 40, '43c2c60cb5f8e68c87323cc14f1e0ee6', '1640501264images_(8).jpeg', '2022-01-04 05:07:59', '1', '', 0, 0, 0, '2891'),
(1441, 'GNI-20959', 'sisaragamage@yahoo.com', 'Sithuki de alwis', '2010-08-20', 'female', 'Bishops College', 'Colombo', 'Maharagama', '718053754', '', '', '718053754', '20/6A Thappawatte road, Godigamuwa Maharagama', 39, '4798fc802135dc1c9c39eb5335f617d9', '', '2021-12-04 08:38:31', '1', '', 0, 0, 0, ''),
(1442, 'GNI-98644', 'kariyawasamsajeewa@gmail.com', 'Rithu mandakini kariyawasam ', '2007-06-30', 'female', 'Sussex college ', 'Galle', 'Hikkaduwa ', '715509008', '', '', '715509008', '280/8 srilal liyanage mawatha nalagasdeniya hikkaduwa ', 42, 'ac6e0ea0906b480521caf067118d933d', '', '2021-12-04 08:44:36', '1', '', 0, 0, 0, ''),
(1443, 'GNI-61520', 'dewapriyaviraj9@gmail.com', 'K.A.chamalsha mandakini dewapriya.', '2010-11-19', 'female', 'R/sumana balika vidyalaya.', 'Ratnapura', 'Ratnapura', '716857159', '', '', '716857159', 'Hallella,gallella,rathnapura', 39, 'e9d21fd2a9b8be02306dfa5c0fc94a3a', '164000219420201125_100719.jpg', '2021-12-20 12:09:55', '1', '', 0, 0, 0, '1477'),
(1444, 'GNI-80894', 'hansasangeeth@gmail.com', 'Manamendra Don Hansa Sangeeth', '2005-08-12', 'male', 'Asian grammar school', 'Colombo', 'Colombo', '716568709', '', '', '787842899', '122 sadham mawatha, walpola, angoda', 44, '622661a5cda07b786b9bf95680f07b4d', '', '2021-12-04 08:50:08', '1', '', 0, 0, 0, ''),
(1445, 'GNI-28897', 'Ondg902 @gmail.com', 'D.G.sanuthi sasmini ', '2021-03-19', 'female', 'Vidyakara girls school ', 'Colombo', 'Boralesgamuwa ', '779143013', '', '', '710684680', 'No.197/3,sirimal uwana,werahara ,boralesgamuwa ', 39, '7dc72b557ead5447e2cf63b7ca88c48a', '', '2021-12-04 12:09:05', '1', '', 0, 0, 0, '');
INSERT INTO `lmsregister` (`reid`, `stnumber`, `email`, `fullname`, `dob`, `gender`, `school`, `district`, `town`, `pcontactnumber`, `pemail`, `pname`, `contactnumber`, `address`, `level`, `password`, `image`, `add_date`, `status`, `ip_address`, `relogin`, `reloging_ip`, `payment`, `verifycode`) VALUES
(1446, 'GNI-44891', 'rajithawathulanda@gmail.com', 'Hashini Devindi Senevirathne ', '2009-11-09', 'female', 'K/ Swarnamali Balika Maha Vidyalaya', 'Kandy', 'Kadugannawa', '769181718', '', '', '769181718', 'No.5, Mudaliwatta, Kadugannawa', 40, '5c6336376ff35b28c304cfdea668ff0a', '', '2021-12-04 12:32:14', '1', '', 0, 0, 0, ''),
(1447, 'GNI-74214', 'premalal9perera@gmail.com', 'H.A.Randima Geethanjana', '2005-11-01', 'male', 'Wp/Mt,St/Mary\'s college', 'Kalutara', 'Palawaththa', '764849621', '', '', '764849621', '408 2/B Janapadaya meegahathanna', 44, '303fe66b33aeb00a3dcf2ee5d104bf8d', '', '2021-12-12 10:09:17', '1', '', 0, 0, 0, ''),
(1448, 'GNI-13533', 'ruvini.nilanka79@gmail.com ', 'Rithika Binuwara', '2006-06-07', 'male', 'President college ', 'Colombo', 'Kirulapone ', '704474445', '', '', '704474445', '30A DM Colombage mawatha kirulapona Colombo 5', 43, 'd2d363ac22d81fada81c378d4e19c1ef', '', '2022-01-08 02:04:30', '1', '', 0, 0, 0, ''),
(1449, 'GNI-87949', 'gihansaranath5@gmail.com', 'Gihan Saranath', '2004-09-10', 'male', 'Gamunu maha vidyalaya', 'Anuradhapura', 'Anuradhapura', '763767188', '', '', '714577675', 'No:41, Diulwewa Hidogama', 44, '4dc80c94003628d1140f1006c3b7d902', '', '2021-12-23 18:48:56', '1', '', 0, 0, 0, ''),
(1450, 'GNI-09703', 'himashakavinda18@gmail.com', 'B.R.Himasha kavinda', '2005-05-13', 'male', 'Ruwanwella Rajasinhge Central Collage ', 'Kegalle', 'Ruwanwella', '714977910', '', '', '705167385', 'Kiriporuwa,ampagala', 44, '7c908f4b989ac64a21bedb9844c7f490', '', '2021-12-04 14:36:38', '1', '', 0, 0, 0, ''),
(1451, 'GNI-04196', 'randikakrishan1971@gmail.com', 'I.A.D isindu denuwan', '2012-04-05', 'male', 'ST John college nugegoda', 'Colombo', 'nugegoda', '711706801', '', '', '723203565', '72 Kadawatha road Kalubowila Dehiwala', 37, '88c5e42abf41039834dc08340734d6be', '', '2021-12-04 15:58:13', '1', '', 0, 0, 0, ''),
(1453, 'GNI-82425', 'chamathkanishadi29@gmail.com', 'Chamathka Nishadi', '2008-02-13', 'female', 'Chamathka Nishadi', 'Gampaha', 'Batuwatta', '752067381', '', '', '781190335', 'No:52/1, batuwatta ragama', 41, '35f5d0952c5d6f85a32b89abe3a7161d', '', '2021-12-04 18:52:45', '1', '', 0, 0, 0, ''),
(1454, 'GNI-93273', 'nishi.iddamalgoda@gmail.com', 'W.M.Janeesh Chalaka Bandara Waraddana ', '2010-05-07', 'male', 'Kandy Model National School ', 'Kandy', 'Katugastota ', '773938742', '', '', '773938742', '91/B,Maligatenne, Doragamuwa', 39, 'b8ee5ae47fc2e879d00aedfe196b3308', '164154493820210701_181711.jpg', '2022-01-07 08:42:18', '1', '', 0, 0, 0, ''),
(1455, 'GNI-43375', 'nimesh20030425@gmail.com', 'Ishadi Rathnayaka ', '2007-04-03', 'female', 'Lyceum International School ', 'Ratnapura', 'Rathnapura ', '703121947', '', '', '716334513', 'Sannasgama, Lellopitiya ', 43, 'e483e2e503742701aaf07daa889cfc63', '1641015619Wolf.jpg', '2022-01-01 05:40:19', '1', '', 0, 0, 0, ''),
(1456, 'GNI-64938', 'meenusanindee@gmail.com', 'G.H.Meenu Sanindee ', '2021-02-20', 'female', 'St.mary\'s convent ', 'Matara', 'Kaburugamuva ', '703770601', '', '', '703770601', '104/134\' viktoriya pak kaburugamuva, mathara ', 40, 'c79526cf36221a6261c3e37eef09c221', '', '2021-12-05 03:21:47', '1', '', 0, 0, 0, ''),
(1457, 'GNI-36699', 'chandimawakkubura@gmail.com ', 'Chamodi Wakkumbura ', '2007-05-14', 'female', 'Lyceum International School ', 'Ratnapura', 'Pelmadulla ', '716351800', '', '', '452274690', 'Midigahamulla.  Pelmadulla ', 43, 'b4885b91fe9088c94cdd8ff5e55575b2', '1641089598df31bf416432a34206de8b3f23e2b527.jpg', '2022-01-02 02:13:18', '1', '', 0, 0, 0, ''),
(1458, 'GNI-24261', 'bihandubiman123@gmail.com', 'Salwathura Acharige Bihandu Biman ', '2011-01-31', 'male', 'Mahinda College', 'Galle', 'Galle ', '772253407', '', '', '763434302', '134,Viskam Road,Galwadugoda,Galle ', 39, '5469ca9cb725a6c73ef4c5a0513a2ba8', '', '2021-12-05 05:42:05', '1', '', 0, 0, 0, ''),
(1459, 'GNI-28710', 'saranganissanka@gmail.com', 'Nissanka Maneesha Aadhithya Mendis ', '2010-02-10', 'male', 'A/Niwathththaka Chethiya Maha Vidyalaya Anuradhapuraya ', 'Anuradhapura', 'Anuradhapuraya ', '775094020', '', '', '775094020', 'Track 17,Putthalam road,Pahalamaragahawewa.', 39, 'f5d33835beaf7b2d5121d2938095a7f2', '', '2021-12-05 05:45:31', '1', '', 0, 0, 0, ''),
(1460, 'GNI-78420', 'deepthiperera1978@gmail.com', 'Junius Miron Koys', '2016-08-27', 'male', 'St Peter\'s College ', 'Gampaha', 'Gampaha ', '711155418', '', '', '711155418', '14/2 Obeysekara Mawatha Pitiyegedara Bemmulla', 33, '4713db59b7d2dc66f5a8cac85b6dae7e', '', '2021-12-05 05:49:48', '1', '', 0, 0, 0, ''),
(1461, 'GNI-93743', 'mendisadithya1@gmail.com', 'Desh Mendis', '2007-12-03', 'male', 'Science College mt Lavinia', 'Colombo', 'Katubedda,Moratuwa', '779882999', '', '', '716202999', 'No 4 Ramya place sri rahula mw Katubedda', 36, '74cf7480064a6bbaf964cbf157f9f200', '', '2022-01-19 10:08:31', '1', '', 0, 0, 0, ''),
(1462, 'GNI-90276', 'senthuja2017@gmail.com', 'Senthuja Ekanayake ', '2007-09-25', 'male', 'Isipathana College ', 'Colombo', 'Nugegoda ', '774123334', '', '', '774123334', '26/1/4, Old Kesbewa Road , Delkanda ', 42, '952dcb6ba27fe8882758de51420b6f55', '1638686227IMG_20211205_115048.jpg', '2021-12-05 06:37:08', '1', '', 0, 0, 0, ''),
(1463, 'GNI-20377', 'dkwdinusha@gmail.com', 'Sethuni Ekanayake ', '2009-06-14', 'female', 'Sujatha Vidyalaya ', 'Colombo', 'Nugegoda ', '760373334', '', '', '760373334', '26/1/4, Old Kesbewa Road , Delkanda ', 40, '952dcb6ba27fe8882758de51420b6f55', '1638686014Screenshot_20210824_124312_com.android.chrome.jpg', '2021-12-05 06:33:34', '1', '', 0, 0, 0, ''),
(1464, 'GNI-46210', 'nidukniklesha2005@gmail.com', 'Niduk Niklesha', '2005-03-15', 'male', 'St\' john college', 'Colombo', 'Dehiwala', '778491509', '', '', '774795005', '29/25(114) Sri saranankara road , Kalubowila, dehiwala.', 44, '603b0002791c0e7868a4e8d811f71880', '', '2021-12-05 07:14:41', '1', '', 0, 0, 0, ''),
(1465, 'GNI-36906', 'chandima19790619@gmail.com', 'Lawanya Nimsarani Wijesingha', '2014-01-27', 'female', 'A/Swarnapali Balika Maha Vidyalaya', 'Anuradhapura', 'Anuradhapura', '711941303', '', '', '711941303', 'Chandima Lakmini Bowalgaha 21st canel Diwulwewa Hidogama Anuradhapura', 36, 'bb6329aa7c6c6d395f6dc463b690b7b5', '', '2021-12-05 07:56:28', '1', '', 0, 0, 0, ''),
(1466, 'GNI-28868', 'odithakvh@gmail.com', 'K V Oditha Harischandra', '2009-04-29', 'male', 'Vidura College - Colombo', 'Colombo', 'Sri Jayawardenapura Kotte', '776436008', '', '', '776436008', '333 A, Nawala Road, Nawala, Rajagiriya.', 40, 'af440cbb27cba66938a56a22f511495c', '1641818621Oditha.jpg', '2022-01-10 12:43:41', '1', '', 0, 0, 0, ''),
(1467, 'GNI-54671', 'chathuranga.bpp@gmail.com', 'Thesali nevmindi ', '2009-02-27', 'female', 'Anula girls college nugegoda', 'Kegalle', 'Dehiowita', '779318391', '', '', '718857391', '201 iriyagolla dehiowita', 40, 'ac6aa964340104470a90c3664f789433', '1638699634Screenshot_20211204-075112_Google.jpg', '2021-12-05 10:20:34', '1', '', 0, 0, 0, ''),
(1468, 'GNI-74328', 'Dsakurugoda@gmail.com ', 'K.G.Methuka Githsara Kandegama ', '2012-10-24', 'male', 'Nalada college ', 'Colombo', 'Rajagiriy ', '714216717', '', '', '714216717', '68,buthgamuva Road, kotuwegoda, Rajagiriy ', 37, '7842075165f9923f7cc2c94d46ab59bd', '', '2021-12-06 13:10:03', '1', '', 0, 0, 0, ''),
(1469, 'GNI-24581', 'dunyaliyanage@gmail.com', 'Dunya Liyanage', '2005-06-29', 'male', 'Musaeus College ', 'Ampara', 'Colombo 7', '714175806', '', '', '714175806', '10/4 , Peiris Place , Off Quarry Rd , Dehiwala. ', 44, '8dbaf4cf48e59fd79c7d23679f50b7aa', '1638723513violin.jpeg', '2021-12-05 16:58:33', '1', '', 0, 0, 0, ''),
(1470, 'GNI-41725', 'princyjayasooriya@gmail.com', 'K. Sandaru Amandya Ariyasinghe', '2006-02-06', 'male', 'R/ Newtown Prince College', 'Ratnapura', 'Ratnapura', '715618107', '', '', '715618107', '289/14, Peak View, Colombo Road, Ratnapura', 43, '8f857993bc7d70ec31c99a6fd0f5548f', '', '2021-12-19 14:54:34', '1', '', 0, 0, 0, ''),
(1471, 'GNI-38918', 'tharushkadinujaya05@gmail.com', 'Methumdi Hesali', '2009-06-09', 'female', 'kollonnawa balika vidyalaya', 'Colombo', 'colombo', '770897341', '', '', '770897341', '76/a brandiyawatta kohilawatta wellampitiya', 40, 'ea70cc612de0855ec39ac93e2c009c20', '', '2021-12-06 06:21:15', '1', '', 0, 0, 0, ''),
(1472, 'GNI-95417', 'Shiromidk2010@gmail.com ', '     NETHUKI DINARA BALACHANDRA ', '2010-10-04', 'female', 'St Paul\'s Girl\'s school MILAGIRIYA ', 'Colombo', 'Dehiwala ', '774206975', '', '', '774206975', 'No 20 Nadimala, Dehiwala ', 39, '427ccb01d1a420a4c34fcf4110ad7477', '', '2021-12-29 02:46:59', '1', '', 0, 0, 0, ''),
(1473, 'GNI-32694', 'sanilkac@gmail.com', 'Nehan Kethmin Balachandra', '2010-10-04', 'male', 'St Johns College ', 'Colombo', 'Dehiwala ', '775937529', '', '', '775937529', 'No 20 Nadimala , Dehiwala ', 39, '427ccb01d1a420a4c34fcf4110ad7477', '', '2021-12-06 08:50:31', '1', '', 0, 0, 0, ''),
(1474, 'GNI-47547', 'anushananayakara@gmail.com', 'Dewasiri Narayana Thisangi Ravindi Nanayakkara ', '2009-01-18', 'female', 'G/Siridhamma College Labuduwa,Galle ', 'Galle', 'Ambalanwaththa ', '718260005', '', '', '718260005', '227/4D,Morris Road.Ambalanwaththa.Galle ', 41, 'cc1f92dac84fd4f6f39a4f11f47f659b', '', '2021-12-06 10:05:40', '1', '', 0, 0, 0, ''),
(1475, 'GNI-34034', 'sgayathti@gmail.com', 'D. Ranula Adilsha Navinna Kottage', '2010-09-19', 'male', 'St. Peterâ€™s Collage ', 'Gampaha', 'Jaela', '777166777', '', '', '777166777', '79, Zone 01, Millennium city, Kotugoda, Jaela', 39, '0b27bbbed3c0275ab19d5c710a4d7ee1', '', '2021-12-06 10:34:36', '1', '', 0, 0, 0, ''),
(1611, 'GNI-90991', 'pasindunuwantha266@gmail.com', 'Nuwantha Pasindu', '2005-10-08', 'male', 'Giriulla  N. S', 'Kurunegala', 'Giriulla', '762132473', '', '', '762132473', 'Giriulla', 43, '6695eb2d9ffd4db47ae2598ea865acdc', '', '2021-12-22 05:40:38', '1', '', 0, 0, 0, ''),
(1477, 'GNI-50599', 'Diyanathanarashi@gmail.com', 'Diyana Siriwardena ', '2011-01-27', 'male', 'Ananda balika vidyalaya Kotte ', 'Colombo', 'Pita Kotte ', '711537022', '', '', '711537022', 'Polgasowita ', 39, '5d2a7ec3cdd69b9aa4a649aba37963c8', '', '2022-01-03 12:25:51', '1', '', 0, 0, 0, ''),
(1478, 'GNI-05789', 'janiththilakarathna@gmail.com', 'I D THARUKI DEENA THILAKARATHNA', '2009-02-05', 'female', 'Bandaragama madya maha vidyalaya   ', 'Kalutara', 'Bandaragama ', '715352225', '', '', '715344139', '78/B10 KOSGAHA WATHTHA MANINGAMUWA PARA WELMILLA HANDIYA', 40, '440d78662a25e1d8dded78b95b15112e', '', '2022-01-18 05:04:05', '1', '', 0, 0, 0, '1948'),
(1479, 'GNI-57722', 'sandyarosairo@gmail.com', 'Mithila Kaveesha Rozairo', '2009-03-10', 'male', 'St.Anthon\"ys College Kandy', 'Kandy', 'kandy', '775329643', '', '', '775329643', '124/2,polwaththa, Am,./?/mpitiya', 40, '2afd223762609e8d7ca96bf71b0bf940', '', '2021-12-06 14:16:47', '1', '', 0, 0, 0, ''),
(1480, 'GNI-14852', 'samanthi198007@gmail.com', 'Lithum Sathsana', '2008-05-30', 'male', 'royal institute ', 'Colombo', 'pamankada', '778525189', '', '', '778525189', '41/6 strafford road,pamankada,colombo 06', 41, '79d9fc0d6073fd8448c33dfa8c5d1665', '', '2022-01-10 14:11:03', '1', '', 0, 0, 0, ''),
(1481, 'GNI-61092', 'lahirusanjeewa79@gmail.com', 'Gagana Adeesha Pabasara ', '2010-03-13', 'male', 'Lumbini collage ', 'Colombo', 'Kottawa ', '765625900', '', '', '765625900', '213/4C , Balika niwasa road ,namal place ,kottawa pannipitiya ', 39, '56b717fb3cad408d41901026b640db3e', '1638887861gagana_scool_photo_2.jpg', '2022-01-10 12:14:49', '1', '', 0, 0, 0, ''),
(1482, 'GNI-97183', 'Navindyahansani680@gmail.com', 'Navindya hansani', '2006-03-22', 'female', 'Mo/medagama national school', 'Monaragala', 'Medagama', '713284127', '', '', '714211632', 'Kotabowa road,1st mile post, medagama,bibile', 43, '062733e4c6fc4665edeb6892f306ac74', '16411813213632695.jpg', '2022-01-03 03:42:01', '1', '', 0, 0, 0, ''),
(1483, 'GNI-66112', 'vihangaweerathunga2009@gmail.com', 'vihanga weerathunga', '2009-08-08', 'male', 'sarasavi uyana college', 'Kandy', 'kandy', '775675777', '', '', '775675777', '203/c poththapitiya,menikdiwela', 40, '3bb442afab071dac5a27ba9e38ba96e9', '', '2021-12-11 03:34:29', '1', '', 0, 0, 0, ''),
(1484, 'GNI-70497', 'bgislakmali@gmail.com', 'Sehiru Indew Silva', '2015-10-12', 'male', 'St . Peter\'s College, Colombo 4', 'Colombo', 'Dehiwala', '776357215', '', '', '776357215', '36 A, Pepiliyana Road, Dehiwala', 34, '3740b6036d8cedca803a5f1af25def61', '1638948681IMG_20211001_104006.jpg', '2021-12-08 07:31:22', '1', '', 0, 0, 0, ''),
(1505, 'GNI-45200', 'weihenaliyanageanura@gmail.com', 'Weihena Liyanage Ranithma Thinudi', '2007-03-22', 'female', 'Christ Church Girls\' College', 'Galle', 'Baddegama', '778632000', '', '', '778632000', '1st Mile Post, Weniyarawela, Baddegama, Galle', 42, '251e75453149111fe5305f7eea5cb27a', '1639111622BeautyPlus_20201120141053788_save.jpg', '2021-12-10 04:47:02', '1', '', 0, 0, 0, ''),
(1486, 'GNI-31031', 'dushangavesh@gmail.com', 'P.L.K.Dushan Gavesh', '2008-05-02', 'male', 'St.Joseph\'s College', 'Colombo', 'Mount Lavinia', '768648288', '', '', '768648288', '1/A Sirir Gunarathne Mawatha Mt.Lavinia', 41, 'e0cefdbe5c967fbb5ec1d9249849ae50', '1638889113F47898BE-C657-4830-B02A-CCDEE49AEA57.jpg', '2021-12-07 14:58:33', '1', '', 0, 0, 0, ''),
(1487, 'GNI-28820', 'himaliranatunge1000@gmail.com', 'Sithuka Ranasinghe', '2010-07-16', 'male', 'Lumbini Collage', 'Colombo', 'Kottawa', '777824166', '', '', '777824166', '1549/12A, Amu Etamulla Road, Kottawa, Pannipitiya.', 39, 'c4d2d96cc8947a20c4afea73f400c388', '1641573301download_(1).jfif', '2022-01-07 16:35:01', '1', '', 0, 0, 0, ''),
(1488, 'GNI-50521', 'ldilanka 033@gmail. com ', 'U. N. W. A Deneth Maduranga ', '2010-08-28', 'male', 'Wp/M Nawuththuduwa National school ', 'Ampara', 'Mathugama ', '789598206', '', '', '703092223', 'à¶±à·œ 75à¶šà¶´à·’à¶­à·à¶±à·Š à¶¸à·”à¶«à·’à¶¯à·à·ƒ à¶¸à·à·€à¶­, à¶…à·…à·”à¶­à·Šà¶œà¶¸à¶œà·œà¶©,à¶±à·€à·”à¶­à·Šà¶­à·”à¶©à·”à·€ ', 39, '3c137881a7a742261c5c4c9004603f49', '', '2021-12-07 14:23:59', '1', '', 0, 0, 0, ''),
(1607, 'GNI-09155', 'deemanthisedhahansisamaraweera@gmail.com', 'Deemanthi Sedhahansi', '2007-02-22', 'female', 'Lyceum International School Rathnapura', 'Ratnapura', 'Rathnapura', '768834074', '', '', '768834074', '183/10 Batugedara Rathnapura', 43, '60ecaf93077bf24e69348d590aa4a35b', '', '2021-12-21 05:03:50', '1', '', 0, 0, 0, ''),
(1490, 'GNI-22472', 'Sumedhabandara@gmail.com', 'Ruwangi sankalpani', '2007-10-23', 'female', 'Buddhist ladies college', 'Colombo', 'Malabe', '112407411', '', '', '723501985', '134/d,kahanthota road,pittugala,malabe.', 42, '155d17a5031b563db34d422035ab9266', '', '2021-12-07 14:52:54', '1', '', 0, 0, 0, ''),
(1491, 'GNI-77614', 'indikagunasinghe39@gmail.com', 'Herath Mudiyanselage Binara sahas pabasara gunasinghe', '2009-09-27', 'male', 'A/Galenbidunuwawa.m.c.c', 'Anuradhapura', 'Galenbidunuwawa', '768145465', '', '', '768145465', 'Upuldeniya/Anuradapura', 40, '25d55ad283aa400af464c76d713c07ad', '', '2021-12-07 15:08:43', '1', '', 0, 0, 0, ''),
(1492, 'GNI-80903', 'hmskgunasinghe@gmil.com', 'Virakoon mudiyansala vihaga yasith randiu virakoon', '2009-01-16', 'male', 'A/upuldaniy madyamaha vidyalaya', 'Anuradhapura', 'Galinbidunuwawa', '713648734', '', '', '761024124', 'Upldaniya anuradapura', 41, '5c1b7eac6b8777b54abb27fa02016fc0', '', '2021-12-07 15:08:49', '1', '', 0, 0, 0, ''),
(1493, 'GNI-74289', 'ajithanjani@gmail.com', 'Binuthi Yashinsha Diyani', '2013-09-13', 'female', 'Princess of wales', 'Colombo', 'Moratuwa', '718207468', '', '', '782981580', 'No 53D Mahagammadda Payagala', 36, '9228aeb3e64e7f5c81afe811402a542a', '', '2021-12-07 15:09:28', '1', '', 0, 0, 0, ''),
(1494, 'GNI-56987', 'ajithanjani@gmail.com', 'Onithi Siyansa Thawasari ', '2010-06-22', 'female', 'Princess of Wales', 'Colombo', 'Moratuwa', '718207468', '', '', '782981427', 'No 53 D , Mahagammadda,payagala', 39, '9228aeb3e64e7f5c81afe811402a542a', '', '2021-12-07 15:33:58', '1', '', 0, 0, 0, ''),
(1495, 'GNI-95160', 'hamskgunasinghe@gmil.com', 'Weerkoon mudiyansalaga vihaga yasith weekoon', '2009-01-16', 'male', 'A/upuldaniya vidyalaya', 'Anuradhapura', 'Galingidunuwawa', '713748734', '', '', '768254124', 'Upuldaniya anuradapura', 41, '14de9cb8e86f6a42008b43144877d0c8', '', '2021-12-07 16:05:46', '1', '', 0, 0, 0, ''),
(1496, 'GNI-48564', 'Kumarishyamali776@gmail.com', 'Yunila dinoth yahathugoda ', '2007-11-02', 'male', 'St.joseph college ', 'Gampaha', 'Negombo', '778813809', '', '', '778813809', '138 Temple road negombo Sri lanka', 42, '3dd57e70ef9ef731a205e5af393bae93', '', '2021-12-08 04:00:05', '1', '', 0, 0, 0, ''),
(1497, 'GNI-75158', 'Sajeekarunarathna948@gmail.com', 'Chanuga Nimsandu Waidyathilake ', '2009-09-07', 'male', 'Dharmaraja College ', 'Kandy', 'Kandy ', '778096802', '', '', '778096802', 'No.1/7,A, Doolwala, Jayanthi road ,Halloluwa.', 40, 'bdaefd69dfbe00bf53d8264036004816', '', '2022-01-11 15:01:17', '1', '', 0, 0, 0, ''),
(1498, 'GNI-61296', 'sethmi882@gmail.com', 'A.A.Sethmi Yehansa', '2010-10-04', 'female', 'Mount Calvary High School', 'Galle', 'Elpitiya', '714000023', '', '', '714000023', 'Cinnamon Garden Elpitiya', 38, '1bcd47f176e6d9be32ca8a920b2ea065', '1638961619sunrise-1014712_1920.jpg', '2021-12-08 11:06:59', '1', '', 0, 0, 0, ''),
(1499, 'GNI-04289', 'harshanikalanidssnk057@gmail.com', 'Chathuni Bimanya Liyanage', '2010-10-13', 'female', 'Asian Grammar School', 'Matara', 'Matara', '705044665', '', '', '705044665', 'Bogahawatta,Akila zone Walgama Matara', 39, 'b124597c145d9ebf8320937e92281309', '', '2021-12-08 12:45:42', '1', '', 0, 0, 0, ''),
(1500, 'GNI-57585', 'harshamallawarachchi@gmail.com', 'Dinodh Methnula Mallawarachchi ', '2008-04-24', 'male', 'Stjosephscollege ', 'Gampaha', 'Wattala ', '766661265', '', '', '766661265', '103/B2,carmel Mawatha ,Hendala ,Wattala ', 40, '1d93527cb3410dc955beb65b7bead66e', '', '2021-12-09 05:47:19', '1', '', 0, 0, 0, ''),
(1501, 'GNI-19250', 'royalchesspianist@gmail.com', 'T.Sithum Gayasha Mendis', '2010-09-08', 'male', 'G/Sri Devananda College', 'Ampara', 'Ambalangoda', '772929702', '', '', '772929702', 'Sithum Cinamon Green, Suduwalla Road, Thalgasgoda, Ambalangoda', 38, 'd86eb5a9711c1a5910ccec1517047d05', '1639057083DSC_0301.JPG', '2021-12-09 13:38:04', '1', '', 0, 0, 0, ''),
(1502, 'GNI-57508', 'bimsaraliyanage123@gmail.com', 'Bimsara avishka liyanagr', '2009-08-30', 'male', 'St.john college', 'Ampara', 'Nugegoda', '112829151', '', '', '702735085', '23/8 5th Lane,jambugas mulla mawatha , nugegoda.', 40, 'fcfabfd04214b1f0424253c8944d8c3b', '', '2022-01-08 06:57:46', '1', '', 0, 0, 0, ''),
(1503, 'GNI-64511', 'linukadevsara2009@gmail.com', 'Linuka Devsara', '2009-03-02', 'male', 'Nalanda College Colombo 10', 'Gampaha', 'Ragama', '714411125', '', '', '714411125', '215/A, Walpola, Ragama', 40, '2ca6e420c07844fd2095f9cea02c0d1b', '', '2021-12-12 11:33:51', '1', '', 0, 0, 0, ''),
(1721, 'GNI-52895', 'Sanjeewakandy64@gmail.com', 'Shashini Amunugama', '2014-06-16', 'female', 'JMC College International ', 'Kandy', 'Kandy', '715149013', '', '', '784994176', 'No 5 Lokuwaththa, Sirimalwaththa, Gunnapana', 35, '7364b68edff76ea61e0310f12c59ed1e', '', '2022-02-01 02:39:15', '1', '', 0, 0, 0, ''),
(1506, 'GNI-50024', 'muvindu@yogeemedia.com', 'heehaka Muvindu Susara De Zoysa', '1995-10-25', 'male', 'aaaa', 'Ampara', 'aaaa', '775303051', '', '', '765303051', 'aaaa', 43, 'c39ff48d1cb76c09b4ec2c1615720420', '', '2021-12-10 05:53:58', '1', '', 0, 0, 0, ''),
(1507, 'GNI-81926', 'lakmini.kandycity@gmail.com', 'Pahan Prabashwara Liyanage', '2009-03-07', 'male', 'Dharmaraja College ', 'Kandy', 'Kandy', '771846888', '', '', '771846888', '430/A, Balagolla, Kengalla', 40, '744bed1cd9b89db1bb6baf0125dbe6f9', '163920696620211027_083808.jpg', '2022-02-01 04:28:00', '1', '', 0, 0, 0, ''),
(1508, 'GNI-48126', 'Sanethathisun@outlook.com', 'Sanetha Thisun', '2008-10-03', 'male', 'nttambuwa sangabodhi national collage', 'Gampaha', 'nittambuwa', '778327206', '', '', '778327206', '57/k/2,3rd lane,mahagedarawaththa,napagoda,nittambuwa', 41, 'ef8446f35513a8d6aa2308357a268a7e', '1641551237sanetha.jpeg', '2022-01-07 10:27:17', '1', '', 0, 0, 0, ''),
(1509, 'GNI-51700', 'fernandokumari174@gmail.com', 'Vithana Arachchige Gayansa Sasithmee Maria Perera', '2009-01-27', 'female', 'Holy Family Convemt', 'Colombo', 'Mutwal', '715318442', '', '', '715318442', '271/44, church lane, colombo 15', 41, 'ef4cd145032931e138b780196c7be565', '', '2022-01-07 11:41:49', '1', '', 0, 0, 0, ''),
(1510, 'GNI-59779', 'Kanchanabandara705@gmail.com', 'Kawmadi arambepola ', '2009-05-12', 'female', 'Katugastota ', 'Kandy', 'Katugastota ', '714336001', '', '', '714336001', '375 arambepola Alawathugoda ', 40, 'dd77450b515519ee587c5778b1818b4a', '1640739630Peppa-Pig-Wallpaper-8.jpg', '2021-12-29 01:00:31', '1', '', 0, 0, 0, ''),
(1511, 'GNI-64738', 'bhagyahapuarachchi55@gmail.com', 'Ayansa Abewardhana', '2010-03-10', 'female', 'Rathnawali Balika Vidyalaya - Gampaha ', 'Gampaha', 'Mawaramandiya', '784763589', '', '', '767628040', '60/27 Katukurundawattha, Mawaramandiya, Kadawatha', 39, 'db171a60e91cda0525cbf34f7f0a83db', '1641276838Screenshot_20220102-171035_Google.jpg', '2022-01-04 06:13:58', '1', '', 0, 0, 0, ''),
(1512, 'GNI-39725', 'tadeeshasarami921@gmail.com', 'Tadeesha Sarami Pathirage', '2009-08-21', 'female', 'Hilburn International College', 'Ratnapura', 'Eheliyagoda', '719603451', '', '', '719603451', '377/A,Dangaswellawaththe,Nakandala,Eheliyagoda', 40, '1ec605bc1367da2d289dbc828bd367d3', '16391505072.jpg', '2021-12-10 15:35:07', '1', '', 0, 0, 0, ''),
(1513, 'GNI-64009', 'thisarikdh@gmail.com', 'K. Thisari D. Harischandra', '2006-03-02', 'female', 'Musaeus College - Colombo', 'Colombo', 'Sri JayawardenaPura Kotte', '776436008', '', '', '770585880', '333 A, Nawala Road, Nawala, Rajagiriya.', 43, '8baa79dd5f1bdd6b464080f2b46f6e44', '1639890370black_galaxy.jpg', '2021-12-19 05:06:10', '1', '', 0, 0, 0, ''),
(1514, 'GNI-79986', 'kanchkulathunga@gmail.com', 'Kamkanamge Vihanga Sampath', '2011-05-07', 'male', 'Defence College ', 'Colombo', 'Athurugiriya ', '763158997', '', '', '763158997', '197, Pore, Athurugiriya ', 38, '9adbd48b1fc0c7cdebe7dc969662f2b6', '', '2021-12-10 15:50:43', '1', '', 0, 0, 0, ''),
(1515, 'GNI-42610', 'Sandyaniroshani50@gmail.com', 'Uyangodage kaveesha nethsara', '2006-12-05', 'male', 'Sri Saddharmodhaya maha vidyalaya.', 'Colombo', 'Kirulapana ', '766087397', '', '', '777219235', 'No.156,Poorwarama rd,kirulapana,Colombo 05.', 43, '13a91eecc0522d57ac4a55863608a8a3', '', '2021-12-10 15:54:47', '1', '', 0, 0, 0, ''),
(1516, 'GNI-71357', 'adheekshana.ranushan2008@gmail.com', 'Adheekshana Ranushan', '2008-05-17', 'male', 'Nalanda College - Colombo-10', 'Colombo', 'Battaramulla', '770637079', '', '', '714064922', 'No: 547/1, Thalangama North, Battaramulla', 41, '8094edf188e1ed78d0580897f67e4c4d', '1639157112aaaaaaaaaaaaa_(22).jpg', '2021-12-10 17:25:12', '1', '', 0, 0, 0, ''),
(1517, 'GNI-08677', 'nilu.palliyaguru@gmail.com', 'M. P. G. Lithuka Megha Damsath Palliyaguru ', '2010-10-06', 'male', 'Mahanama college', 'Colombo', 'Maharagama', '773987842', '', '', '773987842', '571/4B, Patalwatta Road, Arawwala, Pannipitiya ', 39, '93672761ed145fdd795da7b824ee2a69', '', '2021-12-10 17:30:40', '1', '', 0, 0, 0, ''),
(1518, 'GNI-93461', 'nuhansadew3108@gmail.com', 'Nuhansa Abewardhana', '2008-05-31', 'female', 'Viharamahadevi Balika Vidyalaya - Kiribathgoda', 'Gampaha', 'Mawaramandiya', '718106725', '', '', '718106725', '60/27 Katukurundawaththa, Mawaramandiya, Kadawatha', 40, 'a943c89975761c22c15439865c0041b7', '', '2021-12-11 01:36:51', '1', '', 0, 0, 0, ''),
(1519, 'GNI-71915', 'nuprasha77@gmail.com', 'Nuhansa Dewlini', '2008-05-31', 'female', 'Viharamahadevi Balika Vidyalaya - Kiribathgoda', 'Gampaha', 'Mawaramandiya', '784763589', '', '', '784763589', '60/27 Katukurundawaththa, Mawaramandiya, Kadawatha', 41, 'd22c37d848ee149a65f7ba0c5c0fc228', '', '2021-12-11 01:40:45', '1', '', 0, 0, 0, ''),
(1520, 'GNI-11786', 'wihagaw9@gmail.com', 'Weerakon Mudiyanselage Vihanga Yasith Randiw Weerakon ', '2009-01-16', 'male', 'A/Upuldeniya Vidyalaya', 'Anuradhapura', 'Galenbindunuwewa', '713748734', '', '', '701346004', 'Upuldeniya, Anuradhapura', 41, '2b6a0d188b6f2a220cb494dee19a4dac', '', '2021-12-11 03:00:15', '1', '', 0, 0, 0, ''),
(1521, 'GNI-17807', 'indasarahapugoda2009@gmail.com', 'K. G. Indasara Thareesha Vichakshana Hapugoda', '2009-03-23', 'male', 'Nugawela Central College', 'Kandy', 'Ammbatenna', '713599786', '', '', '768831597', '125/1 Hapugoda Ammbatenna', 40, 'fc99809e6317304e60542d324ca0666f', '', '2021-12-31 05:25:16', '1', '', 0, 0, 0, ''),
(1522, 'GNI-23449', 'rajindri.r.beddwela@gmail.com', 'Rajindri Beddewela', '2007-11-07', 'female', 'Maliyadeva Balika vidyalaya', 'Kurunegala', 'Kurunegala', '777345289', '', '', '777345289', '656/A , Temple road, Wehera , Kurunegala', 42, '8d2708f8676f419d34ee248f2bc45163', '1639376301Screenshot_20211102-145654_Pinterest.jpg', '2021-12-13 06:18:22', '1', '', 0, 0, 0, ''),
(1523, 'GNI-27408', 'herath.67dsa@gmail.com', 'Weerathunga Arachchige Himansa Sathsarani Costa ', '2008-02-18', 'female', 'Wp/Ja/Samuddradevi Balika Vidyalaya ', 'Colombo', 'Boralesgamuwa ', '718014067', '', '', '718014067', '168,Suriyamalmw ,Divulpitiya ,Boralesgamuwa ', 41, 'aca936303e3f1b06598e743107259681', '', '2021-12-11 04:29:12', '1', '', 0, 0, 0, ''),
(1524, 'GNI-85772', 'Unrathnayaka@gmail.com', 'Maheshika sathsarani', '2009-02-21', 'female', 'Mo/medagama national school ', 'Monaragala', 'Medagama ', '713284127', '', '', '713284127', 'Kotabowa road,1st mile post,medagama,bibile.', 40, '062733e4c6fc4665edeb6892f306ac74', '', '2021-12-11 07:22:02', '1', '', 0, 0, 0, ''),
(1569, 'GNI-02151', 'YashodaraDewsarani@gmail.com', 'Yashodara Dewsarani ', '2006-06-24', 'female', 'Holy Family Convent', 'Colombo', 'Kaduwela ', '776022880', '', '', '761828278', '1065/7A,Amaragoda road,Pothuarava,Malabe.', 43, 'cef76c616dde4f725c8f463490e04657', '', '2021-12-16 15:10:08', '1', '', 0, 0, 0, ''),
(1526, 'GNI-22081', 'Indimadk@gmail.com', 'Matheesha Radika', '2010-08-14', 'male', 'AM / MAHA / Kappetipoia  jathika pasala', 'Ampara', 'Mahaoya', '716630879', '', '', '773716389', 'M . 9  Mahaoya', 39, 'dd6ca71a27ea7cd55126acef38fb58b7', '', '2021-12-21 07:21:17', '1', '', 0, 0, 0, '1870'),
(1527, 'GNI-17271', 'janakanis@gmail.com', 'M.M.sadeep hansana,Grade 8', '2009-05-06', 'male', 'S.T.Joesph\'s college ', 'Badulla', 'Bandarawela ', '701745809', '', '', '713593493', 'No42,Udhakalagama, Poonagala Road,Bandarawela ', 40, '75324f44a96dc7f4695833ad44cc2502', '164129759420211230_083335.jpg', '2022-01-04 12:00:51', '1', '', 0, 0, 0, ''),
(1600, 'GNI-02865', 'senarathnedilini0@gmail.com', 'Hiranya Khushi ', '2012-08-24', 'female', 'Kottawa dharmapala primari ', 'Ampara', 'Kahathduwa', '775657675', '', '', '775657675', '461/B/386/D/kahathduwa,city Of Life', 37, '39c1267ac7cc492e84b60c3c59fea6d0', '', '2021-12-19 12:22:27', '1', '', 0, 0, 0, ''),
(1528, 'GNI-55641', 'Ravindapeirismal@gmail.com', 'E.A.Didula Damsath Peiris', '2021-06-22', 'male', 'Mahinda Rajapaksha College', 'Colombo', 'Homagama', '770834657', '', '', '770834657', '218,2/C Delgahawaththa Pitipana South Homagama', 43, 'd41d8cd98f00b204e9800998ecf8427e', '', '2021-12-11 11:26:08', '1', '', 0, 0, 0, ''),
(1529, 'GNI-02690', 'Sunithawarnasuriya6@gmail.com', 'R.A.Amanthika Anuruddhi Ranasinghe', '2008-06-30', 'female', 'Ku/Lakdas De Mel College', 'Kurunegala', 'polpithigama', '702192783', '', '', '760319568', '451/3 palagama , makulpotha', 41, '162dd1e08c072a9a207e4d2c44d2bc39', '1639277377Snapchat-1924524363.jpg', '2021-12-12 09:18:34', '1', '', 0, 0, 0, ''),
(1530, 'GNI-09423', 'bmakbalasuriya@gmail.com', 'B.M.Kalana Nuwan balasooriya ', '2007-10-17', 'male', 'Rangiri dambulla central collage ', 'Matale', 'Dambulla', '716953681', '', '', '716953681', '2/1 Sigiriya road Kimbussa', 42, '74d05e4045d487dc6fbf8fc0c985a816', '', '2021-12-25 05:48:03', '1', '', 0, 0, 0, ''),
(1531, 'GNI-42907', 'Fathimanoorah2007@gmail.com ', 'Fathima Noorah', '2007-09-24', 'female', 'Royal international school ', 'Kurunegala', 'Kurunegala ', '776229304', '', '', '740708362', 'Negambo road, Bamunawela kurunegala', 42, '9fa3faea3714a96f8e5845d29c86af0d', '', '2021-12-12 05:38:54', '1', '', 0, 0, 0, ''),
(1532, 'GNI-06451', 'Seyarasanuli@gmail.com', 'Sanuli Seyara Herathge', '2011-11-07', 'male', 'Vidura Collage', 'Ampara', 'Kadawatha', '714967546', '', '', '714967546', '336/17 Gajaba Mawatha, Ihalarakarahamuna,Kadawatha', 38, '0d916a4abc40a7ffbdf414a1d572c072', '', '2021-12-12 07:06:57', '1', '', 0, 0, 0, ''),
(1533, 'GNI-23821', 'dinushabulathsinhala7@gmail.com', 'N.Dinusha Bulathsinhala ', '2005-12-29', 'female', 'Anula Vidyalaya', 'Colombo', 'Nugegoda ', '728708945', '', '', '714703620', '140, Jambugass mulla mawatha , Nugegoda ', 44, 'c8c18a1ef34a729b48969d5bf952621e', '', '2021-12-12 08:00:23', '1', '', 0, 0, 0, ''),
(1534, 'GNI-67897', 'nil2cha@gmail.com', 'Chanithma Peduruarachchi', '2006-08-23', 'female', 'Sirimavo Bandaranaike Girl\'s College', 'Colombo', 'Colombo', '713976845', '', '', '713976845', '295/1/A,Mahalwarawa,Pannipitiya', 43, '665db6933ecf24d71537f8987200526c', '1639297207Dp-image-for-girls-227.jpg', '2021-12-12 08:20:07', '1', '', 0, 0, 0, ''),
(1535, 'GNI-53034', 'shehanrowel@gmail.com', 'Shenala D. Rowel', '2005-11-08', 'female', 'holy cross college ', 'Gampaha', 'gampaha', '777122219', '', '', '777122219', '104/60 3rd lane Sribodhi place, Gampaha', 44, 'a5f71e73ab341f4027f7c26385ac16e7', '1639304397cute-unicorn.jpg', '2021-12-16 14:13:12', '1', '', 0, 0, 0, ''),
(1536, 'GNI-47059', 'amayasalwathura934@gmail.com', 'Amaya Devindya', '2007-12-02', 'female', 'Sanghamiththa college galle', 'Galle', 'Gallr', '777909731', '', '', '760404272', '307/3wakwella road, galle', 42, '7a7334732b3f32e2574653ea07aff8f4', '', '2021-12-12 13:57:33', '1', '', 0, 0, 0, '9568'),
(1537, 'GNI-83054', 'nsudarshani1980@gmail.com', 'J.A Senoli Thamalsha ', '2008-11-08', 'male', 'Samudra devi balika vidyalaya Nugegoda ', 'Colombo', 'Borales Gamuwa ', '713018893', '', '', '713018893', '252/A sooriyamal mawatha divulpitiya borelessgamuwa ', 41, '7ed7c9192774b5f7543084cf16c87256', '1639321816IMG-20201206-WA0036.jpg', '2021-12-12 15:10:16', '1', '', 0, 0, 0, ''),
(1538, 'GNI-48375', 'nilufafazli@gmail.com', 'Faarah Fazli', '2007-04-13', 'female', 'Yasodara Vidyalaya ', 'Colombo', 'Colombo', '772311283', '', '', '772311283', 'No.19, Tichborne Lane, Colombo 10', 42, 'd550614cade5a7732b2b956e2b7e1c5f', '', '2022-01-07 12:22:58', '1', '', 0, 0, 0, ''),
(1539, 'GNI-28082', 'lithukiwijayabandara@gmail.com', 'lithuki malinsha wijayabandara', '2010-09-16', 'male', 'Kg/Mw/Mayrapada C.C', 'Kegalle', 'Mawanalla', '763461790', '', '', '763461790', 'no,904 kandy road hingula', 39, '60e64ee5d5a8a3fa61297033587f9249', '', '2021-12-14 12:49:27', '1', '', 0, 0, 0, ''),
(1540, 'GNI-58268', 'senehansa@gmail.com', 'Senuki Nehansa Desaa', '2010-07-04', 'female', 'Good Shepherd Convent Panadura', 'Kalutara', 'Panadura', '770375789', '', '', '770375789', 'No 451/B1 Maddewella road Nalluruwa, Panadura', 38, '017eaea7394c6bdfac35cd9fc468bfdd', '1639384416Angel_return_11.jpg', '2021-12-13 08:33:36', '1', '', 0, 0, 0, ''),
(1541, 'GNI-62627', 'maheshisethum@gmail.com', 'G.G. Maheshika Muthumini', '2022-04-28', 'female', 'Ga/ Gintota m.v.', 'Galle', 'Galle ', '711113949', '', '', '750870833', 'Kendala Bossa', 39, 'afb823c7d93ac03ed1b3f6fc98d3733c', '', '2021-12-29 11:14:12', '1', '', 0, 0, 0, '4348'),
(1542, 'GNI-41233', 'chandimapriyadarshani14011983@gmail.com', 'Maleesha Dineth', '2009-11-30', 'male', 'Bandaranayake Central College Veyangoda', 'Gampaha', 'Gampaha', '714643245', '', '', '741537452', 'No.75/C ', 40, 'dd5cad7bd1a514ea7c3cc53f7c5ff4a0', '', '2021-12-13 11:34:13', '1', '', 0, 0, 0, ''),
(1543, 'GNI-28792', 'sithumhapuarachchi6@gmail.com', 'jemilka damsara wanniarachchi', '2009-08-05', 'male', 'kottawa dharmapala maha vidyalaya', 'Colombo', 'kottawa', '717738155', '', '', '717738155', '704/3 kulawevana road,kottawa', 40, '579c2f8453e72571758e911c0287bdd6', '', '2021-12-13 13:29:51', '1', '', 0, 0, 0, ''),
(1544, 'GNI-22085', 'piuthillekerathne@gmail.com', 'piumali thillekerathne', '1987-02-24', 'female', 'University of Colombo', 'Ampara', 'MORATUWA', '772959974', '', '', '772959974', '115,  Uyana Road', 43, '80d560510db5183aa9349ac8d7947407', '', '2021-12-20 19:17:55', '1', '', 0, 0, 0, ''),
(1545, 'GNI-43147', 'ireshikanisali@gmail.com', 'I. D. Sulakshana jayashan', '2006-09-04', 'male', 'St. John\'s college', 'Colombo', 'Nugegoda', '763939287', '', '', '763939287', '47/vakanda para, jambugasmulla mavatha, nugegoda', 43, 'b18dc23e6c923b9568bf54a9a5ebb930', '', '2021-12-14 10:32:35', '1', '', 0, 0, 0, ''),
(1546, 'GNI-77797', '0787451377', 'Isumi kemdini ', '2015-04-05', 'male', 'Negombo south international ', 'Colombo', 'Piliyandala', '786543577', '', '', '787451377', 'Indrajothi Mahimi Mawatha', 35, '0b0cfc07fca81c956ab9181d8576f4a8', '', '2021-12-14 10:39:23', '1', '', 0, 0, 0, ''),
(1547, 'GNI-51419', 'ashansaph@gmail.com', 'P.H Ashansa Pelawatte', '2008-10-11', 'female', 'Lindsay Balika Vidyalaya', 'Colombo', 'Wellawatte', '767360999', '', '', '727999360', '480/1,A, Galle Road, Wellawatte, Colombo 06', 41, 'd1623c5a0740c7c52a8aa4d2e81f65a4', '1639479331WhatsApp_Image_2021-09-24_at_14.13.31_(1).jpeg', '2022-01-08 10:52:51', '1', '', 0, 0, 0, ''),
(1548, 'GNI-96979', 'Mprpriyadharshanipriya@ gmail.com', 'W.G Nehara sathsarani', '2021-09-23', 'female', 'Lumbini college ', 'Ampara', 'Piliyandala', '769666409', '', '', '769666409', 'No.36/ A makuluduwa piliyandala', 39, 'e19d5cd5af0378da05f63f891c7467af', '', '2022-01-18 12:12:35', '1', '', 0, 0, 0, '4224'),
(1549, 'GNI-43014', 'uddikaperera@gmail.com', 'Omaththage Ravishka Sandunatha Perera', '2006-08-29', 'male', 'Royal College', 'Colombo', 'Boralesgamuwa', '789812437', '', '', '781735872', '674/A, Lake Road, Boralesgamuwa', 43, 'e359cbdf2475d2ed74709f550736dfac', '', '2021-12-14 14:04:24', '1', '', 0, 0, 0, ''),
(1550, 'GNI-65591', 'Nishanthakumara  321v@gmail.com', 'V.G thimesha rasangani ', '2010-03-03', 'female', 'R/malvala nvoddaya maha viddiyalya', 'Ratnapura', 'Ratnapura', '770577492', '', '', '770577492', 'Amunuthenne ,gallella ,ratnapura .', 39, '97e6819379616fa40f150fb88fdaec73', '', '2021-12-14 14:21:58', '1', '', 0, 0, 0, ''),
(1551, 'GNI-07047', 'bhanuraperera@gmail.com', 'Omaththage Chamantha Bhanura Perera', '2009-05-15', 'male', 'Mahanama College', 'Colombo', 'Boralesgamuwa', '789812437', '', '', '789812437', '674/A, Lake Road, Boralesgamuwa', 40, 'f12df19ed54a487c8f6672911af8feef', '', '2021-12-14 14:26:06', '1', '', 0, 0, 0, ''),
(1552, 'GNI-77679', 'dinukumara30@gmail.com', 'Ethdath Waduge Thenu Thisanga', '2008-02-10', 'female', 'Gothami balika maha vidyalaya, co 10', 'Colombo', 'Maradana', '785120022', '', '', '752393374', '132/23 2/1 tichborne passage, maradana, colombo10', 41, '5142b6507697a792abbf6b10dfadb8a6', '', '2021-12-14 14:43:53', '1', '', 0, 0, 0, ''),
(1553, 'GNI-95249', 'rajapakshan2005@gmail.com', 'Vidana Gamage Lithum Damsana', '2010-11-26', 'male', 'Lumbiniya College Colombo 5', 'Colombo', 'Maharagama', '767242542', '', '', '767242542', '159/52, Temple Road , Maharagama.', 39, '25d55ad283aa400af464c76d713c07ad', '1639822440cropped-IMG20211010144841.jpg', '2022-01-08 02:43:30', '1', '', 0, 0, 0, ''),
(1554, 'GNI-66525', 'tgppkumara.mo@gmail.com ', 'T. G. Sinuri Hesanya Malmanthi ', '2008-07-16', 'male', 'Gampaha Rathnavali Balika Vidyalaya ', 'Ampara', 'Homagama ', '776706761', '', '', '764681581', 'No. 184 /A TEMPLE JUNCTION PITIPANA NORTH HOMAGAMA ', 41, '1021bd8c88c80e238cfa055ff0315cce', '', '2021-12-14 18:40:30', '1', '', 0, 0, 0, ''),
(1555, 'GNI-54814', 'rathnayakechamela@gmail.com', 'Wattegedara Chamela Kaveendra Rathnayake', '2006-07-18', 'male', 'B/P ,Ananda Shasthralaya ,Kotte', 'Colombo', 'Nedimala', '710228326', '', '', '777312944', '17/5,Alubogahawatta ,Nedimala ,Dehiwala', 43, '83badca5859dae2e6fb04a81ae0f7970', '1641122018WhatsApp_Image_2022-01-02_at_16.43.08.jpeg', '2022-01-02 11:13:38', '1', '', 0, 0, 0, ''),
(1556, 'GNI-42268', 'Roshansrilanka80@gmil.com ', 'R. Uvindu Rehan Fernando ', '2008-05-17', 'male', 'Mahanama college ', 'Colombo', 'Mount lavinia ', '762046378', '', '', '762046378', '10/B huludagoda lane mount lavinia ', 41, '45fb7a48d3dfcc750d821911c26a6b25', '', '2021-12-15 06:25:11', '1', '', 0, 0, 0, ''),
(1557, 'GNI-17585', 'zahirmatara1@gmail.com', 'afsara', '2010-03-10', 'female', 'matara convent', 'Matara', 'matara', '713403401', '', '', '713403401', '43 thalalla gandara', 39, '3bfa57103f9073cc27c2476c9c61c729', '', '2021-12-15 08:33:05', '1', '', 0, 0, 0, ''),
(1558, 'GNI-10461', 'mamalawiarachhi@gmail.com', 'G.L.Sathsara pathum nirwan ', '2009-04-01', 'male', 'Gankanda central college ', 'Ratnapura', 'Madampe', '765404563', '', '', '765404563', '267/A Buluwana atakalampanna ', 39, '122fc052988d69f4f82fed0c5702c2ab', '16395587751639558720790868212698247293767.jpg', '2021-12-15 08:59:35', '1', '', 0, 0, 0, ''),
(1597, 'GNI-31418', 'tdewminiwickramarathna2005@gmail.com', 'Tharushika Dewmini Wickramarathna ', '2005-02-18', 'female', 'C.W.W.Kannangara Central College, Mathugama ', 'Kalutara', 'Kalutara ', '716145190', '', '', '716145190', 'Sheelasumana Mawatha ,Duwaththa ,Halkandawila ', 44, '972a3d48ffe4e286930d1c059b4fab31', '', '2021-12-18 15:25:44', '1', '', 0, 0, 0, ''),
(1559, 'GNI-55859', 'guwanithathsarani04@gmail.com', 'Guwani Dananjana Thathsarani', '2008-12-04', 'female', 'Lindsay girls school', 'Colombo', 'Rajagiriya', '726410688', '', '', '778879688', '11/1, Nanayakkara mawatha, Obesekara pura, Rajagiriya', 41, '732aa1f09221e65212554d1313701380', '', '2021-12-15 11:29:51', '1', '', 0, 0, 0, ''),
(1560, 'GNI-02007', 'sanjilakarunadipathi@gmail.com', 'S.G Nethsara Navodya Samaraweera', '2008-10-11', 'male', 'ku/ Lakdas De Mel Collage', 'Ampara', 'Kuruegala', '717188061', '', '', '717188061', 'pahalagama,siyabalangamuwa,maspotha,kurunegala', 41, '0fc8258fc8055ea34b1debe761a68a93', '', '2021-12-15 12:34:16', '1', '', 0, 0, 0, ''),
(1561, 'GNI-52972', 'udenisinhala@gmail.com ', 'T. M. Tharani Sawidya ', '2008-11-11', 'female', 'Holy Family Balika / Kurunegala ', 'Kurunegala', 'Ibbagamuwa ', '715350543', '', '', '715350543', 'Kurunegala, Kiribamuna, Ibbagamuwa ', 41, '361633153a464830a1fe85dec5efab17', '1642159927Screenshot_20220114_170030.jpg', '2022-01-14 11:32:07', '1', '', 0, 0, 0, '4784'),
(1562, 'GNI-51925', 'wingflaglanka@outlook.com', 'RANUKI  PERERA', '2008-12-03', 'female', 'HOLY ANGELS GIRLS COLLAGE', 'Kurunegala', 'KULIYAPITIYA', '718578952', '', '', '718578952', '294 WENDESIWATTA APALADENIYA KULIYAPITIYA', 41, '25d55ad283aa400af464c76d713c07ad', '', '2021-12-17 18:14:28', '1', '', 0, 0, 0, ''),
(1563, 'GNI-22073', 'Sithijadeveloper@gmail.com ', 'Heenwattage sithija Dulakshana Peiris ', '2008-08-17', 'male', 'Christ King College thudella,Ja-ela ', 'Gampaha', 'Ja-ela ', '764252384', '', '', '764252384', '211/batagama North,Ja-ela ', 41, '432384a25cfc5754c9feb4ff647a4498', '163982391020200704_130722.jpg', '2021-12-18 10:38:31', '1', '', 0, 0, 0, ''),
(1564, 'GNI-42182', 'vi1976bandara@gmail.com', 'vihanga bandara', '2006-04-18', 'male', 'anuradhapura walisinha harishchandra collage', 'Anuradhapura', 'auradhapura', '710855924', '', '', '702492822', '155/A,stage 2,dhevanampiyathissa pura, thissa wawa,anuradhapura', 43, '1afc6943a36af57e664b0519ebca875f', '1639636715OIP.jpg', '2022-01-27 23:46:30', '1', '', 0, 0, 0, '2249'),
(1565, 'GNI-30210', 'shafiyafassey@gmail.com', 'Eesa Hassim', '2016-01-01', 'male', 'Abrar', 'Colombo', 'Gothatuwa', '777277876', '', '', '777277876', '183/D/30 manikamulla road gothatuwa', 33, '8f86880e9f2440bd9c8213452fe333e7', '', '2021-12-16 08:34:29', '1', '', 0, 0, 0, ''),
(1566, 'GNI-02822', 'www.dhanujinimsara @gamail .com', 'Dhanuji  nimsara', '2006-12-04', 'male', 'Mo/medagama national school ', 'Ampara', 'Medagama ', '711547601', '', '', '710750445', 'Kotabowa road ,2mile post,medagama ,bibila ', 43, '41013a805458a2bb7e17a5d78b66f2a5', '', '2021-12-16 09:54:46', '1', '', 0, 0, 0, ''),
(1567, 'GNI-34845', 'anushkadkumarasinghe78@gmail.com', 'H.M.Tashini Nesansa ', '20009-12-30', 'female', 'Mo/Mahanama c.c ', 'Monaragala', 'Monaragala ', '717008628', '', '', '703535385', 'No 100, magandanamulla , Monaragala ', 40, 'ea499afdeef66ded657c70864f0c7b95', '', '2021-12-16 10:04:36', '1', '', 0, 0, 0, ''),
(1568, 'GNI-45408', 'jeewanthi1977@gmail.com', 'A.G.Wohara methuki sahansa', '2010-08-06', 'female', 'ST\' Paul\'s girls\'school, Milagiriya.', 'Colombo', 'Dehiwala', '768488590', '', '', '715201393', '23/A 1st lane, Bellanthara rode, Dehiwala', 38, 'a56348086300310b231b14bbef0ab03f', '', '2021-12-16 13:47:21', '1', '', 0, 0, 0, ''),
(1601, 'GNI-99432', 'githikasanjeewani123@gmail.com ', 'G.Ushira sandeepa', '2006-08-14', 'male', 'Madhuraawala M.V', 'Kalutara', 'Horana', '741190850', '', '', '741190850', '198 Arambakanda road , walikatalla remuna , horana', 43, 'b5162cb9b689231de26240653767501c', '', '2021-12-19 14:28:56', '1', '', 0, 0, 0, ''),
(1572, 'GNI-29948', 'randitha1982@gmail.com', 'Welliwita Angoda Liyanage Rayani Shenara Welliwita', '2013-12-24', 'male', 'St. Joseph\'s Girls\' School - Nugegoda', 'Ampara', 'Pitakotte', '716114986', '', '', '716114986', '19/6, Janatha Mawatha, Mirihana, Pitakotte', 36, '2a68a28bf9455468e5960d4e4ff47bdb', '', '2021-12-17 03:24:36', '1', '', 0, 0, 0, ''),
(1573, 'GNI-75097', 'Udarifernando63@gmail.com', 'Nithini dahamya athukorala', '2012-03-14', 'female', 'Princsses of wales college ', 'Ampara', 'Moratuwa', '716733914', '', '', '716733914', 'No 10 4th lane lunwa moratuwa', 36, 'aea9b2fb22a97e4d8e08c9a9f94e2909', '', '2021-12-17 04:37:33', '1', '', 0, 0, 0, ''),
(1574, 'GNI-68480', 'Anushkahettiarachchi473@gmail. Com', 'Teesha shenali kumarathunga', '2006-11-17', 'female', 'Lindsay kollupitiya ', 'Colombo', 'Piliyandaka', '771328357', '', '', '777455219', '37/3 wata mawatha, piliyandala ', 43, '677c4c449aa2cbf2bd3db73276fd4798', '', '2021-12-17 05:20:56', '1', '', 0, 0, 0, ''),
(1575, 'GNI-88959', '17724@olvc.edu.lk', 'Thuyiyahandi Ushani Shelanka Hemathilaka De Silva', '2008-03-26', 'female', 'Convernt Of Our Lady Of Victories', 'Kalutara', 'panadura', '777719154', '', '', '757372970', '44/3,suduwalla road,kaludawala,panadura.', 41, '25d55ad283aa400af464c76d713c07ad', '', '2021-12-17 05:42:37', '1', '', 0, 0, 0, ''),
(1576, 'GNI-10290', 'Dammikap853@gmail.com ', 'D.M.Gagani kihara', '2022-02-11', 'female', 'Am/Maha keppetipol primary school', 'Ampara', 'Mahaoya', '706013525', '', '', '703013525', 'M/9/B , Mahaoya', 35, 'a106f83a1022123a3a6bde9348b7a26b', '', '2022-01-31 15:15:41', '1', '', 0, 0, 0, '8141'),
(1577, 'GNI-09397', 'dammikawg45@gmail.com', 'Sachintha Sadaruwan ', '2011-08-01', 'male', 'Am/Maha keppetipola secondary school', 'Ampara', 'Mahaoya', '706013525', '', '', '769293525', 'M/9/B,Mahaoya', 38, 'eb7b4947ec503d2b902b363d9905af31', '', '2021-12-17 08:49:42', '1', '', 0, 0, 0, ''),
(1578, 'GNI-71858', 'Sathmitharuminiliyanaarachchi@gmail.com ', 'Sathmi Tharumini Liyanaarachchi ', '2008-01-02', 'female', 'St.Josheph\'s Balika Maha Vidyala ', 'Kegalle', 'Kegalle ', '711048821', '', '', '711048821', 'F,95/2, Amarasekara pedesa, Ranwala, Kegalle ', 42, '4111de627a8db22e79b97acfc355e868', '', '2021-12-17 10:07:31', '1', '', 0, 0, 0, ''),
(1579, 'GNI-94948', 'chamilaroshani44@gmail.com', 'Vinuli Rohansa Jayakodi', '2009-01-13', 'female', 'Samudradevi Balika Vidyalaya Nugegoda', 'Colombo', 'Nugegoda', '714025027', '', '', '714025027', '24/7 Narahenpita road, Nawala', 41, 'a703660b524495e82431a00e20db7944', '', '2021-12-17 12:52:56', '1', '', 0, 0, 0, ''),
(1580, 'GNI-45559', 'Manorisandamali78@gmail .com', 'S.D.senitha hemal ', '2006-08-21', 'male', 'Unique international school ', 'Kandy', 'Nawalapitiye ', '776046625', '', '', '776046625', 'Pahala rambukpitiye nawalapitiye ', 43, '42429a4ab36df4ad424f15849eb4544f', '', '2021-12-17 13:23:39', '1', '', 0, 0, 0, ''),
(1581, 'GNI-97022', 'Prabashiayodya1@gmail.com', 'W.M Prabhashi Ayodya', '2008-05-14', 'female', 'kotabowa road, 1st mile post, Medagama, Bibila', 'Monaragala', 'Medagama', '714211844', '', '', '714211844', ' kotabowa road, 1st mile post, Medagama, Bibila', 41, '23374bf7c4e7639da897a2e227307a51', '', '2022-01-09 14:06:29', '1', '', 0, 0, 0, '1518'),
(1582, 'GNI-86130', 'Prabashiayodya1@gmail.com', 'W.M Dinithi Nawodya', '2010-09-08', 'female', 'Mo/ Medagama Natinol school', 'Monaragala', 'Medagama', '702743372', '', '', '702743372', 'kotabowa road, 1st mile post, Medagama, Bibila', 39, '5cbd9d366901157cfa302905a3b8b7e6', '164104839820211122_070219.jpg', '2022-01-01 14:46:39', '1', '', 0, 0, 0, '5325'),
(1587, 'GNI-58898', 'nelum.nadeeka78@gmail.com', 'Nethuki Minthuli Athapaththu ', '2009-10-05', 'female', 'Samudradevi balika vidyalaya', 'Colombo', 'Hanwella', '773826777', '', '', '772016711', '376/24,victoria park,artigala,hanwella ', 40, '5950970c2ef81a448fa6ea0f144f4dd9', '1639974189image_search_1634913919372.jpg', '2022-01-25 05:06:03', '1', '', 0, 0, 0, ''),
(1583, 'GNI-09256', 'asankayellow@gmail.com', 's.s.a.v.ragamalithi samarsingha', '2010-03-03', 'female', 'kegalu balika vidyalaya', 'Kegalle', 'mawanella', '711815843', '', '', '711815843', 'c/20,2,pallemakadawara,higula', 38, 'd95673f05c369d5aec22c3d357b7cc63', '', '2021-12-17 18:10:35', '1', '', 0, 0, 0, ''),
(1584, 'GNI-04249', 'sarasikeshala@gmal.com', 'B.D.Sarasee Keshala Jayalath', '2010-03-29', 'female', 'R/President\'s Collage Embilipitiya', 'Monaragala', 'Embilipitiya', '770290888', '', '', '767588078', 'No ,8/1Nawodagama Sewanagala', 39, 'c4afa6fbcaeb3bdf16dadd6d89cccf0f', '', '2021-12-31 14:28:43', '1', '', 0, 0, 0, ''),
(1585, 'GNI-58894', 'dahamkeshara307@.com', 'J.M.Thisarani dehemi vihara jayarathna', '2009-01-11', 'male', 'à¶¶à¶´/à·„à·/à¶¸à·„à·’à¶±à·Šà¶¯ à¶»à·à¶¢à¶´à¶šà·Šà¶šà·Šà·‚ à·€à·’à¶¯à·Šâ€à¶ºà·à¶½à¶º.', 'Kegalle', 'dehiovita', '947697022', '', '', '947697022', '4 th mile,deloluva,dehiovita', 40, 'c8ff20a58b5eb2cbd43cd7bb90eea727', '', '2021-12-18 01:29:20', '1', '', 0, 0, 0, ''),
(1586, 'GNI-11105', 'dahamkeshara301@.com', 'J.M.Thisarani Dehemi Vihara', '2009-01-11', 'male', 'à¶¶à¶´/à·„à·/ à¶¸à·„à·’à¶±à·Šà¶¯ à¶»à·à¶¢à¶´à¶šà·Šà·‚ à·€à·’à¶¯à·Šâ€à¶ºà·à¶½à¶º', 'Ampara', 'dehiovita', '947697022', '', '', '769702298', '4 th mile,deloluva,dehiovita', 40, '6b365f21504844dc47612fee45129e2a', '', '2021-12-18 01:36:46', '1', '', 0, 0, 0, ''),
(1588, 'GNI-49993', 'matishakavinda@gmail.com', 'Kasthuri arachchilage matheesha kavinda ', '2008-03-09', 'male', 'St. John\'s college nugegoda ', 'Ampara', 'Nugegoda ', '112769063', '', '', '766214233', '37/ wakanda road , jumbugalmulla mawatha, nugegoda ', 40, '2ff5bdef31670f10a2e8bd394255a647', '', '2021-12-18 04:34:13', '1', '', 0, 0, 0, '8443'),
(1589, 'GNI-21089', 'samankumararmas@gmail.com', 'Rathnayaka Mudiyanselage Manuka Losara Raathnayaka ', '2010-10-05', 'male', 'Bandaranayaka College - Gampaha', 'Gampaha', 'Ragama', '714446654', '', '', '714446654', '215/A Walpola,Ragama ', 39, '8b001e865ec86b45d7de5d4862f424b9', '', '2021-12-18 05:00:38', '1', '', 0, 0, 0, ''),
(1590, 'GNI-40807', 'vsasanki@gmail.com ', 'Venuri Sasanki Kavimini ', '2006-03-07', 'female', 'Lindsay Girls school ', 'Colombo', 'Colombo ', '702799688', '', '', '773799688', '1/11, Nanayakara Road, Obeysekara pura, Rajagiriya ', 43, '84c397c9b0401965cc0b02698bc13ea7', '1640272843Screenshot_20211223-204800_Gallery.jpg', '2021-12-23 15:20:43', '1', '', 0, 0, 0, ''),
(1591, 'GNI-65899', 'pahasaranivishaka@gmail.com', 'Vishaka Pahasarani.', '2008-06-12', 'female', 'Vidya Vardana Maha Vidyalaya', 'Colombo', 'Kaduvela', '776022880', '', '', '779082588', '1065/7A,Amaragoda road,Pothuarawa,Malabe.', 41, '19e61b0548d1dbf6c5f08a18c6e288f6', '', '2022-01-09 13:27:30', '1', '', 0, 0, 0, '1569'),
(1592, 'GNI-69605', 'anomageethika6@gmail.com', 'Pansiluni Vihara Sooriarachchi', '2009-10-12', 'female', 'Am/D.S Senanayaka National School', 'Ampara', 'Ampara', '701908893', '', '', '701908893', '2/B 64 Namalthalawa, Ampara', 40, 'ef2863cc0d6f0f39f8fdbc9f9a1d1308', '', '2021-12-18 08:11:16', '1', '', 0, 0, 0, ''),
(1593, 'GNI-02258', '0778880054', 'Kumara Kg', '2021-12-13', 'male', 'Kumara Kg', 'Galle', 'ALPITIYA', '778880054', '', '', '778880054', 'ATAKOHTA', 39, '8c17d4b56315935e92a2c302145e95ad', '', '2021-12-18 09:28:39', '1', '', 0, 0, 0, ''),
(1594, 'GNI-22018', 'hansasangeeth8@gmail.com', 'Hansa Sangeeth', '2005-08-01', 'male', 'Asian grammar school', 'Colombo', 'Angoda', '768957919', '', '', '716568709', '122 sadham mawatha, walpola, angoda', 44, '2348400ffb67e77601f87fee905f8766', '', '2021-12-18 08:46:20', '1', '', 0, 0, 0, ''),
(1595, 'GNI-40626', 'Priyanthasenanayaka76@gmail.com', 'Sanuthmi Senanayaka', '2008-02-23', 'female', 'Rangiri Dambulla Central Collage', 'Matale', 'Dambulla', '777547879', '', '', '777547879', 'No 320/25,Kurunegala Road,Dambulla', 41, '5254cab0ebb563c6ee490e6e99f78c0d', '', '2021-12-18 12:13:41', '1', '', 0, 0, 0, ''),
(1596, 'GNI-04717', 'sesenul2007lethnura@gmail.com', 'Senul lethnura', '2021-12-12', 'male', 'AllsAINTS\' college', 'Galle', 'Galle', '769879007', '', '', '769879007', '348c anhandiya rathgama ', 41, '7b5fbfd28f26c023b4d22fc9d88513f5', '', '2021-12-18 12:15:47', '1', '', 0, 0, 0, ''),
(1598, 'GNI-49088', 'ruwandi.lakshika2005@gmail .com', 'H.N. Ruwandi Lakshika ', '2005-08-08', 'female', 'Mahamaya Balika Vidyalaya Nugegoda ', 'Colombo', 'Nugegoda ', '783599172', '', '', '760362865', 'No. 61/ 1 lane ,Rubbarwatta road ,Gangodawila, Nugegoda .', 44, 'df66e7a58ea4addb8bc2d9ab08fbe9cb', '1640278173WhatsApp_Image_2021-12-22_at_07.53.52.jpeg', '2021-12-23 16:49:33', '1', '', 0, 0, 0, ''),
(1599, 'GNI-10495', 'senarathnedilini0@gmail.com', 'Himansa samudra ', '2009-02-07', 'male', 'Kottawa dharmapala ', 'Colombo', 'Kahathduwa', '774278762', '', '', '774278762', '461/B/386/D/kahathduwa,city Of Life', 40, '237c926fe2e8325497865632aa33cd66', '', '2021-12-19 06:59:25', '1', '', 0, 0, 0, '');
INSERT INTO `lmsregister` (`reid`, `stnumber`, `email`, `fullname`, `dob`, `gender`, `school`, `district`, `town`, `pcontactnumber`, `pemail`, `pname`, `contactnumber`, `address`, `level`, `password`, `image`, `add_date`, `status`, `ip_address`, `relogin`, `reloging_ip`, `payment`, `verifycode`) VALUES
(1602, 'GNI-57566', 'sathushhasthika15@gmail.com', 'Sathush Bandaranayake', '2005-06-09', 'male', 'Kingswood College', 'Kandy', 'Kandy ', '765734522', '', '', '765734522', 'No.430/12A, Mount pleasant Gardens , Heerassagsagala , Kandy .', 44, 'fcd9d8ea4f655653f1fe9e40c8a9f1df', '1640183521922442223688249374jjjjjjjjjjjjjjj.jpg', '2021-12-22 14:32:01', '1', '', 0, 0, 0, ''),
(1603, 'GNI-69080', 'ravindusamodjayasekara@gmail.com ', 'Hetti Arachchige Don Ravindu Samoth Jayasekara ', '2021-10-22', 'male', 'St.jhone college ', 'Ampara', 'Kalubowilla ', '759962874', '', '', '777452250', '10/B Ruban Pirise Road Kalubowilla Dehiwala ', 42, '25d55ad283aa400af464c76d713c07ad', '', '2021-12-20 05:16:03', '1', '', 0, 0, 0, ''),
(1604, 'GNI-13187', 'dkarunadasa76@gmail.com', 'test', '1980-02-23', 'male', 'test', 'Ampara', 'test', '788508850', '', '', '788508850', 'test', 40, '18713bfc2baffb7ddb9b1abc34c949ca', '', '2021-12-20 08:18:28', '1', '', 0, 0, 0, ''),
(1610, 'GNI-19434', 'Dissanayakeharshani77@gmail.com ', 'Sadew hiruditha dissanayaka ', '2010-10-17', 'male', 'Kandy MODLE SCHOOL ', 'Ampara', 'Madewala ', '779270231', '', '', '779270231', '161/D,godapolawaththa,meadawala,h.p', 39, '2bad6bc83b96284414cde5cca8f1fa98', '', '2021-12-21 12:31:33', '1', '', 0, 0, 0, '3945'),
(1606, 'GNI-15498', 'rebekashenali106@gmail.com', 'Rebeka shenali', '2010-06-15', 'female', 'Rajapaksha vidayalaya kiribathgoda', 'Gampaha', 'Kiribathgoda', '775105706', '', '', '774044409', 'Hunupitiya wattala', 39, '117fc9fa3261a6646b99ec7ecdde99c6', '', '2021-12-20 14:26:55', '1', '', 0, 0, 0, ''),
(1612, 'GNI-58433', 'ayesha1030.jaya@gmail.com', 'Hiruka Damjith Ranasinghe', '2008-04-21', 'male', 'Lyceum international  school ', 'Ratnapura', 'Ratnapura', '706777343', '', '', '706777343', 'No.50, sripada mawatha, Ratnapura', 42, 'eef40bb7419beeb48e96dd3244ea3920', '', '2021-12-22 06:03:40', '1', '', 0, 0, 0, ''),
(1613, 'GNI-39473', 'gayani791030@gmail.com', 'Sesmitha Dhanushka Premathilka ', '2008-05-01', 'male', 'Lyceum International School Rathnapura', 'Ampara', 'Rathnapura ', '719973569', '', '', '719973569', 'Malangama Hidellana Rathnapura ', 42, '3cbf7051683a9f0748ebe68b864edb73', '', '2021-12-22 06:05:59', '1', '', 0, 0, 0, ''),
(1614, 'GNI-85548', 'Gayathrimadushani @ gmail. Com', 'Dadallage  githmi Sachindra ', '2009-06-14', 'female', 'ST Mariyas Convent', 'Matara', 'Akurassa', '740259820', '', '', '740259820', 'Ihalawaththa  manik goda   maliduwa akuressa', 40, '25d55ad283aa400af464c76d713c07ad', '', '2021-12-22 08:40:26', '1', '', 0, 0, 0, ''),
(1615, 'GNI-95942', 'jayashantha@live.com', 'Vathmi vethara ', '2009-07-11', 'female', 'Ghanodaya maha vidyalaya ', 'Kalutara', 'Kalutara ', '718465665', '', '', '718465665', 'Sri jaya galle rode,waskaduwa ', 40, '25d55ad283aa400af464c76d713c07ad', '', '2021-12-22 12:55:35', '1', '', 0, 0, 0, ''),
(1616, 'GNI-78860', 'N.k.cassim1938@gmail.com', 'M.rasheed najeeb cassim', '2005-11-07', 'male', 'Lumbini college ', 'Colombo', 'Wellawatta ', '777977197', '', '', '767502141', '55/A Hampdon lane wellawatta ', 44, 'd85cfb73fa068661b6f9ce4aacbb97f0', '', '2021-12-30 02:34:11', '1', '', 0, 0, 0, ''),
(1620, 'GNI-96125', '0776284660', 'T.AKAVEESHA NIMSARA', '2005-06-21', 'male', 'LUMBINI COLLEGE', 'Colombo', 'DEHIWALA', '776284660', '', '', '776284660', '94/A ANAGARIKA DARMAPALA MAWATHA', 44, '25d55ad283aa400af464c76d713c07ad', '1641572121WhatsApp_Image_2021-10-20_at_6.23.14_AM_(1).jpeg', '2022-01-07 16:15:21', '1', '', 0, 0, 0, ''),
(1621, 'GNI-73145', 'vidyaperera@hotmail.com', 'Rajeevani subramaniam', '2009-09-20', 'female', 'Mahamaya Balika Vidyalaya Gangodavila,Nugegoda', 'Colombo', 'Boralesgamuwa', '761927040', '', '', '777684809', '43/1, G. H. Perera Mawatha, Boralesgamuwa', 40, 'b06372bce3108bff542688fc442bcf5c', '', '2021-12-26 04:01:43', '1', '', 0, 0, 0, ''),
(1618, 'GNI-67016', 'dharmapalag3@gmail.com', 'Kulani Senulya ', '2009-11-07', 'female', 'Mount Calvary High School Galle', 'Galle', 'Galle', '777474189', '', '', '777474189', 'Thisaragiri gonapinuwala ', 40, 'ab472276a6ef8160a83dd74a0771e8df', '', '2021-12-23 09:51:29', '1', '', 0, 0, 0, '2702'),
(1619, 'GNI-47221', 'danithusujayana7@', 'Danithu Sujayana HEWALOKUGE', '2008-08-17', 'male', 'Mahamathya Vidyalaya', 'Colombo', 'Meegoda', '761875045', '', '', '761875045', '144/6 dampe Meegoda', 41, 'd366fd95cdbf546280b81ec64ade75ae', '', '2021-12-24 13:07:24', '1', '', 0, 0, 0, ''),
(1622, 'GNI-32707', 'navodyakalhara82@gmail.com', 'Navodya Kalhara', '2005-03-16', 'male', 'Gamini M.V', 'Ampara', 'Ampara', '718138200', '', '', '703203959', 'C 568  E 1/4 Ampara', 44, '8992c56b84a5cb8ad7a60a7d96b83776', '', '2021-12-26 07:18:47', '1', '', 0, 0, 0, ''),
(1623, 'GNI-07362', 'dissanayakeshiromi3@gmail.com', 'dahami dissanayake', '2005-10-28', 'female', 'gothami balika vidyalaya', 'Colombo', 'nugegoda', '766918576', '', '', '766918576', 'No.75/12 Wanatha road, Gangodawila, Nugegoda', 44, '8d9907e87f05a760e069e1dfec0c22ee', '', '2021-12-26 08:52:56', '1', '', 0, 0, 0, ''),
(1624, 'GNI-94962', 'lgrandiduchethina@gmail.com', 'L.G Chethina Randidu', '2008-09-18', 'male', 'Ananda college', 'Colombo', 'Nugegodha', '767988090', '', '', '767988090', '423/17,A Sarana mavatha, Udhamulla, Nugegodha', 40, '808ef61a0ba2a9866203cbde022fa49a', '', '2021-12-26 16:24:19', '1', '', 0, 0, 0, ''),
(1625, 'GNI-95321', 'heratheranda@gmail.com', 'Omandie Rohansa Herath ', '2008-09-30', 'female', 'ST.Joseph college Colombo 10 Negambo Branch ', 'Gampaha', 'Divulapitiya ', '773433887', '', '', '719191922', '271 /A/1/Wewagedara, divulapitiya', 41, 'b98aaa00ced1ac0bde89a5f7b303b4c8', '', '2021-12-27 09:44:16', '1', '', 0, 0, 0, ''),
(1626, 'GNI-95207', 'pminiruwan@gmail.com', 'WM pasindu miniruwan wijakoon', '2010-08-21', 'male', 'Nu/Gamini school.', 'Ampara', 'Nuwara eliya', '710136393', '', '', '710136393', 'no9 jayatilaka mawata nuwara eliya', 39, '2f529ef222952625cfcdec9d38fe625d', '', '2021-12-27 10:50:29', '1', '', 0, 0, 0, ''),
(1627, 'GNI-88360', 'pererawasanthi83@gmail.com', 'W. M. M. SASATHMI CHAYANA BETHANI PERERA ', '2010-08-05', 'female', 'Holy Cross College, Gampaha ', 'Gampaha', 'Kadawatha ', '777206051', '', '', '777206051', '320/F WEBODA SOUTH, WEBODA ', 39, 'bfb94dacaf7c6e8fb371fae8b8ab8eba', '1642780461SASA.jpeg', '2022-01-21 15:54:21', '1', '', 0, 0, 0, ''),
(1628, 'GNI-95063', 'panditharatned@gmail.com', 'Thiseni Dahamya Panditharatne', '2011-04-07', 'female', 'I Gate college ', 'Colombo', 'Pannipitiya', '768501369', '', '', '768501369', '140/8,  1st cross lane,Nugemulla Watta,', 39, '01971a855ad3bed58cdc319129873444', '', '2021-12-29 05:43:30', '1', '', 0, 0, 0, ''),
(1629, 'GNI-95037', 'thusharisilva744@gmail.com', 'Santhana Dewage Ashin lomika silva ', '2009-12-09', 'male', 'Thurstan college', 'Kalutara', 'Waskaduwa ', '789322333', '', '', '789322333', '557/ kyda waskaduwa ,waskaduwa ', 40, '3a3abc09c8f0079b2f3613582b060de0', '1640761246DFaxIZKWAAIv-ns.jpg', '2022-01-14 02:05:37', '1', '', 0, 0, 0, ''),
(1630, 'GNI-98578', 'sdevinda79@gmail.com', 'A.M.Hiruni Sanjana Sathsarani Aththanayaka', '2008-11-10', 'female', 'Sir John Kothalawala college', 'Kurunegala', 'Melsiripura', '715369114', '', '', '712877647', 'Liyanagama,polpithigama', 41, 'fc7c4042549f492dd270f9058d90291a', '', '2021-12-29 14:50:28', '1', '', 0, 0, 0, ''),
(1632, 'GNI-34566', 'himeshih2014@gmail.com', 'Senaya piyumdi senavirathna', '2008-07-01', 'female', 'Anula vidyalaya', 'Colombo', 'Nugegoda', '754448224', '', '', '754448224', 'No.75 Jambugasmulla mawatha,Nugegoda', 41, 'ab181e5b742f9681eadaa754b47ff7e1', '', '2022-01-15 04:12:20', '1', '', 0, 0, 0, ''),
(1633, 'GNI-14069', 'ranasingheminrada@gmail.com', 'Minrada Ranasinghe', '2009-04-06', 'female', 'Viharamahadevi Balika Vidyalaya', 'Gampaha', 'Kiribathgoda', '773351270', '', '', '775181376', '281/5 Rukmal Place, Thambiligasmulla Road, Kiribathgoda', 40, '56be158e4e38c64bcfeec466ddcd3800', '', '2021-12-30 12:51:01', '1', '', 0, 0, 0, ''),
(1634, 'GNI-20983', 'lalanisajeewa@gmail.com', 'W. A. Dulani Sanulya ', '2008-08-20', 'male', 'Ananda college ', 'Ampara', 'Horana ', '753772623', '', '', '779510188', '171/ Bodiya Road kumbukawaththa', 41, '017a0cd78ddfba01e3064fa6c8d0ec60', '', '2022-01-27 12:55:21', '1', '', 0, 0, 0, ''),
(1635, 'GNI-87892', 'dishanmandis2@gmail.com', 'Sandesh Mendis', '2010-04-01', 'male', 'Science College Mt Lavinia', 'Ampara', 'Moratuwa', '716202999', '', '', '769777210', 'No 4 Ramya Place Sri Rahula Mw Katubedda', 39, '3c1b0c8049f19abfbd8ebe1f20473f14', '', '2021-12-30 16:55:02', '1', '', 0, 0, 0, ''),
(1636, 'GNI-58807', 'slakmali382@gmail.com', 'M.T.NADUN KAWISHKA NETHSARA', '2009-11-17', 'male', 'Republican lnternationl school ', 'Nuwara-Eliya', 'Nuwara eliya ', '710668125', '', '', '710668125', 'IRRIGATION CIRCUIT BUNGALOW, KANDE ELA, MIPILIMAANA, NUWARA ELIYA. ', 40, '7f7402432d966e9eab61430dbda59632', '', '2021-12-31 03:41:22', '1', '', 0, 0, 0, ''),
(1637, 'GNI-39771', 'eshanperera930@gmail.com', 'Y.A.Eshan Yasith Mindula Perera', '2007-02-12', 'male', 'S.T.Jhon\'s College', 'Colombo', 'Nuggegoda', '712903754', '', '', '761626798', 'No23,D.M.Colambage Mawatha,Nawala Road, Nuggegoda.', 42, '922d9af06b84dbae2b96e64f58a87eec', '', '2021-12-31 04:51:00', '1', '', 0, 0, 0, ''),
(1638, 'GNI-32024', 'thilina2018m@gmail.com', 'thilina mohotti', '2010-10-05', 'male', 'G/ saralankara m.v', 'Ampara', 'baddegama', '778309001', '', '', '777390250', 'kongahagoga,gonapinuwala', 39, 'a2c0aefabaf41c7e16c44efa4e727b27', '', '2021-12-31 07:12:12', '1', '', 0, 0, 0, ''),
(1640, 'GNI-19613', 'nethmisanjana2023@gmail.com', 'Subaweerage Nethmi Sanjana Dias', '2007-07-05', 'female', 'Clifton Girls School ', 'Colombo', 'Rajagiriya ', '770639549', '', '', '771081924', '46,Kurudhuwaththa Rd,Nawala Rd,Rajagiriya.', 42, '7642b3410817b4056e74e8b40ce44a4e', '', '2021-12-31 10:05:48', '1', '', 0, 0, 0, ''),
(1639, 'GNI-13348', 'beverlydekker348@Gmail.com ', 'Nethuki nathasha ', '2010-03-03', 'female', 'All saints college ', 'Colombo', 'Battaramulla ', '774169306', '', '', '779180837', 'Pelawatta,battaramulla ', 39, '25d55ad283aa400af464c76d713c07ad', '', '2021-12-31 08:39:44', '1', '', 0, 0, 0, ''),
(1641, 'GNI-70900', 'danasirisubasingha345@gmail.com', 'Praharsha Tashini Subasingha', '2006-12-13', 'female', 'H/Tzuchi National School', 'Hambantota', 'Hambantota', '778571260', '', '', '778571260', 'No 17/1, Maithreegama, Keliyapura, Hambantota', 43, '688f3776d57ba9f5f7cf910f26102fca', '1641017868WhatsApp_Image_2022-01-01_at_11.42.12.jpeg', '2022-01-01 06:17:48', '1', '', 0, 0, 0, ''),
(1642, 'GNI-09757', 'immeshalakmali@gmail.com', 'Raneli Tenasha ', '2007-07-19', 'female', 'Holy Family Convent Bambalapitiya ', 'Colombo', 'Dehiwala ', '778333291', '', '', '778333291', '18/11,Hill street,union place,Dehiwala', 42, '0e7517141fb53f21ee439b355b5a1d0a', '', '2022-01-20 07:48:32', '1', '', 0, 0, 0, ''),
(1643, 'GNI-30440', 'nitishsansithu2011@gmail.com', 'Nitish Rodrigo ', '2011-08-06', 'male', 'Highland college ', 'Ampara', 'Maharagama ', '770420743', '', '', '770420743', 'Sirimal waththa  kottawa ', 38, 'dd1ee4acf30afaf318f4a6bc31db80ac', '', '2022-01-01 10:13:22', '1', '', 0, 0, 0, ''),
(1644, 'GNI-27063', 'thuheershamal@gmail.com', 'A.L.Shamal Thuheer', '2007-06-15', 'male', 'Wp/Gm Galhitiyawa central college', 'Gampaha', 'Kadawatha', '719068244', '', '', '719068244', '279/2/1 Pahalakaragahamuna Kadawatha', 42, 'fea3cb1ba8430a1e867874000444b280', '', '2022-01-01 12:06:03', '1', '', 0, 0, 0, '9541'),
(1651, 'GNI-91417', 'gdulkith@gmail.com', 'Dulkith Gajasinghe', '2010-06-01', 'male', 'Sri Chandananda Buddhist Collage, Kandy', 'Kandy', 'Kandy', '774170706', '', '', '774170706', 'No.247/2, Heerassagala, Kandy', 39, 'd98319fe46cbd4fceb1c01cc3ad7d535', '', '2022-01-04 08:06:36', '1', '', 0, 0, 0, ''),
(1645, 'GNI-16719', 'tinaratarini189@gmail.com ', 'M.V Tarini Tinara', '2005-04-20', 'female', 'Anula vidyalaya ', 'Colombo', 'Kohuwala nugegoda ', '765669217', '', '', '765669217', '37 sunethradevi road Kohuwala ', 44, '3422bd990b0dc2cb4ab5d04b6c3e0a6e', '', '2022-01-02 09:08:37', '1', '', 0, 0, 0, ''),
(1646, 'GNI-89678', 'marishaelisa@gmail.com', 'Siminorisge Rivini  Marisha ', '2007-11-26', 'female', 'Good Shepherd Convent ', 'Gampaha', 'Wattala ', '718264273', '', '', '753805905', '26,Edward  Lane ,Averiwatte Rd,Wattala', 42, '5913b095eae4817cb227ef4bb1841823', '', '2022-01-02 10:09:17', '1', '', 0, 0, 0, ''),
(1647, 'GNI-03264', 'Upekakasuni@gmail.com', 'wejesuriya arachchige Keshiya sharanya perera', '2012-06-26', 'female', 'Ave maria convent-negambo', 'Gampaha', 'Ja-ela', '773919614', '', '', '773919614', 'No.4/23kalaeliya,ja-ela', 37, 'aacfea1221a731cec7710f3dce93031b', '', '2022-01-03 03:06:51', '1', '', 0, 0, 0, ''),
(1648, 'GNI-75585', 'www.bhagyaharshani840@gmail.com', 'Hetti Arachchige Yurini Yahansa ', '2015-08-24', 'female', 'JMC College Gampaha ', 'Gampaha', 'Gampaha ', '715703375', '', '', '715703375', 'No.42/2,Rathupaswala,Nadungamuwa.', 34, 'cf1dcde624983b92e5efe610560812d8', '1641300130e9fb1ea76fa125739155048c1c4014c8.jpg', '2022-01-04 12:42:10', '1', '', 0, 0, 0, ''),
(1649, 'GNI-70557', 'manjulagodagandeniya.1982 @ gmail.com', 'sonadi. pahanmini godagandeniya', '2014-02-27', 'female', 'sri darmaloka college', 'Gampaha', 'kelaniya', '716686026', '', '', '716686026', '471/2. rukmal place  polhena  kelaniya ', 35, 'd590d6f36f5d18d9593c8721abb47c90', '', '2022-01-04 05:06:40', '1', '', 0, 0, 0, ''),
(1650, 'GNI-98965', 'Www.thushari sarathchendra gamil. Com ', 'N.M.R HIMANDI INUKI ADITHYA MAHAGAMA ', '2010-07-12', 'female', 'BODIRAGA COLLEGE ', 'Colombo', 'Kosgama/hanwalle ', '714344129', '', '', '764208728', '356/10dola ihala,ihala kosgama,kosgama ', 39, 'd41d8cd98f00b204e9800998ecf8427e', '', '2022-01-04 05:55:29', '1', '', 0, 0, 0, '6997'),
(1652, 'GNI-98625', 'Deepanilankapurage@gmail.com', 'G. A. Kulini Sehasni', '2014-05-31', 'female', 'G/Anuladewi balika vidyalaya', 'Galle', 'Galle ', '775266760', '', '', '775266760', 'No, 15,magalle lane,  magalle, galle. ', 35, '25f9e794323b453885f5181f1b624d0b', '', '2022-01-04 09:11:25', '1', '', 0, 0, 0, ''),
(1653, 'GNI-80854', 'sandalisaranya945@gmail.com', 'Sandali Saranya Wickramasinghe ', '2007-08-19', 'female', 'Hemamali Girls\' College Kandy', 'Kandy', 'Katugasthota', '719232915', '', '', '741132118', '129/2,Derana,Polgollawatta,Polgolla, Kandy ', 42, '04a054fd28c368f84f5dd5d799217ccb', '', '2022-01-04 09:55:51', '1', '', 0, 0, 0, ''),
(1654, 'GNI-75079', 'Kithumi.s.salgadu7b@gmail.com', 'Kithumi Senethya Salgadu ', '2008-05-31', 'female', 'Louvre International School ', 'Colombo', 'Pannipitiyata ', '774301088', '', '', '740584854', '189, old road , Navinna , Maharagama ', 41, 'fec1ed90632425f2e60a77dfed6e5ee9', '', '2022-01-04 10:48:44', '1', '', 0, 0, 0, ''),
(1655, 'GNI-32620', 'chanulyehesara555@gmail.com', 'Chanul Yehesara ', '2010-11-08', 'male', 'B/welimada vijaya vidyalaya ', 'Badulla', 'Welimada ', '714420075', '', '', '714886905', '\"chanul\"dammikawaththa nugathalawa ', 39, 'fd25b8b75aba6453e7eaf30104dd1e60', '', '2022-01-04 13:30:33', '1', '', 0, 0, 0, ''),
(1656, 'GNI-74900', 'chenuliwewalwala@gmail.com', 'W.H Dulansa chenuli wewelwala', '2011-12-05', 'female', 'Ga/ Anuladevi girls college ', 'Galle', 'Galle ', '774744521', '', '', '774744521', 'Ihalawaththa ,heenatigala ,thalpe ,galle .', 38, 'c585847bd3a96a99434d63dbb94978ed', '1641312134IMG-20211012-WA0001.jpg', '2022-01-04 16:02:14', '1', '', 0, 0, 0, ''),
(1657, 'GNI-17492', 'sathmim18@gmail.com', 'Mathangadeerage Sathmi Sahansa', '2005-12-08', 'female', 'Musaeus College', 'Colombo', 'Piliyandala', '777313821', '', '', '777313821', '95-C, Pokuna Road, Weera Uditha Mawatha, Hedigama, Piliyandala', 44, 'c989352b92e3c0ece691d473550106ca', '', '2022-01-04 15:57:21', '1', '', 0, 0, 0, ''),
(1658, 'GNI-41194', 'dmadusha497@gmail.com', 'wikrama pedige ashwini akarshana wimalasena ', '2014-06-22', 'female', 'Kings international ', 'Kandy', 'Hasalaka ', '786148826', '', '', '786148826', 'No 83,front of police station,hasalaka ', 35, 'cdd02c5a854e1513a82bb0846e60bb8d', '164195607020220111_144908.jpg', '2022-01-12 02:54:30', '1', '', 0, 0, 0, '5269'),
(1659, 'GNI-86835', 'danu.marapana@yahoo.com', 'Dhanuka Wanniarachchi', '2015-02-19', 'male', 'Isipathana College ', 'Colombo', 'Colombo', '778139052', '', '', '778139052', 'No 45/19 Rajamaha vihara Road nawinna', 34, '98d517895d402a230c41b9ee87bbfcc5', '', '2022-01-05 02:05:03', '1', '', 0, 0, 0, ''),
(1660, 'GNI-47767', 'namal777104@gmail.com', 'Dahamdi Nesakya', '2007-07-07', 'female', 'Gothami Balika Vidyalaya', 'Colombo', 'Rajagiriya', '752129504', '', '', '752129504', 'No.125,Daniel place,Maddinagoda,Rajagiriya', 42, '4c79448ebf0db26d17469e74c4875490', '', '2022-01-05 05:13:11', '1', '', 0, 0, 0, ''),
(1661, 'GNI-16048', 'lakmini.rasi@gmail.com', 'Ranuthi Ranara Lokuhettiarachchi ', '2012-08-21', 'female', 'Buddhist laddies college ', 'Gampaha', 'Wattala ', '778945475', '', '', '778945475', 'No:37,Shanthi road,hendala, wattala.', 37, 'a44e43edf6b22d18a15bb100f366a58f', '', '2022-01-05 06:28:40', '1', '', 0, 0, 0, ''),
(1662, 'GNI-39789', 'mcp.hash@gmail.com', 'Chamara', '2000-01-13', 'male', 'Jjzkkkzx', 'Ampara', 'Ampara', '778804971', '', '', '718937175', '124hhhjehf', 33, '25d55ad283aa400af464c76d713c07ad', '', '2022-01-05 07:52:28', '1', '', 0, 0, 0, ''),
(1663, 'GNI-69305', 'jeganchamara09 @gamil .com', 'Jegan Thilakshani ', '2003-11-12', 'female', 'Nauththuduwa', 'Kalutara', 'Mathugama ', '769756758', '', '', '769756758', 'Annasigala waththa,mathugama ', 44, '325a2cc052914ceeb8c19016c091d2ac', '', '2022-01-05 08:50:12', '1', '', 0, 0, 0, '4510'),
(1664, 'GNI-32469', 'nandimaherath@gmail.com ', 'G.H.A Sa dewika Manchana Nadith Hettiarachchi ', '2007-08-15', 'male', 'CP/HAVE Ambagamuwa Crental College ', 'Ampara', 'Nawalapitiya ', '712479890', '', '', '712479890', '176/2 Hainford B, Waligampola Nawalapitiya ', 42, 'fc58c007e81c0d92530d6b9f9f91eb4b', '', '2022-01-05 09:05:22', '1', '', 0, 0, 0, ''),
(1665, 'GNI-69591', 'sithumudara123@gmai.com', 'WP Diduni thisakya', '2015-09-26', 'female', 'M/R sarnapala kanitu viduhala', 'Matara', 'Mathara', '784381511', '', '', '784381511', 'malapalawaththa maliyadda dickwall', 34, '25d55ad283aa400af464c76d713c07ad', '', '2022-01-05 14:19:53', '1', '', 0, 0, 0, ''),
(1666, 'GNI-78211', 'Pahanyasachini@gmail.com', 'Sachini pahanya bandara', '2004-06-09', 'male', 'A/Swarnapali girls college ', 'Anuradhapura', 'Anuradhapura ', '719809971', '', '', '705504841', '601/72 P thammennakulamma anuradhapura ', 43, '6a7ffcec8e9d749d2be2b9878985084f', '', '2022-01-06 07:22:17', '1', '', 0, 0, 0, ''),
(1667, 'GNI-87128', 'dilkalani97@gmail.com', 'W.Lakshika Poorni Wijayarathna', '2007-09-29', 'female', 'Mo/Pelwatta Central Sport College ', 'Monaragala', 'Buttala', '716309878', '', '', '784937844', 'Pahalawela,Uva-Pelwatta,Buttala', 42, '25d55ad283aa400af464c76d713c07ad', '', '2022-01-06 08:51:26', '1', '', 0, 0, 0, ''),
(1668, 'GNI-92456', 'samudrak015@gmail.com', 'Matheesha Pavindu Abeysinghe', '2010-11-13', 'male', 'St\"Sylvester college', 'Kandy', 'Pilimathalawa', '771723021', '', '', '771723021', '15 Sadikka watte,Wattappola,Pilimathalaea,Kandy', 39, 'ab29f37534dfb241e46b8209b44a1a78', '', '2022-01-06 11:39:52', '1', '', 0, 0, 0, ''),
(1669, 'GNI-34748', 'weluka123@gmail.com', 'Thavish Devnula Ranaweera', '2022-10-20', 'male', 'Lexicon International School, Kandy', 'Kandy', 'Kandy', '714474528', '', '', '714474528', '131/3, Tittapajjala, Werellagama, Kandy', 33, '643ccfd43678e9a3b6f31a695dc20794', '1641545262IMG-20220107-WA0019.jpg', '2022-01-07 08:47:42', '1', '', 0, 0, 0, ''),
(1670, 'GNI-25542', 'lukshmie8836@gmail.com', 'Hadapangoda mudalige chamasha lakshika', '2008-07-24', 'female', 'Devi balika  vidyalaya', 'Gampaha', 'Dompe', '777883640', '', '', '775485361', '91A,Welgama, Thiththapaththar', 41, 'f21c8910e7701eee22eefbf42d903ee2', '1641572417IMG-20220107-WA0011.jpg', '2022-01-07 16:20:17', '1', '', 0, 0, 0, ''),
(1675, 'GNI-92839', 'Sanuthmirasanga123@gmail.com ', 'Sanuthmi Rasanga ', '2007-02-08', 'female', 'St John\'s Girls School Panadura ', 'Kalutara', 'Panadura', '773710577', '', '', '773710577', '\"Thusitha\"Sapthabodhi Mawatha Panadura ', 42, 'ccb7ab41fc3fc62d1f48febbf9749c27', '', '2022-01-18 17:11:42', '1', '', 0, 0, 0, ''),
(1671, 'GNI-00583', 'rkdias66@gmail.com', 'Oneth Dias', '2016-07-02', 'male', 'Vidura college', 'Galle', 'Galle', '711492216', '', '', '711492216', 'Unawatuna ,Galle.', 33, '74bd96fa50f1d4f922761f9f32124e4b', '', '2022-01-07 10:26:48', '1', '', 0, 0, 0, ''),
(1672, 'GNI-81732', ' samanthika.bandara1990@gmail.com', 'Nulan Nethsara', '2012-01-19', 'male', 'Springfield college kandy', 'Kandy', 'Peradeniya', '773826440', '', '', '773826440', 'No.104,1/B,Megoga kallugamuwa,peradeniya .', 38, 'c92e246080536b96e0f54e1a6d57e8f2', '', '2022-01-07 11:35:10', '1', '', 0, 0, 0, ''),
(1673, 'GNI-75933', 'nalinr10@gmail.com', 'Dasula Rathnayaka ', '2010-07-02', 'male', 'Vidyartha College,Kandy', 'Kandy', 'Gampola', '712852434', '', '', '712851434', 'No.168 Gampola Road, Ulapane.', 39, 'ee691f78c53026f505933300d634b3d2', '', '2022-01-07 12:43:58', '1', '', 0, 0, 0, ''),
(1674, 'GNI-37572', 'idusha29@gmail.com', 'idusha eshan odithya', '2009-06-07', 'male', 'Ku/Lakdasa De mel college', 'Kurunegala', 'kurunagala', '772647299', '', '', '761311695', 'ihalawela,ambakotte', 39, 'ffd0d9500c9660a8f951f0d7d810658c', '', '2022-01-07 12:52:08', '1', '', 0, 0, 0, ''),
(1676, 'GNI-63317', 'sanjaya.hettige@gmail.com', 'Sehanthi Disanga', '2009-05-02', 'female', 'St John\'s Girls School Panadura', 'Kalutara', 'Panadura', '773710577', '', '', '772538383', '\"Thusitha\"Sathbodhi Mawatha,Panadura', 40, 'ccb7ab41fc3fc62d1f48febbf9749c27', '', '2022-01-18 16:44:13', '1', '', 0, 0, 0, ''),
(1677, 'GNI-72793', 'glakruchira@gmail.com', 'Senalya Nurandee Dulansa Korala ', '2015-11-21', 'female', 'Harvard International school ', 'Matale', 'Rattota ', '779108599', '', '', '779108599', 'Nicholaoya SP, Rattota ', 34, '30d6e860ab0102aeec6041792f816d48', '', '2022-01-08 06:35:55', '1', '', 0, 0, 0, ''),
(1678, 'GNI-85716', 'u.g.kamal hemantha79@gmail.com', 'U.G.Kamal Hemantha', '1979-04-05', 'male', 'Mount Calvary High School.', 'Galle', 'Galle', '769355535', '', '', '775188189', 'No:18,Wadigoda ,Udalamathrha,Galle.', 34, '44b89c785a16ea8aa80975dcc728b5cd', '', '2022-01-08 08:28:35', '1', '', 0, 0, 0, ''),
(1679, 'GNI-14304', 'sanjayaperera1984at@gmail.com', 'Kithmini Senethma ', '2006-05-03', 'female', 'Samudradevi Balika Vidyalaya', 'Colombo', 'Nugegoda', '713437855', '', '', '713437855', '12/A, Vihara Mawatha, Papiliyana', 43, '334c39c475f5172b858c29c7447fa54d', '', '2022-01-08 17:13:06', '1', '', 0, 0, 0, ''),
(1681, 'GNI-73492', 'sathsaradissanayaka013@gmail.com', 'LUNUWATHTHE GEDARA DISSANAYAKA MUDIYANSELAGE KASANDUN KALPITHA KAUSHALYA DISSANAYAKA', '2007-10-24', 'male', 'St Anthonys collage kandy', 'Kandy', 'kandy', '717799824', '', '', '717799824', '58/9mapamadulla, kulugammana, katugasthota', 42, 'fe939e8064eac0e8c3a23f8df5172424', '1641778813Devil_Editing.jpg', '2022-01-10 01:40:13', '1', '', 0, 0, 0, ''),
(1682, 'GNI-16359', 'pradeepavg83@gmail.com', 'W.G.Thedini Tharumini', '2005-08-27', 'female', 'St.Mary\'s National College Hambantota', 'Hambantota', 'Hambantota', '786681877', '', '', '786681877', 'No 12, Indrasiri Road Hambantota', 43, 'c0001638fa667741f59a4a673dfaa852', '', '2022-01-09 15:07:24', '1', '', 0, 0, 0, ''),
(1691, 'GNI-93801', 'khirundi3824@gmail.com', 'PALLIYA GURUGE DEWMI NIRASHA', '2009-03-07', 'female', 'Mo/Mahanama National College', 'Monaragala', 'Monaragala', '767970365', '', '', '710482004', 'No.65,Hirundi, Magandanamulla rd, Monaragala', 40, 'b9709a7a238062b05af2964e5a158792', '', '2022-01-13 16:28:17', '1', '', 0, 0, 0, ''),
(1683, 'GNI-09968', 'raziya@gmail.com', 'Fathima Reema', '2010-05-14', 'female', 'Viharamadevi girls college ', 'Badulla', 'Passara ', '724733112', '', '', '771352827', '13A Panguwatta gama passara ', 39, '870fab18061a7a01c706044bc7104280', '1643718232310457276152201.jpg', '2022-02-01 12:23:53', '1', '', 0, 0, 0, ''),
(1684, 'GNI-40461', 'dwsiriwardane1212@gmail.com', 'Hesandu Vimath Wijesiriwardane ', '2010-02-26', 'male', 'Royal College ', 'Kalutara', 'Nagoda kalutara Sri Lanka', '715344064', '', '', '715344064', 'No 33 Guruviduhala Road Nagoda Kalutara ', 39, 'cc8b4dadf0aa23ef0ed64354af4c9a45', '', '2022-01-11 04:31:02', '1', '', 0, 0, 0, ''),
(1685, 'GNI-73766', 'sekarajaya31@gmail.com', 'yasitha sadaruwan', '2022-01-11', 'male', 'Udupila M.V.', 'Gampaha', 'Udupila', '773042124', '', '', '717237117', '203/9 Udupila ,Delgoda', 43, '25d55ad283aa400af464c76d713c07ad', '', '2022-01-11 05:23:12', '1', '', 0, 0, 0, ''),
(1686, 'GNI-46742', 'dilmishanthaa@gmail.com', 'Dehemi Shanthaa', '2007-12-06', 'female', 'Princess of Wales college ', 'Colombo', 'Ratmalana', '777213435', '', '', '777910741', '712/2A,Galle road,Idama,Moratuwa ', 42, '0b57cf726529dd26c10c96fbfdfa0e65', '1641898549photo-1560807707-8cc77767d783.jpeg-1.jpg', '2022-01-11 10:55:49', '1', '', 0, 0, 0, ''),
(1687, 'GNI-74777', 'Akilakodi071@gmail.com ', 'Akila', '2008-05-14', 'male', 'lyceum ', 'Ratnapura', 'pelmadulla ', '702726866', '', '', '776364007', 'bogoda arambha', 41, '77cb2899cf0a7a8d52eca93d410df665', '1641966235WhatsApp_Image_2021-12-31_at_8.23.19_AM.jpeg', '2022-01-12 05:43:55', '1', '', 0, 0, 0, ''),
(1688, 'GNI-39228', 'edu.ybinhewavitharana@gmail.com', 'Yenula Biman Hewavitharana ', '2009-12-17', 'male', 'St.Anthonys college kandy ', 'Kandy', 'Kandy', '777611716', '', '', '715326942', '42/3,Wattarantenna Road Kandy ', 40, '2396008ae30bf7689f9afc55b03820b0', '', '2022-01-11 17:01:53', '1', '', 0, 0, 0, ''),
(1689, 'GNI-71851', 'dmadusha497@gmail.com ', ' W.p Nimithaki anakshi', '2011-03-24', 'female', 'King\'s International ', 'Kandy', 'Hasalaka ', '786148826', '', '', '742051727', 'No 83,front of police station,hasalaka ', 38, 'cdd02c5a854e1513a82bb0846e60bb8d', '', '2022-01-31 15:13:09', '1', '', 0, 0, 0, ''),
(1690, 'GNI-38209', 'amodilsarani@gmail.com', 'G.R.Chamodya Sathsarani', '2009-02-20', 'female', 'PL/Royal Central College,Polonnaruwa', 'Polonnaruwa', 'Bediwewa', '775749645', '', '', '775749645', 'No.32,Sirisangabo place,pollonaruwa', 40, 'f511fa239248a5d2fe1c586eb6ac15a0', '', '2022-01-13 13:21:45', '1', '', 0, 0, 0, ''),
(1692, 'GNI-68191', 'nadeepriya1981@gmail.com', 'K.G.Methuki Thedasna ', '2011-01-29', 'female', 'Presbyterian girls school ', 'Colombo', 'Dehiwala ', '718313023', '', '', '718313023', '246/1 main road,Attidiya ,Dehiwala ', 39, 'd43f205ab63c0df174f4cb8eaf9c23b3', '', '2022-01-15 07:19:35', '1', '', 0, 0, 0, ''),
(1693, 'GNI-80341', 'mrshiromala@gmail.com', 'Nethmi dananjali disanayaka ', '2009-02-07', 'female', 'Ke/dehi kadigamuwa widyalaya', 'Kegalle', 'Ruwanwella', '774869582', '', '', '774869582', 'Hapugahawaththa, Imbulgoda, Galapitamada', 40, 'b575622875c48eb5413519566e688f61', '', '2022-01-15 12:46:03', '1', '', 0, 0, 0, ''),
(1694, 'GNI-36744', 'dilshiemail@gmail.com', 'M.J. Blanka Fernando', '2006-08-21', 'female', 'Bolawalana Ave Maria Convent', 'Gampaha', 'Negombo', '779801680', '', '', '779801680', 'Via Casia 38 Roma,Italia', 43, '5aca0fe6e5321f9e6867582c1739c3e1', '', '2022-01-18 16:34:39', '1', '', 0, 0, 0, ''),
(1695, 'GNI-39010', 'rasaliwijesiriwardane@gmail.com', 'Rasali Wijesiriwardane', '2004-11-02', 'female', 'Sussex college', 'Colombo', 'Piliyandala', '717437869', '', '', '716437869', 'No 5 Duwawatta road, Thumbovila, Bokundara, Piliyandala', 44, 'ce5769102ac6cd596c53bac9dc00a5d2', '', '2022-01-17 04:04:43', '1', '', 0, 0, 0, ''),
(1696, 'GNI-75461', 'ranithugihan', 'Ranithu dissanyaka', '2022-01-18', 'male', 'Maliyadeva college ku', 'Kurunegala', 'Kurunegala', '714456260', '', '', '776125046', 'Adagala waththa bamunugedara kurunegala', 40, 'e14ff2455fbc1473e17a33887b7b65e0', '', '2022-01-18 06:27:20', '1', '', 0, 0, 0, ''),
(1697, 'GNI-89721', 'himeshaheshan1997@gmail.com', 'heshan kkkd', '2022-01-13', 'male', 'jj', 'Ampara', 's', '757713398', '', '', '717974771', 'nugegoda', 44, '5e94d71b50cf9a62e93c204de2d5e6c4', '', '2022-01-19 06:02:44', '1', '', 0, 0, 0, ''),
(1698, 'GNI-59503', 'himeshih2014@gmail.com', 'Dahami vidusin ', '2005-09-29', 'female', 'Anula vidyalaya', 'Colombo', 'Nugegoda', '781904595', '', '', '781904595', 'No.75 Jambugasmulla mawatha,Nugegoda', 43, 'a874d5e18159f4300525ec7c5a98d3f3', '', '2022-01-19 06:55:36', '1', '', 0, 0, 0, ''),
(1699, 'GNI-20374', 'Nadeeshanirmali065@gmail.com ', 'Bogodawaththage nethaka chamathwin', '2014-04-10', 'male', 'Mara/pollwaththa prathamika viduhala ', 'Ampara', 'Weligama ', '778322021', '', '', '771065392', 'No:21/32amabhimanagama,weligama ', 35, '25d55ad283aa400af464c76d713c07ad', '', '2022-01-19 08:28:21', '1', '', 0, 0, 0, ''),
(1722, 'GNI-96595', 'VimukthiWijesinghe1@gmail.com ', 'Vimukthi Wijesinghe ', '2006-03-15', 'male', 'D.A Rajapaksha Vidyalaya', 'Colombo', 'Dalugama. Kelaniya ', '741954636', '', '', '742128136', '23/E 6 1/2 mile Road. Dalugama. Kelaniya ', 43, 'f1ab8d64f1cfd67d3151577424f092e9', '', '2022-02-01 03:43:20', '1', '', 0, 0, 0, ''),
(1701, 'GNI-96294', 'prabashisanjana2008@gamil.com', 'T.prabashi sanjana wickramarathne', '2008-10-10', 'female', 'KG/MAWA/ mayurapada central collage ', 'Kegalle', 'mawanella', '719016707', '', '', '719016707', 'no.92 dewaragampala,mawanella', 41, 'c2691d4ec682df0329cc6804d9c1e634', '', '2022-01-22 14:26:42', '1', '', 0, 0, 0, ''),
(1702, 'GNI-69819', 'fgayanmadushanka@gmail.com ', 'W. K. Ilone Jenul Fernando', '2016-11-16', 'male', 'Loyola College Bopitiya', 'Gampaha', 'Ja-ela', '783972161', '', '', '783972161', 'No. 247/c,Niwandama,Ja-ela', 33, '977a5f6325fb3608099f08528fd4be28', '', '2022-01-22 14:39:23', '1', '', 0, 0, 0, ''),
(1703, 'GNI-04726', 'wathsala1978@gmail.com', 'Methum Nethsuka Herath ', '2011-10-03', 'male', 'Ananda college chilaw ', 'Puttalam', 'Chilaw ', '705950626', '', '', '705950626', '35/48 sinhapura Rd.chilaw ', 38, '1a7d3c7bc32b3502b7b5d5a271cdb837', '', '2022-01-25 10:12:59', '1', '', 0, 0, 0, ''),
(1704, 'GNI-28201', 'ramanayakedisna@gmail.com', 'Yulan Ranmika Bandaranayake ', '2011-03-17', 'male', 'Ku/S.W.R.D.Bandaranayake college ', 'Kurunegala', 'Kurunegala ', '718505585', '', '', '718505585', '166/3 walakulpola ,Kurunegala ', 38, '261a99c943e358e2ad0ccc184107657d', '', '2022-01-26 04:31:51', '1', '', 0, 0, 0, ''),
(1727, 'GNI-99360', 'Nimeshilakshara@gmail.com', 'Yuhas nethsilu', '2014-06-29', 'male', 'Bodhiraja college ambilipitiya', 'Hambantota', 'Sooriyawewa', '717870101', '', '', '717870101', 'Diniru driving school', 35, '25d55ad283aa400af464c76d713c07ad', '', '2022-02-02 01:27:50', '1', '', 0, 0, 0, ''),
(1705, 'GNI-54619', 'chandra.tp1979@gmail.com', 'Ruhara Thavasari Bandara ', '2011-09-30', 'female', 'St. Mary\'s Convent -Matara', 'Matara', 'Matara ', '714476731', '', '', '714476731', 'No. 687, Aranayaka Rd, Ussapitiya ', 38, 'a9da9e04b963dc0e77cc7218757fd83b', '', '2022-01-26 14:47:21', '1', '', 0, 0, 0, ''),
(1706, 'GNI-95024', 'Savinrich123@gmail.com ', 'Binuk tennakoon ', '2008-06-19', 'male', 'Lyceum International school Rathnapura ', 'Ampara', 'Rathnapura ', '705050701', '', '', '705050701', 'Jayamanna ,Aluth walawwa Ganegama pellmadulla ', 42, 'b2f95053f112968d28884d84b6766aaa', '', '2022-01-26 15:18:18', '1', '', 0, 0, 0, ''),
(1707, 'GNI-53944', 'www.navindudilka@gmail.com', 'M A Arunoda ruvidu rashmika ', '2011-11-11', 'male', 'Moratu maha widdiyalaya ', 'Colombo', 'Moratuwa', '725569377', '', '', '771273518', '138/18 sramadana mawatha koralawella moratuwa', 38, 'd903a52c7b9ad75d16ab07ca5220947b', '', '2022-01-27 07:39:38', '1', '', 0, 0, 0, ''),
(1708, 'GNI-04484', 'achirakapuhennayke@yahoo.com', 'N.S.Rathnayake ', '2011-10-07', 'female', 'Mahamaya Girls college ', 'Kandy', 'Kandy, Sri Lanka', '703559348', '', '', '703559348', '101/1,Bodhiyangana Mawatha, Kandy ', 38, '7e085bec004ca0f912b790ae93af3202', '', '2022-01-28 09:11:25', '1', '', 0, 0, 0, ''),
(1709, 'GNI-77840', 'rovindusandeepa09@gmail.com', 'JH. Rovindu Sandeepa', '2007-07-05', 'male', 'St.Joseph\'s Collage ', 'Colombo', 'Papiliyana', '716650610', '', '', '703684619', '255\\A sunethra MW papiliyana', 41, 'cedf97b97c1a4024c46655f474a6ccae', '', '2022-01-29 01:21:40', '1', '', 0, 0, 0, ''),
(1710, 'GNI-94968', 'vindhya.vgl@gmail.com', 'Susara Vidthwath Perera ', '2010-02-22', 'male', 'St.John\'s College ', 'Colombo', 'Nugegoda ', '773592290', '', '', '773592290', 'No.401/A/3,Thalawathugoda Road, Hokandara South, Hokandara. ', 39, '63c2c4c5c726f060a57d83123343e461', '', '2022-01-29 06:21:26', '1', '', 0, 0, 0, ''),
(1711, 'GNI-44113', 'www.ayajitharinya@gmail.com', 'Ayaji tharinya ', '2011-11-11', 'male', 'G/sangamittha girl   school', 'Ampara', 'Galle', '761054917', '', '', '761054917', 'Kahatagahawatta,pitiduwa,talpe.', 38, 'b54a0248b34a94a9f623295ad6ddf168', '', '2022-01-29 06:51:53', '1', '', 0, 0, 0, ''),
(1723, 'GNI-11614', 'ishapavi3@gmail.Com', 'Ranuga Thisath yashwin samaranayaka ', '2016-06-13', 'male', 'Gamini national school ', 'Galle', 'Bentota ', '706066138', '', '', '703505887', '98/D,Olaganduwa,Induruwa ', 33, 'b35ea77ae895e80bc17a283b66cce3fe', '', '2022-02-01 05:07:52', '1', '', 0, 0, 0, ''),
(1712, 'GNI-34628', 'harshansilva@gmail.com', 'Hasthika silva', '2006-04-05', 'male', 'st Joseph`s college colombo 10', 'Colombo', 'Dehiwala', '774378415', '', '', '774378415', '95/6 Kawdana Road Attidiya Dehiwala', 43, '25d55ad283aa400af464c76d713c07ad', '1643713795IMG_20210109_162810_764.jpg', '2022-02-01 11:09:55', '1', '', 0, 0, 0, ''),
(1713, 'GNI-22914', 'harshansilva@gmail.com', 'Anagi Silva', '2000-12-14', 'female', 'Holy Family Convent Dehiwala', 'Colombo', 'Dehiwala', '779417749', '', '', '779417749', '95/6 Kawdana Road Attidiya Dehiwala', 42, '25d55ad283aa400af464c76d713c07ad', '', '2022-01-29 11:46:18', '1', '', 0, 0, 0, ''),
(1714, 'GNI-63489', 'danushkam@gmail.com', 'Daham Pandukabhaya ', '2007-05-10', 'male', 'Lyceum International school ', 'Ratnapura', 'Ratnapura ', '777336673', '', '', '777336673', 'No 38, 5th lane, Mihindugama, Ratnapura ', 43, 'e83e8763ad83433731282b07510856c7', '', '2022-01-30 02:37:38', '1', '', 0, 0, 0, ''),
(1715, 'GNI-05022', 'ddsnadeeshani@gmail.com', 'G.A . Thisathmi Devinya Jayawardana', '2008-11-27', 'female', 'K/Aluthgama National School', 'Kalutara', 'Aluthgama', '772698920', '', '', '772698920', 'Mahawaththa yalagama induruwa', 41, '25d55ad283aa400af464c76d713c07ad', '', '2022-01-30 05:05:10', '1', '', 0, 0, 0, ''),
(1716, 'GNI-26570', 'jagathwickramasinghe1983@gmail.com', 'W.M.D.C.Wichramasinghe', '2011-11-18', 'female', 'Mo/ Maligathanna central college', 'Monaragala', 'Badalkumbura', '713467882', '', '', '713467882', 'Suramya,pussallawa,badalkumbura', 38, '69b4439c229300e62ced0bf0796732dd', '', '2022-01-30 06:50:20', '1', '', 0, 0, 0, ''),
(1717, 'GNI-69097', 'dulanjaliejayasinghe@gmail.com', 'Buthmi Ahasna Peiris ', '2011-06-17', 'female', 'St.Josaph Girls school ', 'Colombo', 'Pannipitiya ', '718747288', '', '', '718747288', '7/17H,Cemetery Road, Pannipitiya.', 38, '33aa7e82caf79688391954e45dc10fef', '', '2022-01-31 03:44:01', '1', '', 0, 0, 0, ''),
(1718, 'GNI-54752', 'nehakaumadi@gmail.com', 'Neha kaumadi', '2006-11-21', 'female', 'Galagedara central college', 'Colombo', 'Maharagama', '761133626', '', '', '742328946', '520/5,high level rd,navinna,maharagama.', 43, '2be44b2866212cfe1ca1722be2a0b0f5', '', '2022-01-31 06:08:46', '1', '', 0, 0, 0, ''),
(1719, 'GNI-40078', 'ravi.1234@live.com', 'Himesh Navidu Abaynaike', '2009-09-15', 'male', 'S. Thomas\' college', 'Colombo', 'Nugegoda ', '773670557', '', '', '773507503', '84 old kesbewa Rd, Nugegoda', 40, '21c4f7a978b600239051fa5acace9f80', '', '2022-01-31 09:42:13', '1', '', 0, 0, 0, ''),
(1720, 'GNI-22097', 'natharakithmi@gmail.com', 'Maha Durage Kithmi Nathara Methmini', '2007-02-06', 'female', 'G/sangamitta Balika Vidyalaya.', 'Galle', 'Wanduramba/Galle', '767146872', '', '', '773440806', '292/B Keembikanda,Wanduramba,Galle', 42, 'f137fb287c291140ebcc3ffd93c0aa3a', '', '2022-01-31 13:22:09', '1', '', 0, 0, 0, ''),
(1724, 'GNI-57898', 'shanasfazir@gmail.com', 'Farha Fazir', '2013-05-16', 'female', 'Springfield college kandy', 'Kandy', 'Kandy', '777253284', '', '', '777253284', 'No:52 , Elamaldeniya , Muruthagahamulla , Gelioya.', 36, 'd0b5e1bcc249ba2022409ef5b1c8d75c', '', '2022-02-01 07:53:18', '1', '', 0, 0, 0, ''),
(1725, 'GNI-95099', 'mihirimd28@gmail.com ', 'S W W Disaja gagan kumara senevirathne ', '2011-10-10', 'male', 'Kandy modal ', 'Kandy', 'Kandy', '707320284', '', '', '707320284', '62 c Balanagala rd Katugasthota ', 38, '0f22893e166edd2da6beba4786bd0555', '', '2022-02-01 09:20:39', '1', '', 0, 0, 0, ''),
(1726, 'GNI-51603', 'Chamindankg@email.com ', 'Amasha Hansamali ', '2012-04-29', 'female', 'Wathttagama balika maha vidyalaya ', 'Kandy', 'Wathttagama ', '769013149', '', '', '769013149', '16/2 makkanigama wathttagama ', 37, 'df4f109f5c32033057d072a7d9ba6329', '', '2022-02-01 10:18:23', '1', '', 0, 0, 0, ''),
(1728, 'GNI-05516', 'Padumaranasinghe51@gmail.com', 'W A K Nethuki  Nadinsha', '2023-09-10', 'female', 'G/southlands college ', 'Galle', 'Galle', '760978842', '', '', '717269515', '289/2,pinnaduwa', 34, '5ac2936d4be3dca9533240145d338496', '', '2022-02-02 04:54:26', '1', '', 0, 0, 0, ''),
(1729, 'GNI-14307', 'vithushcolonne@gmail.com', 'Vithush Colonne', '2011-07-26', 'male', 'Royal Central College Polonnaruwa ', 'Polonnaruwa', 'Polonnaruwa ', '777886043', '', '', '777425653', 'No13,Hospital Junction,Polonnaruwa ', 38, 'b3943d4a3304bc14d9121a5f294a959c', '', '2022-02-02 05:55:59', '1', '', 0, 0, 0, ''),
(1730, 'GNI-83151', 'dinukathudugalage@gmail.com', 'Nadina Amodhya Thudugalage', '2008-12-03', 'male', 'MAHINDA RAJAPAKSA COLLEGE, HOMAGAMA, ', 'Colombo', 'PANNIPITIYA', '714846909', '', '', '714846909', '747/2B RUKMALE ROAD,KOTTAWA, PANNIPITIYA', 41, 'dec8febb630952441ed26a8673b616bc', '', '2022-02-02 08:22:20', '1', '', 0, 0, 0, ''),
(1731, 'ATL-97299', 'asd@gmail.com', 'asd', '2022-05-23', 'male', 'DCB', 'Ampara', 'asdad', '787200877', '', '', '111222333', 'asd', 38, '25f9e794323b453885f5181f1b624d0b', '', '2022-05-23 05:43:29', '1', '', 0, 0, 0, ''),
(1733, 'ATL-46438', 'charith01yashoda@gmail.com', 'Charith', '2022-05-09', 'male', 'Trinity College ', 'Kandy', 'Kandy', '778781177', 'charith01yashoda@gmail.com', 'asda', '778781177', '361, Nawayalathanne, Katugasthota', 37, 'c93e5d9fc28b5714423d74890804f566', '', '2022-06-10 03:00:20', '1', '', 0, 0, 0, '9174'),
(1734, 'ATL-77379', 'sumudupramuditha@gmail.com', 'Sumudu Test', '2001-05-10', 'male', 'Test', 'Ampara', 'Test', '765803636', 'sumudupramuditha@gmail.com', 'Test', '773853994', 'test', 37, '12bce374e7be15142e8172f668da00d8', '', '2022-05-31 14:45:19', '1', '', 0, 0, 0, ''),
(1735, 'ATL-43927', 'Test5@gmail.com', 'Test5', '2003-03-03', 'male', 'Test5', 'Ampara', 'Test5', '765803636', 'Test5@gmail.com', 'Test5', '765803636', 'Test5', 37, '52cded2c3e175f4df513d704616bb82b', '', '2022-06-03 02:56:19', '1', '', 0, 0, 0, ''),
(1745, 'ATL-23317', 'kasun.yogeemedia@gmail.com', 'Yogeemedia', '2022-06-02', 'male', 'Sample College', 'Ampara', 'Sample City', '0', 'sample12@gmail.com', 'sample name', '773842820', 'Sample Address Line 2', 35, 'ed2b1f468c5f915f3f1cf75d7068baae', '', '2022-06-17 06:21:21', '1', '', 0, 0, 0, ''),
(1737, 'ATL-14954', 'atlascr20@gmail.com', 'Testing ', '2016-06-15', 'male', 'Testing', 'Galle', 'Testing', '771442428', 'testing@gmail.com', 'Testing', '771442428', 'Testing', 34, 'c19c654a0c0147ca12221de78ece1490', '', '2022-06-15 05:08:00', '1', '', 0, 0, 0, ''),
(1741, 'ATL-34826', 'charith01yashoda@gmail.com', 'Charith Yashoda Bandara Samarakoon ', '2022-06-02', 'male', 'Trinity college ', 'Ampara', 'fh', '778781177', 'dfgghhji@gmail.com', 'Uuuooo', '776852886', 'charith01yashoda@gmail.com ', 35, '25d55ad283aa400af464c76d713c07ad', '', '2022-06-16 10:46:31', '1', '', 0, 0, 0, ''),
(1742, 'ATL-60089', 'shau90@gmail.com', 'Test Shauri Hettiarachchi', '1990-02-26', 'male', 'Hollywood college', 'Ampara', 'Peradeniya', '716331072', 'usithadh@gmail.com', 'Usitha D', '773627303', '574/a, thalangama south, battaramulla ', 38, 'a8e5baf34fbf6b728a4f473d6adad861', '', '2022-06-16 11:18:12', '1', '', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `lmsrequest_relogin`
--

CREATE TABLE `lmsrequest_relogin` (
  `relog_id` int(11) NOT NULL,
  `relog_user` int(11) NOT NULL,
  `relog_status` int(11) NOT NULL,
  `req_ip_add` varchar(255) NOT NULL,
  `relog_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsreq_subject`
--

CREATE TABLE `lmsreq_subject` (
  `sub_req_id` int(11) NOT NULL,
  `sub_req_reg_no` varchar(50) NOT NULL,
  `sub_req_sub_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsreq_subject`
--

INSERT INTO `lmsreq_subject` (`sub_req_id`, `sub_req_reg_no`, `sub_req_sub_id`) VALUES
(5762, '779882999', 313),
(5763, '779882999', 315),
(5797, '779699912', 383),
(5800, '772651510', 651),
(5801, '772651510', 562),
(5813, '779118872', 279),
(5814, '779118872', 268),
(5824, '772071713', 607),
(5825, '772071713', 302),
(5843, '716683852', 437),
(5844, '716683852', 497),
(5845, '716683852', 377),
(5846, '776464901', 470),
(5847, '776464901', 515),
(5848, '776464901', 346),
(5849, '776464901', 369),
(5850, '776464901', 548),
(5867, '774069760', 347),
(5881, '760439372', 590),
(5882, '760439372', 439),
(5883, '760439372', 682),
(5884, '760439372', 359),
(5885, '760439372', 677),
(5886, '760439372', 463),
(5887, '760439372', 383),
(5888, '760439372', 668),
(5889, '760439372', 696),
(5890, '760439372', 499),
(5891, '760439372', 422),
(5892, '760439372', 664),
(5893, '760439372', 541),
(5894, '760439372', 542),
(5895, '760439372', 537),
(5896, '760439372', 409),
(5897, '760439372', 410),
(5898, '760439372', 672),
(5899, '760439372', 614),
(5900, '760439372', 709),
(5901, '760439372', 536),
(5902, '760439372', 533),
(5903, '760439372', 637),
(5904, '760439372', 653),
(5905, '760439372', 720),
(5906, '760439372', 566),
(5907, '760439372', 398),
(5908, '760439372', 397),
(5909, '760439372', 631),
(5910, '760439372', 511),
(5911, '760439372', 553),
(5915, '777315582', 346),
(5916, '777315582', 369),
(5917, '777315582', 506),
(5962, '716099910', 350),
(5963, '716099910', 373),
(6077, '0', 763),
(6078, '0', 733),
(6079, '0', 750),
(6080, '0', 736),
(6084, '779090713', 309),
(6085, '779090713', 297),
(6086, '779090713', 415),
(6087, '779090713', 301),
(6088, '704176628', 637),
(6093, '751435651', 434),
(6094, '751435651', 433),
(6095, '751435651', 348),
(6096, '751435651', 446),
(6097, '751435651', 572),
(6098, '751435651', 404),
(6099, '751435651', 611),
(6100, '751435651', 469),
(6101, '751435651', 493),
(6102, '751435651', 706),
(6103, '751435651', 515),
(6104, '751435651', 634),
(6105, '751435651', 346),
(6106, '751435651', 560),
(6107, '751435651', 370),
(6108, '751435651', 727),
(6109, '751435651', 392),
(6110, '751435651', 391),
(6111, '751435651', 628),
(6129, '775682791', 763),
(6130, '775682791', 736),
(6185, '770627023', 308),
(6186, '770627023', 298),
(6187, '770627023', 415),
(6188, '770627023', 657),
(6189, '770627023', 299),
(6190, '770627023', 301),
(6191, '723634616', 312),
(6192, '723634616', 416),
(6193, '723634616', 658),
(6194, '723634616', 314),
(6223, '774030764', 563),
(6231, '762396247', 437),
(6232, '762396247', 461),
(6233, '762396247', 485),
(6234, '762396247', 498),
(6235, '762396247', 421),
(6236, '762396247', 576),
(6237, '762396247', 407),
(6297, '778430482', 360),
(6298, '778430482', 383),
(6299, '778430482', 410),
(6300, '778430482', 565),
(6318, '773442198', 567),
(6320, '702591454', 267),
(6350, '775656063', 346),
(6351, '775656063', 369),
(6366, '741394055', 382),
(6367, '741394055', 666),
(6386, '713821334', 521),
(6387, '713821334', 674),
(6388, '713821334', 566),
(6389, '713821334', 554),
(6395, '717293502', 354),
(6396, '717293502', 377),
(6397, '776945079', 359),
(6398, '776945079', 384),
(6399, '776945079', 720),
(6400, '776945079', 397),
(6401, '776945079', 511),
(6402, '776945079', 553),
(6403, '763705537', 404),
(6404, '763705537', 560),
(6405, '763705537', 370),
(6406, '777241377', 460),
(6407, '777241377', 484),
(6408, '777241377', 494),
(6409, '777241377', 420),
(6410, '777241377', 349),
(6413, '751890686', 370),
(6420, '713216789', 430),
(6421, '713216789', 687),
(6422, '719303025', 356),
(6423, '719303025', 519),
(6424, '719303025', 652),
(6425, '719303025', 564),
(6440, '777063370', 543),
(6441, '777063370', 695),
(6442, '777063370', 412),
(6443, '777063370', 673),
(6444, '777063370', 675),
(6445, '777063370', 667),
(6446, '777063370', 632),
(6451, '779828666', 537),
(6452, '779828666', 522),
(6453, '779828666', 358),
(6454, '779828666', 382),
(6510, '766625872', 383),
(6511, '766625872', 664),
(6512, '766625872', 625),
(6513, '766625872', 653),
(6514, '763053133', 437),
(6515, '763053133', 485),
(6516, '763053133', 379),
(6517, '763053133', 531),
(6518, '763053133', 395),
(6524, '712692230', 635),
(6525, '712692230', 349),
(6526, '712692230', 373),
(6527, '712692230', 728),
(6535, '765441158', 437),
(6536, '765441158', 379),
(6537, '765441158', 421),
(6538, '765441158', 663),
(6539, '765441158', 408),
(6540, '765441158', 532),
(6541, '765441158', 519),
(6542, '765441158', 509),
(6543, '741449839', 447),
(6544, '741449839', 471),
(6545, '741449839', 496),
(6546, '741449839', 350),
(6547, '741449839', 373),
(6548, '741449839', 393),
(6556, '774598115', 387),
(6571, '711914377', 448),
(6572, '711914377', 518),
(6573, '711914377', 350),
(6574, '711914377', 373),
(6581, '752826858', 732),
(6582, '752826858', 749),
(6583, '716530536', 681),
(6584, '716530536', 523),
(6585, '716530536', 386),
(6596, '776846179', 588),
(6597, '776846179', 355),
(6598, '776846179', 379),
(6599, '776846179', 575),
(6600, '776846179', 407),
(6601, '776846179', 613),
(6602, '776846179', 531),
(6603, '776846179', 396),
(6604, '712580444', 585),
(6605, '712580444', 436),
(6606, '712580444', 420),
(6607, '712580444', 447),
(6608, '712580444', 405),
(6609, '712580444', 472),
(6610, '712580444', 496),
(6611, '712580444', 518),
(6612, '712580444', 349),
(6613, '712580444', 373),
(6614, '712580444', 394),
(6615, '769017122', 420),
(6616, '769017122', 405),
(6617, '769017122', 496),
(6618, '769017122', 518),
(6619, '769017122', 718),
(6620, '769017122', 350),
(6621, '769017122', 373),
(6622, '769017122', 374),
(6623, '769017122', 394),
(6624, '769017122', 393),
(6625, '777296361', 471),
(6626, '777296361', 496),
(6627, '777296361', 518),
(6628, '777296361', 350),
(6629, '777296361', 373),
(6630, '777296361', 393),
(6631, '777296361', 508),
(6632, '762088259', 588),
(6633, '762088259', 438),
(6634, '762088259', 356),
(6635, '762088259', 462),
(6636, '762088259', 485),
(6637, '762088259', 486),
(6638, '762088259', 380),
(6639, '762088259', 421),
(6640, '762088259', 663),
(6641, '762088259', 408),
(6642, '762088259', 531),
(6643, '762088259', 551),
(6650, '779304969', 441),
(6651, '779304969', 683),
(6652, '779304969', 363),
(6653, '779304969', 676),
(6654, '779304969', 466),
(6655, '779304969', 387),
(6656, '779304969', 669),
(6657, '779304969', 697),
(6683, '768175476', 344),
(6684, '768175476', 368),
(6685, '768175476', 389),
(6726, '765794996', 413),
(6727, '765794996', 605),
(6728, '765794996', 274),
(6741, '717585778', 379),
(6748, '757186657', 554),
(6753, '716650298', 348),
(6754, '716650298', 372),
(6755, '716650298', 403),
(6756, '716650298', 527),
(6757, '716650298', 559),
(6758, '716650298', 392),
(6763, '764489792', 383),
(6764, '764489792', 668),
(6780, '724040033', 762),
(6787, '775354570', 387),
(6788, '775354570', 669),
(6789, '761286928', 521),
(6790, '711250213', 328),
(6791, '711250213', 417),
(6792, '711250213', 331),
(6796, '776364553', 718),
(6797, '776364553', 350),
(6798, '776364553', 393),
(6803, '715509008', 537),
(6804, '715509008', 614),
(6805, '715509008', 358),
(6806, '715509008', 730),
(6811, '767074458', 403),
(6812, '767074458', 345),
(6813, '767074458', 369),
(6819, '710684680', 348),
(6820, '710684680', 371),
(6821, '769181718', 435),
(6822, '769181718', 351),
(6823, '769181718', 460),
(6824, '769181718', 483),
(6825, '769181718', 375),
(6826, '769181718', 494),
(6827, '769181718', 573),
(6828, '769181718', 406),
(6829, '769181718', 393),
(6830, '769181718', 508),
(6831, '722480996', 440),
(6832, '722480996', 537),
(6833, '722480996', 397),
(6859, '705167385', 732),
(6860, '705167385', 749),
(6878, '773574570', 438),
(6879, '773574570', 421),
(6880, '773574570', 449),
(6881, '773574570', 474),
(6882, '773574570', 497),
(6883, '781190335', 600),
(6884, '781190335', 353),
(6885, '704382241', 382),
(6886, '704382241', 666),
(6896, '703770601', 435),
(6897, '703770601', 420),
(6898, '703770601', 573),
(6899, '452274690', 430),
(6900, '452274690', 687),
(6901, '714629540', 733),
(6902, '714629540', 750),
(6907, '774814219', 284),
(6908, '716094334', 383),
(6909, '716094334', 668),
(6910, '716094334', 409),
(6911, '716094334', 672),
(6912, '779414000', 430),
(6913, '779414000', 687),
(6918, '775094020', 403),
(6919, '775094020', 493),
(6920, '775094020', 516),
(6921, '775094020', 345),
(6922, '775094020', 369),
(6933, '711155418', 267),
(6934, '711155418', 270),
(6935, '711155418', 271),
(6945, '760373334', 350),
(6946, '760373334', 507),
(6947, '760373334', 508),
(6954, '774795005', 763),
(6955, '774795005', 733),
(6956, '774795005', 750),
(6980, '768692992', 732),
(6981, '768692992', 749),
(6987, '779123870', 327),
(6995, '705588778', 466),
(6996, '705588778', 490),
(6997, '705588778', 387),
(6998, '705588778', 500),
(6999, '705588778', 423),
(7000, '705588778', 665),
(7003, '770897341', 471),
(7004, '770897341', 496),
(7005, '775937529', 527),
(7006, '718260005', 377),
(7033, '777166777', 583),
(7034, '777166777', 433),
(7035, '777166777', 348),
(7036, '777166777', 457),
(7037, '777166777', 482),
(7038, '777166777', 371),
(7039, '777166777', 419),
(7040, '777166777', 404),
(7041, '777166777', 392),
(7053, '714216717', 328),
(7055, '775329643', 373),
(7056, '775356942', 387),
(7057, '775356942', 669),
(7058, '778525189', 630),
(7059, '765625900', 433),
(7060, '765625900', 419),
(7061, '765625900', 446),
(7062, '765625900', 469),
(7063, '765625900', 493),
(7064, '765625900', 345),
(7065, '765625900', 369),
(7066, '765625900', 391),
(7098, '714953280', 346),
(7099, '714953280', 369),
(7175, '703092223', 347),
(7176, '703092223', 371),
(7177, '703092223', 403),
(7178, '703092223', 391),
(7229, '768648288', 437),
(7230, '768648288', 473),
(7231, '768648288', 519),
(7232, '768648288', 552),
(7233, '723501985', 439),
(7234, '723501985', 542),
(7235, '723501985', 521),
(7236, '768145465', 351),
(7237, '768145465', 375),
(7238, '761024124', 355),
(7239, '761024124', 379),
(7240, '761024124', 395),
(7241, '782981580', 313),
(7242, '782981580', 416),
(7243, '782981580', 658),
(7244, '782981580', 314),
(7245, '782981580', 316),
(7246, '782981580', 318),
(7247, '782981427', 434),
(7248, '782981427', 348),
(7249, '782981427', 458),
(7250, '782981427', 481),
(7251, '782981427', 372),
(7252, '782981427', 495),
(7253, '782981427', 419),
(7254, '782981427', 404),
(7255, '782981427', 628),
(7256, '782981427', 548),
(7257, '768254124', 355),
(7258, '768254124', 379),
(7259, '768254124', 395),
(7264, '778813809', 383),
(7265, '778813809', 409),
(7266, '778813809', 398),
(7291, '776357215', 282),
(7292, '714000023', 594),
(7293, '714000023', 526),
(7316, '766661265', 375),
(7321, '762666502', 586),
(7322, '762666502', 448),
(7323, '762666502', 405),
(7324, '762666502', 471),
(7325, '762666502', 496),
(7326, '762666502', 517),
(7327, '762666502', 350),
(7328, '762666502', 373),
(7329, '762666502', 393),
(7330, '762666502', 508),
(7346, '772929702', 480),
(7347, '772929702', 492),
(7348, '772929702', 402),
(7349, '772929702', 525),
(7350, '772929702', 514),
(7351, '772929702', 389),
(7352, '772929702', 627),
(7359, '775448485', 462),
(7360, '775448485', 486),
(7361, '775448485', 379),
(7362, '775448485', 498),
(7363, '775448485', 421),
(7364, '775448485', 532),
(7365, '702084129', 742),
(7366, '702084129', 757),
(7367, '702084129', 733),
(7368, '702084129', 750),
(7369, '702084129', 741),
(7370, '702084129', 754),
(7371, '702735085', 435),
(7372, '702735085', 375),
(7373, '702735085', 394),
(7398, '777824166', 767),
(7399, '777824166', 469),
(7400, '777824166', 516),
(7401, '777824166', 515),
(7402, '777824166', 345),
(7403, '777824166', 346),
(7404, '777824166', 369),
(7405, '777824166', 506),
(7406, '775621677', 433),
(7407, '775621677', 348),
(7408, '775621677', 371),
(7409, '775621677', 527),
(7410, '775621677', 506),
(7434, '765303051', 363),
(7435, '765303051', 679),
(7436, '765303051', 676),
(7437, '765303051', 723),
(7438, '765303051', 466),
(7439, '765303051', 465),
(7440, '765303051', 489),
(7441, '765303051', 490),
(7442, '765303051', 387),
(7443, '711941303', 313),
(7458, '715318442', 437),
(7459, '715318442', 355),
(7460, '714336001', 376),
(7461, '714336001', 394),
(7471, '770585880', 667),
(7472, '763158997', 367),
(7473, '763158997', 401),
(7474, '763158997', 627),
(7476, '768819665', 369),
(7477, '714064922', 377),
(7479, '718106725', 585),
(7481, '701346004', 355),
(7482, '701346004', 379),
(7483, '701346004', 395),
(7492, '775675777', 351),
(7493, '775675777', 375),
(7494, '775675777', 530),
(7497, '768831597', 435),
(7498, '768831597', 351),
(7499, '768831597', 375),
(7500, '768831597', 405),
(7502, '777345289', 422),
(7515, '718014067', 379),
(7532, '771846888', 375),
(7533, '713284127', 435),
(7534, '713284127', 351),
(7535, '713284127', 375),
(7570, '770834657', 654),
(7580, '715494587', 436),
(7581, '715494587', 420),
(7582, '715494587', 448),
(7583, '715494587', 406),
(7584, '715494587', 471),
(7585, '715494587', 496),
(7586, '715494587', 518),
(7587, '715494587', 349),
(7588, '715494587', 373),
(7589, '715494587', 393),
(7596, '740708362', 631),
(7597, '714967546', 444),
(7598, '714967546', 468),
(7599, '714967546', 491),
(7600, '714967546', 424),
(7601, '714967546', 341),
(7602, '714967546', 365),
(7603, '714967546', 545),
(7604, '714703620', 750),
(7605, '714703620', 741),
(7606, '713976845', 731),
(7607, '713976845', 400),
(7615, '714411125', 585),
(7616, '714411125', 496),
(7623, '760404272', 542),
(7624, '760404272', 536),
(7635, '713018893', 379),
(7644, '770375789', 342),
(7645, '723203565', 327),
(7646, '723203565', 328),
(7670, '741537452', 394),
(7671, '784447822', 448),
(7672, '784447822', 573),
(7673, '784447822', 373),
(7679, '717738155', 375),
(7685, '760376134', 585),
(7686, '760376134', 351),
(7687, '760376134', 375),
(7688, '760376134', 574),
(7689, '760376134', 405),
(7690, '760376134', 623),
(7691, '760376134', 530),
(7692, '760376134', 393),
(7697, '787451377', 306),
(7710, '772491286', 339),
(7711, '772491286', 417),
(7712, '772491286', 659),
(7713, '772491286', 704),
(7714, '772491286', 643),
(7715, '772491286', 715),
(7716, '772491286', 325),
(7717, '772491286', 331),
(7718, '769666409', 404),
(7719, '769666409', 560),
(7720, '769666409', 392),
(7727, '773938742', 433),
(7728, '773938742', 419),
(7729, '773938742', 446),
(7730, '773938742', 469),
(7731, '773938742', 493),
(7732, '773938742', 369),
(7756, '716375903', 379),
(7757, '716375903', 613),
(7758, '716375903', 719),
(7761, '781735872', 543),
(7762, '770577492', 571),
(7763, '789812437', 517),
(7764, '752393374', 450),
(7765, '752393374', 473),
(7766, '752393374', 708),
(7767, '752393374', 564),
(7768, '752393374', 729),
(7788, '713403401', 767),
(7789, '713403401', 584),
(7790, '713403401', 547),
(7791, '765404563', 559),
(7837, '778879688', 377),
(7838, '776705192', 422),
(7839, '776705192', 768),
(7840, '776705192', 521),
(7841, '776705192', 358),
(7842, '776705192', 382),
(7843, '776705192', 631),
(7844, '717188061', 377),
(7845, '715350543', 576),
(7846, '715350543', 408),
(7847, '715350543', 520),
(7848, '715350543', 354),
(7849, '715350543', 729),
(7850, '762046378', 519),
(7985, '760349368', 364),
(7986, '760349368', 679),
(7987, '760349368', 387),
(7988, '760349368', 669),
(7991, '702492822', 543),
(7992, '702492822', 691),
(8001, '777277876', 263),
(8007, '710750445', 543),
(8009, '703535385', 718),
(8022, '715201393', 525),
(8024, '777122219', 732),
(8025, '777122219', 749),
(8035, '772533916', 435),
(8036, '772533916', 351),
(8037, '772533916', 459),
(8038, '772533916', 483),
(8039, '772533916', 375),
(8040, '772533916', 405),
(8041, '772533916', 530),
(8042, '772533916', 562),
(8043, '772533916', 393),
(8044, '772533916', 629),
(8045, '772533916', 508),
(8048, '716114986', 312),
(8049, '716733914', 313),
(8050, '777455219', 543),
(8051, '757372970', 552),
(8052, '703013525', 297),
(8053, '703013525', 415),
(8054, '703013525', 299),
(8055, '769293525', 343),
(8056, '769293525', 367),
(8057, '769293525', 402),
(8058, '769293525', 525),
(8059, '769293525', 557),
(8060, '769293525', 389),
(8061, '769293525', 504),
(8063, '718053754', 571),
(8064, '714025027', 663),
(8065, '776046625', 386),
(8066, '776046625', 667),
(8067, '714211844', 587),
(8068, '714211844', 356),
(8069, '714211844', 379),
(8070, '702743372', 348),
(8071, '702743372', 371),
(8073, '711815843', 368),
(8074, '711815843', 341),
(8075, '711815843', 557),
(8077, '947697022', 351),
(8078, '769702298', 351),
(8085, '759427835', 351),
(8086, '759427835', 375),
(8087, '789626027', 351),
(8088, '789626027', 375),
(8089, '789626027', 393),
(8090, '789626027', 508),
(8091, '766214233', 435),
(8092, '766214233', 351),
(8093, '766214233', 375),
(8094, '766214233', 405),
(8096, '714446654', 650),
(8099, '779082588', 356),
(8100, '779082588', 380),
(8101, '779082588', 421),
(8102, '701908893', 707),
(8103, '701908893', 350),
(8104, '701908893', 394),
(8105, '778880054', 371),
(8106, '716568709', 761),
(8107, '787842899', 761),
(8108, '766469510', 382),
(8109, '766469510', 666),
(8110, '718578952', 354),
(8111, '718578952', 377),
(8122, '769879007', 355),
(8129, '714886612', 382),
(8130, '714886612', 666),
(8131, '773799688', 386),
(8132, '773799688', 667),
(8136, '770531051', 732),
(8137, '770531051', 749),
(8138, '716145190', 733),
(8139, '760362865', 733),
(8140, '760362865', 750),
(8141, '760362865', 736),
(8142, '774278762', 349),
(8143, '774278762', 373),
(8181, '727999360', 354),
(8182, '727999360', 377),
(8183, '775657675', 328),
(8184, '775657675', 417),
(8185, '763461790', 446),
(8186, '763461790', 403),
(8187, '763461790', 469),
(8188, '763461790', 493),
(8189, '763461790', 515),
(8190, '763461790', 778),
(8191, '763461790', 345),
(8192, '763461790', 369),
(8197, '704474445', 387),
(8198, '704474445', 669),
(8199, '704474445', 556),
(8200, '741190850', 388),
(8201, '741190850', 669),
(8202, '715618107', 387),
(8203, '715618107', 669),
(8205, '772016711', 350),
(8211, '788508850', 436),
(8212, '788508850', 435),
(8213, '788508850', 352),
(8214, '788508850', 351),
(8215, '788508850', 460),
(8216, '788508850', 459),
(8217, '788508850', 483),
(8218, '788508850', 375),
(8219, '788508850', 376),
(8220, '788508850', 494),
(8223, '711048821', 422),
(8229, '774044409', 347),
(8239, '772959974', 430),
(8247, '768834074', 430),
(8248, '768834074', 687),
(8249, '773716389', 347),
(8250, '773716389', 457),
(8251, '773716389', 481),
(8252, '773716389', 371),
(8253, '773716389', 419),
(8254, '773716389', 403),
(8255, '773716389', 527),
(8256, '773716389', 767),
(8257, '773716389', 548),
(8258, '763939287', 387),
(8259, '763939287', 669),
(8260, '763939287', 543),
(8261, '763939287', 691),
(8262, '763939287', 567),
(8273, '779270231', 369),
(8292, '702866826', 440),
(8293, '702866826', 422),
(8294, '702866826', 538),
(8295, '702866826', 397),
(8296, '765734522', 736),
(8297, '777452250', 383),
(8298, '777452250', 668),
(8301, '762132473', 669),
(8302, '762132473', 412),
(8303, '762132473', 535),
(8304, '706777343', 590),
(8305, '706777343', 686),
(8306, '719973569', 686),
(8307, '740259820', 435),
(8308, '772491285', 420),
(8309, '772491285', 448),
(8310, '772491285', 471),
(8311, '772491285', 517),
(8312, '772491285', 350),
(8313, '772491285', 373),
(8314, '772491285', 394),
(8315, '772491285', 508),
(8316, '718465665', 352),
(8333, '777474189', 426),
(8341, '761145554', 407),
(8342, '761145554', 497),
(8343, '761145554', 519),
(8344, '761145554', 354),
(8345, '761145554', 377),
(8347, '714577675', 743),
(8355, '761875045', 356),
(8362, '771747678', 579),
(8365, '776284660', 736),
(8366, '776284660', 737),
(8367, '776284660', 760),
(8368, '778293479', 351),
(8369, '778293479', 375),
(8370, '716953681', 422),
(8371, '716953681', 409),
(8372, '716953681', 398),
(8373, '777684809', 435),
(8374, '777684809', 351),
(8375, '777684809', 375),
(8376, '777684809', 494),
(8377, '777684809', 405),
(8378, '777684809', 393),
(8379, '777684809', 629),
(8380, '703203959', 736),
(8381, '764849621', 742),
(8382, '764849621', 757),
(8383, '764849621', 743),
(8384, '764849621', 751),
(8385, '764849621', 733),
(8386, '764849621', 750),
(8387, '764849621', 734),
(8388, '764849621', 753),
(8389, '764849621', 739),
(8390, '764849621', 737),
(8391, '764849621', 760),
(8394, '767988090', 662),
(8395, '766918576', 736),
(8396, '719191922', 395),
(8397, '777206051', 515),
(8409, '768501369', 425),
(8414, '789322333', 435),
(8415, '789322333', 376),
(8416, '789322333', 529),
(8417, '789322333', 393),
(8418, '789322333', 508),
(8439, '750870833', 433),
(8440, '750870833', 347),
(8441, '750870833', 458),
(8442, '750870833', 481),
(8443, '750870833', 371),
(8444, '750870833', 495),
(8445, '750870833', 419),
(8446, '750870833', 572),
(8447, '750870833', 403),
(8448, '750870833', 527),
(8449, '750870833', 391),
(8450, '750870833', 506),
(8451, '767628040', 434),
(8452, '767628040', 419),
(8453, '767628040', 572),
(8473, '719603451', 471),
(8474, '719603451', 496),
(8475, '719603451', 426),
(8476, '777547879', 380),
(8477, '712877647', 379),
(8478, '712877647', 531),
(8479, '712877647', 395),
(8492, '767502141', 736),
(8494, '775181376', 435),
(8495, '775181376', 420),
(8496, '775181376', 448),
(8497, '775181376', 471),
(8498, '775181376', 496),
(8499, '775181376', 517),
(8500, '775181376', 349),
(8501, '775181376', 373),
(8502, '775181376', 393),
(8503, '775181376', 508),
(8509, '769777210', 347),
(8510, '769777210', 371),
(8511, '769777210', 391),
(8512, '710668125', 448),
(8513, '710668125', 405),
(8514, '710668125', 406),
(8515, '710668125', 471),
(8516, '710668125', 496),
(8517, '710668125', 426),
(8518, '710668125', 518),
(8519, '710668125', 350),
(8520, '710668125', 393),
(8521, '710668125', 629),
(8522, '710668125', 507),
(8523, '710668125', 550),
(8527, '719384845', 739),
(8528, '761626798', 541),
(8529, '777889594', 435),
(8530, '777889594', 448),
(8531, '777889594', 405),
(8532, '777889594', 471),
(8533, '777889594', 496),
(8534, '777889594', 517),
(8535, '777889594', 350),
(8536, '777889594', 373),
(8537, '777889594', 393),
(8538, '777889594', 508),
(8539, '777390250', 515),
(8562, '756870303', 432),
(8563, '756870303', 431),
(8564, '756870303', 344),
(8565, '756870303', 343),
(8566, '756870303', 456),
(8567, '756870303', 455),
(8568, '756870303', 479),
(8569, '756870303', 367),
(8570, '756870303', 368),
(8571, '756870303', 492),
(8572, '756870303', 418),
(8573, '756870303', 660),
(8574, '756870303', 444),
(8575, '756870303', 570),
(8576, '756870303', 569),
(8577, '756870303', 594),
(8578, '756870303', 401),
(8579, '756870303', 402),
(8580, '756870303', 467),
(8581, '756870303', 491),
(8582, '756870303', 705),
(8583, '779180837', 772),
(8584, '771081924', 664),
(8585, '771081924', 720),
(8586, '771081924', 775),
(8587, '773068552', 723),
(8588, '773068552', 387),
(8589, '773068552', 669),
(8590, '773068552', 604),
(8596, '767588078', 515),
(8603, '716334513', 430),
(8604, '716334513', 687),
(8605, '716334513', 721),
(8606, '778333291', 541),
(8607, '770420743', 342),
(8608, '719068244', 463),
(8609, '719068244', 501),
(8610, '778571260', 423),
(8611, '778571260', 362),
(8612, '778571260', 386),
(8613, '778571260', 667),
(8614, '763434302', 404),
(8615, '763434302', 515),
(8616, '763434302', 369),
(8617, '763434302', 506),
(8649, '765669217', 733),
(8650, '765669217', 750),
(8652, '718857391', 435),
(8653, '718857391', 420),
(8654, '718857391', 373),
(8655, '712888951', 279),
(8656, '773919614', 328),
(8657, '714211632', 441),
(8658, '714211632', 683),
(8659, '714211632', 364),
(8660, '714211632', 679),
(8661, '714211632', 387),
(8662, '714211632', 669),
(8663, '714211632', 697),
(8682, '715703375', 640),
(8683, '716686026', 299),
(8684, '774170706', 347),
(8685, '774170706', 622),
(8686, '774170706', 628),
(8687, '775266760', 298),
(8688, '775266760', 299),
(8689, '775266760', 301),
(8690, '741132118', 440),
(8691, '741132118', 684),
(8692, '741132118', 696),
(8693, '741132118', 785),
(8694, '741132118', 422),
(8695, '741132118', 664),
(8696, '741132118', 409),
(8697, '741132118', 765),
(8698, '741132118', 672),
(8699, '741132118', 501),
(8700, '741132118', 781),
(8701, '741132118', 720),
(8702, '741132118', 382),
(8703, '741132118', 666),
(8704, '741132118', 397),
(8705, '741132118', 631),
(8706, '741132118', 511),
(8707, '740584854', 395),
(8708, '740584854', 510),
(8709, '713593493', 585),
(8710, '713593493', 435),
(8711, '713593493', 448),
(8712, '713593493', 405),
(8713, '713593493', 471),
(8714, '713593493', 373),
(8715, '713593493', 393),
(8716, '713593493', 508),
(8722, '705044665', 369),
(8723, '714886905', 369),
(8734, '777313821', 733),
(8735, '777313821', 750),
(8741, '774744521', 418),
(8742, '774744521', 444),
(8743, '774744521', 467),
(8744, '774744521', 491),
(8745, '774744521', 424),
(8746, '774744521', 342),
(8747, '774744521', 365),
(8748, '774744521', 390),
(8749, '774744521', 503),
(8750, '774744521', 545),
(8751, '767242542', 446),
(8752, '767242542', 493),
(8753, '767242542', 516),
(8754, '767242542', 369),
(8755, '767242542', 506),
(8756, '767242542', 548),
(8757, '778139052', 282),
(8758, '778139052', 656),
(8759, '778139052', 286),
(8760, '778139052', 289),
(8763, '778945475', 417),
(8764, '778945475', 330),
(8765, '778945475', 326),
(8766, '778945475', 331),
(8767, '718937175', 279),
(8768, '769756758', 751),
(8769, '712479890', 589),
(8770, '712479890', 439),
(8771, '712479890', 682),
(8772, '712479890', 359),
(8773, '712479890', 677),
(8774, '712479890', 463),
(8775, '712479890', 488),
(8776, '712479890', 384),
(8777, '712479890', 668),
(8778, '712479890', 696),
(8779, '712479890', 785),
(8780, '712479890', 499),
(8781, '712479890', 422),
(8782, '712479890', 664),
(8783, '712479890', 410),
(8784, '712479890', 765),
(8785, '712479890', 680),
(8786, '712479890', 614),
(8787, '712479890', 709),
(8788, '712479890', 533),
(8789, '712479890', 781),
(8790, '712479890', 720),
(8791, '712479890', 397),
(8792, '712479890', 631),
(8793, '712479890', 775),
(8794, '712479890', 511),
(8802, '784763589', 587),
(8803, '784763589', 509),
(8804, '703815172', 382),
(8805, '703815172', 666),
(8809, '764252384', 354),
(8810, '764252384', 377),
(8811, '706050121', 440),
(8812, '706050121', 684),
(8813, '706050121', 698),
(8814, '706050121', 422),
(8815, '706050121', 664),
(8816, '706050121', 409),
(8817, '706050121', 672),
(8818, '706050121', 522),
(8819, '706050121', 357),
(8820, '706050121', 674),
(8821, '706050121', 382),
(8822, '706050121', 666),
(8823, '706050121', 398),
(8824, '784381511', 282),
(8825, '784381511', 284),
(8826, '778520056', 411),
(8827, '778520056', 673),
(8828, '771517752', 405),
(8829, '771517752', 517),
(8830, '771517752', 393),
(8831, '761974948', 362),
(8832, '761974948', 556),
(8844, '784937844', 590),
(8845, '784937844', 724),
(8846, '784937844', 383),
(8847, '784937844', 668),
(8848, '784937844', 410),
(8849, '784937844', 397),
(8850, '771723021', 446),
(8851, '771723021', 469),
(8852, '771723021', 493),
(8853, '771723021', 345),
(8854, '771723021', 369),
(8855, '714474528', 270),
(8856, '714474528', 266),
(8857, '778327206', 462),
(8858, '778327206', 531),
(8859, '784917309', 354),
(8860, '784917309', 377),
(8861, '775485361', 575),
(8862, '775485361', 408),
(8863, '775485361', 509),
(8881, '761828278', 442),
(8882, '761828278', 423),
(8883, '718222089', 439),
(8884, '718222089', 682),
(8885, '718222089', 488),
(8886, '718222089', 383),
(8887, '718222089', 668),
(8888, '718222089', 422),
(8889, '711492216', 263),
(8890, '775510084', 352),
(8891, '775510084', 375),
(8892, '775510084', 573),
(8893, '772311283', 589),
(8894, '772311283', 538),
(8895, '772311283', 409),
(8896, '772311283', 382),
(8897, '712851434', 348),
(8898, '712851434', 403),
(8903, '761311695', 446),
(8904, '761311695', 469),
(8905, '761311695', 506),
(8924, '773826440', 342),
(8925, '773826440', 365),
(8929, '779108599', 281),
(8930, '703004398', 364),
(8931, '703004398', 679),
(8932, '703004398', 387),
(8933, '703004398', 669),
(8934, '775188189', 281),
(8954, '713437855', 387),
(8955, '711575858', 373),
(8956, '776706761', 434),
(8957, '776706761', 419),
(8958, '776706761', 446),
(8959, '776706761', 403),
(8960, '776706761', 493),
(8961, '776706761', 515),
(8962, '776706761', 346),
(8963, '776706761', 369),
(8964, '776706761', 392),
(8965, '776706761', 506),
(8966, '776706761', 548),
(8967, '764681581', 519),
(8968, '764681581', 354),
(8969, '764681581', 563),
(8970, '764681581', 377),
(8971, '762043885', 742),
(8972, '762043885', 757),
(8973, '762043885', 733),
(8974, '762043885', 750),
(8975, '762043885', 736),
(8976, '762043885', 783),
(8977, '776436008', 373),
(8978, '776436008', 393),
(8979, '786681877', 386),
(8980, '786681877', 667),
(8981, '717799824', 382),
(8982, '717799824', 666),
(9001, '711537022', 433),
(9002, '711537022', 403),
(9003, '711537022', 369),
(9004, '771352827', 369),
(9005, '771352827', 628),
(9015, '715344064', 469),
(9016, '715344064', 516),
(9017, '715344064', 391),
(9018, '717237117', 399),
(9023, '753805905', 383),
(9024, '753805905', 668),
(9025, '753805905', 785),
(9026, '753805905', 672),
(9027, '777910741', 440),
(9028, '777910741', 422),
(9029, '777910741', 382),
(9030, '778632000', 360),
(9031, '778632000', 678),
(9032, '778632000', 383),
(9033, '778632000', 668),
(9034, '778632000', 698),
(9035, '778632000', 398),
(9036, '776364007', 428),
(9037, '715326942', 406),
(9038, '715326942', 471),
(9039, '715326942', 517),
(9040, '715326942', 350),
(9041, '715326942', 373),
(9042, '715387110', 387),
(9043, '715387110', 669),
(9050, '719797185', 446),
(9051, '719797185', 469),
(9052, '719797185', 493),
(9053, '719797185', 369),
(9054, '719797185', 548),
(9055, '722112991', 435),
(9056, '722112991', 460),
(9057, '722112991', 494),
(9058, '722112991', 420),
(9059, '775749645', 517),
(9060, '775749645', 718),
(9061, '775749645', 508),
(9068, '710482004', 405),
(9069, '710482004', 517),
(9070, '710482004', 779),
(9071, '710482004', 373),
(9072, '710482004', 508),
(9078, '704800036', 437),
(9079, '704800036', 485),
(9080, '704800036', 379),
(9081, '704800036', 498),
(9082, '717363442', 437),
(9083, '717363442', 356),
(9084, '717363442', 461),
(9085, '717363442', 485),
(9086, '717363442', 379),
(9087, '717363442', 498),
(9088, '717363442', 421),
(9089, '717363442', 532),
(9090, '717363442', 396),
(9091, '774123334', 537),
(9092, '754448224', 379),
(9093, '718313023', 347),
(9094, '718313023', 371),
(9095, '718313023', 403),
(9096, '718313023', 516),
(9097, '718313023', 778),
(9098, '718313023', 560),
(9099, '718313023', 506),
(9100, '774877315', 446),
(9101, '774877315', 469),
(9102, '774877315', 493),
(9103, '774877315', 345),
(9104, '774877315', 369),
(9110, '773987842', 434),
(9111, '773987842', 446),
(9112, '773987842', 469),
(9113, '773987842', 493),
(9114, '773987842', 515),
(9115, '773987842', 345),
(9116, '773987842', 369),
(9117, '773987842', 392),
(9118, '773987842', 767),
(9119, '773987842', 547),
(9120, '774869582', 375),
(9126, '760319568', 353),
(9127, '752129504', 538),
(9128, '752129504', 694),
(9129, '752129504', 501),
(9130, '752129504', 382),
(9131, '716437869', 749),
(9132, '711500238', 446),
(9133, '711500238', 469),
(9134, '711500238', 493),
(9135, '711500238', 369),
(9141, '715344139', 351),
(9142, '715344139', 483),
(9143, '715344139', 375),
(9144, '715344139', 393),
(9145, '715344139', 508),
(9146, '776125046', 529),
(9147, '786148826', 299),
(9148, '786148826', 618),
(9149, '786148826', 295),
(9150, '786148826', 301),
(9159, '779801680', 386),
(9160, '779801680', 667),
(9164, '772538383', 436),
(9165, '772538383', 352),
(9166, '773710577', 440),
(9167, '773710577', 541),
(9168, '717974771', 736),
(9173, '781904595', 387),
(9174, '771065392', 297),
(9177, '779306215', 742),
(9178, '779306215', 743),
(9179, '779306215', 733),
(9180, '779306215', 750),
(9181, '779306215', 736),
(9205, '777312944', 441),
(9206, '777312944', 683),
(9207, '777312944', 364),
(9208, '777312944', 679),
(9209, '777312944', 387),
(9210, '777312944', 669),
(9211, '777312944', 543),
(9212, '777312944', 691),
(9213, '777312944', 604),
(9214, '777312944', 523),
(9215, '767349975', 448),
(9216, '767349975', 406),
(9217, '767349975', 350),
(9218, '767349975', 561),
(9219, '767349975', 373),
(9221, '779510188', 519),
(9234, '716202999', 312),
(9235, '716202999', 314),
(9236, '751859368', 351),
(9237, '751859368', 375),
(9238, '719016707', 450),
(9239, '719016707', 473),
(9240, '719016707', 520),
(9241, '719016707', 519),
(9242, '719016707', 563),
(9243, '777219235', 387),
(9244, '777219235', 669),
(9245, '783972161', 266),
(9246, '764541453', 434),
(9247, '764541453', 446),
(9248, '764541453', 469),
(9249, '764541453', 515),
(9250, '705950626', 582),
(9251, '705950626', 581),
(9252, '705950626', 432),
(9253, '705950626', 431),
(9254, '705950626', 344),
(9255, '705950626', 343),
(9256, '705950626', 456),
(9257, '705950626', 455),
(9258, '705950626', 479),
(9259, '705950626', 367),
(9260, '705950626', 368),
(9261, '705950626', 492),
(9262, '705950626', 418),
(9263, '705950626', 570),
(9264, '705950626', 569),
(9265, '705950626', 594),
(9266, '705950626', 593),
(9267, '705950626', 401),
(9268, '705950626', 402),
(9269, '705950626', 491),
(9270, '705950626', 424),
(9271, '705950626', 525),
(9272, '705950626', 526),
(9273, '705950626', 514),
(9274, '705950626', 513),
(9275, '705950626', 341),
(9276, '705950626', 342),
(9277, '705950626', 558),
(9278, '705950626', 557),
(9279, '705950626', 365),
(9280, '705950626', 390),
(9281, '705950626', 389),
(9282, '705950626', 627),
(9283, '705950626', 771),
(9284, '705950626', 503),
(9285, '705950626', 504),
(9286, '705950626', 545),
(9287, '705950626', 546),
(9288, '718505585', 444),
(9289, '718505585', 401),
(9290, '718505585', 467),
(9291, '718505585', 491),
(9292, '718505585', 424),
(9293, '718505585', 341),
(9294, '718505585', 365),
(9295, '718505585', 627),
(9296, '779064019', 446),
(9297, '779064019', 572),
(9298, '779064019', 403),
(9299, '779064019', 469),
(9300, '779064019', 493),
(9301, '779064019', 515),
(9302, '779064019', 346),
(9303, '779064019', 369),
(9304, '779064019', 391),
(9305, '779064019', 506),
(9306, '714476731', 514),
(9307, '714476731', 365),
(9308, '714476731', 389),
(9309, '705050701', 686),
(9310, '771273518', 343),
(9311, '771273518', 367),
(9312, '714135345', 541),
(9313, '714135345', 690),
(9314, '714135345', 720),
(9315, '703559348', 444),
(9316, '713742577', 446),
(9317, '713742577', 596),
(9318, '713742577', 595),
(9319, '713742577', 469),
(9320, '713742577', 493),
(9321, '713742577', 516),
(9322, '713742577', 515),
(9323, '713742577', 345),
(9324, '713742577', 346),
(9325, '713742577', 369),
(9326, '713742577', 772),
(9327, '703684619', 379),
(9330, '772662712', 742),
(9331, '772662712', 744),
(9332, '761054917', 444),
(9333, '761054917', 467),
(9334, '761054917', 491),
(9335, '761054917', 424),
(9336, '761054917', 514),
(9337, '761054917', 341),
(9338, '761054917', 365),
(9339, '778096802', 375),
(9342, '779417749', 383),
(9343, '779417749', 668),
(9344, '773669601', 742),
(9345, '773669601', 743),
(9346, '773669601', 733),
(9347, '773669601', 741),
(9348, '773669601', 739),
(9349, '773669601', 737),
(9350, '777336673', 430),
(9351, '777336673', 687),
(9360, '772698920', 624),
(9361, '713467882', 418),
(9362, '713467882', 365),
(9370, '716299245', 352),
(9371, '718747288', 432),
(9372, '718747288', 343),
(9373, '718747288', 455),
(9374, '718747288', 479),
(9375, '718747288', 367),
(9376, '718747288', 492),
(9377, '718747288', 418),
(9378, '718747288', 660),
(9379, '718747288', 569),
(9380, '718747288', 401),
(9381, '718747288', 610),
(9382, '718747288', 525),
(9383, '718747288', 558),
(9384, '718747288', 389),
(9385, '718747288', 503),
(9386, '718747288', 546),
(9387, '742328946', 723),
(9388, '742328946', 387),
(9389, '742328946', 669),
(9390, '742328946', 604),
(9391, '773507503', 352),
(9392, '773507503', 376),
(9393, '760351908', 433),
(9394, '760351908', 419),
(9395, '760351908', 403),
(9396, '760351908', 469),
(9397, '760351908', 493),
(9398, '760351908', 516),
(9399, '760351908', 346),
(9400, '760351908', 559),
(9401, '760351908', 369),
(9402, '760351908', 392),
(9404, '742051727', 791),
(9405, '742051727', 514),
(9406, '742051727', 341),
(9407, '742051727', 365),
(9408, '703238556', 566),
(9409, '773592290', 346),
(9410, '773592290', 369),
(9412, '742128136', 441),
(9413, '742128136', 683),
(9414, '742128136', 363),
(9415, '742128136', 676),
(9416, '742128136', 387),
(9417, '742128136', 669),
(9418, '742128136', 699),
(9419, '742128136', 543),
(9420, '742128136', 691),
(9421, '742128136', 411),
(9422, '742128136', 673),
(9423, '742128136', 400),
(9424, '703505887', 267),
(9425, '777253284', 315),
(9426, '777253284', 311),
(9427, '777253284', 316),
(9431, '784994176', 295),
(9432, '707320284', 342),
(9433, '707320284', 365),
(9434, '769013149', 327),
(9435, '713359312', 360),
(9436, '713359312', 678),
(9437, '713359312', 383),
(9438, '713359312', 668),
(9439, '713359312', 698),
(9440, '713359312', 542),
(9441, '713359312', 410),
(9442, '713359312', 680),
(9443, '774378415', 685),
(9444, '774378415', 540),
(9445, '774378415', 789),
(9446, '774378415', 524),
(9447, '774378415', 675),
(9448, '774378415', 386),
(9449, '774378415', 667),
(9450, '716857159', 433),
(9451, '716857159', 348),
(9452, '716857159', 371),
(9453, '716857159', 572),
(9454, '716857159', 404),
(9455, '717269515', 283),
(9456, '717269515', 282),
(9457, '717269515', 284),
(9458, '777425653', 431),
(9459, '777425653', 344),
(9460, '777425653', 455),
(9461, '777425653', 479),
(9462, '777425653', 367),
(9463, '777425653', 492),
(9464, '777425653', 401),
(9465, '777425653', 525),
(9466, '777425653', 342),
(9467, '777425653', 365),
(9468, '777425653', 390),
(9469, '777425653', 504),
(9473, '773440806', 589),
(9474, '773440806', 664),
(9475, '767802811', 439),
(9476, '767802811', 698),
(9477, '767802811', 422),
(9478, '767802811', 541),
(9479, '767802811', 537),
(9480, '767802811', 501),
(9481, '767802811', 357),
(9482, '767802811', 674),
(9483, '767802811', 382),
(9484, '767802811', 666),
(9485, '774654567', 377),
(9486, '714846909', 353),
(9487, '714846909', 377),
(9494, '773853994', 792),
(9495, '771442428', 294),
(9538, '773627303', 582),
(9539, '773627303', 581),
(9540, '773627303', 432),
(9541, '773627303', 431),
(9548, '773842820', 607),
(9549, '773842820', 618),
(9551, '787200877', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmssms`
--

CREATE TABLE `lmssms` (
  `id` int(11) NOT NULL,
  `sa_token` varchar(4000) NOT NULL,
  `sender_id` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmssms`
--

INSERT INTO `lmssms` (`id`, `sa_token`, `sender_id`) VALUES
(1, 'QivS1637411337', 'GURUNIWASA');

-- --------------------------------------------------------

--
-- Table structure for table `lmsstudent_subject`
--

CREATE TABLE `lmsstudent_subject` (
  `ssid` int(11) NOT NULL,
  `student` int(11) NOT NULL DEFAULT '0',
  `subject` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmsstuden_video_watch`
--

CREATE TABLE `lmsstuden_video_watch` (
  `id` int(11) NOT NULL,
  `reg_no` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `lid` int(11) DEFAULT NULL,
  `allowed_view` int(11) DEFAULT NULL,
  `watched_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lmssubject`
--

CREATE TABLE `lmssubject` (
  `sid` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
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
(1, 35, 'Bsc IT', 12000, '2023-07-07 03:53:49', 'Publish', '2023-07-06', '2023-08-06');

-- --------------------------------------------------------

--
-- Table structure for table `lmssubject_tealmsr`
--

CREATE TABLE `lmssubject_tealmsr` (
  `stid` int(11) NOT NULL,
  `subject` int(11) NOT NULL DEFAULT '0',
  `tealmsr` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lmstealmsr`
--

CREATE TABLE `lmstealmsr` (
  `tid` int(11) NOT NULL,
  `systemid` int(11) NOT NULL,
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
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmstealmsr`
--

INSERT INTO `lmstealmsr` (`tid`, `systemid`, `fullname`, `address`, `contactnumber`, `subdetails`, `qualification`, `username`, `password`, `image`, `Percentage`, `add_date`, `status`) VALUES
(95, 1654706436, 'Test', 'test', '773405650', 'Grade 5 ', 'Test', 'sumudupramuditha@gmail.com', '7ac4987e5a84dbaf689eb677d4cc67ba', '', 40, '2023-07-06 12:59:16', 1),
(96, 1688717175, 'ashan', 'teacher@gmail.com', '787200877', 'test', 'test', 'teacher@teacher.com', '25f9e794323b453885f5181f1b624d0b', '', 0, '2023-07-09 06:39:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmstealmsr_multiple`
--

CREATE TABLE `lmstealmsr_multiple` (
  `tealmsr_id` int(11) NOT NULL,
  `tealmsr_system_id` int(11) NOT NULL,
  `tealmsr_type` int(11) NOT NULL,
  `tealmsr_contain_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmstealmsr_multiple`
--

INSERT INTO `lmstealmsr_multiple` (`tealmsr_id`, `tealmsr_system_id`, `tealmsr_type`, `tealmsr_contain_id`) VALUES
(1798, 1636570760, 2, 20),
(1799, 1636570760, 3, 260),
(1805, 1636572014, 2, 20),
(1806, 1636572014, 3, 260),
(1807, 1636572014, 3, 261),
(1808, 1636572014, 3, 259),
(1809, 1636572904, 2, 20),
(1810, 1636572904, 2, 32),
(1811, 1636572904, 3, 262),
(1812, 1636603577, 2, 20),
(1813, 1636603577, 3, 262),
(1820, 1636995149, 2, 20),
(1821, 1636995149, 2, 32),
(1822, 1636995149, 3, 262),
(1823, 1636999111, 2, 33),
(1824, 1636999111, 2, 34),
(1825, 1636999111, 2, 35),
(1826, 1636999111, 2, 36),
(1827, 1636999111, 2, 37),
(1828, 1636999111, 3, 279),
(1829, 1636999111, 3, 268),
(1830, 1636999111, 3, 276),
(1831, 1636999111, 3, 272),
(1832, 1636999111, 3, 274),
(2075, 1637013181, 2, 42),
(2076, 1637013181, 2, 43),
(2077, 1637013181, 2, 38),
(2078, 1637013181, 2, 39),
(2079, 1637013181, 2, 40),
(2080, 1637013181, 2, 41),
(2081, 1637013181, 3, 442),
(2082, 1637013181, 3, 440),
(2083, 1637013181, 3, 438),
(2084, 1637013181, 3, 436),
(2085, 1637013181, 3, 434),
(2086, 1637013181, 3, 432),
(2087, 1637013181, 3, 430),
(2088, 1637013181, 3, 428),
(2089, 1637013181, 3, 429),
(2090, 1637013181, 3, 425),
(2091, 1637013181, 3, 426),
(2092, 1637013181, 3, 424),
(2093, 1637013415, 2, 42),
(2094, 1637013415, 2, 43),
(2095, 1637013415, 2, 38),
(2096, 1637013415, 2, 39),
(2097, 1637013415, 2, 40),
(2098, 1637013415, 2, 41),
(2099, 1637013415, 3, 442),
(2100, 1637013415, 3, 440),
(2101, 1637013415, 3, 438),
(2102, 1637013415, 3, 436),
(2103, 1637013415, 3, 434),
(2104, 1637013415, 3, 432),
(2105, 1637013415, 3, 430),
(2106, 1637013415, 3, 428),
(2107, 1637013415, 3, 429),
(2108, 1637013415, 3, 425),
(2109, 1637013415, 3, 426),
(2110, 1637013415, 3, 424),
(2111, 1637013541, 2, 42),
(2112, 1637013541, 3, 293),
(2113, 1637013541, 3, 587),
(2268, 1637015342, 2, 42),
(2269, 1637015342, 2, 43),
(2270, 1637015342, 2, 38),
(2271, 1637015342, 2, 39),
(2272, 1637015342, 2, 40),
(2273, 1637015342, 2, 41),
(2274, 1637015342, 3, 364),
(2275, 1637015342, 3, 360),
(2276, 1637015342, 3, 356),
(2277, 1637015342, 3, 352),
(2278, 1637015342, 3, 348),
(2279, 1637015342, 3, 344),
(2752, 1637014609, 2, 42),
(2753, 1637014609, 2, 43),
(2754, 1637014609, 2, 38),
(2755, 1637014609, 2, 39),
(2756, 1637014609, 2, 40),
(2757, 1637014609, 2, 41),
(2758, 1637014609, 3, 480),
(2759, 1637014609, 3, 482),
(2760, 1637014609, 3, 484),
(2761, 1637014609, 3, 486),
(2762, 1637014609, 3, 487),
(2763, 1637014609, 3, 490),
(2764, 1637441333, 2, 42),
(2765, 1637441333, 2, 43),
(2766, 1637441333, 2, 38),
(2767, 1637441333, 2, 39),
(2768, 1637441333, 2, 40),
(2769, 1637441333, 2, 41),
(2770, 1637441333, 3, 633),
(2771, 1637441333, 3, 634),
(2772, 1637441333, 3, 635),
(2773, 1637441333, 3, 636),
(2774, 1637441333, 3, 637),
(2775, 1637441333, 3, 638),
(2810, 1637441883, 2, 33),
(2811, 1637441883, 2, 42),
(2812, 1637441883, 2, 43),
(2813, 1637441883, 2, 34),
(2814, 1637441883, 2, 35),
(2815, 1637441883, 2, 36),
(2816, 1637441883, 2, 37),
(2817, 1637441883, 2, 38),
(2818, 1637441883, 2, 39),
(2819, 1637441883, 2, 40),
(2820, 1637441883, 2, 41),
(2821, 1637441883, 3, 644),
(2822, 1637441883, 3, 645),
(2823, 1637441883, 3, 646),
(2824, 1637441883, 3, 647),
(2825, 1637441883, 3, 648),
(2826, 1637441883, 3, 649),
(2827, 1637441883, 3, 650),
(2828, 1637441883, 3, 651),
(2829, 1637441883, 3, 652),
(2830, 1637441883, 3, 653),
(2831, 1637441883, 3, 654),
(2886, 1637521989, 2, 42),
(2887, 1637521989, 2, 43),
(2888, 1637521989, 3, 724),
(2889, 1637521989, 3, 725),
(2890, 1637580198, 2, 38),
(2891, 1637580198, 2, 39),
(2892, 1637580198, 2, 40),
(2893, 1637580198, 3, 726),
(2894, 1637580198, 3, 727),
(2895, 1637580198, 3, 728),
(2896, 1637580286, 2, 42),
(2897, 1637580286, 2, 43),
(2898, 1637580286, 2, 41),
(2899, 1637580286, 3, 729),
(2900, 1637580286, 3, 730),
(2901, 1637580286, 3, 731),
(3823, 1638445782, 2, 42),
(3824, 1638445782, 2, 43),
(3825, 1638445782, 3, 769),
(3826, 1638445782, 3, 768),
(4902, 1637437854, 2, 42),
(4903, 1637437854, 2, 43),
(4904, 1637437854, 2, 38),
(4905, 1637437854, 2, 39),
(4906, 1637437854, 2, 40),
(4907, 1637437854, 2, 41),
(4908, 1637437854, 3, 443),
(4909, 1637437854, 3, 445),
(4910, 1637437854, 3, 447),
(4911, 1637437854, 3, 449),
(4912, 1637437854, 3, 451),
(4913, 1637437854, 3, 453),
(4914, 1637437854, 3, 468),
(4915, 1637437854, 3, 470),
(4916, 1637437854, 3, 472),
(4917, 1637437854, 3, 474),
(4918, 1637437854, 3, 476),
(4919, 1637437854, 3, 478),
(4920, 1637437854, 3, 756),
(4999, 1637016882, 2, 44),
(5000, 1637016882, 2, 42),
(5001, 1637016882, 2, 43),
(5002, 1637016882, 2, 38),
(5003, 1637016882, 2, 39),
(5004, 1637016882, 2, 40),
(5005, 1637016882, 2, 41),
(5006, 1637016882, 3, 387),
(5007, 1637016882, 3, 383),
(5008, 1637016882, 3, 379),
(5009, 1637016882, 3, 375),
(5010, 1637016882, 3, 371),
(5011, 1637016882, 3, 367),
(5012, 1637016882, 3, 733),
(5013, 1637016882, 3, 750),
(5014, 1637016882, 3, 668),
(5015, 1637016882, 3, 669),
(5016, 1637016882, 3, 732),
(5017, 1637016882, 3, 386),
(5018, 1637016882, 3, 382),
(5019, 1637016882, 3, 377),
(5020, 1637016882, 3, 373),
(5021, 1637016882, 3, 369),
(5022, 1637016882, 3, 365),
(5023, 1637016882, 3, 749),
(5024, 1637016882, 3, 666),
(5025, 1637016882, 3, 667),
(5026, 1637014056, 2, 44),
(5027, 1637014056, 2, 42),
(5028, 1637014056, 2, 43),
(5029, 1637014056, 2, 38),
(5030, 1637014056, 2, 39),
(5031, 1637014056, 2, 40),
(5032, 1637014056, 2, 41),
(5033, 1637014056, 3, 698),
(5034, 1637014056, 3, 699),
(5035, 1637014056, 3, 741),
(5036, 1637014056, 3, 754),
(5037, 1637014056, 3, 400),
(5038, 1637014056, 3, 398),
(5039, 1637014056, 3, 396),
(5040, 1637014056, 3, 394),
(5041, 1637014056, 3, 392),
(5042, 1637014056, 3, 390),
(5065, 1637016644, 2, 33),
(5066, 1637016644, 2, 42),
(5067, 1637016644, 2, 43),
(5068, 1637016644, 2, 34),
(5069, 1637016644, 2, 35),
(5070, 1637016644, 2, 36),
(5071, 1637016644, 2, 37),
(5072, 1637016644, 2, 38),
(5073, 1637016644, 2, 39),
(5074, 1637016644, 2, 40),
(5075, 1637016644, 2, 41),
(5076, 1637016644, 3, 783),
(5077, 1637016644, 3, 336),
(5078, 1637016644, 3, 321),
(5079, 1637016644, 3, 306),
(5080, 1637016644, 3, 291),
(5081, 1637016644, 3, 276),
(5082, 1637016644, 3, 569),
(5083, 1637016644, 3, 571),
(5084, 1637016644, 3, 573),
(5085, 1637016644, 3, 575),
(5086, 1637016644, 3, 577),
(5087, 1637016644, 3, 579),
(5088, 1637002885, 2, 33),
(5089, 1637002885, 2, 42),
(5090, 1637002885, 2, 43),
(5091, 1637002885, 2, 34),
(5092, 1637002885, 2, 35),
(5093, 1637002885, 2, 36),
(5094, 1637002885, 2, 37),
(5095, 1637002885, 2, 38),
(5096, 1637002885, 2, 39),
(5097, 1637002885, 2, 40),
(5098, 1637002885, 2, 41),
(5099, 1637002885, 3, 327),
(5100, 1637002885, 3, 312),
(5101, 1637002885, 3, 297),
(5102, 1637002885, 3, 337),
(5103, 1637002885, 3, 322),
(5104, 1637002885, 3, 307),
(5105, 1637002885, 3, 292),
(5106, 1637002885, 3, 277),
(5107, 1637002885, 3, 570),
(5108, 1637002885, 3, 572),
(5109, 1637002885, 3, 574),
(5110, 1637002885, 3, 576),
(5111, 1637002885, 3, 578),
(5112, 1637002885, 3, 580),
(5145, 1637436929, 2, 44),
(5146, 1637436929, 2, 42),
(5147, 1637436929, 2, 43),
(5148, 1637436929, 2, 38),
(5149, 1637436929, 2, 39),
(5150, 1637436929, 2, 40),
(5151, 1637436929, 2, 41),
(5152, 1637436929, 3, 364),
(5153, 1637436929, 3, 360),
(5154, 1637436929, 3, 356),
(5155, 1637436929, 3, 352),
(5156, 1637436929, 3, 348),
(5157, 1637436929, 3, 344),
(5158, 1637436929, 3, 678),
(5159, 1637436929, 3, 679),
(5160, 1637016535, 2, 33),
(5161, 1637016535, 2, 42),
(5162, 1637016535, 2, 43),
(5163, 1637016535, 2, 34),
(5164, 1637016535, 2, 35),
(5165, 1637016535, 2, 36),
(5166, 1637016535, 2, 37),
(5167, 1637016535, 2, 38),
(5168, 1637016535, 2, 39),
(5169, 1637016535, 2, 40),
(5170, 1637016535, 2, 41),
(5171, 1637016535, 3, 332),
(5172, 1637016535, 3, 317),
(5173, 1637016535, 3, 302),
(5174, 1637016535, 3, 289),
(5175, 1637016535, 3, 274),
(5176, 1637016535, 3, 545),
(5177, 1637016535, 3, 547),
(5178, 1637016535, 3, 549),
(5179, 1637016535, 3, 551),
(5180, 1637016535, 3, 553),
(5181, 1637016535, 3, 555),
(5182, 1637441060, 2, 33),
(5183, 1637441060, 2, 42),
(5184, 1637441060, 2, 43),
(5185, 1637441060, 2, 34),
(5186, 1637441060, 2, 35),
(5187, 1637441060, 2, 36),
(5188, 1637441060, 2, 37),
(5189, 1637441060, 2, 38),
(5190, 1637441060, 2, 39),
(5191, 1637441060, 2, 40),
(5192, 1637441060, 2, 41),
(5193, 1637441060, 3, 605),
(5194, 1637441060, 3, 606),
(5195, 1637441060, 3, 607),
(5196, 1637441060, 3, 608),
(5197, 1637441060, 3, 609),
(5198, 1637441060, 3, 610),
(5199, 1637441060, 3, 611),
(5200, 1637441060, 3, 612),
(5201, 1637441060, 3, 613),
(5202, 1637441060, 3, 614),
(5203, 1637441060, 3, 615),
(5204, 1637438609, 2, 44),
(5205, 1637438609, 2, 42),
(5206, 1637438609, 2, 43),
(5207, 1637438609, 2, 38),
(5208, 1637438609, 2, 39),
(5209, 1637438609, 2, 40),
(5210, 1637438609, 2, 41),
(5211, 1637438609, 3, 748),
(5212, 1637438609, 3, 752),
(5213, 1637438609, 3, 361),
(5214, 1637438609, 3, 357),
(5215, 1637438609, 3, 353),
(5216, 1637438609, 3, 349),
(5217, 1637438609, 3, 345),
(5218, 1637438609, 3, 341),
(5219, 1637438609, 3, 674),
(5220, 1637438609, 3, 675),
(5221, 1637015876, 2, 44),
(5222, 1637015876, 2, 42),
(5223, 1637015876, 2, 43),
(5224, 1637015876, 3, 542),
(5225, 1637015876, 3, 544),
(5226, 1637015876, 3, 692),
(5227, 1637015876, 3, 693),
(5250, 1637013042, 2, 44),
(5251, 1637013042, 2, 42),
(5252, 1637013042, 2, 43),
(5253, 1637013042, 2, 41),
(5254, 1637013042, 3, 722),
(5255, 1637013042, 3, 723),
(5256, 1637013042, 3, 739),
(5257, 1637013042, 3, 423),
(5258, 1637013042, 3, 422),
(5259, 1637013042, 3, 421),
(5260, 1637441215, 2, 33),
(5261, 1637441215, 2, 42),
(5262, 1637441215, 2, 43),
(5263, 1637441215, 2, 34),
(5264, 1637441215, 2, 35),
(5265, 1637441215, 2, 36),
(5266, 1637441215, 2, 37),
(5267, 1637441215, 2, 38),
(5268, 1637441215, 2, 39),
(5269, 1637441215, 2, 40),
(5270, 1637441215, 2, 41),
(5271, 1637441215, 3, 655),
(5272, 1637441215, 3, 656),
(5273, 1637441215, 3, 657),
(5274, 1637441215, 3, 658),
(5275, 1637441215, 3, 659),
(5276, 1637441215, 3, 660),
(5277, 1637441215, 3, 661),
(5278, 1637441215, 3, 662),
(5279, 1637441215, 3, 663),
(5280, 1637441215, 3, 664),
(5281, 1637441215, 3, 665),
(5282, 1637521372, 2, 33),
(5283, 1637521372, 2, 42),
(5284, 1637521372, 2, 43),
(5285, 1637521372, 2, 34),
(5286, 1637521372, 2, 35),
(5287, 1637521372, 2, 36),
(5288, 1637521372, 2, 37),
(5289, 1637521372, 2, 38),
(5290, 1637521372, 2, 39),
(5291, 1637521372, 2, 40),
(5292, 1637521372, 2, 41),
(5293, 1637521372, 3, 700),
(5294, 1637521372, 3, 701),
(5295, 1637521372, 3, 702),
(5296, 1637521372, 3, 703),
(5297, 1637521372, 3, 704),
(5298, 1637521372, 3, 705),
(5299, 1637521372, 3, 706),
(5300, 1637521372, 3, 707),
(5301, 1637521372, 3, 708),
(5302, 1637521372, 3, 709),
(5303, 1637521372, 3, 710),
(5304, 1637014755, 2, 42),
(5305, 1637014755, 2, 43),
(5306, 1637014755, 2, 38),
(5307, 1637014755, 2, 39),
(5308, 1637014755, 2, 40),
(5309, 1637014755, 2, 41),
(5310, 1637014755, 3, 492),
(5311, 1637014755, 3, 494),
(5312, 1637014755, 3, 495),
(5313, 1637014755, 3, 498),
(5314, 1637014755, 3, 499),
(5315, 1637014755, 3, 500),
(5316, 1637014755, 3, 491),
(5317, 1637014755, 3, 493),
(5318, 1637014755, 3, 496),
(5319, 1637014755, 3, 497),
(5320, 1637014755, 3, 501),
(5321, 1637014755, 3, 502),
(5322, 1637012423, 2, 44),
(5323, 1637012423, 2, 42),
(5324, 1637012423, 2, 43),
(5325, 1637012423, 2, 38),
(5326, 1637012423, 2, 39),
(5327, 1637012423, 2, 40),
(5328, 1637012423, 2, 41),
(5329, 1637012423, 3, 411),
(5330, 1637012423, 3, 409),
(5331, 1637012423, 3, 407),
(5332, 1637012423, 3, 405),
(5333, 1637012423, 3, 403),
(5334, 1637012423, 3, 401),
(5335, 1637012423, 3, 759),
(5336, 1637012423, 3, 672),
(5337, 1637012423, 3, 673),
(5338, 1637012423, 3, 362),
(5339, 1637012423, 3, 358),
(5340, 1637012423, 3, 354),
(5341, 1637012423, 3, 350),
(5342, 1637012423, 3, 346),
(5343, 1637012423, 3, 342),
(5344, 1637014510, 2, 42),
(5345, 1637014510, 2, 43),
(5346, 1637014510, 2, 38),
(5347, 1637014510, 2, 39),
(5348, 1637014510, 2, 40),
(5349, 1637014510, 2, 41),
(5350, 1637014510, 3, 479),
(5351, 1637014510, 3, 481),
(5352, 1637014510, 3, 483),
(5353, 1637014510, 3, 485),
(5354, 1637014510, 3, 488),
(5355, 1637014510, 3, 489),
(5356, 1637016292, 2, 33),
(5357, 1637016292, 2, 42),
(5358, 1637016292, 2, 43),
(5359, 1637016292, 2, 34),
(5360, 1637016292, 2, 35),
(5361, 1637016292, 2, 36),
(5362, 1637016292, 2, 37),
(5363, 1637016292, 2, 38),
(5364, 1637016292, 2, 39),
(5365, 1637016292, 2, 40),
(5366, 1637016292, 2, 41),
(5367, 1637016292, 3, 335),
(5368, 1637016292, 3, 320),
(5369, 1637016292, 3, 305),
(5370, 1637016292, 3, 288),
(5371, 1637016292, 3, 273),
(5372, 1637016292, 3, 558),
(5373, 1637016292, 3, 560),
(5374, 1637016292, 3, 562),
(5375, 1637016292, 3, 564),
(5376, 1637016292, 3, 566),
(5377, 1637016292, 3, 568),
(5378, 1637521481, 2, 33),
(5379, 1637521481, 2, 42),
(5380, 1637521481, 2, 43),
(5381, 1637521481, 2, 34),
(5382, 1637521481, 2, 35),
(5383, 1637521481, 2, 36),
(5384, 1637521481, 2, 37),
(5385, 1637521481, 2, 38),
(5386, 1637521481, 2, 39),
(5387, 1637521481, 2, 40),
(5388, 1637521481, 2, 41),
(5389, 1637521481, 3, 711),
(5390, 1637521481, 3, 712),
(5391, 1637521481, 3, 713),
(5392, 1637521481, 3, 714),
(5393, 1637521481, 3, 715),
(5394, 1637521481, 3, 716),
(5395, 1637521481, 3, 717),
(5396, 1637521481, 3, 718),
(5397, 1637521481, 3, 719),
(5398, 1637521481, 3, 720),
(5399, 1637521481, 3, 721),
(5400, 1637012868, 2, 33),
(5401, 1637012868, 2, 34),
(5402, 1637012868, 2, 35),
(5403, 1637012868, 2, 36),
(5404, 1637012868, 2, 37),
(5405, 1637012868, 2, 38),
(5406, 1637012868, 2, 39),
(5407, 1637012868, 2, 40),
(5408, 1637012868, 3, 420),
(5409, 1637012868, 3, 419),
(5410, 1637012868, 3, 418),
(5411, 1637012868, 3, 417),
(5412, 1637012868, 3, 416),
(5413, 1637012868, 3, 415),
(5414, 1637012868, 3, 414),
(5415, 1637012868, 3, 413),
(5416, 1637015639, 2, 44),
(5417, 1637015639, 2, 42),
(5418, 1637015639, 2, 43),
(5419, 1637015639, 3, 541),
(5420, 1637015639, 3, 543),
(5421, 1637015639, 3, 537),
(5422, 1637015639, 3, 539),
(5423, 1637015639, 3, 736),
(5424, 1637015639, 3, 788),
(5425, 1637015639, 3, 789),
(5426, 1637015639, 3, 690),
(5427, 1637015639, 3, 691),
(5428, 1637016076, 2, 44),
(5429, 1637016076, 2, 33),
(5430, 1637016076, 2, 42),
(5431, 1637016076, 2, 43),
(5432, 1637016076, 2, 34),
(5433, 1637016076, 2, 35),
(5434, 1637016076, 2, 36),
(5435, 1637016076, 2, 37),
(5436, 1637016076, 2, 38),
(5437, 1637016076, 2, 39),
(5438, 1637016076, 2, 40),
(5439, 1637016076, 2, 41),
(5440, 1637016076, 3, 594),
(5441, 1637016076, 3, 596),
(5442, 1637016076, 3, 598),
(5443, 1637016076, 3, 600),
(5444, 1637016076, 3, 602),
(5445, 1637016076, 3, 603),
(5446, 1637016076, 3, 334),
(5447, 1637016076, 3, 319),
(5448, 1637016076, 3, 304),
(5449, 1637016076, 3, 287),
(5450, 1637016076, 3, 272),
(5451, 1637016076, 3, 557),
(5452, 1637016076, 3, 559),
(5453, 1637016076, 3, 561),
(5454, 1637016076, 3, 563),
(5455, 1637016076, 3, 565),
(5456, 1637016076, 3, 567),
(5457, 1637016076, 3, 784),
(5458, 1637441792, 2, 33),
(5459, 1637441792, 2, 42),
(5460, 1637441792, 2, 43),
(5461, 1637441792, 2, 34),
(5462, 1637441792, 2, 35),
(5463, 1637441792, 2, 36),
(5464, 1637441792, 2, 37),
(5465, 1637441792, 2, 38),
(5466, 1637441792, 2, 39),
(5467, 1637441792, 2, 40),
(5468, 1637441792, 2, 41),
(5469, 1637441792, 3, 616),
(5470, 1637441792, 3, 617),
(5471, 1637441792, 3, 618),
(5472, 1637441792, 3, 619),
(5473, 1637441792, 3, 620),
(5474, 1637441792, 3, 621),
(5475, 1637441792, 3, 622),
(5476, 1637441792, 3, 623),
(5477, 1637441792, 3, 624),
(5478, 1637441792, 3, 625),
(5479, 1637441792, 3, 626),
(5502, 1638171126, 2, 42),
(5503, 1638171126, 2, 43),
(5504, 1638171126, 3, 765),
(5505, 1638171126, 3, 766),
(5506, 1637017362, 2, 42),
(5507, 1637017362, 2, 43),
(5508, 1637017362, 2, 38),
(5509, 1637017362, 2, 39),
(5510, 1637017362, 2, 40),
(5511, 1637017362, 2, 41),
(5512, 1637017362, 3, 388),
(5513, 1637017362, 3, 384),
(5514, 1637017362, 3, 380),
(5515, 1637017362, 3, 376),
(5516, 1637017362, 3, 372),
(5517, 1637017362, 3, 368),
(5518, 1637016767, 2, 33),
(5519, 1637016767, 2, 42),
(5520, 1637016767, 2, 43),
(5521, 1637016767, 2, 34),
(5522, 1637016767, 2, 35),
(5523, 1637016767, 2, 36),
(5524, 1637016767, 2, 37),
(5525, 1637016767, 2, 38),
(5526, 1637016767, 2, 39),
(5527, 1637016767, 2, 40),
(5528, 1637016767, 2, 41),
(5529, 1637016767, 3, 331),
(5530, 1637016767, 3, 316),
(5531, 1637016767, 3, 301),
(5532, 1637016767, 3, 286),
(5533, 1637016767, 3, 271),
(5534, 1637016767, 3, 503),
(5535, 1637016767, 3, 767),
(5536, 1637016767, 3, 507),
(5537, 1637016767, 3, 509),
(5538, 1637016767, 3, 511),
(5539, 1637016767, 3, 512),
(5552, 1637015781, 2, 44),
(5553, 1637015781, 2, 42),
(5554, 1637015781, 2, 43),
(5555, 1637015781, 3, 735),
(5556, 1637015781, 3, 538),
(5557, 1637015781, 3, 540),
(5558, 1637015781, 3, 761),
(5559, 1637015781, 3, 694),
(5560, 1637015781, 3, 695),
(5561, 1637015976, 2, 42),
(5562, 1637015976, 2, 43),
(5563, 1637015976, 2, 38),
(5564, 1637015976, 2, 39),
(5565, 1637015976, 2, 40),
(5566, 1637015976, 2, 41),
(5567, 1637015976, 3, 593),
(5568, 1637015976, 3, 595),
(5569, 1637015976, 3, 597),
(5570, 1637015976, 3, 599),
(5571, 1637015976, 3, 601),
(5572, 1637015976, 3, 604),
(5573, 1637012748, 2, 44),
(5574, 1637012748, 2, 42),
(5575, 1637012748, 2, 43),
(5576, 1637012748, 2, 38),
(5577, 1637012748, 2, 39),
(5578, 1637012748, 2, 40),
(5579, 1637012748, 2, 41),
(5580, 1637012748, 3, 737),
(5581, 1637012748, 3, 412),
(5582, 1637012748, 3, 410),
(5583, 1637012748, 3, 408),
(5584, 1637012748, 3, 406),
(5585, 1637012748, 3, 404),
(5586, 1637012748, 3, 402),
(5587, 1637012748, 3, 760),
(5588, 1637012748, 3, 680),
(5589, 1637012748, 3, 681),
(5590, 1637002735, 2, 35),
(5591, 1637002735, 2, 36),
(5592, 1637002735, 2, 37),
(5593, 1637002735, 3, 326),
(5594, 1637002735, 3, 311),
(5595, 1637002735, 3, 296),
(5596, 1637439138, 2, 33),
(5597, 1637439138, 2, 42),
(5598, 1637439138, 2, 43),
(5599, 1637439138, 2, 34),
(5600, 1637439138, 2, 35),
(5601, 1637439138, 2, 36),
(5602, 1637439138, 2, 37),
(5603, 1637439138, 2, 38),
(5604, 1637439138, 2, 39),
(5605, 1637439138, 2, 40),
(5606, 1637439138, 2, 41),
(5607, 1637439138, 3, 339),
(5608, 1637439138, 3, 324),
(5609, 1637439138, 3, 309),
(5610, 1637439138, 3, 294),
(5611, 1637439138, 3, 279),
(5612, 1637439138, 3, 582),
(5613, 1637439138, 3, 584),
(5614, 1637439138, 3, 586),
(5615, 1637439138, 3, 588),
(5616, 1637439138, 3, 590),
(5617, 1637439138, 3, 592),
(5618, 1637438258, 2, 44),
(5619, 1637438258, 2, 42),
(5620, 1637438258, 2, 43),
(5621, 1637438258, 2, 38),
(5622, 1637438258, 2, 39),
(5623, 1637438258, 2, 40),
(5624, 1637438258, 2, 41),
(5625, 1637438258, 3, 442),
(5626, 1637438258, 3, 440),
(5627, 1637438258, 3, 438),
(5628, 1637438258, 3, 436),
(5629, 1637438258, 3, 434),
(5630, 1637438258, 3, 432),
(5631, 1637438258, 3, 747),
(5632, 1637438258, 3, 758),
(5633, 1637438258, 3, 684),
(5634, 1637438258, 3, 685),
(5635, 1637438258, 3, 746),
(5636, 1637438258, 3, 430),
(5637, 1637438258, 3, 428),
(5638, 1637438258, 3, 429),
(5639, 1637438258, 3, 425),
(5640, 1637438258, 3, 426),
(5641, 1637438258, 3, 424),
(5642, 1637438258, 3, 755),
(5643, 1637438258, 3, 686),
(5644, 1637438258, 3, 687),
(5645, 1637438060, 2, 44),
(5646, 1637438060, 2, 42),
(5647, 1637438060, 2, 43),
(5648, 1637438060, 2, 38),
(5649, 1637438060, 2, 39),
(5650, 1637438060, 2, 40),
(5651, 1637438060, 2, 41),
(5652, 1637438060, 3, 696),
(5653, 1637438060, 3, 697),
(5654, 1637438060, 3, 734),
(5655, 1637438060, 3, 753),
(5656, 1637438060, 3, 787),
(5657, 1637438060, 3, 785),
(5658, 1637438060, 3, 786),
(5659, 1637438060, 3, 399),
(5660, 1637438060, 3, 397),
(5661, 1637438060, 3, 395),
(5662, 1637438060, 3, 393),
(5663, 1637438060, 3, 391),
(5664, 1637438060, 3, 389),
(5665, 1637438060, 3, 504),
(5666, 1637438060, 3, 506),
(5667, 1637438060, 3, 508),
(5668, 1637438060, 3, 510),
(5669, 1637013637, 2, 44),
(5670, 1637013637, 2, 42),
(5671, 1637013637, 2, 43),
(5672, 1637013637, 2, 38),
(5673, 1637013637, 2, 39),
(5674, 1637013637, 2, 40),
(5675, 1637013637, 2, 41),
(5676, 1637013637, 3, 441),
(5677, 1637013637, 3, 439),
(5678, 1637013637, 3, 437),
(5679, 1637013637, 3, 435),
(5680, 1637013637, 3, 433),
(5681, 1637013637, 3, 431),
(5682, 1637013637, 3, 742),
(5683, 1637013637, 3, 757),
(5684, 1637013637, 3, 682),
(5685, 1637013637, 3, 683),
(5696, 1637016409, 2, 44),
(5697, 1637016409, 2, 33),
(5698, 1637016409, 2, 42),
(5699, 1637016409, 2, 43),
(5700, 1637016409, 2, 34),
(5701, 1637016409, 2, 35),
(5702, 1637016409, 2, 36),
(5703, 1637016409, 2, 37),
(5704, 1637016409, 2, 38),
(5705, 1637016409, 2, 39),
(5706, 1637016409, 2, 40),
(5707, 1637016409, 2, 41),
(5708, 1637016409, 3, 740),
(5709, 1637016409, 3, 333),
(5710, 1637016409, 3, 318),
(5711, 1637016409, 3, 303),
(5712, 1637016409, 3, 290),
(5713, 1637016409, 3, 275),
(5714, 1637016409, 3, 546),
(5715, 1637016409, 3, 548),
(5716, 1637016409, 3, 550),
(5717, 1637016409, 3, 552),
(5718, 1637016409, 3, 554),
(5719, 1637016409, 3, 556),
(5720, 1637014266, 2, 42),
(5721, 1637014266, 2, 43),
(5722, 1637014266, 2, 38),
(5723, 1637014266, 2, 39),
(5724, 1637014266, 2, 40),
(5725, 1637014266, 2, 41),
(5726, 1637014266, 3, 456),
(5727, 1637014266, 3, 458),
(5728, 1637014266, 3, 460),
(5729, 1637014266, 3, 462),
(5730, 1637014266, 3, 464),
(5731, 1637014266, 3, 466),
(5732, 1637002236, 2, 33),
(5733, 1637002236, 2, 42),
(5734, 1637002236, 2, 43),
(5735, 1637002236, 2, 34),
(5736, 1637002236, 2, 38),
(5737, 1637002236, 2, 39),
(5738, 1637002236, 2, 40),
(5739, 1637002236, 2, 41),
(5740, 1637002236, 3, 282),
(5741, 1637002236, 3, 267),
(5742, 1637002236, 3, 455),
(5743, 1637002236, 3, 457),
(5744, 1637002236, 3, 459),
(5745, 1637002236, 3, 461),
(5746, 1637002236, 3, 463),
(5747, 1637002236, 3, 465),
(5748, 1637002236, 3, 281),
(5749, 1637002236, 3, 266),
(5750, 1637015497, 2, 44),
(5751, 1637015497, 2, 42),
(5752, 1637015497, 2, 43),
(5753, 1637015497, 2, 38),
(5754, 1637015497, 2, 39),
(5755, 1637015497, 2, 40),
(5756, 1637015497, 2, 41),
(5757, 1637015497, 3, 363),
(5758, 1637015497, 3, 359),
(5759, 1637015497, 3, 355),
(5760, 1637015497, 3, 351),
(5761, 1637015497, 3, 347),
(5762, 1637015497, 3, 343),
(5763, 1637015497, 3, 743),
(5764, 1637015497, 3, 751),
(5765, 1637015497, 3, 676),
(5766, 1637015497, 3, 677),
(5767, 1637441731, 2, 42),
(5768, 1637441731, 2, 43),
(5769, 1637441731, 2, 38),
(5770, 1637441731, 2, 39),
(5771, 1637441731, 2, 40),
(5772, 1637441731, 2, 41),
(5773, 1637441731, 3, 627),
(5774, 1637441731, 3, 628),
(5775, 1637441731, 3, 629),
(5776, 1637441731, 3, 630),
(5777, 1637441731, 3, 631),
(5778, 1637441731, 3, 632),
(5779, 1637441731, 3, 771),
(5780, 1637441731, 3, 772),
(5781, 1637441731, 3, 773),
(5782, 1637441731, 3, 774),
(5783, 1637441731, 3, 775),
(5784, 1637441731, 3, 776),
(5785, 1637014393, 2, 44),
(5786, 1637014393, 2, 42),
(5787, 1637014393, 2, 43),
(5788, 1637014393, 2, 38),
(5789, 1637014393, 2, 39),
(5790, 1637014393, 2, 40),
(5791, 1637014393, 2, 41),
(5792, 1637014393, 3, 745),
(5793, 1637014393, 3, 467),
(5794, 1637014393, 3, 469),
(5795, 1637014393, 3, 471),
(5796, 1637014393, 3, 473),
(5797, 1637014393, 3, 475),
(5798, 1637014393, 3, 477),
(5799, 1638700208, 2, 33),
(5800, 1638700208, 2, 42),
(5801, 1638700208, 2, 43),
(5802, 1638700208, 2, 34),
(5803, 1638700208, 2, 35),
(5804, 1638700208, 2, 36),
(5805, 1638700208, 2, 37),
(5806, 1638700208, 2, 38),
(5807, 1638700208, 2, 39),
(5808, 1638700208, 2, 40),
(5809, 1638700208, 2, 41),
(5810, 1638700208, 3, 777),
(5811, 1638700208, 3, 778),
(5812, 1638700208, 3, 779),
(5813, 1638700208, 3, 780),
(5814, 1638700208, 3, 781),
(5815, 1638700208, 3, 782),
(5816, 1638700208, 3, 639),
(5817, 1638700208, 3, 640),
(5818, 1638700208, 3, 641),
(5819, 1638700208, 3, 642),
(5820, 1638700208, 3, 643),
(5861, 1637015206, 2, 42),
(5862, 1637015206, 2, 43),
(5863, 1637015206, 2, 38),
(5864, 1637015206, 2, 39),
(5865, 1637015206, 2, 40),
(5866, 1637015206, 2, 41),
(5867, 1637015206, 3, 525),
(5868, 1637015206, 3, 527),
(5869, 1637015206, 3, 529),
(5870, 1637015206, 3, 531),
(5871, 1637015206, 3, 533),
(5872, 1637015206, 3, 534),
(5873, 1637015206, 3, 513),
(5874, 1637015206, 3, 515),
(5875, 1637015206, 3, 517),
(5876, 1637015206, 3, 519),
(5877, 1637015206, 3, 521),
(5878, 1637015206, 3, 523),
(5879, 1637439505, 2, 33),
(5880, 1637439505, 2, 34),
(5881, 1637439505, 2, 35),
(5882, 1637439505, 2, 36),
(5883, 1637439505, 2, 37),
(5884, 1637439505, 3, 328),
(5885, 1637439505, 3, 313),
(5886, 1637439505, 3, 298),
(5887, 1637439505, 3, 283),
(5888, 1637439505, 3, 268),
(5901, 1637438797, 2, 42),
(5902, 1637438797, 2, 43),
(5903, 1637438797, 2, 38),
(5904, 1637438797, 2, 39),
(5905, 1637438797, 2, 40),
(5906, 1637438797, 2, 41),
(5907, 1637438797, 3, 514),
(5908, 1637438797, 3, 516),
(5909, 1637438797, 3, 518),
(5910, 1637438797, 3, 520),
(5911, 1637438797, 3, 522),
(5912, 1637438797, 3, 524),
(5913, 1641011968, 2, 42),
(5914, 1641011968, 2, 43),
(5915, 1641011968, 2, 38),
(5916, 1641011968, 2, 39),
(5917, 1641011968, 2, 40),
(5918, 1641011968, 2, 41),
(5919, 1641011968, 3, 526),
(5920, 1641011968, 3, 528),
(5921, 1641011968, 3, 532),
(5922, 1641011968, 3, 535),
(5923, 1641011968, 3, 536),
(5924, 1641011968, 3, 530),
(5925, 1637438922, 2, 44),
(5926, 1637438922, 2, 33),
(5927, 1637438922, 2, 42),
(5928, 1637438922, 2, 43),
(5929, 1637438922, 2, 34),
(5930, 1637438922, 2, 35),
(5931, 1637438922, 2, 36),
(5932, 1637438922, 2, 37),
(5933, 1637438922, 2, 38),
(5934, 1637438922, 2, 39),
(5935, 1637438922, 2, 40),
(5936, 1637438922, 2, 41),
(5937, 1637438922, 3, 338),
(5938, 1637438922, 3, 323),
(5939, 1637438922, 3, 308),
(5940, 1637438922, 3, 293),
(5941, 1637438922, 3, 278),
(5942, 1637438922, 3, 581),
(5943, 1637438922, 3, 583),
(5944, 1637438922, 3, 585),
(5945, 1637438922, 3, 587),
(5946, 1637438922, 3, 589),
(5947, 1637438922, 3, 591),
(5948, 1637438922, 3, 790),
(5949, 1637001198, 2, 33),
(5950, 1637001198, 2, 34),
(5951, 1637001198, 2, 35),
(5952, 1637001198, 2, 36),
(5953, 1637001198, 2, 37),
(5954, 1637001198, 3, 325),
(5955, 1637001198, 3, 310),
(5956, 1637001198, 3, 295),
(5957, 1637001198, 3, 340),
(5958, 1637001198, 3, 263),
(5959, 1637013796, 2, 33),
(5960, 1637013796, 2, 42),
(5961, 1637013796, 2, 43),
(5962, 1637013796, 2, 34),
(5963, 1637013796, 2, 35),
(5964, 1637013796, 2, 36),
(5965, 1637013796, 2, 37),
(5966, 1637013796, 2, 38),
(5967, 1637013796, 2, 39),
(5968, 1637013796, 2, 40),
(5969, 1637013796, 2, 41),
(5970, 1637013796, 3, 444),
(5971, 1637013796, 3, 446),
(5972, 1637013796, 3, 448),
(5973, 1637013796, 3, 450),
(5974, 1637013796, 3, 452),
(5975, 1637013796, 3, 454),
(5976, 1637013796, 3, 330),
(5977, 1637013796, 3, 315),
(5978, 1637013796, 3, 300),
(5979, 1637013796, 3, 285),
(5980, 1637013796, 3, 270),
(5994, 1637003145, 2, 44),
(5995, 1637003145, 2, 33),
(5996, 1637003145, 2, 34),
(5997, 1637003145, 2, 35),
(5998, 1637003145, 2, 36),
(5999, 1637003145, 2, 37),
(6000, 1637003145, 3, 744),
(6001, 1637003145, 3, 791),
(6002, 1637003145, 3, 329),
(6003, 1637003145, 3, 314),
(6004, 1637003145, 3, 299),
(6005, 1637003145, 3, 284),
(6006, 1637003145, 3, 269),
(6011, 1654706436, 2, 35),
(6012, 1654706436, 3, 1),
(6017, 1688717175, 2, 35),
(6018, 1688717175, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lmsurl`
--

CREATE TABLE `lmsurl` (
  `id` int(11) NOT NULL,
  `url` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lmsurl`
--

INSERT INTO `lmsurl` (`id`, `url`) VALUES
(1, 'http://localhost/nimesh-lms/');

-- --------------------------------------------------------

--
-- Table structure for table `lmsusers`
--

CREATE TABLE `lmsusers` (
  `user_id` int(11) NOT NULL,
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
  `classid` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `lms_answer`
--

CREATE TABLE `lms_answer` (
  `lms_answer_id` int(11) NOT NULL,
  `lms_answer_user` int(11) NOT NULL,
  `lms_answer_paper` int(11) NOT NULL,
  `lms_answer_q` int(11) NOT NULL,
  `lms_answer_a` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lms_answer`
--

INSERT INTO `lms_answer` (`lms_answer_id`, `lms_answer_user`, `lms_answer_paper`, `lms_answer_q`, `lms_answer_a`) VALUES
(12, 1322, 10, 11, 3),
(11, 1322, 10, 10, 2),
(10, 1322, 10, 9, 3),
(9, 1322, 10, 8, 1),
(8, 1609, 9, 7, 3),
(7, 1609, 9, 6, 2),
(13, 1322, 10, 12, 3),
(14, 1545, 10, 9, 2),
(15, 1545, 10, 8, 1),
(16, 1545, 10, 10, 1),
(17, 1545, 10, 11, 1),
(18, 1545, 10, 12, 1),
(19, 1355, 10, 8, 2),
(20, 1303, 10, 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `lms_exam_details`
--

CREATE TABLE `lms_exam_details` (
  `lms_exam_id` int(11) NOT NULL,
  `lms_exam_add_user` int(11) NOT NULL,
  `lms_exam_system_id` int(11) NOT NULL,
  `lms_exam_name` varchar(255) NOT NULL,
  `lms_exam_subject` int(11) NOT NULL,
  `lms_exam_question` int(11) NOT NULL,
  `lms_exam_time_duration` int(11) NOT NULL,
  `lms_exam_start_time` datetime NOT NULL,
  `lms_exam_end_time` datetime NOT NULL,
  `lms_exam_add_time` datetime NOT NULL,
  `lms_exam_pay_type` int(11) NOT NULL COMMENT '1=pay, 0=free'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lms_exam_details`
--

INSERT INTO `lms_exam_details` (`lms_exam_id`, `lms_exam_add_user`, `lms_exam_system_id`, `lms_exam_name`, `lms_exam_subject`, `lms_exam_question`, `lms_exam_time_duration`, `lms_exam_start_time`, `lms_exam_end_time`, `lms_exam_add_time`, `lms_exam_pay_type`) VALUES
(10, 68, 1640751056, 'test 01', 387, 5, 20, '2021-12-29 09:10:00', '2021-12-29 09:30:00', '2021-12-29 09:40:56', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lms_exam_report`
--

CREATE TABLE `lms_exam_report` (
  `lms_report_id` int(11) NOT NULL,
  `exam_report_user` int(11) NOT NULL,
  `exam_report_paper` int(11) NOT NULL,
  `exam_report_faced` int(11) NOT NULL,
  `exam_report_corect` int(11) NOT NULL,
  `exam_report_percent` int(11) NOT NULL,
  `exam_report_complet_time` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lms_exam_report`
--

INSERT INTO `lms_exam_report` (`lms_report_id`, `exam_report_user`, `exam_report_paper`, `exam_report_faced`, `exam_report_corect`, `exam_report_percent`, `exam_report_complet_time`, `status`) VALUES
(7, 1545, 10, 5, 0, 0, '2021-12-29 23:12:44', 1),
(6, 1322, 10, 5, 0, 0, '2021-12-29 09:46:53', 1),
(5, 1609, 9, 2, 1, 5, '2021-12-26 10:37:11', 1),
(8, 1303, 10, 1, 0, 0, '2022-01-04 09:11:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lms_mcq_questions`
--

CREATE TABLE `lms_mcq_questions` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `ans_1` text NOT NULL,
  `ans_2` text NOT NULL,
  `ans_3` text NOT NULL,
  `ans_4` text NOT NULL,
  `ans` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lms_mcq_questions`
--

INSERT INTO `lms_mcq_questions` (`id`, `exam_id`, `question`, `ans_1`, `ans_2`, `ans_3`, `ans_4`, `ans`) VALUES
(6, 9, '<p>whai is micro organisms<img alt=\"\" src=\"https://guruniwasainstitute.lk/lms/dashboard/paper_img/1640494178ABHIMANA_SIR_SCIENCE_Low_quality.jpeg\" /></p>\r\n', 'qwdqw', 'qdqdqd', 'qdqdwq', 'dqwddq', 2),
(7, 9, '<p>afsgagearbeabzsvszvzafwefwefw</p>\r\n', 'fFFWFwf', 'qfFFw', 'dwfwaffafFAf', 'vsavasvasvsv', 4),
(8, 10, '<p>test 01?</p>\r\n', '1', '2', '3', '4', 2),
(9, 10, '<p>test 2</p>\r\n', '1', '2', '3', '4', 1),
(10, 10, '<p>test 03</p>\r\n', '1', '2', '3', '4', 3),
(11, 10, '<p>test 04</p>\r\n', '1', '2', '3', '4', 4),
(12, 10, '<p>test 05</p>\r\n', '1', '2', '3', '4', 2);

-- --------------------------------------------------------

--
-- Table structure for table `lms_teacher_payment_history`
--

CREATE TABLE `lms_teacher_payment_history` (
  `lms_teacher_payment_history_id` int(11) NOT NULL,
  `lms_teacher_payment_history_tid` int(11) NOT NULL,
  `lms_teacher_payment_company_amount` float NOT NULL,
  `lms_teacher_payment_history_amount` float NOT NULL,
  `lms_teacher_payment_history_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lms_teacher_payment_history`
--

INSERT INTO `lms_teacher_payment_history` (`lms_teacher_payment_history_id`, `lms_teacher_payment_history_tid`, `lms_teacher_payment_company_amount`, `lms_teacher_payment_history_amount`, `lms_teacher_payment_history_time`) VALUES
(1, 72, 7220, 28880, '2021-12-31 13:15:08'),
(2, 68, 0, 133700, '2021-12-31 13:32:41'),
(3, 64, 1920, 7680, '2021-12-31 13:54:20'),
(4, 56, 5480, 21920, '2021-12-31 15:02:17'),
(5, 58, 5840, 23360, '2021-12-31 15:09:53'),
(6, 45, 2200, 8800, '2021-12-31 15:15:06'),
(7, 62, 1660, 6640, '2021-12-31 15:18:10'),
(8, 46, 2280, 9120, '2021-12-31 15:25:51'),
(9, 73, 4220, 16880, '2021-12-31 15:26:18'),
(10, 48, 5260, 21040, '2021-12-31 15:32:50'),
(11, 51, 540, 2160, '2021-12-31 15:35:32'),
(12, 66, 1560, 6240, '2021-12-31 18:24:30'),
(13, 79, 300, 1200, '2021-12-31 18:29:35'),
(14, 74, 2160, 8640, '2021-12-31 18:35:29'),
(15, 70, 2480, 9920, '2021-12-31 18:40:52'),
(16, 59, 240, 960, '2021-12-31 18:48:48'),
(17, 80, 860, 3440, '2021-12-31 18:53:25'),
(18, 55, 2940, 11760, '2021-12-31 19:00:04'),
(19, 86, 300, 1200, '2021-12-31 19:07:03'),
(20, 53, 1060, 4240, '2021-12-31 19:42:01'),
(21, 44, 1920, 7680, '2021-12-31 20:19:52'),
(22, 77, 660, 2640, '2021-12-31 20:25:04'),
(23, 83, 300, 1200, '2021-12-31 20:29:01'),
(24, 60, 240, 960, '2021-12-31 20:53:19'),
(25, 49, 2660, 10640, '2021-12-31 21:11:52'),
(26, 37, 480, 1920, '2021-12-31 21:14:44'),
(27, 76, 600, 2400, '2021-12-31 21:18:59'),
(28, 39, 1360, 5440, '2021-12-31 22:16:45'),
(29, 41, 1080, 4320, '2021-12-31 22:17:07'),
(30, 57, 3620, 14480, '2021-12-31 22:17:43'),
(31, 52, 1460, 5840, '2021-12-31 22:37:13'),
(32, 50, 1980, 7920, '2021-12-31 22:41:27'),
(33, 67, 1120, 4480, '2021-12-31 22:42:08'),
(34, 61, 300, 1200, '2021-12-31 22:43:10'),
(35, 92, 600, 2400, '2021-12-31 23:28:03'),
(36, 78, 960, 3840, '2021-12-31 23:51:44'),
(37, 63, 300, 1200, '2022-01-01 23:50:58'),
(38, 63, 300, 1200, '2022-01-01 23:50:58'),
(39, 43, 8700, 34800, '2022-01-02 14:45:15'),
(40, 82, 0, 1500, '2022-01-02 14:50:27'),
(41, 75, 1880, 7520, '2022-01-02 14:51:44'),
(42, 68, 0, 142800, '2022-01-31 21:32:18'),
(43, 79, 300, 1200, '2022-01-31 21:32:34'),
(44, 74, 2320, 9280, '2022-01-31 21:32:52'),
(45, 70, 3680, 14720, '2022-01-31 21:33:14'),
(46, 41, 480, 1920, '2022-01-31 21:33:25'),
(47, 80, 560, 2240, '2022-01-31 21:33:39'),
(48, 66, 960, 3840, '2022-01-31 21:33:53'),
(49, 85, 300, 1200, '2022-01-31 21:34:07'),
(50, 64, 1920, 7680, '2022-01-31 21:34:17'),
(51, 43, 8060, 32240, '2022-01-31 21:34:33'),
(52, 59, 720, 2880, '2022-01-31 21:34:51'),
(53, 42, 240, 960, '2022-01-31 21:35:07'),
(54, 56, 6160, 24640, '2022-01-31 21:35:24'),
(55, 67, 720, 2880, '2022-01-31 21:35:48'),
(56, 55, 2580, 10320, '2022-01-31 21:36:02'),
(57, 58, 4880, 19520, '2022-01-31 21:36:16'),
(58, 86, 300, 1200, '2022-01-31 21:36:29'),
(59, 69, 960, 3840, '2022-01-31 21:36:40'),
(60, 50, 1920, 7680, '2022-01-31 21:36:53'),
(61, 45, 1960, 7840, '2022-01-31 21:37:09'),
(62, 45, 0, 0, '2022-01-31 21:37:12'),
(63, 53, 1080, 4320, '2022-01-31 21:37:39'),
(64, 49, 2720, 10880, '2022-01-31 21:37:54'),
(65, 83, 300, 1200, '2022-01-31 21:38:13'),
(66, 62, 1480, 5920, '2022-01-31 21:38:31'),
(67, 87, 240, 960, '2022-01-31 21:38:50'),
(68, 39, 960, 3840, '2022-01-31 21:39:04'),
(69, 37, 480, 1920, '2022-01-31 21:39:18'),
(70, 48, 4720, 18880, '2022-01-31 21:39:31'),
(71, 46, 2720, 10880, '2022-01-31 21:39:45'),
(72, 73, 4080, 16320, '2022-01-31 21:39:59'),
(73, 77, 660, 2640, '2022-01-31 21:40:14'),
(74, 40, 240, 960, '2022-01-31 21:40:30'),
(75, 44, 1640, 6560, '2022-01-31 21:40:44'),
(76, 57, 2400, 9600, '2022-01-31 21:40:57'),
(77, 52, 3060, 12240, '2022-01-31 21:41:12'),
(78, 78, 240, 960, '2022-01-31 21:41:27'),
(79, 76, 600, 2400, '2022-01-31 21:41:41'),
(80, 75, 880, 3520, '2022-01-31 21:41:56'),
(81, 92, 900, 3600, '2022-01-31 21:42:12'),
(82, 72, 4560, 18240, '2022-01-31 21:43:01'),
(83, 63, 0, 0, '2022-01-31 21:45:15'),
(84, 65, 0, 0, '2022-01-31 21:45:35'),
(85, 61, 0, 0, '2022-01-31 21:46:05'),
(86, 90, 0, 0, '2022-01-31 21:46:25'),
(87, 51, 0, 0, '2022-01-31 21:46:47'),
(88, 82, 0, 0, '2022-01-31 21:47:09'),
(89, 93, 0, 0, '2022-01-31 21:47:21'),
(90, 94, 0, 0, '2022-06-03 12:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `paper_image`
--

CREATE TABLE `paper_image` (
  `pi_id` int(11) NOT NULL,
  `pi_exam_id` int(11) NOT NULL,
  `pi_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paper_image`
--

INSERT INTO `paper_image` (`pi_id`, `pi_exam_id`, `pi_image`) VALUES
(2, 9, '1640494178ABHIMANA_SIR_SCIENCE_Low_quality.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `paper_marks`
--

CREATE TABLE `paper_marks` (
  `mid` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quizno` tinyint(4) NOT NULL,
  `answerstatus` tinyint(1) NOT NULL,
  `add_date` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paper_marks`
--

INSERT INTO `paper_marks` (`mid`, `exam_id`, `user_id`, `quizno`, `answerstatus`, `add_date`, `status`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `reg_prefix` varchar(3) NOT NULL,
  `application_name` varchar(400) NOT NULL,
  `main_logo` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `reg_prefix`, `application_name`, `main_logo`) VALUES
(1, 'ATL', 'Yogee', 'logo-text-white.png');

-- --------------------------------------------------------

--
-- Table structure for table `user_attandance`
--

CREATE TABLE `user_attandance` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `lid` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_attandance`
--

INSERT INTO `user_attandance` (`id`, `userid`, `subjectid`, `lid`, `date`) VALUES
(10, 1732, 35, 1, '2022-02-05 09:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `verbal_exam`
--

CREATE TABLE `verbal_exam` (
  `id` int(11) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `marks` bigint(20) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `verbal_exam`
--

INSERT INTO `verbal_exam` (`id`, `userId`, `marks`, `document`, `status`) VALUES
(9, 1732, 5000, NULL, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `course_work_marks`
--
ALTER TABLE `course_work_marks`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `course_work_submissions`
--
ALTER TABLE `course_work_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exam_submissions`
--
ALTER TABLE `exam_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmsclass`
--
ALTER TABLE `lmsclass`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `lmsclasstute`
--
ALTER TABLE `lmsclasstute`
  MODIFY `ctuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `lmsclass_schlmsle`
--
ALTER TABLE `lmsclass_schlmsle`
  MODIFY `classid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmscomments`
--
ALTER TABLE `lmscomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `lmscourse_work`
--
ALTER TABLE `lmscourse_work`
  MODIFY `exid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lmsdb`
--
ALTER TABLE `lmsdb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmsebook`
--
ALTER TABLE `lmsebook`
  MODIFY `ctuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `lmsexpense`
--
ALTER TABLE `lmsexpense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lmsgallery`
--
ALTER TABLE `lmsgallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lmsgetway`
--
ALTER TABLE `lmsgetway`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmslesson`
--
ALTER TABLE `lmslesson`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=722;

--
-- AUTO_INCREMENT for table `lmsmail`
--
ALTER TABLE `lmsmail`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lmsonlineexams`
--
ALTER TABLE `lmsonlineexams`
  MODIFY `exid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lmspayment`
--
ALTER TABLE `lmspayment`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lmsregister`
--
ALTER TABLE `lmsregister`
  MODIFY `reid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1746;

--
-- AUTO_INCREMENT for table `lmsrequest_relogin`
--
ALTER TABLE `lmsrequest_relogin`
  MODIFY `relog_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lmsreq_subject`
--
ALTER TABLE `lmsreq_subject`
  MODIFY `sub_req_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9552;

--
-- AUTO_INCREMENT for table `lmssms`
--
ALTER TABLE `lmssms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmsstudent_subject`
--
ALTER TABLE `lmsstudent_subject`
  MODIFY `ssid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lmsstuden_video_watch`
--
ALTER TABLE `lmsstuden_video_watch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lmssubject`
--
ALTER TABLE `lmssubject`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmssubject_tealmsr`
--
ALTER TABLE `lmssubject_tealmsr`
  MODIFY `stid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lmstealmsr`
--
ALTER TABLE `lmstealmsr`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `lmstealmsr_multiple`
--
ALTER TABLE `lmstealmsr_multiple`
  MODIFY `tealmsr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6019;

--
-- AUTO_INCREMENT for table `lmsurl`
--
ALTER TABLE `lmsurl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmsusers`
--
ALTER TABLE `lmsusers`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lmsverbal_exam`
--
ALTER TABLE `lmsverbal_exam`
  MODIFY `classid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lms_answer`
--
ALTER TABLE `lms_answer`
  MODIFY `lms_answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `lms_exam_details`
--
ALTER TABLE `lms_exam_details`
  MODIFY `lms_exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lms_exam_report`
--
ALTER TABLE `lms_exam_report`
  MODIFY `lms_report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lms_mcq_questions`
--
ALTER TABLE `lms_mcq_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `lms_teacher_payment_history`
--
ALTER TABLE `lms_teacher_payment_history`
  MODIFY `lms_teacher_payment_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `paper_image`
--
ALTER TABLE `paper_image`
  MODIFY `pi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paper_marks`
--
ALTER TABLE `paper_marks`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_attandance`
--
ALTER TABLE `user_attandance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `verbal_exam`
--
ALTER TABLE `verbal_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
