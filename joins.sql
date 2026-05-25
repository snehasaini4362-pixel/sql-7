-- self join=a table when joined with itself.
create database joindb;

use joindb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employees (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),
(15, 'Nitin', 'IT', 6, 51000);



/*

Amit
 ├── Neha
 │    ├── Rohit
 │    │     └── Meera
 │    └── Anjali
 │
 ├── Raj
 │    ├── Karan
 │    │     ├── Arjun
 │    │     └── Pooja
 │    └── Priya
 │           └── Nitin
 │
 └── Simran
      ├── Vikas
      │     └── Dev
      └── Sneha

*/
select * from employees;
select empl.emp_id,empl.emp_name,empl.manager_id,manager.emp_id,manager.emp_name from employees as empl join 
employees as manager where empl.manager_id=manager.emp_id;

select e.emp_id,e.emp_name,e.manager_id,e.department,m.emp_id,m.emp_name,m.department from employees as e join
 employees as m where  e.manager_id=m.emp_id and e.department=m.department;

-- u need to find the emp name and salary if it is greter then salary of its manager.
select e.emp_id,e.emp_name,e.manager_id,e.salary,m.emp_id,m.emp_name,m.salary from employees as e join
 employees as m where  e.manager_id=m.emp_id and e.salary>m.salary;


-- show all the emp name with all the mannger name.
select e.emp_name,m.emp_name from employees as e left join employees as m on e.manager_id=m.emp_id;
-- show employees with its grand manager.
select e.emp_name as employee_name,m.emp_name as manager_name ,gm.emp_name as grand_manager from employees as e left 
join employees as m on e.manager_id=m.emp_id  left join employees gm on m.manager_id=gm.emp_id;

-- find employees who  are also a manager.
select distinct e.emp_name from employees as e join employees as m on e.emp_id=m.manager_id;



create database regexjoin;

use regexjoin;

-- Create first table: customers
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert records into customers
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Pune'),
(4, 'Sneha', 'Jaipur'),
(5, 'Karan', 'Chennai');


-- Create second table: orders
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(50)
);

-- Insert records into orders
-- Duplicate customer_id is present because some customers ordered multiple products
INSERT INTO orders VALUES
(101, 1, 'Laptop'),
(102, 2, 'Mobile'),
(103, 1, 'Keyboard'),
(104, 3, 'Mouse'),
(105, 2, 'Headphones');
use sakila;

select * from customers;
select * from orders;
-- inner join it is type of join which will filter the data on common values
select  customers.customer_id,customers.customer_name,orders.customer_id,product_name from customers join orders where customers.customer_id=orders.customer_id;
-- left join or outer join me jo data match nhi krta waha null aata 
select  customers.customer_id,customers.customer_name,orders.customer_id,product_name from customers left join orders on customers.customer_id=orders.customer_id;

-- is null 
select  customers.customer_id,customers.customer_name,orders.customer_id,product_name from customers left join orders on customers.customer_id=orders.customer_id
where product_name is null;
-- is not null 
select  customers.customer_id,customers.customer_name,orders.customer_id,product_name from customers left join orders on customers.customer_id=orders.customer_id
where product_name is not null;

-- right outer join
insert into orders values(106,11,'ice cream');
select  customers.customer_id,customers.customer_name,orders.customer_id,product_name from customers right join orders on customers.customer_id=orders.customer_id;

-- natural join = dono table me jo coloumn same hai usko automatic join krta hai 
-- work like inner join and columns not same then work like cross join
select  customers.customer_id,customers.customer_name,orders.customer_id,product_name from customers natural join orders ;



-- 1. What Are SQL Joins?
-- In a real-world database, data is spread across multiple tables — not stuffed into one giant table. SQL Joins
-- are the glue that connects these tables together so you can pull meaningful, combined information in a
-- single query.

-- 1.1 Why Do We Use Joins?
-- Imagine a school that keeps:
-- • A Students table (who the students are)
-- • A Courses table (what courses exist)
-- • An Enrollments table (which student is in which course)

-- 1.2 Key Features of SQL Joins
-- • Combine rows from two or more tables based on a related column.
-- • Avoid data duplication — each piece of information lives in one place.
-- • Support filtering, aggregation, and complex logic across tables.
-- • Work with any relational database: MySQL, PostgreSQL, SQL Server, SQLite, etc.
-- • Multiple join types give you precise control over which rows are included.

-- INNER JOIN
--  Concept
-- INNER JOIN returns only the rows where there is a MATCH in BOTH tables. Think of it as the intersection
-- — only common data.
-- 🔑 Real-world analogy: You have a guest list (employees) and a seating chart (departments). INNER JOIN
-- gives you only guests who have a seat — no seat = excluded,empty seat = excluded.

-- LEFT JOIN (LEFT OUTER JOIN)
-- 4.1 Concept
-- LEFT JOIN returns ALL rows from the LEFT table, and the matched rows from the right table. If there is no
-- match, the right side columns show NULL.
-- Think of it as: 'Give me everyone from the left table, and fill in any matching info from the right — if no
-- match, leave it blank.'


-- RIGHT JOIN (RIGHT OUTER JOIN)
-- Concept
-- RIGHT JOIN is the mirror image of LEFT JOIN. It returns ALL rows from the RIGHT table, and matching
-- rows from the left. Non-matching left rows show NULL.
-- Think of it as: 'Show me every department, even if no employee is assigned to it.'

-- FULL OUTER JOIN
--  Concept
-- FULL OUTER JOIN returns ALL rows from BOTH tables. Where there is a match, the columns are filled in.
-- Where there is no match, NULL fills the missing side.
-- Think of it as: 'I want every employee AND every department — match them where you can, otherwise just
-- show NULL.'


-- SELF JOIN
-- Concept
-- A SELF JOIN joins a table with itself. This sounds strange, but it's incredibly useful when rows in a table are
-- related to other rows in the SAME table.
-- 🔑 Classic use case: An employee table where each employee has a manager — and the manager is also
-- an employee in the same table!


-- SELF JOIN
--  Concept
-- A SELF JOIN joins a table with itself. This sounds strange, but it's incredibly useful when rows in a table are
-- related to other rows in the SAME table.
-- 🔑 Classic use case: An employee table where each employee has a manager — and the manager is also
-- an employee in the same table!

-- work like inner join 
-- differnce between inner and natural join 
-- inner join specify with on but natural join connect without on
