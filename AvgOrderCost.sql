/*

Avg Order Cost during rush hours.

The company you work fro has asked you to look into the average order value 
per hour during rush hours in the San Jose area.

Note Rush hour is from 15H - 17H inclusive.

You have also been told that the column order_total represents the gross order 
total for each order. Therefore, you'll need to calculate the net order total.

Note: The gross order total is the total of the order before adding the tip 
and deducing the discount and refund.

Use the column customer_placed_order_datetime for your calculations.

Table: delivery_details.

customer_placed_order_datetime datetime
placed_order_with_restaurant_datetime datetime
driver_at_restaurant_datetime datetime
delivered_to_customer_datetime datetime
driver_id int
restaurant_id int
consumer_id int
is_new bool
delivery_region varchar
is_asap bool
order_total float
discount_amount float
tip_amount float
refunded_amount

*/


/*
customer placed order datetime should be between 15h and 17h
delivery region = 'San Jose'
and use datepart(interval, datetime)
*/
SELECT datepart(hh, customer_placed_order_datetime) hour
	,avg(order_total) AS AvgOrderCost
FROM delivery_details
WHERE delivery_region = 'San Jose'
	AND datepart(hh, customer_placed_order_datetime) BETWEEN 15
		AND 17
GROUP BY datepart(hh, customer_placed_order_datetime)
