create database store;
use store;

create table customers(customer_id int primary key,
					   name varchar(20) not null,
                       signup_date date);

create table orders(order_id int primary key,
                    order_date date, order_total int,
                    customer_id int,
                    foreign key(customer_id)
                    references customers (customer_id));
                    
insert into customers values (1,'hasini','2021-09-30'), (2,'roja','2025-12-15'),
			                 (3,'brama','2018-02-28'), (4,'rajmatha','2023-11-03'),
                             (5,'prema','2019-03-29');
select * from customers;

insert into orders values (101,'2020-04-03',5,5), (102,'2026-01-22',4,2),
						  (103,'2023-08-17',2,4), (104,'2026-04-06',8,3),
                          (105,'2025-12-09',14,5), (106,'2022-05-31',7,2),
                          (107,'2019-01-12',28,3), (108,'2024-10-13',11,1),
                          (109,'2023-11-03',1,4), (110,'2022-07-16',19,5);

select * from orders;

select *, row_number() over (partition by customer_id 
							 order by order_date asc) rowno
from orders;

select *,rank() over (partition by customer_id 
					  order by order_total desc) highord
from orders;

select *,lag(order_total) over (partition by customer_id 
					  order by order_total desc) previous
from orders;

select *,sum(order_total) over (partition by customer_id 
					  order by order_date asc) totalOrd
from orders;

select order_id, customer_id, order_date, order_total
from (
    select *,
           row_number() over (order by order_total desc) as rn
    from orders
) t
where rn <= 3;