/*
Find the matching hosts and guests in a way that they are both of the same 
gender and nationality.

Output the host id and the guest id of matched pair

Table: airbnb_hosts
host_id int 
nationality varchar
gender varchar
age int

Table: airbnb_guests
guest_id int 
nationality varchar
gender varchar 
age int

*/

SELECT DISTINCT host_id
	,guest_id
FROM airbnb_hosts h
INNER JOIN airbnb_guests g ON h.gender = g.gender
	AND h.nationality = g.nationality

/*
Use distinct keyword
otherwise
result set will contain mulitple records for same host id 
which isn't the case while pairing host with guest, assuming
each host can be paried with only one distinct guest.

*/
