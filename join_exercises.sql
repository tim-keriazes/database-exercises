use join_example_db;
select * from roles;
select * from users;

-- use join, left join, right join for users and roles tables
select *

from users
join roles on users.role_id= roles.id;
-- joined roles to users inner join

select *
from users
left join roles on users.role_id=roles.id;
-- left joined roles to users

select *
from users
right join roles on users.role_id=roles.id;
-- right joined roles to users

select roles.name,
count(users.name)

from users

right join roles on users.role_id=roles.id

group by roles.name;
