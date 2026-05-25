-- group by=grouping by similar values

-- groupby ek operation hai jo data ko common values ke basis par groups me divide karta hai, aur phir 
-- har group par aggregate functions (jaise sum, count, average) apply karne deta hai.

-- group by k sath wo column select krte h ...wo select k sath bhi likha jata hai.
select department from employees group by department;

-- group by is a statement which is used  to groups similar value together .

-- | Feature     | DISTINCT                | GROUP BY                             |
-- | ----------- | ----------------------- | ------------------------------------ |
-- | Kaam        | Duplicate values hatana | Data ko groups me divide karna       |
-- | Use         | Unique values nikalna   | Group bana ke calculation karna      |
-- | Aggregation | ❌ Use nahi hota         | ✅ SUM, COUNT, AVG etc. use hote hain |
-- | Output      | Sirf unique rows        | Har group ka result                  |

select department ,count(department) from employees group by department ;

select department ,sum(salary) from employees group by department ;

select department ,sum(salary),count(department),avg(salary) from employees group by department ;

use sakila;
select * from employees;

select * from employees where job_title ='software enginner';

-- from this payment table find the total amt and avg amt 
--  from this payment table find the no. of trancation done by cusotomer id 1
-- find the total tran done by cus id 2 and 5
-- find the avg amount spend in the year 2005
select * from payment;
select count(amount) from payment where customer_id=1 ;
select sum(amount),avg(amount) from payment;
select sum(amount) from payment  where customer_id in (2,5) group by customer_id;
select avg(amount) from payment where year(payment_date)=2005;

-- u have to find out totsl trsnc
-- find total tranc anf total amount spend after the customer id 3
-- find the occurance for each amount 
-- find the total amount given in your tabale 
-- geT the avg amount spend by each stAFF
-- GET THE  total amount spend in each month
-- get the total amount spend for each month of each year
select sum(amount) from payment;
select sum(amount),count(*) from payment where customer_id =3;
select count (amount)from payment ;









 