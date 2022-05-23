--  SECTION 1
use saurabh;
drop table dept;

create table dept
(
DEPTNO int(2),
DNAME varchar(15),
LOC varchar(10)
);


insert into dept values
(10,'ACCOUNTING','NEW YORK'),
(20 ,'RESEARCH','DAILLAS'),
(30, 'SALES','CHICAGO'),
(40,'OPERATIONS', 'BOSTON' ) ;

select * from dept;
truncate table dept;

DROP TABLE EMP;
	Create table emp
    (
EMPNO int(4),
ENAME varchar(10),
JOB	 varchar(9),
HIREDATE date,
SAL	 float(7,2),
COMM float(7,2),
DEPTNO int(2)
);

insert into emp values
(7839	,'KING'	,	'MANAGER',	'1991-11-17'	,5000	,NULL	,10),
(7698	,'BLAKE',	'CLERK'	,'1981-05-01',	2850	,NULL	,30),
(7782	,'CLARK'	,'MANAGER'	,'1981-06-09'	,2450	,NULL	,10),
(756,	'JONES',	'CLERK'	,'1981-04-02',	2975,	NULL ,20),
(7654	,'MARTIN',	'SALESMAN',	'1981-09-28',	1250	,1400,	30),
(7499	,'ALLEN',	'SALESMAN'	,'1981-02-20'	,1600,	300	,30);


3.	Display all the employees where SAL between 2500 and 5000 (inclusive of both).
select * from emp;
select ename from emp where sal between 2500 and 5000;

-- 4.	Display all the ENAMEs in descending order of ENAME.

select ename from emp
order by ename desc;

-- 5.	Display all the JOBs in lowercase.
select lower(job) from emp;

-- 6.	Display the ENAMEs and the lengths of the ENAMEs.
select ename,length(ename) 'LENGTH' from emp;


-- 7.	Display the DEPTNO and the count of employees who belong to that DEPTNO .
select deptno , count(deptno) 'COUNT' from emp
group by deptno;

-- 8.	Display the DNAMEs and the ENAMEs who belong to that DNAME.
select dname,ename from emp,dept
where emp.deptno=dept.deptno;


-- 9.	Display the position at which the string ‘AR’ occurs in the ename.
select instr(ename,'AR') from emp;

-- 10.	Display the HRA for each employee given that HRA is 20% of SAL.*/
select ename,sal*12 'HRA' from emp;
















-- ************************************************************************

-- SECTION 2:-

-- Q1
create table temp
(
strname varchar(20),
message varchar(10)
);

delimiter //
create procedure PROC1 (string1 varchar(10),string2 varchar(10))
begin
if  instr(string1,string2)!=0
then 
insert into temp values(string1,'MATCHED');
end if;
end;//
delimiter ; 

call PROC1("CDAC","DAC");

SELECT * FROM TEMP;
truncate table temp;
drop procedure proc1;
-- Q2
delimiter //
create function func1(x int , y int , z int) returns boolean deterministic 
begin 
declare result boolean;
if   (((x+y) > z) or ((y+z)>x) or ((x+z > y)))
then 
set result =true;
return  true;
else 
set result=false;
return false;
end if;
end ; //
delimiter ;

set @answer = func1(20,20,10);
select @answer from dual;
drop function func1;



