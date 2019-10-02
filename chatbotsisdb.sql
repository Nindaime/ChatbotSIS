-- phpMyAdmin SQL Dump

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbotsis`
--

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

-- Users Table
CREATE TABLE IF NOT EXISTS `User` (
	`UserID` SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`FirstName`	VARCHAR(30) NOT NULL,
	`LastName`	VARCHAR(30) NOT NULL,
	`UserType`	enum('Student','Admin') DEFAULT 'Student'
);

-- Faculties
CREATE TABLE IF NOT EXISTS `Faculty` (
	`FacultyID`	SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT UNIQUE,
	`FacultyName`	VARCHAR(20)
);

-- Departments
CREATE TABLE IF NOT EXISTS `Department` (
	`DepartmentID`	SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT UNIQUE,
	`FacultyID`	SMALLINT UNSIGNED,
	`DepartmentName`	VARCHAR(20),
	`ProgrammeSpan`	ENUM('4','5','6') DEFAULT '4',
	FOREIGN KEY(`FacultyID`) REFERENCES `Faculty`(`FacultyID`) ON DELETE SET NULL
);

-- Courses details
CREATE TABLE IF NOT EXISTS `Course` (
	`CourseID`	SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT UNIQUE,
	`CourseCode`	VARCHAR(8) NOT NULL UNIQUE,
	`CourseTitle`	TEXT NOT NULL,
	`CourseUnit`	TINYINT UNSIGNED NOT NULL,
	`CourseLevel`	enum ('100','200','300','400','500','600'),
	`Semester`	ENUM('first','second'),
	`LecturerName`	TEXT,
	`DepartmentID`	SMALLINT UNSIGNED,
	FOREIGN KEY(`DepartmentID`) REFERENCES `Department`(`DepartmentID`) ON DELETE SET NULL
);

-- School timetables table
CREATE TABLE IF NOT EXISTS `Timetable` (
	`TimeTableID`	SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`CourseID`	SMALLINT UNSIGNED,
	`Weekday`	enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'),
	`StartTime`	DATETIME,
	`EndTime`	DATETIME,
	FOREIGN KEY(`CourseID`) REFERENCES `Course`(`CourseID`)
);

-- Student details table
CREATE TABLE IF NOT EXISTS `Student` (
	`Student_MatricID`	VARCHAR(20) ,
	`UserID`	SMALLINT UNSIGNED NOT NULL,
	`DepartmentID`	SMALLINT UNSIGNED NOT NULL,
	`Level`	enum ('100','200','300','400','500','600'),
	FOREIGN KEY(`UserID`) REFERENCES `User`(`UserID`),
	PRIMARY KEY(`Student_MatricID`),
	FOREIGN KEY(`DepartmentID`) REFERENCES `Department`(`DepartmentID`)
);

-- School activities and events table
CREATE TABLE IF NOT EXISTS `SchoolActivity_Event` (
	`Activity_EventID`	SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT UNIQUE,
	`Title`	TEXT,
	`Date`	DATE,
	`Description`	TEXT,
	`Type`	enum('SchoolActivity','SchoolEvent') DEFAULT 'SchoolActivity',
	`Venue`	TEXT,
	`DepartmentGroup`	TEXT
);

-- Studens result table
CREATE TABLE IF NOT EXISTS `Result` (
	`Student_MatricID`	VARCHAR(20) ,
	`SessionYear`	VARCHAR(10),
	`CourseID`	SMALLINT UNSIGNED,
	`Level`	enum('100','200','300','400','500','600') NOT NULL,
	`DepartmentID`	SMALLINT UNSIGNED,
	`Grade`	ENUM('A','B','C','D','E'),
	FOREIGN KEY(`Student_MatricID`) REFERENCES `Student`(`Student_MatricID`),
	PRIMARY KEY(`Student_MatricID`,`SessionYear`,`CourseID`),
	FOREIGN KEY(`CourseID`) REFERENCES `Course`(`CourseID`)
);

-- Chat log
CREATE TABLE IF NOT EXISTS `Chat` (
	`DateTime`	DATETIME,
	`SenderID`	SMALLINT UNSIGNED,
	`RecepientID`	SMALLINT UNSIGNED,
	`Message`	TEXT,
	FOREIGN KEY(`RecepientID`) REFERENCES `User`(`UserID`),
	PRIMARY KEY(`DateTime`),
	FOREIGN KEY(`SenderID`) REFERENCES `User`(`UserID`)
);

-- Assignment records
CREATE TABLE IF NOT EXISTS `Assignment` (
	`AssignmentID`	SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT UNIQUE,
	`CourseID`	SMALLINT UNSIGNED,
	`Deadline`	DATETIME,
	`ModeOfSubmission`	TEXT,
	`AssignmentFormat`	TEXT,
	`DateOfAssignment`	DATE,
	FOREIGN KEY(`CourseID`) REFERENCES `Course`(`CourseID`)
);
COMMIT;