/*
Number of bathrooms and bedrooms 

find the average number of bathrooms and bedrooms for each city's property types.

output the resutll along with the city name and the property type.

tables: airbnb_search_details

unnamed_0 int
id int
price float
property_type  varchar
amenities varchar
accommodations int
bathrooms int
bed_type varchar
cancellation_policy varchar
cleaning_fee bool
city varchar
host_identity_verified varchar
host_response_rate varchar
host_since datetime
neighbourhood varchar
number_of_reviews int
review_scores_rating float
zipcode int 
bedrooms int
beds int

*/
SELECT city
	,property_type
	,avg(bedrooms * 1.0) AS Avg_Bedrooms
	,avg(bathrooms * 1.0) AS AVg_Bathrooms
FROM airbnb_search_details
GROUP BY city
	,property_type

/*
Mistake/error: use of avg with group by
solution: understand how does avg function works with group by
*/
