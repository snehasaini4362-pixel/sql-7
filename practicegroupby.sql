CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(50),
    product VARCHAR(50),
    sales_person VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (region, product, sales_person, amount, sale_date) VALUES
('North', 'Laptop', 'Amit', 55000, '2025-01-05'),
('North', 'Mobile', 'Amit', 20000, '2025-01-06'),
('South', 'Laptop', 'Ravi', 60000, '2025-01-07'),
('East', 'Tablet', 'Suman', 15000, '2025-01-08'),
('West', 'Laptop', 'Neha', 58000, '2025-01-09'),

('North', 'Tablet', 'Amit', 12000, '2025-01-10'),
('South', 'Mobile', 'Ravi', 22000, '2025-01-11'),
('East', 'Laptop', 'Suman', 50000, '2025-01-12'),
('West', 'Tablet', 'Neha', 14000, '2025-01-13'),
('North', 'Laptop', 'Amit', 57000, '2025-01-14'),

('South', 'Tablet', 'Ravi', 13000, '2025-01-15'),
('East', 'Mobile', 'Suman', 21000, '2025-01-16'),
('West', 'Laptop', 'Neha', 61000, '2025-01-17'),
('North', 'Mobile', 'Amit', 19000, '2025-01-18'),
('South', 'Laptop', 'Ravi', 62000, '2025-01-19'),

('East', 'Tablet', 'Suman', 16000, '2025-01-20'),
('West', 'Mobile', 'Neha', 23000, '2025-01-21'),
('North', 'Tablet', 'Amit', 11000, '2025-01-22'),
('South', 'Mobile', 'Ravi', 25000, '2025-01-23'),
('East', 'Laptop', 'Suman', 52000, '2025-01-24'),

('West', 'Tablet', 'Neha', 13500, '2025-01-25'),
('North', 'Laptop', 'Amit', 59000, '2025-01-26'),
('South', 'Tablet', 'Ravi', 12500, '2025-01-27'),
('East', 'Mobile', 'Suman', 20500, '2025-01-28'),
('West', 'Laptop', 'Neha', 60000, '2025-01-29'),

('North', 'Mobile', 'Amit', 21000, '2025-01-30'),
('South', 'Laptop', 'Ravi', 63000, '2025-01-31'),
('East', 'Tablet', 'Suman', 17000, '2025-02-01'),
('West', 'Mobile', 'Neha', 24000, '2025-02-02'),
('North', 'Tablet', 'Amit', 12500, '2025-02-03'),

('South', 'Mobile', 'Ravi', 26000, '2025-02-04'),
('East', 'Laptop', 'Suman', 54000, '2025-02-05'),
('West', 'Tablet', 'Neha', 15000, '2025-02-06'),
('North', 'Laptop', 'Amit', 61000, '2025-02-07'),
('South', 'Tablet', 'Ravi', 14000, '2025-02-08');

select * from sales;
-- total sales
select sum(amount) as total_sales from sales;
-- mobile total sales
select sum(amount) as total_mobile from sales where product ='mobile';
-- u need to find the total sales and the avg sales in north region  but for the product laptop and mobiles
select sum(amount), avg(amount) from sales where (region="north" and product in ('laptop','mobile'));
-- u need to find out the max amt the min amount in feb month
select max(amount),min(amount) from sales  where month(sale_date)=2;
-- find out the total sales we have don eeach region 
-- find out the avg sales each person
-- find the total amt and total tranc done for each product but the amit should not be th esales person
-- find the no. of sales each person for the amt greter then 10 thousand
-- find the no. total of trancation done for day 1 to 7 for any month 
-- find the total amoiunt ,avg,max for each product of each amount 
-- find the total tranc amount for each product where the product should be sold more than 13 times
-- 1
select sum(amount), count(region) from sales group by region;
select * from sales;
select avg(amount) ,count(*) from sales group by id;
select sum(amount),count(*) from sales where sales_person!='amit' group by product ;
select count(*) from sales where amount>=10000 group by sales_person ;
select  count(*) from sales where day(sale_date) between 1 and 7 ;





use sakila ;
CREATE TABLE Sales_Data (
    OrderID     INT             NOT NULL PRIMARY KEY,
    CustomerID  VARCHAR(10)     NOT NULL,
    Category    VARCHAR(20)     NOT NULL,
    OrderDate   DATE            NOT NULL,
    OrderValue  DECIMAL(10, 2)  NOT NULL
);


INSERT INTO Sales_Data (OrderID, CustomerID, Category, OrderDate, OrderValue) VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500.00),
(1002, 'C203', 'Apparel',     '2024-01-07',  3200.00),
(1003, 'C205', 'Home',        '2024-01-10',  5800.00),
(1004, 'C201', 'Electronics', '2024-01-15',  8900.00),
(1005, 'C207', 'Apparel',     '2024-01-18',  2100.00),
(1006, 'C210', 'Home',        '2024-01-22',  4700.00),
(1007, 'C203', 'Electronics', '2024-02-01', 15300.00),
(1008, 'C212', 'Apparel',     '2024-02-05',  1800.00),
(1009, 'C205', 'Home',        '2024-02-08',  6200.00),
(1010, 'C214', 'Electronics', '2024-02-12',  9400.00),
(1011, 'C207', 'Apparel',     '2024-02-17',  2900.00),
(1012, 'C210', 'Electronics', '2024-02-20', 11000.00),
(1013, 'C212', 'Home',        '2024-03-01',  3500.00),
(1014, 'C201', 'Apparel',     '2024-03-05',  4100.00),
(1015, 'C214', 'Home',        '2024-03-10',  7800.00),
(1016, 'C210', 'home',        '2024-03-10',  9900.00)  
;

select * from sales_data;
-- LEVEL 1 — EASY Basic GROUP BY with Aggregate Functions
-- Q1. Calculate the total revenue (sum of OrderValue) for each product Category.
select category as product_category, sum(ordervalue) as total_revenue from sales_data group by product_category;

-- Q2. Count the total number of orders placed in each Category.
select category ,count(*) as total_orders from saleby1 group by category;

-- 3. Find the highest (maximum) single OrderValue within each Category.
select category,max(ordervalue) from sales_data group by category;

-- LEVEL 2 — EASY Using DISTINCT to Identify Unique Segments
-- Q1. List all unique product Categories that appear in the Sales_Data table.
select distinct category from sales_data;

-- Q2. List all unique CustomerIDs who have placed at least one order.
select distinct customerid from sales_data ;

-- Q3. Find all unique combinations of CustomerID and Category (i.e., which customers bought from which categories).
select distinct customerid,category from sales_data;

-- LEVEL 3 — MEDIUM GROUP BY with Multiple Columns

-- Hint: Group records by more than one column simultaneously to create multi-dimensional summaries.
select customerid,category,sum(ordervalue) as total_sales from sales_data group by  customerid,category;

-- Q2. Order Count by CustomerID and Category
select customerid,category,count(*) as count_transactions from sales_data group by customerid,category;

-- Q3. Revenue by Category and Month
select * from sales_data;
select category,month(orderdate) as m,sum(ordervalue) as totalsales from sales_data group by m ,category;

-- LEVEL 4 — MEDIUM GROUP BY Combined with HAVING
-- Q1. Categories with Revenue > $20,000
select category,sum(ordervalue) as totalsales from sales_data
 group by category having category in ('electronics','home') order by category;
 
--  Q2. Customers with More Than 1 Order
select customerid,count(*) as transactions from sales_data group by customerid having transactions>1 order by customerid;

-- Q3. Customer + Category Combinations Spending > $10,000
select customerid,sum(ordervalue) as total_spent,category from sales_data group by customerid,category having total_spent>10000 
order by customerid;

-- Level 5 — Expected Output
-- Q1. Category Summary (Avg Order Value > $5,000, sorted by Revenue) 
select category,count(*) as total_order,avg(ordervalue) as avgorder_value,
sum(ordervalue) as total_revenue from sales_data group by category having avgorder_value>5000 order by total_revenue ;
 -- Q2. High-Value Repeat Customers (>1 order, Avg OrderValue > $6,000)
select customerid,count(*) as order_count,avg(ordervalue) as avg_ordervalue from sales_data group by customerid
having order_count>1 and avg_ordervalue>6000 ;

-- Q3. Category-Month Summary (Min 2 Orders, Sorted by Month then Revenue)
-- Category Month Orders Total_Revenue ($) Avg_OrderValue ($)
select * from sales_data;
select category,month(orderdate) as m,sum(ordervalue) as total_revenue,avg(ordervalue) as avg_ordervalue,count(*) 
as orders from sales_data group by category,month(orderdate) having orders>=2 order by m,total_revenue;

-- finish --