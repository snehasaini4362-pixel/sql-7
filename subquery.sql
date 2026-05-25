-- A subquery is a query nested inside another query, usually used in databases (especially SQL) to help retrieve or filter data more precisely.
-- How it works

-- The inner query (subquery) runs first and produces a result.
-- That result is then used by the outer query.

-- subquery have two types
-- inner query and outer query
-- subquery=it is type of subquery in which the inner query return only one  row.
-- What is a Subquery in SQL?
-- A subquery is a SQL query written inside another SQL query. The inner query runs first, produces a result,
-- and that result is then used by the outer query to complete its work.
-- Think of it like this:
-- • The INNER query is the helper. It fetches some data.
-- • The OUTER query uses that data to answer your main question.
-- A subquery is always enclosed in parentheses ( ).

-- Single Row Subquery
-- A Single Row Subquery returns exactly ONE value (one row, one column). You use this with comparison
-- operators like =, >, <, >=, <=, <>.

-- Multi Row Subquery
-- A Multi Row Subquery returns MORE THAN ONE ROW. Since the result is a list, you cannot use = directly.
-- You must use special operators: IN, ANY, or ALL.
-- Operators IN, ANY, and ALL Explained
-- Operator Meaning Example in Plain English
-- IN = TRUE if value matches any value in the
-- subquery list
-- Salary is in the list (50000, 80000,90000)



-- ANY TRUE if comparison is true for AT LEAST ONE value in the list
-- Salary > any one value in the list


-- ALL TRUE only if comparison is true for EVERY value in the list
-- Salary > every value in the list

create database shadid;

use shadid;

create table biodata(id int,name varchar(20),age int);

insert into biodata values (1,'rahul',28),(2,'anjali',28),(3,'aishwarya',40),(4,'naina',23);
select * from biodata;

select age from biodata where name='rahul'; -- age of rahul

select * from biodata where age=29;
select * from biodata where age=(select age from biodata where name='rahul');

select max(age) from biodata;
select * from biodata where age=40;
select * from biodata where age=(select max(age) from biodata);

select * from biodata where age=(select max(age) from biodata);

-- we have find out the name of rahul and her letter lenth
select char_length(name) from biodata where name ='rahul';
select name  from biodata where char_length(name)=5;
select name  from biodata where char_length(name)=(select char_length(name) from biodata where name ='rahul');


use sakila;
select * from film;

-- find those movie where the rental rate is same for movie of african egg
select rental_rate from film where title='african egg';
select rental_rate,title from film where rental_rate=2.99;
select rental_rate,title from film where rental_rate=(select rental_rate from film where title='african egg');-- dynamic cond

-- get the movie id ,name where the rental rate is min of rental rate
select * from film;
select min(rental_rate) from film;
select film_id,title,min(rental_rate) from film where rental_rate=0.99;



--  in multi row subreqy multiple rows one column 
-- multirow subquery mein direct arithmetic operator nhi lg sakte ex:=,>,<

select age from biodata where name='anjali' or name='aishwarya';
select * from biodata where name ='rahul';
select * from biodata where name ='rahul' and age in(select age from biodata where name='anjali' or name='aishwarya');

-- i need find the name fo rahul where the age is not equal the age of anjali and aishwarya
select * from biodata where age not in(select age from biodata where name='anjali' or name='aishwarya');

use shadid;

CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT);
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

select * from employees;

select avg(salary) from employees;-- 74285.7143
select * from employees where salary>(select avg(salary) from employees);

select max(salary) from employees;-- 95000
select * from employees where salary=(select max(salary) from employees);

select salary from employees where emp_id=101;-- 50000
select * from employees where salary>(select salary from employees where emp_id=101);

select min(salary) from employees;-- 48000
select name,department,salary from employees where salary=(select min(salary) from employees);

-- multirow su query example 
select department from employees where name='alice' or name='bob';
select * from employees where department in(select department from employees where name='alice' or name='bob');

-- find the salary of emp_id 103 and 105
select salary from employees where emp_id=103 or emp_id =107;
select * from employees where salary not in(select department from employees where name='alice' or name='bob');

-- i need to find those employees whose salry is greter then 103 and 105

-- any operater = kisi se bhi 
select * from employees where salary >any(select salary from employees where emp_id=103 or emp_id=107);

select * from employees where department='hr';
select * from employees where salary >any(select salary from employees where department='hr');

-- all opertor
select * from employees where salary >all(select salary from employees where department='hr');

select * from employees where department ='it';
select * from employees where salary>all(select salary from employees where department='it');

-- find th employees detiql who work in it department and have the salry greter then the salry of employee id 101.
select * from employees where emp_id=101;
select * from employees where department='it' and salary in(select salary from employees where emp_id=101);

-- find the name of a person whose salary is greter then all the salalry of hr or it department.
select * from employees;
select  name from employees where department='hr' or department='it';-- 50000 and 48000
select name from employees where salary >all(select salary from employees where department='hr' or department='it');-- 50000 and 48000

-- find th emp id and name of the users whose salry is greter then the salry of any employee working under the manager id 101
select emp_id ,name from employees where manager_id=101;
select emp_id,name from employees where salary > any(select salary from employees where manager_id=101);

-- find out the second highest salry from this table. 
select max(salary) from employees;
select max(salary) from employees where salary <(select max(salary) from employees );















