CREATE TABLE committees(committee_id varchar(6),name varchar(20));
INSERT ALL
INTO committees VALUES('101','Ramesh')
INTO committees VALUES('102','Suresh')
INTO committees VALUES('103','Hritik')
SELECT 1 FROM dual;

CREATE TABLE member(member_id varchar(6),name varchar(20));
INSERT ALL
INTO member VALUES('m101','Ramesh')
INTO member VALUES('m102','Suresh')
INTO member VALUES('m103','Rakesh')
SELECT 1 FROM dual;

--Question1a
SELECT name FROM committees where not exists(SELECT * FROM member where member.name=committees.name);

--Question1b
SELECT name FROM member where not exists(SELECT * FROM committees where member.name=committees.name);

--Question1c
alter table committees add (age number);
UPDATE committees set age=20 where committee_id='101';
UPDATE committees set age=20 where committee_id='102';
UPDATE committees set age=30 where committee_id='103';

SELECT DISTINCT(A.name) as Name1 FROM committees a, committees b WHERE a.name!=b.name AND a.age=b.age;

--Question2
SELECT DISTINCT student.name,student.rollno from student 
INNER JOIN teaching on student.advisor=teaching.empId
INNER JOIN enrollment on enrollment.courseId=teaching.courseId and enrollment.rollNo=student.rollNo;

--Question3
SELECT courseid,cname FROM(
SELECT prereqcourse from prerequisite where courseid='608'
UNION
SELECT DISTINCT prereqcourse from prerequisite where courseid in (SELECT prereqcourse from prerequisite where courseid='608'))
INNER JOIN course on course.courseid=prereqcourse;

--Question4
SELECT distinct student.name,student.rollno from student
minus
SELECT distinct student.name,student.rollno from student
INNER JOIN enrollment on enrollment.rollNo=student.rollNo
and enrollment.courseId IN 
(SELECT teaching.courseid from teaching where empid IN (SELECT empid from teaching where courseid='319'));


--Question5
SELECT rollno from enrollment
INNER JOIN prerequisite on enrollment.courseid=prerequisite.preReqCourse and enrollment.grade='S' and prerequisite.courseid='760';

--Question6
SELECT DISTINCT A.rollNo FROM enrollment A, enrollment B WHERE A.rollNo=B.rollNo AND A.courseId=B.courseId AND A.year!=B.year;