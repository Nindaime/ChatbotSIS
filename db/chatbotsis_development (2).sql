-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2019 at 12:25 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbotsis_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `assignmentId` int(11) NOT NULL,
  `assignmentDetails` text NOT NULL,
  `courseId` int(11) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `modeOfSubmission` text,
  `assignmentFormat` text,
  `dateOfAssignment` date DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`assignmentId`, `assignmentDetails`, `courseId`, `deadline`, `modeOfSubmission`, `assignmentFormat`, `dateOfAssignment`, `createdAt`, `updatedAt`) VALUES
(1, 'Write an overview on the Association for Computing Machinery (ACM) & Nigeria Computer Society', 20, '2019-10-03 08:00:00', 'LecturerEmail@gmail.com', 'Softcopy, \r\n5 pages,\r\nIntroduction ACM,\r\nHistory ACM,\r\nIntroduction NCS,\r\nHistory NCS,\r\nDifference ACM & NCS\r\n', '2019-10-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Write an extensive study on Ethics and Critical Systems', 20, '2019-11-19 10:00:00', 'Lab 203, Mr Emmanuel', 'Hardcopy,\r\n5 pages,\r\nSpiral bind\r\n', '2019-10-19', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Answer the questions in the document shared on your class group. File Name: Systems Performance evaluation', 3, '2019-10-03 12:00:00', 'Lab 203, Mr Emmanuel', 'Softcopy', '2019-10-03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Implement the Linked list and doubly Linked list without java class libraries', 2, '2019-10-12 16:00:00', 'Dr. Sennaike’s Office', 'source code', '2019-09-23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Poison Distribution', 3, '2019-10-13 08:00:00', 'Lab 203, Mr Emmanuel', 'Hardcopy, \r\n3 pages\r\n', '2019-08-13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Develop a documentation on the flowchat, Whitebox and blackbox test for a Student Information System', 1, '2019-11-12 10:00:00', 'Lab 203, Mr Emmanuel', 'Softcopy, \r\n5 pages\r\n', '2019-10-03', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `datetime` datetime NOT NULL,
  `senderId` int(11) UNSIGNED NOT NULL,
  `recipientId` int(11) UNSIGNED NOT NULL,
  `message` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `courseCode` varchar(255) DEFAULT NULL,
  `courseTitle` varchar(255) DEFAULT NULL,
  `courseUnit` int(11) DEFAULT NULL,
  `courseLevel` enum('100','200','300','400','500','600') DEFAULT NULL,
  `semester` enum('first','second') DEFAULT NULL,
  `lecturerName` varchar(255) DEFAULT NULL,
  `departmentId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `courseCode`, `courseTitle`, `courseUnit`, `courseLevel`, `semester`, `lecturerName`, `departmentId`, `createdAt`, `updatedAt`) VALUES
(1, 'csc533', 'Course Title', 3, '500', 'first', 'Ahmad Ahmad', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'csc505', 'Course Title', 3, '500', 'first', 'Ibukun', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'csc504', 'Course Title', 3, '500', 'second', 'Lawrence', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'csc303', 'Course Title', 3, '300', 'first', 'Tijani', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'csc514', 'Course Title', 3, '500', 'second', 'Meghan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'csc401', 'Course Title', 3, '400', 'first', 'Utopia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'siw400', 'Course Title', 3, '400', 'first', 'none', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'csc405', 'Course Title', 3, '400', 'first', 'Chike', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'csc422', 'Course Title', 3, '400', 'second', 'Madueke', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'csc421', 'Course Title', 3, '400', 'first', 'Reily', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'csc102', 'introduction to computer science II', 3, '100', 'second', 'Richard', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'csc307', 'Introduction to compiler construction', 3, '300', 'first', 'Remi', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'csc306', 'Introduction to programming languages', 3, '300', 'second', 'Cynthia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'csc302', 'Building a chatbot', 3, '300', 'second', 'Adah', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'csc301', 'Computer in a business world', 3, '300', 'first', 'Felix', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'csc413', 'Artificial Intelligence', 3, '400', 'first', 'Chris', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'phs205', 'Dynamics and Motion', 2, '200', 'first', 'Nduka', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'mat201', 'Material design', 1, '200', 'first', 'Ndavu', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'csc503', 'Database Management', 3, '500', 'first', 'Honululu', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `departmentId` int(11) NOT NULL,
  `facultyId` int(11) NOT NULL,
  `departmentName` varchar(20) DEFAULT NULL,
  `programmeSpan` enum('4','5','6') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`departmentId`, `facultyId`, `departmentName`, `programmeSpan`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Computer Science', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 'Material engineer', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 'Physics', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `facultyId` int(11) NOT NULL,
  `falcultyName` varchar(30) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`facultyId`, `falcultyName`, `createdAt`, `updatedAt`) VALUES
(1, 'Faculty of Sciences', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Faculty of Engineering', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `studentMatricId` varchar(255) NOT NULL,
  `sessionYear` varchar(255) DEFAULT NULL,
  `courseId` int(11) NOT NULL,
  `level` enum('100','200','300','400','500','600') DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `grade` enum('A','B','C','D','E','F') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`studentMatricId`, `sessionYear`, `courseId`, `level`, `departmentId`, `grade`, `createdAt`, `updatedAt`) VALUES
('140805041', '208/2019', 1, '500', 1, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805037', '208/2019', 1, '500', 1, 'B', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805057', '208/2019', 1, '500', 1, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805037', '208/2019', 2, '500', 1, 'B', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805037', '208/2019', 3, '500', 1, 'C', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805037', '208/2019', 4, '500', 1, 'B', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805041', '208/2019', 1, '500', 1, 'C', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805037', '208/2019', 4, '300', 1, 'D', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805037', '208/2019', 5, '500', 1, 'D', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805027', '208/2019', 2, '500', 1, 'C', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805027', '2017/2018', 6, '500', 1, 'B', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805037', '2017/2018', 6, '400', 1, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805037', '2017/2018', 7, '500', 1, 'B', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805037', '2017/2018', 16, '400', 1, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805041', '2017/2018', 7, '500', 1, 'B', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805041', '2017/2018', 8, '400', 1, 'D', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805057', '2017/2018', 8, '500', 1, 'C', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805037', '2017/2018', 9, '500', 1, 'D', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805057', '2016/2017', 4, '500', 1, 'E', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('140805037', '2017/2018', 10, '500', 1, 'C', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `schoolactivityevents`
--

CREATE TABLE `schoolactivityevents` (
  `activityEventId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` text,
  `type` enum('SchoolActivity','SchoolEvent') DEFAULT NULL,
  `venue` text,
  `departmentGroup` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schoolactivityevents`
--

INSERT INTO `schoolactivityevents` (`activityEventId`, `title`, `date`, `description`, `type`, `venue`, `departmentGroup`, `createdAt`, `updatedAt`) VALUES
(1, 'MTN ARDIC', '2019-10-10 00:00:00', '2019 MTN Academic Research and Development Innovation Challenge (MTN-ARDIC) expects participants to translate their ideas to solutions for a complete end-to-end support system.  Winner gets one million naira (=N=1, 000, 000. 00) as well as other necessary supports to further develop.', 'SchoolEvent', 'www.mtnonline.com/ardic\r\n\r\n', 'postgraduate programmes at the master’s and doctoral levels.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'NSYC SENSITIZATION PROGRAMME', '2019-10-07 00:00:00', 'The Student Affairs Division hereby informs all final year students that the 2019 NYSC Briefing/Sensitization exercise', 'SchoolActivity', 'Afe Babalola Hall', 'Final Year Students', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'INDEPENDENCE DAY', '2019-10-01 00:00:00', 'The Federal Government has declared Tuesday, October 1, 2019 public holiday to commemorate Nigeria’s Independence Day', 'SchoolActivity', 'N/A', 'All Students', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'DLI RESIENTIAL PROGRAMME COMMENSE', '2019-11-18 11:00:00', 'The Distance Learning Institute (DLI) wishes to inform all new and returning students of the Institute that its residential programme for the 2018/2019 academic session', 'SchoolActivity', 'Nurudeen Alao Auditorium DLI UNILAG', 'DLI Students', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'GOVERING COUNCIL ELECTION', '2019-10-02 00:00:00', 'Below is the list of nominees for Election of one (1) representative on the Governing Council at the Congregation meeting', 'SchoolActivity', 'N/A', 'All Students', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'MAIDEN UNILAG INTERNATIONAL WEEK', '2019-10-14 00:00:00', 'The Week, which will be both an academic and policy-based meeting, is being organised to address the requirements of effectively educating students in the 21st century.\r\nMallam Adamu Adamu, Honourable Minister of Education; Dr. Isa Ali (Pantami), FNCS, FBCS, FIIM, Honourable Minister of Communications; Professor Suleiman Elias Bogoro, Executive Secretary of TETFund; Professor Peter McEleavy, University of Dundee and Mr. Jérôme Pasquier, His Excellency, Ambassador of France will deliver the Keynote Addresses\r\n', 'SchoolEvent', 'J. F. Ade. Ajayi Auditorium', 'All Students', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20191004110147-create-user.js'),
('20191004110532-create-faculty.js'),
('20191004110754-create-department.js'),
('20191004111010-create-course.js'),
('20191004111158-create-time-table.js'),
('20191004111341-create-student.js'),
('20191004111521-create-school-activity-event.js'),
('20191004111804-create-result.js'),
('20191004112007-create-chat.js'),
('20191004112152-create-assignment.js');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `userId` int(11) UNSIGNED NOT NULL,
  `studentMatricId` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `level` enum('100','200','300','400','500','600') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`userId`, `studentMatricId`, `password`, `departmentId`, `level`, `createdAt`, `updatedAt`) VALUES
(4, '140805027', '', 1, '500', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '140805037', '', 1, '500', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, '140805041', 'password', 1, '500', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '140805057', '', 1, '500', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `timeTableId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `weekday` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetables`
--

INSERT INTO `timetables` (`timeTableId`, `courseId`, `weekday`, `startTime`, `endTime`, `createdAt`, `updatedAt`) VALUES
(2, 11, 'Monday', '10:00:00', '12:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 11, 'Monday', '08:00:00', '10:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 'Monday', '09:00:00', '11:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 3, 'Friday', '09:00:00', '11:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 2, 'Wednesday', '12:00:00', '14:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, 'Tuesday', '10:00:00', '12:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 8, 'Thursday', '08:00:00', '10:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 6, 'Monday', '08:00:00', '10:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 16, 'Tuesday', '10:00:00', '12:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 17, 'Friday', '09:00:00', '11:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 13, 'Wednesday', '13:00:00', '15:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 12, 'Friday', '14:00:00', '16:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 14, 'Tuesday', '09:00:00', '11:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 19, 'Thursday', '10:00:00', '12:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 15, 'Friday', '16:00:00', '18:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) UNSIGNED NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `userType` enum('student','admin') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `firstName`, `lastName`, `userType`, `createdAt`, `updatedAt`) VALUES
(1, 'Chinwe', 'Nancy', 'student', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Chinwe', 'Nancy', 'student', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Chibuike', 'Emenike', 'student', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Adesanya', 'Jacob', 'student', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`assignmentId`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`datetime`),
  ADD KEY `senderId` (`senderId`),
  ADD KEY `recipientId` (`recipientId`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departmentId` (`departmentId`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`departmentId`),
  ADD KEY `facultyId` (`facultyId`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`facultyId`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD KEY `studentMatricId` (`studentMatricId`),
  ADD KEY `courseId` (`courseId`),
  ADD KEY `departmentId` (`departmentId`);

--
-- Indexes for table `schoolactivityevents`
--
ALTER TABLE `schoolactivityevents`
  ADD PRIMARY KEY (`activityEventId`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentMatricId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `departmentId` (`departmentId`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`timeTableId`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `assignmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `departmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `facultyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schoolactivityevents`
--
ALTER TABLE `schoolactivityevents`
  MODIFY `activityEventId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `timeTableId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`);

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`senderId`) REFERENCES `users` (`userId`),
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`recipientId`) REFERENCES `users` (`userId`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentId`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`facultyId`) REFERENCES `faculties` (`facultyId`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`studentMatricId`) REFERENCES `students` (`studentMatricId`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `results_ibfk_3` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentId`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentId`);

--
-- Constraints for table `timetables`
--
ALTER TABLE `timetables`
  ADD CONSTRAINT `timetables_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
