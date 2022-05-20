use employees;

-- 2.
select distinct(title) from titles;
-- there are 7 distinct titles

-- 3.
select distinct(last_name) from employees
where last_name like 'e%' and last_name like '%e';
-- list of unique last names that start and end with e

-- 4.
select distinct(last_name),first_name from employees
where last_name like 'e%' and last_name like '%e';
-- unique combination of first name and last names that start and end with e 

-- 5. 
select distinct(last_name) from employees
where last_name like '%q%' and last_name not like '%qu%';
-- last names : Chleq, Lindqvist, Qiwen

-- 6. 
select distinct(last_name), count(*) as 'number of same last name' from employees
where last_name like '%q%' and last_name not like '%qu%'
group by last_name;
-- last names : Chleq with 189, Lindqvist with 190, Qiwen with 168

-- 7.
select distinct(first_name), gender, count(*) from employees
where first_name in('Irena', 'Vidya', 'Maya')
group by first_name, gender;
-- Vidya: 151 male, 81 female
-- Irena: 144 male, 97 female
-- Maya: 146 male, 90 female

-- 8. 
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
		
		 
        
        count(*) count_of_usernames
                
from employees
group by username
having count_of_usernames >1;

-- there are duplicate usernames, there are 13251 records returned with duplicates
		
		

-- utilizing lower function to lowercase output, substrings within the concat to modify what is being concatenated
-- returns first letter first name underscore, last name four letters, birthdate month, birthdate year 
