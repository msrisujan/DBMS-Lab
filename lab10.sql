/*
Create the following tables.
• Student( RollNo varchar2 (8), SName varchar2 (20), Gender varchar2 (1),
City varchar2(20)) where RollNo is defined as the key attribute. Also,
assume that the RollNo values are of IIITDM”s RollNo types such as
“1901CS99”
*/

CREATE TABLE Student( RollNo varchar2 (8), SName varchar2 (20), Gender varchar2 (1),City varchar2(20), PRIMARY KEY (RollNo));

INSERT INTO Student VALUES('1901CS99','Raj','M','Kolkata');
INSERT INTO Student VALUES('1901CS98','Rahul','M','Mumbai');
INSERT INTO Student VALUES('1901CS97','Rose','F','Delhi');
INSERT INTO Student VALUES('1901CS96','Pranav','M','Kolkata');
INSERT INTO Student VALUES('1901CS95','Jennie','F','Mumbai');
INSERT INTO Student VALUES('1901ME94','Lisa','F','Delhi');
INSERT INTO Student VALUES('1901ME93','Jisoo','F','Kolkata');
INSERT INTO Student VALUES('1901EC92','Jungkook','M','Mumbai');
INSERT INTO Student VALUES('1901EC91','Jimin','M','Delhi');

/*
Course (CCode varchar2(5), CName varchar2(20), Credit number) where
CCode is defined as the key attribute. Also assume that the CCode
consists of values such as “CS354”, “ME305”, etc, i.e. first two are upper
case character types and remaining three are digit types.*/
CREATE TABLE Course( CCode varchar2(5), CName varchar2(20), Credit number, PRIMARY KEY (CCode));

INSERT INTO Course VALUES('CS354','DBMS',3);
INSERT INTO Course VALUES('CS355','Operating System',4);
INSERT INTO Course VALUES('CS524','Computer Networks',3);
INSERT INTO Course VALUES('CS357','Compiler Design',3);
INSERT INTO Course VALUES('CS358','Data Mining',2);
INSERT INTO Course VALUES('ME305','Machine Design',4);
INSERT INTO Course VALUES('ME502','Fluid Mechanics',3);
INSERT INTO Course VALUES('EC301','Digital Electronics',3);
INSERT INTO Course VALUES('EC302','Analog Electronics',2);

/*
Enrolled (RollNo varchar2(8), CCode varchar2(5), YoE number) with
RollNo and CCode are defined as the foreign key constraints to Student
(RollNo) and Course (CCode) respectively.*/

CREATE TABLE Enrolled (RollNo varchar2(8), CCode varchar2(5), YoE number, FOREIGN KEY (RollNo) REFERENCES Student(RollNo), FOREIGN KEY (CCode) REFERENCES Course(CCode));

INSERT INTO Enrolled VALUES('1901CS99','CS354',2019);
INSERT INTO Enrolled VALUES('1901CS96','CS355',2017);
INSERT INTO Enrolled VALUES('1901CS99','CS524',2019);
INSERT INTO Enrolled VALUES('1901CS99','CS357',2018);
INSERT INTO Enrolled VALUES('1901CS95','CS357',2020);
INSERT INTO Enrolled VALUES('1901CS98','CS354',2020);
INSERT INTO Enrolled VALUES('1901EC92','EC301',2018);
INSERT INTO Enrolled VALUES('1901EC91','EC302',2020);
INSERT INTO Enrolled VALUES('1901ME94','ME305',2017);
INSERT INTO Enrolled VALUES('1901ME93','ME502',2020);
INSERT INTO Enrolled VALUES('1901CS97','CS354',2018);
INSERT INTO Enrolled VALUES('1901CS96','CS354',2017);
INSERT INTO Enrolled VALUES('1901CS96','CS524',2019);
INSERT INTO Enrolled VALUES('1901CS95','CS358',2020);
INSERT INTO Enrolled VALUES('1901CS98','CS355',2020);
INSERT INTO Enrolled VALUES('1901CS97','CS357',2019);
INSERT INTO Enrolled VALUES('1901EC92','CS358',2019);
INSERT INTO Enrolled VALUES('1901EC92','CS354',2020);
INSERT INTO Enrolled VALUES('1901EC91','CS355',2019);
INSERT INTO Enrolled VALUES('1901ME94','CS524',2018);
INSERT INTO Enrolled VALUES('1901ME93','CS357',2019);
INSERT INTO Enrolled VALUES('1901ME93','CS358',2017);
INSERT INTO Enrolled VALUES('1901EC92','ME305',2019);
INSERT INTO Enrolled VALUES('1901EC92','ME502',2020);
INSERT INTO Enrolled VALUES('1901CS96','ME305',2019);
INSERT INTO Enrolled VALUES('1901CS96','EC301',2019);
INSERT INTO Enrolled VALUES('1901CS95','EC302',2020);
INSERT INTO Enrolled VALUES('1901CS95','EC301',2020);
INSERT INTO Enrolled VALUES('1901CS95','ME305',2020);
INSERT INTO Enrolled VALUES('1901CS98','ME502',2020);
INSERT INTO Enrolled VALUES('1901CS98','EC302',2020);
INSERT INTO Enrolled VALUES('1901CS98','CS524',2021);
INSERT INTO Enrolled VALUES('1901CS97','ME305',2019);
INSERT INTO Enrolled VALUES('1901ME94','CS354',2018);
INSERT INTO Enrolled VALUES('1901EC91','CS354',2019);
INSERT INTO Enrolled VALUES('1901EC91','CS524',2017);
INSERT INTO Enrolled VALUES('1901EC91','CS357',2019);
INSERT INTO Enrolled VALUES('1901EC91','CS358',2020);
INSERT INTO Enrolled VALUES('1901ME93','CS354',2019);
INSERT INTO Enrolled VALUES('1901EC91','EC301',2017);
INSERT INTO Enrolled VALUES('1901EC91','ME305',2019);
INSERT INTO Enrolled VALUES('1901EC91','ME502',2018);



/*
In the Course table add a column course type (CType varchar(20)).
This CType will take a value from Core, Elective, or Open Elective. In the
Student table add a column Email of varchar(30). This column should be
unique and only one email value is to be inserted. Insert email values in
“username@domain-name” format.*/
--Question A
ALTER TABLE Course ADD CType varchar(20);
ALTER TABLE Student ADD Email varchar(30);

UPDATE Course set CType='Core' where CCode='CS354';
UPDATE Course set CType='Elective' where CCode='CS355';
UPDATE Course set CType='Open Elective' where CCode='CS524';
UPDATE Course set CType='Core' where CCode='CS357';
UPDATE Course set CType='Elective' where CCode='CS358';
UPDATE Course set Ctype='Core' where CCode='ME305';
UPDATE Course set CType='Elective' where CCode='ME502';
UPDATE Course set CType='Core' where CCode='EC301';
UPDATE Course set CType='Elective' where CCode='EC302';

UPDATE Student set Email='1901CS99@iiitdm.ac.in' where RollNo='1901CS99';
UPDATE Student set Email='1901CS98@gmail.com' where RollNo='1901CS98';
UPDATE Student set Email='1901CS97@iiitdm.ac.in' where RollNo='1901CS97';
UPDATE Student set Email='1901CS96@iiitdm.ac.in' where RollNo='1901CS96';
UPDATE Student set Email='1901CS95@gmail.com' where RollNo='1901CS95';
UPDATE Student set Email='1901ME94@iiitdm.ac.in' where RollNo='1901ME94';
UPDATE Student set Email='1901ME93@yahoo.com' where RollNo='1901ME93';
UPDATE Student set Email='1901EC92@iiitdm.ac.in' where RollNo='1901EC92';
UPDATE Student set Email='1901EC91@yahoo.com' where RollNo='1901EC91';






-- Find the name of all the courses which start with “CS” code.
--Question B
CREATE VIEW CScourses as
SELECT CName FROM Course WHERE CCode LIKE 'CS%';
SELECT * FROM CScourses;

--Find the name of the male students who have at least two “a”s in their names.
--Question C
CREATE VIEW Malestudents as
SELECT sname FROM Student WHERE sname LIKE '%a%a%';
SELECT * FROM Malestudents;

-- Find the students who have not enrolled in between 2018 and 2019.
--Question D
CREATE VIEW NotEnrolled as
SELECT DISTINCT(RollNo) FROM Enrolled WHERE YoE NOT BETWEEN 2018 AND 2019;
SELECT * FROM NotEnrolled;

-- Find the course with least credit.
--Question E
CREATE VIEW LeastCredit as
SELECT CName FROM Course WHERE Credit=(SELECT MIN(Credit) FROM Course);
SELECT * FROM LeastCredit;

-- Find the name of the Course which is not enrolled by any students in the year 2020.
--Question F
CREATE VIEW NotEnrolled2020 as
SELECT CName FROM Course WHERE CCode NOT IN (SELECT CCode FROM Enrolled WHERE YoE=2020);
SELECT * FROM NotEnrolled2020;

--Find the total number of students city wise.
--Question G
CREATE VIEW CityWise as
SELECT City,COUNT(RollNo) as count FROM Student GROUP BY City;
SELECT * FROM CityWise;

-- Find the Rollno of the students who have enrolled to 5 number of courses.
--Question H
CREATE VIEW Enrolled5 as
SELECT RollNo FROM Enrolled GROUP BY RollNo HAVING COUNT(CCode)=5;
SELECT * FROM Enrolled5;

--Find the total number of courses enrolled by student with roll no “1901CS99”.
--Question I
CREATE VIEW Enrolled1901CS99 as
SELECT COUNT(CCode) as count FROM Enrolled WHERE RollNo='1901CS99';
SELECT * FROM Enrolled1901CS99;

--Find all the 5 level courses (the digits parts of the course code should start with 5).
--Question J
CREATE VIEW Level5 as
SELECT CName FROM Course WHERE CCode LIKE '__5%';
SELECT * FROM Level5;

--Count the number of students containing “CS” as part of the RollNo.
--Question K
CREATE VIEW CSRoll as
SELECT COUNT(RollNo) as count FROM Student WHERE RollNo LIKE '%CS%';
SELECT * FROM CSRoll;

--Find the roll no of students who have enrolled in more than 4 courses in the year 2020.
--Question L
CREATE VIEW Enrolled4 as
SELECT RollNo FROM Enrolled WHERE YoE=2020 GROUP BY RollNo HAVING COUNT(CCode)>4;
SELECT * FROM Enrolled4;

--Find the course code which is taken by most female students who are from Delhi city.
--Question M
CREATE VIEW MostFemaleDelhi as
SELECT CCode FROM Enrolled WHERE RollNo IN 
(SELECT Rollno from Student where Gender = 'F' and City = 'Delhi') 
GROUP BY CCode HAVING COUNT(*) = (SELECT MAX(count) 
FROM (SELECT COUNT(*) AS count FROM Enrolled WHERE 
RollNo IN (SELECT Rollno from Student where 
Gender = 'F' and City = 'Delhi') GROUP BY CCode));
SELECT * FROM MostFemaleDelhi;

--Find the name of all the students whose email ids have “gmail.com” or “yahoo.com” as the domain name.
--Question N
CREATE VIEW EmailDomain as
SELECT SName FROM Student WHERE Email LIKE '%gmail.com' OR Email LIKE '%yahoo.com';
SELECT * FROM EmailDomain;

--find the name of students enrolled in all courses.
--Question O
CREATE VIEW AllCourses as
SELECT SName FROM Student WHERE RollNo IN (SELECT RollNo FROM Enrolled GROUP BY RollNo HAVING COUNT(CCode)=(SELECT COUNT(CCode) FROM Course));
SELECT * FROM AllCourses;
