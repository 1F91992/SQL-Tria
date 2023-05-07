/*
Finding updated records

We have a table employees and their salaries, however, some of the records are old 
and contain outdated salary information. find the current salary of each employee assuming 
that salaries increase each year. 

output their id, first name, last name, department id, and current salary.

order your list by employee id in ascending order.

table: ms_employee_salary

id int 
first_name varchar
last_name varchar
salary int
department_id int

*/

WITH maxcte
AS (
	SELECT id
		,max(salary) AS sal
	FROM ms_employee_salary
	GROUP BY id
	)
SELECT m.id
	,s.first_name
	,s.last_name
	,m.sal
	,s.department_id
FROM maxcte m
INNER JOIN ms_employee_salary s ON m.id = s.id
	AND m.sal = s.salary
ORDER BY m.id
