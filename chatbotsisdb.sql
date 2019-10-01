BEGIN TRANSACTION;

-- Users Table
CREATE TABLE IF NOT EXISTS `User` (
	`UserID`	INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
	`FirstName`	TEXT NOT NULL,
	`LastName`	TEXT NOT NULL,
	`UserType`	INTEGER
);

-- School timetables table
CREATE TABLE IF NOT EXISTS `Timetable` (
	`TimeTableID`	INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
	`CourseID`	INTEGER,
	`Weekday`	TEXT,
	`StartTime`	TEXT,
	`EndTime`	TEXT,
	FOREIGN KEY(`CourseID`) REFERENCES `Course`(`CourseID`)
);

-- Student details table
CREATE TABLE IF NOT EXISTS `Student` (
	`Student_MatricID`	TEXT UNIQUE,
	`UserID`	INTEGER NOT NULL,
	`DepartmentID`	INTEGER NOT NULL,
	`Level`	INTEGER,
	FOREIGN KEY(`UserID`) REFERENCES `User`(`UserID`) ON DELETE SET NULL,
	PRIMARY KEY(`Student_MatricID`),
	FOREIGN KEY(`DepartmentID`) REFERENCES `Department`(`DepartmentID`) ON DELETE SET NULL
);

-- School activities and events table
CREATE TABLE IF NOT EXISTS `SchoolActivity_Event` (
	`Activity_EventID`	INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Title`	TEXT,
	`Date`	TEXT,
	`Description`	TEXT,
	`Type`	TEXT,
	`Venue`	TEXT,
	`DepartmentGroup`	TEXT
);

-- Studens result table
CREATE TABLE IF NOT EXISTS `Result` (
	`Student_MatricID`	INTEGER,
	`SessionYear`	TEXT,
	`CourseID`	INTEGER,
	`Level`	INTEGER NOT NULL,
	`DepartmentID`	INTEGER,
	`Grade`	TEXT,
	FOREIGN KEY(`Student_MatricID`) REFERENCES `Student`(`Student_MatricID`),
	PRIMARY KEY(`Student_MatricID`,`SessionYear`,`CourseID`),
	FOREIGN KEY(`CourseID`) REFERENCES `Course`(`CourseID`)
);

-- Faculties
CREATE TABLE IF NOT EXISTS `Faculty` (
	`FacultyID`	INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
	`FacultyName`	TEXT
);

-- Departments
CREATE TABLE IF NOT EXISTS `Department` (
	`DepartmentID`	INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
	`FacultyID`	INTEGER,
	`DepartmentName`	TEXT,
	`ProgrammeSpan`	INTEGER,
	FOREIGN KEY(`FacultyID`) REFERENCES `Faculty`(`FacultyID`) ON DELETE SET NULL
);

-- Courses details
CREATE TABLE IF NOT EXISTS `Course` (
	`CourseID`	INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
	`CourseCode`	TEXT NOT NULL UNIQUE,
	`CourseTitle`	TEXT NOT NULL,
	`CourseUnit`	INTEGER NOT NULL,
	`CourseLevel`	INTEGER,
	`Semester`	TEXT,
	`LecturerNamme`	TEXT,
	`DepartmentID`	INTEGER,
	FOREIGN KEY(`DepartmentID`) REFERENCES `Department`(`DepartmentID`) ON DELETE SET NULL
);

-- Chat log
CREATE TABLE IF NOT EXISTS `Chat` (
	`DateTime`	TEXT,
	`SenderID`	INTEGER,
	`RecepientID`	INTEGER,
	`Message`	TEXT,
	FOREIGN KEY(`RecepientID`) REFERENCES `User`(`UserID`),
	PRIMARY KEY(`DateTime`),
	FOREIGN KEY(`SenderID`) REFERENCES `User`(`UserID`)
);

-- Assignment records
CREATE TABLE IF NOT EXISTS `Assignment` (
	`AssignmentID`	INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
	`CourseID`	INTEGER,
	`Deadline`	TEXT,
	`ModeOfSubmission`	TEXT,
	`AssignmentFormat`	TEXT,
	`DateOfAssignment`	TEXT,
	FOREIGN KEY(`CourseID`) REFERENCES `Course`(`CourseID`)
);
COMMIT;
