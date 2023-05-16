/*
Risky Projects

Identify projects that are at risk for going over budget.
A project is considered to be over budget if the cost of all employees 
assigned to the project is greater than the budget of the project.
You'll need to prorate the cost of the employees to the duration of the
project. For example, if the budget for a project that takes half a year
to complete is $10k, then the total half year salary of all employees
assigned to the project shoud not exceed $10K. 

Salary is defined on a yearly basis, so be careful how to calculate 
salaries for the projects that last less or more than one year.

Output a list of projects that are overbudget with their project name,
project budget, and prorated total employee expense (rounded 
to the next dollar amount)


*/

WITH cte
AS (
	SELECT p.id
		,sum(ceiling((e.salary) * datediff(day, p.start_date, p.end_date) / 365)) AS TotalExpense
	FROM linkedin_projects p
	INNER JOIN linkedin_emp_projects ep ON p.id = ep.project_id
	INNER JOIN linkedin_employees e ON ep.emp_id = e.id
	GROUP BY p.id
	)
SELECT p.title
	,p.budget
	,c.TotalExpense
FROM cte c
INNER JOIN linkedin_projects p ON c.id = p.id
WHERE c.TotalExpense > p.budget
