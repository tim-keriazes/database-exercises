-- Create a file named subqueries_exercises.sql and craft queries to return the results for the following criteria:

-- Find all the current employees with the same hire date as employee 101010 using a sub-query.
use employees;

select * 
from employees
join dept_emp using(emp_no)
where to_date>now() and 
hire_date = 
(
select hire_date
from employees
where emp_no = 101010
)
;
-- pull columns from emp table, join it with dept_emp table with emp_no, filter results
-- with where to_date >now for current employees and the subquery for hire date
-- of emp no 101010


-- Find all the titles ever held by all current employees with the first name Aamod.

select distinct title
from titles
where emp_no in (
select emp_no from employees
join dept_emp using (emp_no)
where first_name = "Aamod"
and to_date > now()
)
;
-- using distict to find unique title within titles filter with where the emp no in
-- subquery of emp no from employees table join with dept_emp table with emp no
-- filter subquery with where statement for first name aamod and current employee to_date
-- returned 6 rows


-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
select count(*)
from employees
where emp_no not in (select emp_no from dept_emp where to_date > now());
-- utilize count function and not in statement with subquery to see whos start date is not
-- greater than now aka current 59900 people


-- Find all the current department managers that are female. List their names in a comment in your code.
select *
from employees
where emp_no in (
select emp_no from dept_manager where to_date > now())
and gender = 'F';
-- Isamu Legleitner,Karsten Sigstam, Leon DasSarma, Hilary Kambil
-- filter using emp no and subquery and where statement to_date greater than current date, and gender=female


-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.
select emp_no
from salaries s
join employees e using (emp_no)
where to_date > now() 
and salary > (select avg(salary) 
from salaries);

-- returns 154543 rows

-- How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?



select max(salary) from salaries
where to_date > now();
-- 158220 max salary

select std(salary) from salaries where to_date > now();
-- std 17309.95

select count(*)
from salaries
where to_date >now() 
and salary > ( select max(salary) from salaries where to_date > now())
-
(select std(salary) from salaries where to_date > now());

-- returns 83 rows

select count(*)
from salaries where to_date > now();
-- 240124 rows returned

select (
(select count(*) from salaries
where to_date > now()
and salary >
((select max(salary) from salaries where to_date > now())
-
(select std(salary) from salaries where to_date > now())
))/
(select count(*)
from salaries
where to_date > now()))*100 as 'percent of salaries within 1 std of max';

-- .0346 percent of salaries