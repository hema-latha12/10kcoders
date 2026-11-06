create database company1;

create table dept (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO dept (dept_id, dept_name, location)
VALUES
(10, 'ACCOUNTS', 'Hyderabad'),
(20, 'IT', 'Bangalore'),
(30, 'SALES', 'Chennai'),
(40, 'HR', 'Mumbai');


CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    job VARCHAR(50),
    manager_id INT,
    hire_date DATE,
    salary DECIMAL(10,2),
    commission DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(dept_id)
);

INSERT INTO emp
(emp_id, emp_name, job, manager_id, hire_date, salary, commission, dept_id)
VALUES
(101, 'Arjun', 'MANAGER', NULL, '2018-01-15', 90000, NULL, 20),
(102, 'Bhavya', 'DEVELOPER', 101, '2020-03-10', 60000, NULL, 20),
(103, 'Charan', 'DEVELOPER', 101, '2021-07-01', 55000, NULL, 20),
(104, 'Deepa', 'MANAGER', NULL, '2017-05-20', 85000, NULL, 30),
(105, 'Eshwar', 'SALESMAN', 104, '2019-09-12', 40000, 5000, 30),
(106, 'Farah', 'SALESMAN', 104, '2022-01-25', 38000, 3000, 30),
(107, 'Gopal', 'ACCOUNTANT', 108, '2019-11-30', 45000, NULL, 10),
(108, 'Harini', 'MANAGER', NULL, '2016-02-14', 80000, NULL, 10),
(109, 'Imran', 'CLERK', 108, '2023-04-05', 30000, NULL, 10),
(110, 'Jaya', 'ANALYST', 101, '2022-08-18', 60000, NULL, NULL);

select * from emp;

-- Section A-Theory
-- Q1. Database, DBMS and RDBMS

-- a) Definitions:
--    - Database: An organized, structured collection of data stored electronically in a computer system for fast access, retrieval, and management.
--    - DBMS (Database Management System): Software that acts as an interface between a database and its end-users or programs, allowing users to create, read, update, and delete data.
--    - RDBMS (Relational Database Management System): A specialized type of DBMS that stores data in structured tables (rows and columns) and enforces explicit relationships between them using keys.

-- b) 4 Differences between DBMS and RDBMS:
--    1. Data Storage: DBMS stores data as files, hierarchical structures, or key-value pairs, whereas RDBMS stores data strictly in tabular format (rows and columns).
--    2. Relationships: DBMS does not inherently support relationships between data files, whereas RDBMS explicitly supports relationships using Primary Keys and Foreign Keys.
--    3. Normalization: DBMS does not enforce normalization (leading to data redundancy), whereas RDBMS strongly supports and applies normalization rules to minimize duplicate data.
--    4. ACID Support & Security: DBMS has limited or weak transaction/ACID support and basic security, whereas RDBMS is fully ACID-compliant with robust multi-user security, roles, and permissions.

-- c) 4 of Codd’s Rules:
--    1. Rule 0 (Foundation Rule): Any system that is advertised as a relational database management system must be able to manage databases entirely through its relational capabilities.
--    2. Rule 1 (Information Rule): All information in a relational database is represented explicitly in one and only one way—by values in tables.
--    3. Rule 2 (Guaranteed Access Rule): Every single data value (atomic value) is guaranteed to be accessible logically with a combination of table name, primary key, and column name.
--    4. Rule 3 (Systematic Treatment of Null Values): Null values must be supported in the database for representing missing or inapplicable information in a systematic way.

-- ----------------------------------------------------------------------------------------------------

-- Q2. SQL vs MySQL

-- a) Difference between SQL and MySQL:
--    - SQL (Structured Query Language): A standardized programming/query language used to communicate with, query, and manipulate relational databases.
--    - MySQL: An actual software product—an open-source Relational Database Management System (RDBMS) that implements SQL to manage tabular databases.

-- b) Compare MySQL with Oracle / SQL Server on 4 points:
--    1. Licence: MySQL is open-source (Dual-licensed: GPL / Enterprise), whereas Oracle and SQL Server are proprietary, commercial enterprise software.
--    2. Row Limiting Syntax: MySQL uses "LIMIT n", whereas Oracle uses "ROWNUM" (or FETCH FIRST n ROWS ONLY) and SQL Server uses "TOP n".
--    3. Procedural Extension: MySQL uses its own standard stored procedure syntax, whereas Oracle uses PL/SQL (Procedural Language/SQL) and SQL Server uses T-SQL (Transact-SQL).
--    4. Features: MySQL is widely favored for web applications (LAMP stack) and lightweight-to-medium scaling, whereas Oracle and SQL Server are engineered for massive enterprise workloads, deep in-memory analytics, and heavy corporate concurrency.

-- c) Other RDBMS & NoSQL Databases:
--    - 3 RDBMS Products: PostgreSQL, SQLite, Microsoft SQL Server
--    - 2 NoSQL Databases: MongoDB, Cassandra

-- ----------------------------------------------------------------------------------------------------

-- Q3. Constraints

-- a) What are constraints and why are they used:
--    - What they are: Rules or restrictions enforced on table columns or data types in an RDBMS.
--    - Why they are used: They guarantee data integrity, accuracy, reliability, and prevent invalid data entry (e.g., duplicate records or null keys) into the database.

-- b) Explain 6 Constraints with Examples:
--    1. PRIMARY KEY: Uniquely identifies each record in a table and cannot contain NULL. Example: emp_id INT PRIMARY KEY
--    2. FOREIGN KEY: A field that links to the Primary Key of another table, enforcing referential integrity. Example: dept_id INT REFERENCES Department(dept_id)
--    3. UNIQUE: Ensures all values in a column are distinct from one another. Example: email VARCHAR(100) UNIQUE
--    4. NOT NULL: Guarantees that a column cannot store a NULL (empty) value. Example: salary DECIMAL(10,2) NOT NULL
--    5. CHECK: Ensures that all values in a column satisfy a specific condition. Example: age INT CHECK (age >= 18)
--    6. DEFAULT: Sets a default value for a column when no value is explicitly provided during insertion. Example: status VARCHAR(20) DEFAULT 'ACTIVE'

-- c) PRIMARY KEY vs UNIQUE & Multiple Constraints:
--    - Differences: A PRIMARY KEY uniquely identifies a row, does not allow NULL values, and a table can have only one primary key. A UNIQUE constraint also ensures distinct values, does allow a single NULL value (in most RDBMS), and a table can have multiple unique constraints.
--    - Table Limits: No, a table cannot have more than one PRIMARY KEY. Yes, a table can have more than one UNIQUE constraint.

-- d) Composite Key and ON DELETE CASCADE:
--    - Composite Key: A primary key that consists of two or more columns combined together to uniquely identify a record in a table when no single column is unique on its own.
--    - ON DELETE CASCADE: When applied to a FOREIGN KEY constraint, it automatically deletes all matching child rows in the referencing table whenever the referenced parent row in the primary table is deleted.

-- ----------------------------------------------------------------------------------------------------

-- Q4. SQL Command Categories

-- a) Expand DDL, DML, DQL, DCL, and TCL:
--    - DDL: Data Definition Language
--    - DML: Data Manipulation Language
--    - DQL: Data Query Language
--    - DCL: Data Control Language
--    - TCL: Transaction Control Language

-- b) Category breakdown:
--    - DDL: CREATE, ALTER, DROP, TRUNCATE, RENAME
--    - DML: INSERT, UPDATE, DELETE
--    - DQL: SELECT
--    - DCL: GRANT, REVOKE
--    - TCL: COMMIT, ROLLBACK, SAVEPOINT

-- c) TRUNCATE category and reason:
--    - Category: DDL (Data Definition Language)
--    - Reason: It modifies the table structure and storage allocation (de-allocating data pages) rather than manipulating individual data rows, and it executes an implicit COMMIT immediately without firing row-level DELETE triggers or allowing a standard rollback.

-- ----------------------------------------------------------------------------------------------------

-- Q5. DELETE vs TRUNCATE vs DROP

-- a) DELETE:
--    - What is removed: Deletes rows conditionally or all rows; table structure and schema remain.
--    - WHERE support: Supported (can use WHERE to delete specific rows).
--    - Rollback: Can be rolled back if inside an active transaction.
--    - Speed: Slower (logs row-by-row deletions and fires triggers).
--    - Auto-increment reset: Does not reset the auto-increment seed counter.
--    - Command category: DML

-- b) TRUNCATE:
--    - What is removed: Deletes all rows from the table; table structure and schema remain.
--    - WHERE support: Not supported (cannot use WHERE; deletes all rows).
--    - Rollback: Cannot be rolled back in most RDBMS (implicit commit).
--    - Speed: Faster (deallocates data pages as a whole rather than logging individual rows).
--    - Auto-increment reset: Resets the auto-increment seed counter back to its starting value.
--    - Command category: DDL

-- c) DROP:
--    - What is removed: Deletes the entire table structure, schema, data, and constraints completely from the database.
--    - WHERE support: Not supported (destroys the whole object).
--    - Rollback: Cannot be rolled back (DDL auto-commits).
--    - Speed: Instantaneous (removes metadata and file allocations directly).
--    - Auto-increment reset: Removes the table entirely (auto-increment counter is destroyed with it).
--    - Command category: DDL


-- Section B-Commands
-- DDL
-- (a)
create table project(proj_id int primary key auto_increment,
proj_name varchar(30) unique not null, budget decimal(10,2) check (budget>0),
dept_id int,
foreign key (dept_id) references dept(dept_id));

-- (b)
alter table project add column start_date date;

select * from project;

-- (c)
alter table project modify column proj_name varchar(50);

-- (d)
rename table project to projects;
alter table projects drop column start_date;

select * from projects;

insert into projects(proj_name,budget,dept_id) values ('lic policy project', 50000, 30);

-- (e)
truncate projects;

-- DML
-- (a)
insert into projects(proj_name,budget,dept_id)
values ('resume screening system', 70000, 30);
insert into projects(proj_name,budget,dept_id)
values ('career recommendation system', 50000, 20);

-- (b)
select * from emp;
update emp
set salary=salary*1.10
where dept_id in (select dept_id from dept
where dept_name='IT');

-- (c)
update emp
set commission=0
where commission is null
and dept_id in (select dept_id from dept
where dept_name='sales');

-- (d)
set sql_safe_updates=0;
delete from emp
where hire_date < '2017-01-01';

-- (e)
-- already inserted in all tables

-- DQL
-- (a)
select emp_name,job,salary from emp
where salary between 40000 and 60000;

-- (b)
select * from emp
where emp_name like 'H%' 
or emp_name like '%a';

-- (c)
select * from emp
where commission is null and
manager_id is null;

select * from emp;

-- (d)
select * from emp
order by salary desc
limit 3
offset 1;

-- (e)
select distinct(job) from emp
order by job asc;

-- (f)
select * from emp
where dept_id in (10,30);

select * from emp
where dept_id=10 or dept_id=30;

-- TCL
-- (1)
set autocommit=0;

-- (2)
update emp
set salary=35000
where emp_id=109;

-- (3)
savepoint sp1;

-- (4)
delete from emp
where emp_id=109;

-- (5)
rollback to sp1;

select * from emp;

-- (6)
commit;

-- because drop table is a ddl command if we use ddl command
-- it automatically commit the changes we cannot rollback it.

-- DCL
-- (a)
create user analyst@localhost identified by '1234';
select user,host from mysql.user;

-- (b)
grant select,insert on company1.emp to 'analyst'@'localhost';
flush privileges;

-- (c)
revoke insert on company1.emp from 'analyst'@'localhost';

-- (d)
-- with grant option can give the what rights(privileges) given by a user
-- can be that user can send those given rights(privileges) to other users

-- (e)
show grants for 'analyst'@'localhost';

-- Section C-Functions
-- single row functions
-- (a)
select upper(emp_name),length(emp_name),substr(emp_name,1,3) from emp;

-- (b)
select concat(emp_name,' - ',job) as emp_name_job from emp;

-- (c)
select emp_name,hire_date,
timestampdiff(year,hire_date,curdate()) as years_worked,
month(hire_date) as hire_month from emp;

-- (d) 
select emp_name,commission,salary,
(salary+coalesce(commission,0)) as total_pay from emp;

-- (e)
select emp_name,salary,case 
when salary >= 80000 then 'high'
when salary >= 50000 then 'medium'
else 'low'
end as sal_range
from emp;

-- (f)
select round(salary),mod(salary,7) from emp;

-- Aggregate functions
-- (a)
select sum(salary),avg(salary),min(salary),count(*) from emp;

-- (b)
select count(*),count(commission),count(distinct dept_id)from emp;
-- count(*)-> counts all records even null values
-- count(column)-> counts not null records 
-- count(distict column)-> counts distict records

-- (c)
select dept_id,avg(salary) from emp
group by dept_id
having avg(salary)>50000;

-- (d)
select job,count(*) from emp
group by job
order by count(*) desc;

-- (e)
 
-- cause we cannot pass more than one column name in the select statement
-- we can only pass group by column and aggregate function while using
-- group by..if you want to use u need to group that column also

select emp_name,dept_id,max(salary) from emp
group by dept_id;

-- fix it
select e.emp_name,e.dept_id,e.salary
from emp e
where e.salary = (select max(salary) from emp
where dept_id=e.dept_id);

-- (f)
-- where :
-- 1)execute before group by
-- 2)filter records row by row
-- 3)we cannot use aggreate functions in it

-- having :
-- 1)executes after group by
-- 2)filters grouped records
-- 3)we can use aggregate functions in it

-- window functions
select salary,dept_id,row_number() over (partition by dept_id 
order by salary desc) as rownm, rank() over (partition by dept_id 
order by salary desc) as rnk, dense_rank() over (partition by dept_id 
order by salary desc) as densernk
from emp;

-- if two persons got 60000
-- row_number() assign 1,2 even they are unique in dept
-- rank() assigns unique number as 1,1 for duplicates and skips next value
-- like 2 and assigns next sal 3 in that dept
-- desnse_rank() assigns unique number as 1,1 for deuplicates and
-- doesnot skips the next value in that dept it assigns 2

-- (b)
select emp_name,salary,dept_id,avg(salary) 
over (partition by dept_id) as dept_avg_sal from emp;

-- (c)
select emp_name,hire_date,sum(salary) over 
(order by hire_date) as sum_sal
from emp;

-- (d)
select emp_name,hire_date,lag(salary) over 
(order by hire_date) as prev_sal,
lead(salary) over (order by hire_date) as next_sal
from emp;

-- (e)
select emp_name,salary,dept_id,
dense_rank() over (partition by dept_id order by salary desc) rnk
from emp;

select emp_name,salary,dept_id from (select emp_name,salary,dept_id,
dense_rank() over (partition by dept_id order by salary desc) rnk
from emp) t
where rnk<=2;

with dept_max as (select emp_name,salary,dept_id,
dense_rank() over (partition by dept_id order by salary desc) 
as rnk from emp)

select emp_name,salary,dept_id
from dept_max
where rnk<=2;

-- (f)
-- group by :
-- 1)executes before select statement
-- 2)group the records and the individual records will hidden
-- 3)summarizes the data using aggreagte functions

-- partition by :
-- 1)executes after select statement
-- 2)group the records and the individual records will remain
-- 3)summarizes the data using aggregate is optional

-- section D-Joins
-- inner join
-- (a)
select e.emp_name,e.job,d.dept_name,d.location
from emp e inner join dept d
on e.dept_id=d.dept_id;

-- (b)
select count(e.emp_id),d.dept_name
from emp e inner join dept d
on e.dept_id=d.dept_id
group by d.dept_name;

-- (c)
-- cause inner join will return matching records only and jaya has no dept id
-- and also in dept table these are no emp of that dept 40

-- Left & Right outer join
-- (a)
select * from emp e
left outer join dept d
on e.dept_id=d.dept_id;

-- (b)
select * from emp e
right outer join dept d
on e.dept_id=d.dept_id;

-- (c)
select d.dept_name from dept d
left outer join emp e
on e.dept_id=d.dept_id
where e.emp_id is null;

-- (d)
select * from emp e
right outer join dept d
on e.dept_id=d.dept_id;

-- (e)
-- combines vertically
select emp_name,job from emp
union
select dept_id,dept_name from dept; -- remember pass same no of cols

-- union can defaulty remove duplicates
-- union all keeps duplicates

-- self join
-- (a)
select e.emp_name as emp,m.emp_name as mngr from emp e
left join emp m on e.manager_id=m.emp_id;

-- (b)
select m.emp_name as mngr,count(e.emp_id) as employees from emp e
join emp m on e.manager_id=m.emp_id
group by e.manager_id;

-- (c)
select e.emp_name,j.job,d.dept_name from emp e
join emp j on e.dept_id=j.dept_id
and e.job=j.job
join dept d on e.dept_id=d.dept_id;

-- (d)
select e.emp_name as empl, m.emp_name as mngr,
e.salary as emp_sal, m.salary as mngr_sal
from emp e join emp m
on e.manager_id=m.emp_id
where e.salary > m.salary;

-- cross join
-- (a)
select * from emp cross join 
dept;

-- cols added rows multiple

-- (b)
-- 1)to create large combination of datasets
-- 2)build reports
-- 3)fill data gaps

-- (c)
-- if you don't use where clause so it returns cartesian product
-- cross join is used to combine the two tables and if they don't
-- have any relation table 1 records merge with table 2 records
-- and the return table should be cols added and rows multipled

-- subqueries
-- (a)
select * from emp
where salary > (select salary from emp
where emp_name='Bhavya');

-- (b)
select * from emp
where salary > (select avg(salary) from emp);

-- (c)
select * from emp
where dept_id = (select dept_id from emp
where emp_name='Eshwar');

-- (d)
-- single row subquery operators-> relational operators, in, not in
-- multi row subquery operators-> in,not in,all,any,exists

-- nested subquery
-- (a)
select max(salary) as max_sal from emp
where salary < (select max(salary) from emp);

-- (b)
SELECT * 
FROM emp 
WHERE dept_id = (
    SELECT dept_id 
    FROM emp
    GROUP BY dept_id 
    ORDER BY AVG(salary) DESC 
    LIMIT 1
);

-- (c)
SELECT * 
FROM emp 
WHERE dept_id IN (
    SELECT dept_id 
    FROM dept
    WHERE location IN ('Chennai', 'Bangalore')
);

-- (d)
SELECT * 
FROM dept 
WHERE dept_id NOT IN (
    SELECT DISTINCT dept_id 
    FROM emp
    WHERE dept_id IS NOT NULL
);

