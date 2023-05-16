/*

Employee and Manager Salaries

find employees who are earning more than their managers. 

Output the employees first name along with the corresponding salary.

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
bonus int 
email varchar
city varchar
manager_id int

1. Self join, to fetch the manager salary and compare the employee and
manager salary if found employee salary is higher than share the records 
having their first_name and salary

*/
SELECT e.first_name
	,e.salary
FROM employee e
INNER JOIN employee m ON e.manager_id = m.id
WHERE e.salary > m.salary
where e.salary > m.salary
