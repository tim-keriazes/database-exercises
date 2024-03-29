use employees;
select * from employees
where first_name in('Irena', 'Vidya', 'Maya');
-- returned 709 rows

select * from employees
where first_name ='Irena' 
or first_name ='Vidya' 
or first_name ='Maya';
-- returned 709 rows, does match rows from  q2

select * from employees
where first_name ='Irena' 
or first_name ='Vidya' 
or first_name ='Maya'
and gender = 'M';
-- returned 619 rows

select * from employees
where last_name like ('e%');
-- returned 7330 rows start with e

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
where hire_date like '199%' order by hire_date;
-- returned greater than 135214 rows for hire date in the 1990s

select * from employees
where birth_date like '%-12-25';
-- returned 842 rows where birthdate was christmas

select * from employees
where hire_date like '199%'
and birth_date like '%-12-25';
-- returned 362 rows where the hire date is in year 1990 and birthdate is on christmas

select * from employees
where last_name like ('%q%');
-- returned 1873 rows with last name with a q in it

select * from employees
where last_name like ('%q%') and last_name not like ('%qu%');
-- returned 547 rows where q in last name but not qu
