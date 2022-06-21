create database QuanlySinhVientest;
CREATE TABLE Students(
    StudentID int PRIMARY KEY,
    StudentName VARCHAR(50),
    Age int not null,
    Email VARCHAR(50)
);
INSERT INTO Students
VALUES (1, 'Nguyen Quang An', 18, 'an@yahoo.com'),
(2, 'Nguyen Cong Vinh', 20, 'vinh@gmail.com'),
(3, 'Nguyen Van Quyen', 19, 'quyen'),
(4, 'Pham Thanh Binh', 25, 'binh@com'),
(5, 'Nguyen Van Tai Em', 30, 'taiem@sport.vn');
CREATE TABLE Classes(
    ClassID int PRIMARY KEY,
    ClassName VARCHAR(50)
);
INSERT INTO Classes
VALUES (1, 'C0706L'),(2, 'C0708G');
CREATE TABLE ClassStudent(
    StudentID int ,
    ClassID int,
	FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO ClassStudent
VALUES (1, 1),(2, 1),(3, 2),(4, 2),(5, 2);
CREATE TABLE Subjects(
    SubjectID int PRIMARY KEY,
    SubjectName VARCHAR(50)
);
INSERT INTO Subjects
VALUES (1, 'SQL'),(2, 'Java'),(3, 'C'),(4, 'Visual Basic');
CREATE TABLE Marks(
    Mark int not null,
    SubjectID int,
    StudentID int,
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO Marks
VALUES (8,1,2),(4,2,1),(9,1,1),(7,1,3),(3,1,4),(5,2,5),(8,3,3),(1,3,5),(3,2,4);
select * from Students;
select * from Classes;
SELECT AVG(Mark) 'Điểm trung bình' FROM Marks;
SELECT MAX(Mark) 'Điểm cao nhất' FROM Marks;
select * from Marks 
order by Mark desc;
ALTER TABLE subjects 
CHANGE COLUMN SubjectName SubjectName NVARCHAR(255)  NOT NULL;
alter table Students 
add constraint check(Age>15 and Age <50); 
delete from Students where StudentID=1;
alter table Students 
add column Status bit default 1;
update Students set Status=0 where StudentID>0;
