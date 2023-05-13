/*
Popularity of Hack

Meta/facebook has developed a new programming language called Hack. To measure
the popularity of Hack they ran a survey with their employees. The survey 
included data on previous programming familiarity as well the numver of years
of experience, age, gender, and most importantly satisfaction with Hack. 
Due to an error locaiton data was not collected, but your supervisor demands
a report showing average popularity of Hack by office location. Luckily the 
user IDs of employees completing the surveys were stored.

Based on the above, find the average popularity of the Hack per office locaiton.
output the locatin along with the average popularity.

table: facebook_employees, 
id int 
location varchar
age int
gender varchar
is_senior bool

table: facebook_hack_survey

employee_id int
age int
gender varchar
popularity int
*/
/*
solution1 
without using cast
*/
SELECT e.location
	,avg(s.popularity * 1.0)
FROM facebook_employees e
INNER JOIN facebook_hack_survey s ON e.id = s.employee_id
GROUP BY e.location

/*
solution1 with cast function
*/
SELECT e.location
	,avg(cast(s.popularity AS FLOAT))
FROM facebook_employees e
INNER JOIN facebook_hack_survey s ON e.id = s.employee_id
GROUP BY e.location
