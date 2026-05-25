-- if condition , true statement,false statement
use sakila;
select first_name,department,salary,if(department='it',true,false) from employees;
select first_name,department,salary,if(department='it',salary*1.1,salary*1.05) from employees;

-- case condition
-- /*
-- select col1,col2,
-- case
    -- when condition then statement
-- end
-- from table_name
select first_name,department,salary,
case
    when department='it' then true
    else 'non it'
end
from employees;    


select first_name,department,salary,
case
    when department='it' then salary*1.1
    when department='hr' then salary*1.05
    else salary
end as "newsalary"
from employees;    


-- if the hiring date of the emplpoyee before 2020 job title"senior hr"
-- if 2021 "associated"
-- else same name 
select * from employees;
select first_name,department,hire_date,salary ,
case 
    when year(hire_date)<2020 then concat('senior',' ',job_title)
	when year(hire_date)<2021 then concat('associated',' ',job_title)
    else job_title
end 
from employees;    


-- if the salry is greten then 7thousnd create the category name "avg salary"
-- if the salry is greten then 80 thosand "high salary" 
-- if salry greter then "extreme high salry"
-- catery name as low salry
select * from employees;
select first_name ,salary,department,
case 
    when salary>=70000 then "avg salary"
	when salary>=80000 then "high salary"
    when salary=98000 then " extreme high salary"
    else "low salary"
end 
from employees;

-- select the job_title and print the col value based on the condtion 
-- job_title = devops enginner has 2 person
select job_title, count(job_title),
case 
    when count(job_title)=1 then concat(job_title,'position have',count(job_title),'person')  
    when count(job_title)>1 then concat(job_title,'position have',count(job_title),'persons')  
end
from employees group by job_title;


