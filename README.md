/* # SQL-Tria
SQL Practice Questions

salaries differences

write a query that calculates the difference between the highest salaris found 
in the marketing and engineering departments. output just the absolute 
difference in salaries.

db_employee

id int 
first_name varchar
last_name varchar
salary int
department_id int

db_dept 
id int 
department varchar

solution 



*/
select abs
(
(select max(salary) MarHigh
from db_employee e
inner join db_dept d
on e.department_id = d.id and d.department = 'marketing')
-
(select max(salary) EngHigh
from db_employee e
inner join db_dept d
on e.department_id = d.id and d.department = 'engineering')) Diff

with cte as (
select d.department, max(salary) sal
from db_employee e
inner join db_dept d
on e.department_id = d.id and d.department in ('marketing', 'engineering')
group by d.department
)
select max(sal) - min(sal)
from cte
