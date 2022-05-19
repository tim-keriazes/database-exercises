use employees;
select * from employees
where first_name in('Irena', 'Vidya', 'Maya');
-- returned 709 rows

select * from employees
where first_name ='Irena' or 'Vidya' or 'Maya';
-- returned 241 rows, does not match rows from  q2

select * from employees
where (first_name ='Irena' or 'Vidya' or 'Maya')
and gender = 'M';
-- returned 144 rows

select * from employees
where last_name like ('e%');
-- returned 7830 rows start with e

select * from employees
where last_name like ('e%') or last_name like ('%e');
-- returned 30723 rows start with e or end with e

select * from employees
where last_name not like ('e%') and last_name like ('%e');
-- returned 23393 rows that do not start with e and end with e

select * from employees
where last_name like ('e%') and last_name like ('%e');
-- returned 899 rows that start and end with e

select * from employees
where last_name like ('%e');
-- returned 24292 rows that end with e regardless of what it starts with

select * from employees
where hire_date like '1990%' order by hire_date;
-- returned greater than 25610 rows for hire date in the year 1990

select * from employees
where birth_date like '%-12-25';
-- returned 842 rows where birthdate was christmas

select * from employees
where hire_date like '1990%'
and birth_date like '%-12-25';
-- returned 77 rows where the hire date is in year 1990 and birthdate is on christmas

select * from employees
where last_name like ('%q%');
-- returned 1873 rows with last name with a q in it

select * from employees
where last_name like ('%q%') and last_name not like ('%qu%');
-- returned 547 rows where q in last name but not qu
