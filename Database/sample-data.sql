-- Complete sample data for Student Dashboard SQLite schema.
PRAGMA foreign_keys = ON;

INSERT INTO Students (Id, FirstName, LastName, Email, Phone, StudentNumber, ProgramName, Semester, Status, CreatedAt, UpdatedAt) VALUES
(1, 'Irtaza', 'Shahid', 'irtaza@studentdash.local', '03000000001', 'STD-001', 'BS Software Engineering', 4, 'Active', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Sufyan', 'Amjad', 'sufyan@studentdash.local', '03000000002', 'STD-002', 'BS Computer Science', 5, 'Active', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Hashir', 'Hassan', 'hashir@studentdash.local', '03000000003', 'STD-003', 'BS Information Technology', 3, 'Active', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO Courses (Id, Code, Title, CreditHours, InstructorName, CreatedAt, UpdatedAt) VALUES
(1, 'VP-401', 'Visual Programming', 3, 'Mr. Naveed', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'DB-302', 'Database Systems', 3, 'Ms. Hina', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'SE-410', 'Software Engineering', 3, 'Dr. Kamran', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO Enrollments (StudentId, CourseId, EnrolledOn, Status, CreatedAt, UpdatedAt) VALUES
(1, 1, DATE('now', '-20 days'), 'Enrolled', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(1, 2, DATE('now', '-20 days'), 'Enrolled', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, DATE('now', '-18 days'), 'Enrolled', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 2, DATE('now', '-17 days'), 'Enrolled', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO AttendanceRecords (StudentId, CourseId, AttendanceDate, Status, Remarks, CreatedAt, UpdatedAt) VALUES
(1, 1, DATE('now', '-1 day'), 'Present', '', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(1, 2, DATE('now', '-2 days'), 'Present', 'Lab attended', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(1, 1, DATE('now', '-3 days'), 'Absent', 'Medical leave', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, DATE('now', '-1 day'), 'Absent', 'Medical leave', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 2, DATE('now', '-1 day'), 'Present', '', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO GradeRecords (StudentId, CourseId, ExamType, MarksObtained, TotalMarks, CreatedAt, UpdatedAt) VALUES
(1, 1, 'Quiz', 18, 20, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(1, 2, 'Assignment', 42, 50, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, 'Assignment', 42, 50, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 2, 'Midterm', 74, 100, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO Assignments (CourseId, Title, Description, DueDate, TotalMarks, CreatedAt, UpdatedAt) VALUES
(1, 'Blazor CRUD Task', 'Create a reusable CRUD component.', DATE('now', '+7 days'), 50, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'ERD Design', 'Design a normalized database schema.', DATE('now', '+5 days'), 30, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'SRS Review', 'Review requirement documentation and diagrams.', DATE('now', '+10 days'), 40, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO FeeInvoices (StudentId, Amount, DueDate, IsPaid, Notes, CreatedAt, UpdatedAt) VALUES
(1, 45000, DATE('now', '+10 days'), 0, 'Semester fee invoice', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 45000, DATE('now', '+5 days'), 1, 'Paid invoice', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 42000, DATE('now', '+12 days'), 0, 'Semester fee invoice', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO Notifications (Title, Message, Audience, IsRead, CreatedAt, UpdatedAt) VALUES
('Semester Registration', 'Registration is open for the next semester.', 'All', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Fee Reminder', 'Please clear pending dues before the deadline.', 'Students', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Viva Schedule', 'Final project viva will be conducted in Lab 2.', 'Students', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO CalendarEvents (Title, EventDate, Location, Description, CreatedAt, UpdatedAt) VALUES
('Project Viva', DATE('now', '+7 days'), 'Lab 2', 'Final viva and Q&A.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Sports Day', DATE('now', '+14 days'), 'Main Ground', 'Annual sports activities.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO SupportTickets (StudentId, Subject, Description, Status, Priority, CreatedAt, UpdatedAt) VALUES
(1, 'Portal password issue', 'Student cannot reset the portal password.', 'Open', 'High', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO StudyTasks (StudentId, Title, Description, DueDate, Priority, Status, IsCompleted, CreatedAt, UpdatedAt) VALUES
(1, 'Prepare Visual Programming viva', 'Revise Blazor pages, services, EF Core flow and UML explanation.', DATE('now', '+3 days'), 'High', 'Pending', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(1, 'Complete screenshot folder', 'Capture annotated screenshots for major app features.', DATE('now', '+2 days'), 'Medium', 'Pending', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Revise database relationships', 'Practice explaining Student, Course, Enrollment and FeeInvoice relationships.', DATE('now', '+5 days'), 'Medium', 'Pending', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Submit support follow-up', 'Check whether the existing support ticket has been resolved.', DATE('now', '+1 day'), 'Low', 'Completed', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
