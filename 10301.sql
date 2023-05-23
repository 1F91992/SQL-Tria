/*
Expensive Projects

Given a list of projects and employees mapped to each project, calculate 
by the amount of project budget allocated to each employee. 

Output the project title and project budget rounded to closest integer.
Order the list by project with the highest budget per emp first.

table ms_projects
id int 
title varchar
budget int

table ms_emp_projects 
emp_id int 
project_id int

1. calculate the total number of employees fro each project
2. calculate the budget per employee.

*/

WITH cte
AS (
	SELECT project_id
		,count(emp_id) AS TotalEmployees
	FROM ms_emp_projects
	GROUP BY project_id
	)
SELECT p.title
	,p.budget / c.TotalEmployees BudgetPerEmployee
FROM cte c
INNER JOIN ms_projects p ON c.project_id = p.id
ORDER BY BudgetPerEmployee DESC
