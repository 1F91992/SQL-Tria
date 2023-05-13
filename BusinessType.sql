/*
Classify Business type

classify each business as either a restaurant, cafe, school, or other.
- a restaurant should have the word restaurant in the business name.
- a cafe should have either cafe, cafe, or coffee in the business name.
- a schould should have the word school in the business name.
- all other businesses should be classified as 'other'

output the business name and their classification.

Table: sf_restaurant_health_violations

business_id int 
business_name varchar output
business_address varchar
business_city varchar
business_state varchar
business_postal_code float
business_latitude float
business_longitude float
business_location varchar
business_phone_number float
inspection_id varchar
inspection_date datetime
inspection_score float
inspection_type varchar
violation_id varchar
violation_description varchar
risk_category varchar


Note; table contains multiple records with different location for same business.
Note: keep an eye on characters/substring/strings to be matched.

*/

SELECT DISTINCT business_name
	,CASE 
		WHEN business_name LIKE '%restaurant%'
			THEN 'restaurant'
		WHEN business_name LIKE '%cafe%'
			OR business_name LIKE '%café%'
			OR business_name LIKE '%coffee%'
			THEN 'cafe'
		WHEN business_name LIKE '%school%'
			THEN 'school'
		ELSE 'other'
		END
FROM sf_restaurant_health_violations
