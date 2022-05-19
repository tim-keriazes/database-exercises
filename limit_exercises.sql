SELECT DISTINCT
    last_name
FROM
    employees
ORDER BY last_name DESC
LIMIT 10;
-- Zykh,Zyda,Zwicker,Zweizig,Zumaque,Zultner,Zucker,Zuberek,Zschoche,Zongker

select * from employees
where hire_date like '1990%'
and birth_date like '%-12-25'
order by hire_date desc , birth_date desc
limit 5;
-- based on the order by hire date descending and birthdate descending with limit of 5, 5 rows return, altair pezzoli, jeanna meriste, yongmao herbst, chiradeep steinauer, and alexius akazan

select * from employees
where hire_date like '1990%'
and birth_date like '%-12-25'
order by hire_date desc , birth_date desc
limit 5 offset 50;
-- as before, order by hire date desc and birthdate desc with lim 5, 10th page of resulsts (10x5) = offset 50. so limit 5 offset 50