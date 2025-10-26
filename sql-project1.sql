create database sqltest;
use sqltest;
CREATE TABLE CUSTOMERS(
CUSTOMER_ID INT PRIMARY key,
NAME varchar(50) NOT NULL,
email varchar(100) unique,
city varchar(50) default 'unknown',
age int check(age>=18)
);
insert into customers(customer_id,name,email,city,age)
value
(101,'john','john1@gmail.com','mumbai',21),
(102,'lisa','lisa1@gmail.com','delhi',18),
(103,'peter','peter@gmail.com','haryana',19);


select * from customers;
select name,age from customers;
select age,customer_id from customers;

select 10+5 as number_of_sum;
insert into customers values(104,'spider','spider@gmail.com','delhi',22);
INSERT INTO CUSTOMERS VALUES(105,'lb','lb1@gmail.com','mumbai',23);



select * from customers;
select city,age from customers
where city='delhi' and age=18;


select * from customers
where age>20
where age>20;

select * from customers
where age>20 and city='delhi'
where age>20 and city='delhi';

use sqltest
use sqltest;
create table employees(
emp_id int primary key,
name varchar(50),
department varchar(20),
salary int
);

select * from employees
select * from employees;
insert into employees(emp_id,name,department,salary)
value
values
(01,'alice','hr',32000),
(02,'bob','finamce',45000),
(02,'bob','finance',45000),
(03,'charlie','it',50000),
(04,'david','finance',60000),
(05,'elwyn','it',45000),
(06,'lb','hr',60000),
(07,'abc','marketing',50000),
(08,'john','finance',47000),
(09,'mark','hr',52000),
(10,'peter','it',35000);

select * from employees
where salary between 35000 and 40000
where salary between 35000 and 40000;

select * from employees
where department in('hr','finance')
where department in('hr','finance');

select * from employees
where name like '%ar%'
where name like '%ar%';

select *  from customers
order by age desc
order by age desc;

select *  from customers
order by name desc
order by name desc;

select * from customers
order by city,age 
order by city,age;

SET SQL_SAFE_UPDATES = 0; 
safe mode off karne ke liye
-- safe mode off karne ke liye

UPDATE CUSTOMERS
SET city ='banglore'
WHERE NAME ='ravi'
WHERE NAME ='ravi';

DESC CUSTOMERS;
SELECT * FROM CUSTOMERS LIMIT 5;


UPDATE customers SET city = 'Punjab' WHERE name = 'ram';
UPDATE customers SET city = 'Punjab' WHERE name = 'ram'; -- Note: 'ram' is not in the inserted data.

UPDATE customers SET city = 'delhi' WHERE name = 'lisa';

delete from customers
where name='ravi';
where name='ravi'; -- Note: 'ravi' is not in the inserted data.

select * from customers
select * from customers;

select distinct city from customers;

select * from customers
select * from customers;

SELECT * FROM customers
LIMIT 3
LIMIT 3;

SELECT * FROM customers
order by age desc
LIMIT 3;

alter table customers
add gender varchar(10);

alter table customers
modify column gender varchar(10) default 'male';

update customers
set gender=default
set gender=default;

update customers
set gender='female'
where name='lisa'
where name='lisa';

use sqltest
create table room kharcha(
use sqltest;
create table `room kharcha`(
name varchar (50) not null,
item int,
order price float,
`order price` float,
order_date date
)
);
