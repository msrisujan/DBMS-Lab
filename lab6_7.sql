--Question1
SELECT empId,name from professor where startyear<=ALL(SELECT startYear from professor where empId in (SELECT hod from department))
and empid in (SELECT hod from department);

--Question2
SELECT courseId,cname from course where courseid in(SELECT courseId from teaching where empid in(SELECT empid from professor WHERE
startyear<=ALL(select startyear from professor where deptno=(select deptid from department where name='Biology')))) and
deptno=(select deptid from department where name='Biology');

--Question3
SELECT cname,name from (course INNER JOIN department on course.deptno=department.deptid) where courseid in
(SELECT p.courseid from prerequisite p group by p.courseid having count(p.prereqcourse)>=ALL(SELECT count(p1.prereqcourse) from prerequisite p1 group by p1.courseid 
having (SELECT deptno from course c1 where c1.courseid=p1.courseid)=(SELECT deptno from course c2 where c2.courseid=p.courseid )))
order by deptno;
--Question4
select empid,avg(avg_enrolls) from teaching inner JOIN
(select courseid as cid,count(rollno) as avg_enrolls from (
select teaching.courseid,teaching.empid,enrollment.rollno,teaching.year
from teaching inner join enrollment on teaching.courseid=enrollment.courseid
where teaching.year= any(2002,2003,2004)) group by courseid) on teaching.courseid=cid group by empid;

--Question5
SELECT courseid,count(*) from enrollment where courseid in(SELECT courseid from course
where deptno = (select deptid from department where name='Comp. Sci.')) and year=2004 and sem='even' group by courseid;

--Question6
update teaching set sem='Even' where courseid='CS630';

SELECT  min(credits),avg(credits),max(credits),t.sem from course c,teaching t where c.courseid=t.courseid group by t.sem;
--Question7
SELECT grade,count(grade) from enrollment where sem='even' and courseId in(SELECT courseid from teaching where empid in(SELECT hod from department))
and grade!='S'and grade!='U' group by grade;

--Question8a
select count(rollno),deptid from enrollment e,department d where e.courseid IN
(select courseid from teaching t where empid in (SELECT empId from professor p where sex='female' and p.deptno=d.deptid))
and grade<>'U' group by d.deptId;

--Question8b

