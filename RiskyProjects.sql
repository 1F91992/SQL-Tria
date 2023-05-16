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
