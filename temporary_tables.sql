drop table if exists employees_with_departments;
-- clearing any temp table that may exist with that name
use employees;
create temporary table kalpana_1817.employees_with_departments as
(
select first_name, last_name, dept_name
from employees
join dept_emp using (emp_no)
join departments using (dept_no)
);
-- pulling data from employees table to be used in the temp table
select * from kalpana_1817.employees_with_departments;

alter table kalpana_1817.employees_with_departments add full_name varchar(30);
update kalpana_1817.employees_with_departments set 
full_name = concat(first_name,' ', last_name);
-- add column with first name and last name as inputs

alter table kalpana_1817.employees_with_departments
drop column first_name;
alter table kalpana_1817.employees_with_departments
drop column last_name;
-- removed first and last name columns
-- another way you could have ended up with the same table is through joins

use sakila;
create temporary table kalpana_1817.payment_table as
(
select *
from payment

);

-- created temp table of payments from sakila
select * from kalpana_1817.payment_table;
update kalpana_1817.payment_table set amount = (amount * 100);