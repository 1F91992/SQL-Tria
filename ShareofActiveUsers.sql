/*
Share of Active Users

output the share of USA users that are active.
Active users are the ones with an open status in the table.

table: fb_active_users
user_id int 
name varchar
status varchar
country varchar

*/

/*
solution1 
processing slighlty more than solution 2
*/

WITH cte
AS (
	SELECT country
		,count(user_id) TotaLUSAusers
	FROM fb_active_users
	WHERE country = 'USA'
	GROUP BY country
	)
	,cte2
AS (
	SELECT country
		,count(user_id) TotalUSAactiveusers
	FROM fb_active_users
	WHERE country = 'USA'
		AND STATUS = 'open'
	GROUP BY country
	)
SELECT ac.TotalUSAactiveusers*1.0/ u.TotaLUSAusers
FROM cte u
INNER JOIN cte2 ac ON u.country = ac.country

/*
solution 2
*/

SELECT active_users *1.0 / total_users AS active_users_share
FROM (
	SELECT COUNT(user_id) total_users
		,SUM(CASE 
				WHEN STATUS = 'open'
					THEN 1
				ELSE 0
				END) active_users
	FROM fb_active_users
	WHERE country = 'USA'
	) usa_user_counts
