create table employees(
emp_id int primary key, emp_name varchar(30), 
salary decimal(10,2), department varchar(20));

insert into employees values (1,'Priya',40000,'sales');
insert into employees values (2,'Kiran',65500,'IT');
insert into employees values (3,'Hema',72000,'IT');
insert into employees values (4,'Ravi',59000,'sales');
insert into employees values (5,'Ananya',35000,'Operations');
insert into employees values (6,'Lakshmi',26000,'Marketing');
insert into employees values (7,'Ankith',48900,'Operations');
insert into employees values (8,'Pornami',15000,'HR');
insert into employees values (9,'Lavudu',32000,'HR');
insert into employees values (10,'Rashmi',81000,'IT');
insert into employees values (11,'anasuya',48900,'Operations');


select * from employees;

-- Write a query to list all employees whose salary is greater than 
-- the average salary of all employees.
select * from employees
where salary > (select avg(salary) from employees);

-- Write a query to retrieve the employee (or employees) 
-- receiving the maximum salary.
select * from employees 
where salary = (select max(salary) from employees);

-- Write a query to find employees earning more than 
-- the employee named Ravi.
select * from employees 
where salary > (select salary from employees
where emp_name = 'Ravi');

-- Write a query to list employees who work in the 
-- same department as the employee named Kiran.
select * from employees
where department in (select department from employees
where emp_name = 'Kiran');

-- Write a query to obtain the second‑highest salary value.
select max(salary) from employees
where salary < (select max(salary) from employees);

-- Write a query to find employees who earn the minimum salary 
-- within their respective departments.
select * from employees
where salary in (select min(salary) from employees
group by department);

-- Write a query to retrieve the third‑highest distinct 
-- salary across the whole company.
select distinct max(salary) from employees
where salary < (select max(salary) from employees
where salary < (select max(salary) from employees));

-- Write a query to retrieve the third highest 
-- distinct salary across the whole company.
select distinct emp_name,salary from
(select emp_name,salary,dense_rank() over (order by salary desc)
as rnk from employees) tb
where rnk=3;

-- Write a query to display the top 3 highest‑paid employees 
-- ordered by salary descending.
select * from employees
order by salary desc
limit 3;

-- Write a query to identify salary values that appear more than 
-- once in the Employees table (duplicate salaries).
select salary from employees
group by salary
having count(*)>1;

set sql_safe_updates=0;

-- Write an update statement to increase the salary of every employee
-- in the IT department by 10 %.
update employees
set salary = salary+salary*0.10
where department = 'IT';

-- Write a delete statement to remove employees
-- whose salary is below ₹30,000.
delete from employees
where salary < 30000;

-- Write a query to display employee names in uppercase.
select upper(emp_name) from employees;

-- Write a query to find all employees whose names
-- contain the letter 'a' (case‑insensitive).
select * from employees
where emp_name like '%a%';

-- Write a query that uses a CASE expression to add a column 
-- salary_grade with the following mapping:
-- Salary ≥ 50,000 → High
-- Salary between 30,000 and 49,999 → Medium
-- Salary < 30,000 → Low.
select *, 
case when salary >= 50000 then 'High'
when salary between 30000 and 49999 then 'Medium'
else 'Low'
end as salary_range
from employees;




