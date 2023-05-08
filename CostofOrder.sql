/*
Total cost of orders.

Find the total cost of each customer's orders. 
Output customer's id, first name, and the total order cost.

Order records by customer's first name alphabetically.

tables: customers
id int 
first_name varchar
last_name varchar
city varchar
address varchar
phone_number varchar

tables: orders 
id int 
cust_id int 
order_date datetime
order_details 
total_order_cost int 

*/

WITH ordercost
AS (
	SELECT cust_id
		,sum(total_order_cost) Totalcost
	FROM orders
	GROUP BY cust_id
	)
SELECT c.id
	,c.first_name
	,o.Totalcost
FROM customers c
INNER JOIN ordercost o ON c.id = o.cust_id

