use employees;

select concat(first_name, ' ', last_name) as full_name from employees
where last_name like ('E%e');
-- took the first and last name columns and combined them as a new column filtered the rows with %e% where statement

select concat(upper(first_name), ' ', upper(last_name)) as full_name from employees
where last_name like ('e%e');
-- took first and last name columns and modified them and combined, filtered with where %e%

select datediff( curdate(), hire_date) as days_working, first_name, last_name from employees
where hire_date like '199%'
and birth_date like '%-12-25'
order by days_working;
-- took function datediff with now() and hire_date being the variables, named as new column days working, 
-- along with first name and last name then sorted by days working

select min(salary) from salaries;
--  min salary is 38623

select max(salary) as max_salary from salaries;
-- max salary is 158220

select 
	lower(
		concat( 
			substr(first_name, 1, 1), 
			'_', 
            substr(last_name, 1,4), 
			substr(birth_date, 6, 2), 
            substr(birth_date, 3, 2)
			)
		) 
        as username, 
		first_name, 
		last_name, 
        birth_date
from employees;