-- Student Dashboard complete SQLite schema reference.
-- The running application also creates this database automatically through Entity Framework Core.

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS StudyTasks;
DROP TABLE IF EXISTS SupportTickets;
DROP TABLE IF EXISTS CalendarEvents;
DROP TABLE IF EXISTS Notifications;
DROP TABLE IF EXISTS FeeInvoices;
DROP TABLE IF EXISTS Assignments;
DROP TABLE IF EXISTS GradeRecords;
DROP TABLE IF EXISTS AttendanceRecords;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    Email TEXT NOT NULL,
    Phone TEXT,
    StudentNumber TEXT NOT NULL,
    ProgramName TEXT NOT NULL,
    Semester INTEGER NOT NULL,
    Status TEXT NOT NULL,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL
);

CREATE UNIQUE INDEX IX_Students_StudentNumber ON Students (StudentNumber);

CREATE TABLE Courses (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Code TEXT NOT NULL,
    Title TEXT NOT NULL,
    CreditHours INTEGER NOT NULL,
    InstructorName TEXT NOT NULL,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL
);

CREATE UNIQUE INDEX IX_Courses_Code ON Courses (Code);

CREATE TABLE Enrollments (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentId INTEGER NOT NULL,
    CourseId INTEGER NOT NULL,
    EnrolledOn TEXT NOT NULL,
    Status TEXT NOT NULL,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL,
    FOREIGN KEY(StudentId) REFERENCES Students(Id) ON DELETE CASCADE,
    FOREIGN KEY(CourseId) REFERENCES Courses(Id) ON DELETE CASCADE
);

CREATE UNIQUE INDEX IX_Enrollments_StudentId_CourseId ON Enrollments (StudentId, CourseId);

CREATE TABLE AttendanceRecords (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentId INTEGER NOT NULL,
    CourseId INTEGER NOT NULL,
    AttendanceDate TEXT NOT NULL,
    Status TEXT NOT NULL,
    Remarks TEXT,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL,
    FOREIGN KEY(StudentId) REFERENCES Students(Id) ON DELETE CASCADE,
    FOREIGN KEY(CourseId) REFERENCES Courses(Id) ON DELETE CASCADE
);

CREATE TABLE GradeRecords (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentId INTEGER NOT NULL,
    CourseId INTEGER NOT NULL,
    ExamType TEXT NOT NULL,
    MarksObtained NUMERIC NOT NULL,
    TotalMarks NUMERIC NOT NULL,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL,
    FOREIGN KEY(StudentId) REFERENCES Students(Id) ON DELETE CASCADE,
    FOREIGN KEY(CourseId) REFERENCES Courses(Id) ON DELETE CASCADE
);

CREATE TABLE Assignments (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    CourseId INTEGER NOT NULL,
    Title TEXT NOT NULL,
    Description TEXT,
    DueDate TEXT NOT NULL,
    TotalMarks NUMERIC NOT NULL,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL,
    FOREIGN KEY(CourseId) REFERENCES Courses(Id) ON DELETE CASCADE
);

CREATE TABLE FeeInvoices (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentId INTEGER NOT NULL,
    Amount NUMERIC NOT NULL,
    DueDate TEXT NOT NULL,
    IsPaid INTEGER NOT NULL,
    Notes TEXT,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL,
    FOREIGN KEY(StudentId) REFERENCES Students(Id) ON DELETE CASCADE
);

CREATE TABLE Notifications (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    Message TEXT NOT NULL,
    Audience TEXT NOT NULL,
    IsRead INTEGER NOT NULL,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL
);

CREATE TABLE SupportTickets (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentId INTEGER,
    Subject TEXT NOT NULL,
    Description TEXT NOT NULL,
    Status TEXT NOT NULL,
    Priority TEXT NOT NULL,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL,
    FOREIGN KEY(StudentId) REFERENCES Students(Id) ON DELETE CASCADE
);

CREATE TABLE CalendarEvents (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    EventDate TEXT NOT NULL,
    Location TEXT NOT NULL,
    Description TEXT,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL
);

CREATE TABLE StudyTasks (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentId INTEGER NOT NULL,
    Title TEXT NOT NULL,
    Description TEXT,
    DueDate TEXT NOT NULL,
    Priority TEXT NOT NULL,
    Status TEXT NOT NULL,
    IsCompleted INTEGER NOT NULL,
    CreatedAt TEXT NOT NULL,
    UpdatedAt TEXT NOT NULL,
    FOREIGN KEY(StudentId) REFERENCES Students(Id) ON DELETE CASCADE
);
