/*

Most Profitable Companies

Find the 3 most profitable companies in the entire world.

Output the result along with the corresoponding company name.

Sort the result based on profit in descending order.

table: forbes_global_2010-2014

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

result should have 3 rows for most profitable companies in the entire
world. profits column and sort it by descending order.

result should also contain company name, company column 

*/

/*solution 1 
using top keyword
*/
SELECT TOP 3 company
	,profits
FROM forbes_global_2010_2014
ORDER BY profits DESC
