create database windowsdb;
use windowsdb;


-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
-- ============================================
--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2020),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);



select * from employees;





select *,rank() over(),dense_rank() over(),row_number() over() from employees;

select *, dense_rank() over(partition by dept order by salary) from employees;

select * from employees as e where salary=(select max(salary) from employees where dept=e.dept) ;
-- query ko table ka name dena 
select * from (select *, max(salary) over(partition by dept) as deptsalary from employees)as trh where salary=deptsalary;
-- backtick `````
select * from(select * ,rank() over(partition by dept order by salary desc) as rnk from employees) as temp where rnk=1 ;

-- who is person second highest 
-- second highest ,max,min esa kuch manga jaye to kabhi bhi  order by ,limit ye sab use nhi kiya jata
select * from (select *,dense_rank() over(order by salary desc)as rnk from employees)as tmp where rnk=2;
select * from employees where salary=(select max(salary) from employees where salary <(select max(salary) from employees));

-- find second highest
select max(salary) from employees where salary <(select max(salary) from employees);

-- fourth lowest
select * from (select *,dense_rank() over(order by salary)as rnk from employees)as tmp where rnk=4;
