CREATE table course_taken (student_name varchar(30),course varchar(30));
INSERT ALL
into course_taken values('Robert','Databases')
into course_taken values('Robert','Programming Languages')
into course_taken values('David','Databases')
into course_taken values('Hannah','Programming Languages')
into course_taken values('Tom','Operating systems')
into course_taken values('David','Operating systems')
SELECT 1 from dual;

SELECT * from course_taken;

create table course_required (course varchar(30));
INSERT ALL
INTO course_required values('Databases')
INTO course_required values('Programming Languages')
select 1 from dual;

select * from course_required;

--Question 1a
create table students as
SELECT distinct(student_name) from course_taken;
select * from students;

--Question 1b
create table stud_coursereq as
select distinct(A.student_name),B.course from course_taken A,course_required B;
select * from stud_coursereq;

--Question 1c
create table stud_nocourse as
select * from stud_coursereq MINUS SELECT *from course_taken;
select * from stud_nocourse;

--Question 1d
create table stud_nograd as
select distinct(student_name) from (select * from stud_nocourse);
SELECT * from stud_nograd;
--Question 1e
create table stud_grad as
SELECT * from students MINUS select * from stud_nograd;
SELECT * from stud_grad;


--Question 2a
SELECT distinct(student_name) from course_taken MINUS (
select student_name from (select distinct(student_name),course_taken.course from course_taken INNER JOIN course_required on course_taken.course=course_required.course)
group by student_name having count(course) in(select count(course) from course_required));

--Question 2b
select DISTINCT(student_name) from(select * from stud_coursereq A where not exists (select * from course_taken B
where A.student_name=B.student_name and A.course=B.course)); 

--Question 2c
select distinct(student_name) from course_taken minus 
select distinct (A.student_name) from course_taken A,course_taken B where A.student_name=B.student_name and A.course!=B.course
and A.course in(select * from course_required) and B.course in(select * from course_required);


--Question 3
CREATE table bank(bank_name varchar(10),state varchar(30));
insert ALL
into bank values('SBI','ANDHRA PRADESH')
INTO BANK VALUES('SBI','TAMILNADU')
INTO BANK VALUES('SBI','KARNATAKA')
INTO BANK VALUES('ICICI','TAMILNADU')
INTO BANK VALUES('ICICI','KARNATAKA')
SELECT 1 FROM DUAL;

SELECT * FROM BANK;

CREATE TABLE ACCOUNT_HOLDER(ACCOUNT_NAME VARCHAR(20),BANK_NAME VARCHAR(10),STATE_NAME VARCHAR(30));
INSERT ALL
INTO ACCOUNT_HOLDER VALUES('RAMESH','ICICI','TAMILNADU')
INTO ACCOUNT_HOLDER VALUES('DINESH','SBI','ANDHRA PRADESH')
INTO ACCOUNT_HOLDER VALUES('ROBERT','SBI','TAMILNADU')
INTO ACCOUNT_HOLDER VALUES('ROBERT','ICICI','KARNATAKA')
INTO ACCOUNT_HOLDER VALUES('ROBERT','SBI','ANDHRA PRADESH')
INTO ACCOUNT_HOLDER VALUES('KARTHIK','SBI','ANDHRA PRADESH')
SELECT 1 FROM DUAL;

SELECT * FROM ACCOUNT_HOLDER;

--Question 3a
select ACCOUNT_NAME from ACCOUNT_HOLDER A group by ACCOUNT_NAME having count(distinct(A.BANK_NAME)) = (select count(distinct(bank_name)) from bank);

--Question 3b
select bank_name from bank A group by bank_name having count(distinct(A.state))=(select count(distinct(state)) from bank);

--Question 3c
select distinct(bank_name) from bank MINUS (select bank_name from bank A group by bank_name having count(distinct(A.state))=(select count(distinct(state)) from bank));

--Question 3d
select ACCOUNT_NAME from ACCOUNT_HOLDER A group by ACCOUNT_NAME having count(distinct(A.state_NAME)) = (select count(distinct(state)) from bank);


