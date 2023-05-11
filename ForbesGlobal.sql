/*

Find the most profitable company in the financial sector of the entire world 
along with its continent.

Table: forbes_global_2010_2014

company varchar
sector varchar
industry varchar
continent varchar
country varchar
marketvalue float
sales float 
profits float
assets float
rank int
forbeswebpage varchar
*/

/*
solution 1*/
SELECT TOP 1 company
	,profits
	,continent
FROM forbes_global_2010_2014
WHERE sector = 'financials'
ORDER BY profits DESC
/*
solution 2
*/
SELECT company
	,continent
FROM forbes_global_2010_2014
WHERE profits = (
		SELECT MAX(profits)
		FROM forbes_global_2010_2014
		)
/*
solution 3
*/
WITH Temp1
AS (
	SELECT *
		,MAX(profits) OVER () AS MyMax
	FROM forbes_global_2010_2014
	WHERE sector = 'Financials'
	)
SELECT company
	,continent
	,MyMax
FROM Temp1
WHERE profits = MyMax
