drop table if exists employees_with_departments;
-- clearing any temp table that may exist with that name
use employees;
create temporary table kalpana_1817.employees_with_departments as
(
select first_name, last_name, dept_name
from employees
join dept_emp using (emp_no)
join departments using (dept_no)
where to_date > curdate()
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

-- create temporary table employees_with_departments as
-- select concat (first_name, ' ', last_name) as full_name, dept_name
-- from employees.employees
-- join employees.dept_emp using (emp_no)
-- join employees.departments using (dept_no)
-- where to_date > curdate();

-- 2. transform amount column to cent value
use kalpana_1817;
drop table if exists kalpana_1817.payment_table;

select * from sakila.payment;

create temporary table payments as (
select payment_id, customer_id,staff_id,rental_id, amount*100 as amount_in_pennies, payment_date, last_update
from sakila.payment
);
-- create temp table with amount multiplied by 100

select *
from payments;
describe payments;

alter table payments modify amount_in_pennies int not null;
select * from payments;
-- modified temp tale to amount values being integers and not null


-- 3.
use kalpana_1817;
select avg(salary), std(salary) from employees.salaries where to_date > now();
-- avg salary is 72012 and std is 17309
 
 create temporary table overall_aggs as
 (
 select avg(salary) as avg_salary, std(salary) as std_salary
 from employees.salaries where to_date> now()
 );
 select* from overall_aggs;
 -- temptable to hold the avg and std
 
 select dept_name, avg(salary) as department_current_average
 from employees.salaries
 join employees.dept_emp using (emp_no)
 join employees.departments using (dept_no)
 where employees.dept_emp.to_date > curdate()
 and employees.salaries.to_date > curdate ()
 group by dept_name;
 
 
 -- not sure why this one is erroring out
 
 drop table if exists current_info;
 create temporary table current_info as (
 select dept_name, avg(salary) as department_current_average
 from employees.salaries
 join employees.dept_emp using (emp_no)
 join employees.departments using (dept_no)
 where employees.dept_emp.to_date > curdate()
 and employees.salaries.to_date > curdate()
 group by dept_name
 );
 
 select* from current_info;
 -- temp table created, validated with dept name and current avgs
 
 alter table current_info add overall_avg float (10, 2);
 alter table current_info add overall_std float (10,2);
 alter table current_info add zscore float (10,2);
 -- added avg, std, zscore column
 select* from current_info;
 
 update current_info set overall_avg = (select avg_salary from overall_aggs);
 update current_info set overall_std = (select std_salary from overall_aggs);
 -- populated new columns from values in overall_aggs table
 
 update current_info
 set zscore = (department_current_average-overall_avg)/overall_std;
 select*from current_info
 order by zscore desc;
 
 -- best department to work for based on highest salary and zscore is sales, worst is hr

use kalpana_1817;
select avg (salary), std(salary) from employees.salaries where to_date > curdate()