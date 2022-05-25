use employees;
-- write query that returns all employees, dept no, start and end date and new col is current employee

select
de.emp_no,
de.dept_no,
de.from_date as start_date,
de.to_date as end_date,
de.to_date > now() as is_current_employee
from dept_emp de
order by emp_no;
-- table as prescribed

-- write query that returns all employee names (prev and current) and a new column
-- 'alpha group' that returns 'a-h','i-q','r-z' based on first letter of last name

select
first_name,
last_name,
left(last_name, 1) as first_letter_last_name,
case
	when left(last_name, 1) <= 'h' then 'a-h'
	when left(last_name, 1) <='q' then 'i-q'
--    when substr(last_name, 1, 1) <='q' then 'i-q'
    when left(last_name, 1) <= 'z' then 'r-z'
    end as alpha_group
    from employees;


-- how many employees current or previous were born in each decade

select
count(case when birth_date between '1950-01-01' and '1959-12-31' then birth_date else null end) as '50s',
count(case when birth_date between '1960-01-01' and '1969-12-31' then birth_date else null end) as '60s'
from employees;
-- 50s 182886, 60s 117138

-- another way it can be done

-- select
-- concat(substr(birth_date, 1, 3), '0') as decade,
-- count(*)
-- from employees
-- group by decade;

-- what is current avf salary for each of the following dept groupds, r&d, sales and marketing, prod and QM, customer service

select
	case
		when d.dept_name in ('research','development') then 'r & d'
        when d.dept_name in ('sales','marketing') then 'sales & marketing'
        when d.dept_name in ('production','quality management') then 'production & quality management'
        when d.dept_name in ('finance','human resources') then 'finance & hr'
        else d.dept_name
	end as dept_group, salary
from departments d
join dept_emp de using (dept_no)
join salaries s using (emp_no)
where s.to_date > now() and de.to_date > now()
;

-- shows salaries of dept_group
-- not quite sure how to manipulate this to get average for each dept group