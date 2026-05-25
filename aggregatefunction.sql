-- multirow functon = applied on multiple rows and give 1 output/ aggregate function

-- distinct function
-- unique value lana duplicate values ko remove krna 
select * from employees;
select distinct(department)  from employees;

-- calculation on your data = aggregate function

-- count(),sum(),avg(),max(),min()
-- count function kabhi bhi null ko nhi ginta
select count(department) from employees;
select count(distinct department) from employees;

-- you can use aggregate function than you can't use another column directly
-- select salary , count(salary) from employees; -- wrong 
-- use multiple aggregte functions
select sum(salary),count(salary),avg(salary),min(salary),max(salary) from employees;


