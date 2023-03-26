set serveroutput on
--Find a maximum between three numbers.
--Question 1
DECLARE
    x number;
    y number;
    z number;
BEGIN
    x:=&x;
    y:=&y;
    z:=&z;
    IF x>y AND x>z THEN
        dbms_output.put_line('The maximum is '||x);
    ELSIF y>x AND y>z THEN
        dbms_output.put_line('The maximum is '||y);
    ELSE
        dbms_output.put_line('The maximum is '||z);
    END IF;
END; 
/

--Check whether a number is divisible by 5 and 11 or not.
--Question 2
DECLARE
    x number;
BEGIN
    x:=&x;
    IF x MOD 5=0 AND x MOD 11=0 THEN
        dbms_output.put_line('The number is divisible by 5 and 11');
    ELSE
        dbms_output.put_line('The number is not divisible by 5 and 11');
    END IF;
END;
/

--Find the area of rectangle, triangle, and square.
--Question 3
DECLARE
    length number;
    breadth number;
    height number;
    base number;
    side number;
BEGIN
    length:=&length;
    breadth:=&breadth;
    height:=&height;
    base:=&base;
    side:=&side;
    dbms_output.put_line('The area of rectangle is '||(length*breadth));
    dbms_output.put_line('The area of triangle is '||(0.5*base*height));
    dbms_output.put_line('The area of square is '||(side*side));
END;
/

--Iinput marks of five subjects Physics, Chemistry, Biology, Mathematics and Computer. Calculate percentage and grade according to following:
--Question 4
DECLARE
    phy number;
    chem number;
    bio number;
    maths number;
    comp number;
    percentage number;
BEGIN
    phy:=&phy;
    chem:=&chem;
    bio:=&bio;
    maths:=&maths;
    comp:=&comp;
    percentage:=(phy+chem+bio+maths+comp)/5;
    dbms_output.put_line('The percentage is '||percentage);
    IF percentage>=90 THEN
        dbms_output.put_line('Grade A');
    ELSIF percentage>=80 THEN
        dbms_output.put_line('Grade B');
    ELSIF percentage>=70 THEN
        dbms_output.put_line('Grade C');
    ELSIF percentage>=60 THEN
        dbms_output.put_line('Grade D');
    ELSIF percentage>=40 THEN
        dbms_output.put_line('Grade E');
    ELSE
        dbms_output.put_line('Grade F');
    END IF;
END;
/

--Find sum of 100 natural number using loop
--Question 5
DECLARE
    i number;
    tsum number;
BEGIN
    i:=1;
    tsum:=0;
    WHILE i<=100 LOOP
        tsum:=tsum+i;
        i:=i+1;
    END LOOP;
    dbms_output.put_line('The sum is '||tsum);
END;
/


--Question 6
CREATE TABLE EMPLOYEE
(
    ID NUMBER(6) PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL,
    AGE NUMBER(3) NOT NULL,
    ADDRESS CHAR(25),
    SALARY NUMBER(8,2)
);

INSERT INTO EMPLOYEE VALUES(1,'Ramesh',32,'Ahmedabad',2000);
INSERT INTO EMPLOYEE VALUES(2,'Khilan',25,'Delhi',1500);
INSERT INTO EMPLOYEE VALUES(3,'kaushik',23,'Kota',2000);
INSERT INTO EMPLOYEE VALUES(4,'Chaitali',25,'Mumbai',6500);
INSERT INTO EMPLOYEE VALUES(5,'Hardik',27,'Bhopal',8500);
INSERT INTO EMPLOYEE VALUES(6,'Komal',22,'MP',4500);


--Find the name of person having id =1
--Question 6A
DECLARE
    c_id EMPLOYEE.ID%TYPE:=1;
    c_name EMPLOYEE.NAME%TYPE;
BEGIN
    SELECT NAME INTO c_name FROM EMPLOYEE WHERE ID=c_id;
    dbms_output.put_line('The name of the person having id=1 is '||c_name);
END;
/

--Find the name,age, salary lives in kota.
--Question 6B
DECLARE
    c_address EMPLOYEE.ADDRESS%TYPE:='Kota';
    c_name EMPLOYEE.NAME%TYPE;
    c_age EMPLOYEE.AGE%TYPE;
    c_salary EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT NAME,AGE,SALARY INTO c_name,c_age,c_salary FROM EMPLOYEE WHERE ADDRESS=c_address;
    dbms_output.put_line('The name,age,salary of the person living in Kota is '||c_name || ' ' || c_age || ' ' || c_salary);
END;
/