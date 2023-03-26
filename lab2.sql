CREATE TABLE student(rollno VARCHAR(10), name VARCHAR(20), degree VARCHAR(10), year number, sex VARCHAR(6), deptno VARCHAR(10), advisor VARCHAR(20)); insert into student values('cs21b1081','Sujan','B-tech',2021,'Male','CS001','Ram Prasad');
insert into student values('cs21b2026','Abhiram','B-tech',2021,'Male','CS002','Preeth');
insert into student values('ec21b1053','Pavan','B-tech',2021,'Male','EC001','Selvaraj');
insert into student values('ec22m1045','Sowmya','M-tech',2022,'Female','CS003','Masilamani');
insert into student values('coe19b1036','Vineesha','B-tech',2019,'Female','CE001','Sivaselvan');
insert into student values('me20b1065','Sathwik','B-tech',2020,'Male','ME001','Nachiketa');
insert into student values('me18m1019','Vinay','M-tech','2018','Male','ME003','Gurunadhan');
select * from student;



create table department(deptid varchar(10),name varchar(10),hod varchar(20),phone number(10));
insert into department values('CS001','CSE','Masilamani',9437592858)
insert into department values('CS002','CSE-AI','Jagadeesh',4728572967)
insert into department values('EC001','ECE','Selvaraj',8396720638)
insert into department values('ME001','Mechanical','Gurunathan',9576283740)
insert into department values('ME002','Smart Mech','Nachiketha',8742650183)
insert into department values('DS001','Design','Bingi',7639502637)
insert into department values('EE001','Electrical','Binsu',9236482535)
select * from department;



create table professor(empId varchar(10),name varchar(20),sex varchar(6),startyear number,deptno varchar(10),phone number);
insert into professor values('309C','Rahul Raman','Male',2020,'CS001',9273469286)
insert into professor values('206E','Raghavan','Male',2019,'EC001',9127482749)
insert into professor values('410M','Basheer','Male',2021,'ME001',7284627502)
insert into professor values('310A','Ram Prasad','Male',2018,'CS002',6749291204)
insert into professor values('210L','Debolina','Female',2019,'EE001',8912739128)
insert into professor values('435S','Ashok','MAle',2018,'ME002',9238273491)
insert into professor values('501D','Karthik','Male',2020,'DS001',5263816237)
select * from professor;


create table course(courseId varchar(10),cname varchar(20),credits number,deptno varchar(10));
insert into course values('CS2001','Data Structures',4,'CS001');
insert into course values('CS3003','Operating System',4,'CS001');
insert into course values('CS5002','Data Science',4,'CS002');
insert into course values('EC4004','Processing',3,'EC001');
insert into course values('ME2001','Graphics',3,'ME001');
insert into course values('DS2001','Product Design',4,'DS001');
insert into course values('EE2001','Circuits',3,'EE001');
select * from course;


create table enrollment(rollNo varchar(10),courseId varchar(10),sem number,year number,grade varchar(1));
insert into enrollment values('cs21b1081','CS2001',3,2021,'A');
insert into enrollment values('cs21b2026','CS5002',3,2021,'S');
insert into enrollment values('ec21b1053','EC4001',3,2021,'B');
insert into enrollment values('ec22m1045','EE2001',2,2022,'C');
insert into enrollment values('coe19b1036','CS3003',7,2019,'A');
insert into enrollment values('me20b1065','ME2001',5,2020,'B');
insert into enrollment values('me18m1019','DS2001',7,2018,'D');
select * from enrollment;


create table teaching(empId varchar(10),courseId varchar(10),sem number,year number,classroom varchar(4));
insert into teaching values('309C','CS2001',3,2021,'H11');
insert into teaching values('206E','EC2001',2,2020,'H21');
insert into teaching values('410M','ME2001',1,2018,'H11');
insert into teaching values('310A','CS5002',5,2019,'H11');
insert into teaching values('210L','EE2001',4,2022,'H11');
insert into teaching values('435S','CS3003',6,2020,'H11');
insert into teaching values('501D','DS2001',3,2021,'H11');
select * from teaching;


create table preRequisite(preCourseId varchar(10),courseId varchar(10));
insert into preRequisite values('CS1001','CS2001');
insert into preRequisite values('EC1001','EC2001');
insert into preRequisite values('ME1001','ME2001');
insert into preRequisite values('CS2003','CS5002');
insert into preRequisite values('EE2001','EC4003');
insert into preRequisite values('CS2002','CS3003');
insert into preRequisite values('DS1001','DS2001');
select * from prerequisite;

delete from student where rollno='coe19b1036';
delete from student where rollno='me18m1019';
delete from student where rollno='ec22m1045';

delete from enrollment where rollno='coe19b1036';
delete from enrollment where rollno='me18m1019';
delete from enrollment where rollno='ec22m1045';

alter table student add(email-id varchar(30));
alter table professor add(email-id varchar(30));

insert into student(email-id) values('cs21b1081@iiitdm.ac.in');
insert into student(email-id) values('cs21b2026@iiitdm.ac.in');
insert into student(email-id) values('ec21b1053@iiitdm.ac.in');
insert into student(email-id) values('me20b1065@iiitdm.ac.in');

insert into professor(email-id) values('rahulraman@iiitdm.ac.in');
insert into professor(email-id) values('raghavan@iiitdm.ac.in');
insert into professor(email-id) values('basheer@iiitdm.ac.in');
insert into professor(email-id) values('ramprasaf@iiitdm.ac.in');
insert into professor(email-id) values('debolina@iiitdm.ac.in');
insert into professor(email-id) values('ashok@iiitdm.ac.in');
insert into professor(email-id) values('karthik@iiitdm.ac.in');
