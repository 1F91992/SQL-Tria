/*
 
Income by Title and Gender
 
Find the average total compensation based on employee title and gender.

Total compensation is calculateed by adding both the salary and bonus of 
each employee.

However, Not every employee receives a bonus so disregard employees without
bonuses in your calculation. Employee can recive more than one bonus.

Output the employee title, gender, along with the average total compensation.

sf_employee

id int 
first_name varchar
last_name varchar
age int
sex varchar
employee_title varchar
department varchar
salary int
target int
email varchar
city varchar
address varchar
manager_id int

sf_bonus

worker_ref_id int
bonus int

*/

WITH cte
AS (
	SELECT worker_ref_id
		,sum(bonus) AS NewBonus
	FROM sf_bonus
	GROUP BY worker_ref_id
	)
SELECT e.employee_title
	,e.sex
	,avg(e.salary + b.NewBonus) AvgTotalComp
FROM sf_employee e
INNER JOIN cte b ON e.id = b.worker_ref_id
GROUP BY e.employee_title
	,e.sex

/*
solution 2 invalue table alias
*/

SELECT e.employee_title
	,e.sex
	,avg(e.salary + b.NewBonus) AvgTotalComp
FROM sf_employee e
INNER JOIN (
	SELECT worker_ref_id
		,sum(bonus) AS NewBonus
	FROM sf_bonus
	GROUP BY worker_ref_id
	) b ON e.id = b.worker_ref_id
GROUP BY e.employee_title
	,e.sex
