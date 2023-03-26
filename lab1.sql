create table course(courseId varchar(8), cname varchar(50),
credits number, deptNo varchar (20));

CREATE TABLE department (deptId varchar2(20) NOT NULL,
name varchar2(20) DEFAULT NULL,
hod varchar2(5) DEFAULT NULL,
phone number(10,0) DEFAULT NULL) ;

CREATE TABLE enrollment (
  rollNo varchar(5) NOT NULL,
  courseId varchar(8) NOT NULL,
  sem varchar(6) NOT NULL,
  year number(4,0) NOT NULL,
  grade varchar(2) DEFAULT NULL);

CREATE TABLE student (
  rollNo varchar2(5) NOT NULL,
  name varchar2(20) DEFAULT NULL,
  degree varchar2(10) DEFAULT NULL,
  year number(4,0) DEFAULT NULL,
  sex varchar2(6) DEFAULT NULL,
  deptNo varchar2(20) DEFAULT NULL,
  advisor varchar2(5) DEFAULT NULL) ;

CREATE TABLE teaching (
  empId varchar2(5) NOT NULL,
  courseId varchar2(8) NOT NULL,
  sem varchar2(6) NOT NULL,
  year number(4,0) NOT NULL,
classRoom varchar2(5));

CREATE TABLE prerequisite (
  preReqCourse varchar(8) NOT NULL,
  courseId varchar(8) NOT NULL);

CREATE TABLE professor (
  empId varchar2(5) NOT NULL,
  name varchar2(20) DEFAULT NULL,
  sex varchar2(6) DEFAULT NULL,
  startYear number(4,0) DEFAULT NULL,
  deptNo varchar2(20) DEFAULT NULL,
  phone number(10,0) DEFAULT NULL) ;







drop table course;
drop table department;
drop table enrollment;
drop table student;
drop table teaching;
drop table preRequisite;
drop table professor;
























create table student(rollno varchar(10),name varchar(20),degree varchar(10),year number,sex varchar(6),deptno varchar(10),advisor varchar(20));
insert all
into student values('cs21b1081','Sujan','B-tech',2021,'Male','CS001','Ram Prasad')
into student values('cs21b2026','Abhiram','B-tech',2021,'Male','CS002','Preeth')
into student values('ec21b1053','Pavan','B-tech',2021,'Male','EC001','Selvaraj')
into student values('ec22m1045','Sowmya','M-tech',2022,'Female','CS003','Masilamani')
into student values('coe19b1036','Vineesha','B-tech',2019,'Female','CE001','Sivaselvan')
into student values('me20b1065','Sathwik','B-tech',2020,'Male','ME001','Nachiketa')
into student values('me18m1019','Vinay','M-tech','2018','Male','ME003','Gurunadhan')
select 1 from dual;


create table department(deptid varchar(10),name varchar(10),hod varchar(20),phone number(10));
insert all
into department values('CS001','CSE','Masilamani',9437592858)
into department values('CS002','CSE-AI','Jagadeesh',4728572967)
into department values('EC001','ECE','Selvaraj',8396720638)
into department values('ME001','Mechanical','Gurunathan',9576283740)
into department values('ME002','Smart Mech','Nachiketha',8742650183)
into department values('DS001','Design','Bingi',7639502637)
into department values('EE001','Electrical','Binsu',9236482535)
select 1 from dual;



create table professor(empId varchar(10),name varchar(20),sex varchar(6),startyear number,deptno varchar(10),phone number);
insert all
into professor values('309C','Rahul Raman','Male',2020,'CS001',9273469286)
into professor values('206E','Raghavan','Male',2019,'EC001',9127482749)
into professor values('410M','Basheer','Male',2021,'ME001',7284627502)
into professor values('310A','Ram Prasad','Male',2018,'CS002',6749291204)
into professor values('210L','Debolina','Female',2019,'EE001',8912739128)
into professor values('435S','Ashok','MAle',2018,'ME002',9238273491)
into professor values('501D','Karthik','Male',2020,'DS001',5263816237)
select 1 from dual;


create table course(courseId varchar(10),cname varchar(20),credits number,deptno varchar(10));
insert all
into course values('CS2001','Data Structures',4,'CS001')
into course values('CS3003','Operating System',4,'CS001')
into course values('CS5002','Data Science',4,'CS002')
into course values('EC4004','Processing',3,'EC001')
into course values('ME2001','Graphics',3,'ME001')
into course values('DS2001','Product Design',4,'DS001')
into course values('EE2001','Circuits',3,'EE001')
select 1 from dual;


create table enrollment(rollNo varchar(10),courseId varchar(10),sem number,year number,grade varchar(1));
insert all
into enrollment values('cs21b1081','CS2001',3,2021,'A')
into enrollment values('cs21b2026','CS5002',3,2021,'S')
into enrollment values('ec21b1053','EC4001',3,2021,'B')
into enrollment values('ec22m1045','EE2001',2,2022,'C')
into enrollment values('coe19b1036','CS3003',7,2019,'A')
into enrollment values('me20b1065','ME2001',5,2020,'B')
into enrollment values('me18m1019','DS2001',7,2018,'D')
select 1 from dual;


create table teaching(empId varchar(10),courseId varchar(10),sem number,year number,classroom varchar(4));
insert all
into teaching values('309C','CS2001',3,2021,'H11')
into teaching values('206E','EC2001',2,2020,'H21')
into teaching values('410M','ME2001',1,2018,'H11')
into teaching values('310A','CS5002',5,2019,'H11')
into teaching values('210L','EE2001',4,2022,'H11')
into teaching values('435S','CS3003',6,2020,'H11')
into teaching values('501D','DS2001',3,2021,'H11')
select 1 from dual;


create table preRequisite(preCourseId varchar(10),courseId varchar(10));
insert all
into preRequisite values('CS1001','CS2001')
into preRequisite values('EC1001','EC2001')
into preRequisite values('ME1001','ME2001')
into preRequisite values('CS2003','CS5002')
into preRequisite values('EE2001','EC4003')
into preRequisite values('CS2002','CS3003')
into preRequisite values('DS1001','DS2001')
select 1 from dual;

select * from student;
select * from department;
select * from professor;
select * from course;
select * from enrollment;
select * from teaching;
select * from preRequisite;


delete from student where rollno='coe19b1036';
delete from student where rollno='me18m1019';
delete from student where rollno='ec22m1045';

delete from enrollment where rollno='coe19b1036';
delete from enrollment where rollno='me18m1019';
delete from enrollment where rollno='ec22m1045';

select * from student;
select * from enrollment;

alter table student add(email varchar(30));
alter table professor add(email varchar(30));

update student set email='cs21b1081@iiitdm.ac.in' where rollno='cs21b1081';
update student set email='cs21b2026@iiitdm.ac.in' where rollno='cs21b2026';
update student set email='ec21b1053@iiitdm.ac.in' where rollno='ec21b1053';
update student set email='me20b1065@iiitdm.ac.in' where rollno='me21b1065';

update professor set email='rahulraman@iiitdm.ac.in' where empId='309C';
update professor set email='raghavan@iiitdm.ac.in' where empId='206E';
update professor set email='basheer@iiitdm.ac.in' where empId='410M';
update professor set email='ramprasad@iiitdm.ac.in' where empId='310A';
update professor set email='debolina@iiitdm.ac.in' where empId='210L';
update professor set email='ashok@iiitdm.ac.in' where empId='435S';
update professor set email='karthik@iiitdm.ac.in' where empId='501D';

select * from student;
select * from professor;


update department set hod='Sivaselvan' where name='CSE';
update department set hod='Ram Prasad' where name='CSE-AI';
update department set hod='Binsu' where name='ECE';
update department set hod='Karthik' where name='Design';

select * from department;

alter table student add(phone number(10));

update student set phone=9384386207 where rollno='cs21b1081';
update student set phone=8673058396 where rollno='cs21b2026';
update student set phone=7592067385 where rollno='ec21b1053';
update student set phone=6588038694 where rollno='me21b1065';

update professor set phone=7284914824 where empId='309C';
update professor set phone=8392450583 where empId='206E';

select * from student;
select * from professor;
