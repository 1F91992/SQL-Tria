/*
Bikes Last Used

Find the last time each bike was in use.

Output both the bike number and the date timestamp of the bike's last use.
(the date time the bike was returned). 

Order the results by bikes that were most recenlty used.

there are couple of bikes with muliptle records 


*/

SELECT bike_number
	,max(end_time) AS LastUsed
FROM dc_bikeshare_q1_2012
GROUP BY bike_number
ORDER BY max(end_time) DESC
