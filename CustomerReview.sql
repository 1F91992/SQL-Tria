/*
Reviews of Categories

Find the top business categories based on the total number of reviews. 
Output the category along with the total number of reviews.
Order by total reviews in descending order.

Table: yelp_business

business_id varchar
name varchar
neighborhood varchar
address varchar
city varchar
state varchar
postal_code varchar
latitude float
longitude float
stars float
review_count int
is_open int
categories varchar
*/

SELECT value
	,sum(review_count) TotalCount
FROM yelp_business
CROSS APPLY string_split(categories, ';')
GROUP BY value
