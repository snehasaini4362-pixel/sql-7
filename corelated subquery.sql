use shadid;
select * from employees;
create table departments(dept_id int,dept_name varchar(20),location varchar(20));
insert into departments values(10,'hr','mumbai'),(20,'it','banglore'),(30,'finance','delhi');

select * from departments;

select dept_name from departments where location in ('banglore','delhi');
select * from employees 
where department =any(select dept_name from departments where location in ('banglore','delhi'));

-- correlated subquery=correlated subquery is a type of subquery where the inner query is exicuted for each value of the outer query.
-- so inner query also refer to the column of outer column.
-- inner query ka koi column outer query k columnn se match hota hai 
-- it is also called as dependent subquery.
-- genraly the outer query is refer nested query
select * from employees as e where salary>(select avg(salary) from employees where department=e.department);

select max(salary) from employees where department='it';
select * from employees as eout where  salary=(select max(salary) from employees where department=eout.department);
