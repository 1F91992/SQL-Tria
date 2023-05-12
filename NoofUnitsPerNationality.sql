/*
Number of Units Per Nationality

Find the number of apartments per nationality that are owned by people under 30 years old.

Output the nationality along with no of apartments 

sort records by the apartments count in descending order.

Table: airbnb_hosts
host_id int
nationality varchar
gender varchar
age int

Table: airbnb_units
host_id int
unit_id int 
unit_type varchar
n_beds int
n_bathrooms int
country varchar
city varchar

*/

/*
output result set columns: nationality, no of apartments
*/

SELECT h.nationality
	,count(DISTINCT unit_id) AS TotalApartmetn
FROM airbnb_hosts h
INNER JOIN airbnb_units u ON h.host_id = u.host_id
WHERE h.age < 30
	AND u.unit_type = 'Apartment'
GROUP BY h.nationality
ORDER BY count(DISTINCT unit_id) DESC

/*
Mistake/error: unity_type not used
*/
