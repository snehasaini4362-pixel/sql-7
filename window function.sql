-- windows function= 

-- har row k sath uska output dikhana

-- over 
use shadid;
select * from employees;
select emp_id,emp_name,salary from employees;
select emp_name,avg(salary) over() ,max(salary)over() from employees;
select emp_id,emp_name,salary-avg(salary) over() ,max(salary)over() from employees;

select emp_id,emp_name,avg(salary) over() ,max(salary)over(),count(salary)over(),min(salary)over() from employees;

select sum(salary)over(), concat(round((salary/sum(salary)over())*100),'%') from employees;

select emp_id,emp_name,salary,sum(salary) over(order by emp_id desc) from employees;
select emp_id,emp_name,salary,sum(salary) over(order by emp_name desc) from employees;

