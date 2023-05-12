
/*
Highest Energy Consumption 
Find the date with the highest energy consumption from the meta/facebook
data centers. output the date along with the total energy consumption across
all data centers.

tables: fb_eu_energy, fb_asia_energy, fb_na_energy
date datetime
consumption int
*/

WITH temp1
AS (
	SELECT *
	FROM fb_eu_energy
	
	UNION ALL
	
	SELECT *
	FROM fb_asia_energy
	
	UNION ALL
	
	SELECT *
	FROM fb_na_energy
	)
	,temp2
AS (
	SELECT DATE
		,sum(consumption) AS TotalEnergy
	FROM temp1
	GROUP BY DATE
	)
SELECT DATE
	,TotalEnergy
FROM temp2
WHERE TotalEnergy = (
		SELECT max(TotalEnergy)
		FROM temp2
		)
