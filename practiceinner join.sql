select * from departments;
select * from employees;

-- Write query using INNER JOIN
-- 1. Employee name aur department name show karo.
select e.emp_name ,d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id;
-- 2. Employee ka name aur salary with department name display karo.
select * from employees;
select * from departments;
select e.emp_name ,e.salary,d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id;

-- 3. Sirf IT department ke employees show karo.
select * from employees;
select * from departments;
select e.emp_name ,d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id where d.dept_name='it';

-- 4. Employees jinki salary 50000 se zyada hai unka name aur department show karo.
select * from employees;
select * from departments;
select e.emp_name ,e.salary,d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id where e.salary>50000;

-- 5. HR department me kaam karne wale employees ka data nikalo.
select * from employees;
select * from employees;
select * from departments;
select * from employees e inner join departments d on e.dept_id=d.dept_id where dept_name='hr';

-- 6. Employee aur department table ko join karke sabhi employees ke names show karo.
select * from employees;
select * from departments;
select e.emp_name  from employees e inner join departments d on e.dept_id=d.dept_id;

-- 7. Finance department ke employees ki salary show karo.
select * from employees;
select * from departments;
select e.salary,d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id where d.dept_name='finance';

-- 8. Department name ke sath employee count show karo.
select * from employees;
select * from departments;
select e.emp_name ,count(emp_id) from employees e inner join departments d on e.dept_id=d.dept_id group by e.emp_name;

-- 9. Highest salary wale employee ka department name nikalo.
select * from employees;
select * from departments;
select  e.salary,d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id  where salary=(select max(salary) from employees);

-- 10. Employee name aur unke department ko ascending order me show karo.
select * from employees;
select * from departments;
select e.emp_name ,d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id order by emp_name,dept_name asc;

-- 11. IT aur HR department ke employees show karo.
select * from employees;
select * from departments;
select e.emp_name ,d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id where dept_name in('hr','it');

-- 12. Employees jinki salary 55000 ya usse zyada hai unka department name show karo.
select * from employees;
select * from departments;
select e.emp_name ,e.salary,d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id where salary>=55000;

-- 13. Employee name aur department name descending order me display karo.
select * from employees;
select * from departments;
select e.emp_name ,d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id order by emp_name desc;

-- 14. Har employee ki salary aur uska department show karo.
select * from employees;
select * from departments;
select e.emp_name ,e.salary,d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id ;

-- 15. Department-wise average salary show karo.
select * from employees;
select * from departments;
select avg(e.salary),d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name;

-- 16. Jis department me 1 se zyada employees hain unka naam show karo.
select * from employees;
select * from departments;
select count(e.emp_id) ,d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name having count(e.emp_id)>1;

-- 17. Employee name aur department name ke sath salary > 50000 wale employees show karo.
select * from employees;
select * from departments;
select e.emp_name ,d.dept_name,e.salary from employees e inner join departments d on e.dept_id=d.dept_id where salary>50000;

-- 18. Employee aur department ko join karke sirf dept_id = 102 ka data show karo.
select * from employees;
select * from departments;
select  * from employees e inner join departments d on e.dept_id=d.dept_id where e.dept_id=102;

-- 19. Har department ke total salary show karo.
select * from employees;
select * from departments;
select  d.dept_name ,sum(salary) from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name;

-- 20. Employees ka name aur department name alphabetical order me show karo.
select * from employees;
select * from departments;
select d.dept_name,emp_name from employees e inner join departments d on e.dept_id=d.dept_id order by emp_name;




-- join with group by practice

-- 21. Department-wise total employees count karo
SELECT d.dept_name, COUNT(e.emp_id)  FROM Employee e INNER JOIN Department d ON e.dept_id = d.dept_id GROUP BY d.dept_name;

-- 22. Department-wise average salary show karo
SELECT d.dept_name, AVG(e.salary)  FROM Employee e INNER JOIN Department d ON e.dept_id = d.dept_id GROUP BY d.dept_name;

-- 23. Har department ki total salary show karo
SELECT d.dept_name, SUM(e.salary) FROM Employee e INNER JOIN Department d ON e.dept_id = d.dept_id GROUP BY d.dept_name;

-- 24. Har department ki highest salary show karo
SELECT d.dept_name, MAX(e.salary)  FROM Employee e INNER JOIN Department d ON e.dept_id = d.dept_id GROUP BY d.dept_name;

-- 25. Har department ki lowest salary show karo
SELECT d.dept_name, MIN(e.salary)  FROM Employee e INNER JOIN Department d ON e.dept_id = d.dept_id GROUP BY d.dept_name;

-- 26. Jis department me 2 ya usse zyada employees hain
SELECT d.dept_name, COUNT(e.emp_id) FROM Employee e INNER JOIN Department d ON e.dept_id = d.dept_id GROUP BY d.dept_name HAVING COUNT(e.emp_id) >= 2;

-- 27. Department-wise employee count aur total salary show karo
SELECT d.dept_name, COUNT(e.emp_id) ,SUM(e.salary)  FROM Employee e INNER JOIN Department d ON e.dept_id = d.dept_id GROUP BY d.dept_name;

-- 28. Jis department ki average salary 50000 se zyada ho
SELECT d.dept_name, AVG(e.salary) FROM Employee e INNER JOIN Department d ON e.dept_id = d.dept_id GROUP BY d.dept_name HAVING AVG(e.salary) > 50000;

-- 29. Department-wise highest aur lowest salary show karo
SELECT d.dept_name, MAX(e.salary) , MIN(e.salary)  FROM Employee e INNER JOIN Department d ON e.dept_id = d.dept_id GROUP BY d.dept_name;

-- 30. Har department me kitne employees 50000 se zyada salary lete hain
SELECT d.dept_name, COUNT(e.emp_id) FROM Employee e INNER JOIN Department d ON e.dept_id = d.dept_id WHERE e.salary > 50000 GROUP BY d.dept_name;

-- 31 .Find departments whose average salary is greater than the overall average salary.
select * from employees;
select * from departments;
select d.dept_name,avg(e.salary) as avg_salary from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name having avg(e.salary)>
(select avg(salary) from employees);
-- 32. Show departments where employee count is more than 2 and average salary is greater than 60000.
select * from employees;
select * from departments;
select d.dept_name,avg(e.salary) as avg_salary ,count(*) from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name having count(*)>2 
and    avg(e.salary)>60000;
-- 33. Display department-wise highest salary and employee count.
select * from employees;
select * from departments;
select d.dept_name,max(e.salary) as highest_salary ,count(*) from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name ;


-- 34. Find the department with the highest total salary.
select * from employees;
select * from departments;
select d.dept_name,sum(e.salary) as total_salary from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name order by total_salary desc limit 1 ;


-- 35. Show department-wise total salary, but only for departments whose minimum salary is greater than 50000.
select * from employees;
select * from departments;
select d.dept_name,sum(e.salary) as total_salary from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name having min(e.salary)>50000;

-- 36. Find departments where at least 2 employees earn more than 70000.
select * from employees;
select * from departments;
select d.dept_name  from employees e inner join departments d on e.dept_id=d.dept_id where e.salary >70000 group by d.dept_name having count(emp_id)>=2;

-- 37. Show department-wise employee count and total salary where the employee count is an even number.
select * from employees;
select * from departments;
select d.dept_name,sum(e.salary) as total_salary ,count(e.emp_id) from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name 
having count(e.emp_id)%2=0;

-- 38. Find departments whose average salary is greater than the average salary of the IT department.
select * from employees;
select * from departments;
select d.dept_name,avg(e.salary) from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name having avg(e.salary)>
 (select avg(e.salary) from employees e inner join departments d on e.dept_id=d.dept_id where d.dept_name='it');
 
-- 39. Display department-wise employee count, excluding departments with only 1 employee.
select * from employees;
select * from departments;
select d.dept_name ,count(e.emp_id) from employees e inner join departments d on e.dept_id=d.dept_id  group by d.dept_name having count(e.emp_id)>1;


-- 40. Find departments where the difference between maximum and minimum salary is greater than 30000.
select * from employees;
select * from departments;
select d.dept_name  from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name having max(e.salary)-min(e.salary)>30000;


-- 41. Show department-wise average salary and sort the result by highest average salary.
select * from employees;
select * from departments;
select d.dept_name ,avg(e.salary) as highest_average_salary from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name 
order by highest_average_salary desc;

-- 42. Find departments where total salary > 100000 and employee count > 2.
 select * from employees;
select * from departments;
select d.dept_name from employees e inner join departments d on e.dept_id=d.dept_id  group by d.dept_name having sum(e.salary)>100000 and count(e.emp_id)>2;

-- 43. Display department-wise employee count where the highest salary is greater than 80000.
select * from employees;
select * from departments;
select d.dept_name ,count(e.emp_id) from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name having max(e.salary)>80000; 

-- 44. Find the department with the lowest average salary.
select * from employees;
select * from departments;
select d.dept_name ,avg(e.salary) as avg_salary from employees e inner join departments d on e.dept_id=d.dept_id group by d.dept_name order by avg_salary limit 1;


-- 45. Show department-wise total salary and average salary, excluding HR and Sales departments.
select * from employees;
select * from departments;
select d.dept_name ,sum(e.salary) as total_salary,avg(e.salary) from employees e inner join departments d  on e.dept_id=d.dept_id where d.dept_name not in ('hr','sales')  group by d.dept_name
;

-- 46. Find departments where 2 or more employees have the same salary.
select * from employees;
select * from departments;
select d.dept_name ,e.salary ,count(*) from employees e inner join departments d  on e.dept_id=d.dept_id group by d.dept_name,e.salary having count(*)>=2;

-- 47. Show department-wise employee count where the average salary is between 50000 and 80000.
select * from employees;
select * from departments;
select d.dept_name  ,count(e.emp_id) from employees e inner join departments d  on e.dept_id=d.dept_id  group by d.dept_name having avg(e.salary) between 50000 and 80000;

-- 48. Find departments where the employee count is odd and total salary is greater than 100000.
select * from employees;
select * from departments;
select d.dept_name from employees e inner join departments d  on e.dept_id=d.dept_id   group by d.dept_name having count(e.emp_id)%2=1 and sum(salary)>100000;

-- 49. Show department-wise maximum salary where the minimum salary is not less than 40000.
select * from employees;
select * from departments;
select d.dept_name ,max(e.salary)  from employees e inner join departments d  on e.dept_id=d.dept_id   group by d.dept_name having min(e.salary)>=40000;

-- 50. Find departments whose total salary is greater than the overall average department salary.
select * from employees;
select * from departments;
select d.dept_name ,sum(e.salary) as total_salary from employees e inner join departments d  on e.dept_id=d.dept_id  group by d.dept_name 
having sum(e.salary)>(select avg(total_salary) from(select sum(salary) as total_salary from employees group by dept_id)as avg_table);
