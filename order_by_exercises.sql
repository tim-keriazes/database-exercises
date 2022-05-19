use employees;
select * from employees
where first_name in('Irena', 'Vidya', 'Maya') order by first_name;
-- returned Irena Reutenauer for first and Vidya Simmen

select * from employees
where first_name in('Irena', 'Vidya', 'Maya') order by first_name, last_name;
-- returned Irena Acton for first and Vidya Zweizig as last

select * from employees
where first_name in('Irena', 'Vidya', 'Maya') order by last_name, first_name;
-- returned Irena Acton for first and Maya Zyda as last

select * from employees
where last_name like ('e%') and last_name like ('%e')
order by emp_no;
-- returned 899 rows, the first being Ramzi Erde and last being Tadahiro Erde

select * from employees
where last_name like ('e%') and last_name like ('%e')
order by hire_date desc;
-- returned 899 rows, the newest being Teiji Eldridge and oldest being Fox Erie

select * from employees
where hire_date like '199%'
and birth_date like '%-12-25'
order by hire_date desc , birth_date desc;
-- returned 362 rows Khun Bernini being the oldest hired last

select * from employees
where hire_date like '199%'
and birth_date like '%-12-25'
order by birth_date desc , hire_date asc;
-- returned 362 rows youngest hired first being Douadi Pettis
