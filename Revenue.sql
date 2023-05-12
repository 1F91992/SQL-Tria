/*
Customer Revenue in March

calculate the total revenue from each customer in march 2019. Include only 
customers who were active in March 2019.

Output the revenue along with the customer id and sort the results based on 
the revenue in descending oreder.

Table: orders

id int
cust_id int
order_date varchar
order_details varchar
total_order_cost int

*/

/*solution 1 
*/
SELECT cust_id
	,sum(total_order_cost) AS Revenue
FROM orders
WHERE order_date BETWEEN '2019-03-01'
		AND '2019-03-31'
GROUP BY cust_id
ORDER BY revenue DESC

/*
solution 2
SELECT cust_id
	,sum(total_order_cost) AS Revenue
FROM orders
WHERE month(order_date) = 3
	AND year(order_date) = 2019
GROUP BY cust_id
ORDER BY revenue DESC
*/
