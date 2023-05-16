/*

Highest SAlary In Department
Find the employee with the highest salary per department
Output the department name, employee's first name along with the 
corresponding salary.

table: employee
id int 
first_name varchar
last_name varchar
age int
sex varchar
employee_title varchar
department varchar
salary int
target int
bonus  int
email varchar
city varhcar
address varchar
manager_id int

1. find the highest salary use max() function with group by clause as
department in cte
2. Now join employee with cte to fetch first name

*/
/*
solution 1
*/
WITH cte
AS (
	SELECT department
		,max(salary) HighestSalary
	FROM employee
	GROUP BY department
	)
SELECT c.department
	,e.first_name
	,c.HighestSalary
FROM employee e
INNER JOIN cte c ON e.department = c.department
	AND e.salary = c.HighestSalary
  
/*
solution 2
*/
SELECT department
	,first_name
	,HighestSalary
FROM (
	SELECT department
		,first_name
		,salary
		,max(salary) OVER (PARTITION BY department) AS HighestSalary
	FROM employee
	) Info
WHERE salary = HighestSalary
