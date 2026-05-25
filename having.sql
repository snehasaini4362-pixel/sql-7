
-- find th etotal ntranc done by each person in the dicreaseing order
use sakila;
-- har ek person ke har ek product ka sales 
select sales_person,product,sum(amount) from sales group by sales_person,product order by sales_person ;

select * from payment;
select year(payment_date), month(payment_date) from payment group by year(payment_date), month(payment_date);



