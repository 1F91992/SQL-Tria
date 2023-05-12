/*
Highest Cost Orders

Find the customer with the highest daily total order cost between 2019-02-01
to 2019-05-01.
If customer had more than one order on a certain day, sum the order costs on
daily basis. 
Output customer's first name, total cost of their item, and the date.

Table: customers
id int 
first_name varchar
last_name varchar
city varchar
address varchar
phone_number varchar

Table: orders
id int 
cust_id int
order_date datetime
order_details varchar
total_order_cost int
*/

WITH cte
AS (
	SELECT order_date
		,cust_id
		,sum(total_order_cost) AS Totalcost
	FROM orders
	WHERE order_date BETWEEN '2019-02-01'
			AND '2019-05-01'
	GROUP BY order_date
		,cust_id
	)
SELECT c.first_name
	,o.order_date
	,o.Totalcost AS HighestTotalcost
FROM cte o
INNER JOIN customers c ON c.id = o.cust_id
WHERE Totalcost = (
		SELECT max(Totalcost)
		FROM cte
		)
