/*
Order Details

Find order details made by Jill and Eva.
Consider the Jill and Eva as first names of customers.
Output the Order date, details and cost along with the first name.
order records based on the customer id in ascending order.

Tables: Customers
id int 
first_name varchar
last_name varchar
city varchar
addres varchar
phone_number varchar

orders 
id int 
cust_id int 
order_date datetime
order_Details varchar
total_order_cost int

*/

SELECT c.first_name
	,o.order_date
	,o.order_details
	,o.total_order_cost
FROM customers c
LEFT JOIN orders o ON c.id = o.cust_id
WHERE c.first_name = 'Jill'
	OR c.first_name = 'Eva'
