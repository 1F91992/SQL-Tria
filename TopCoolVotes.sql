/*
Top Cool Votes

Find the review_text that received the highest number of cool votes.
Output the business name along with the review_text with the highest number
of cool votes

table: yelp_reviews
business_name varchar
review_id varchar
user_id varchar
stars varchar
review_date datetime
review_text varchar
funny int
useful int
cool int
*/
/*
1. whether there are multiple reviews for same business
one business can have mulitple reviews

2. whether therw are mulitple reviews by same user for same business
a user has offered only one review
*/
SELECT business_name
	,review_text
FROM yelp_reviews
WHERE cool = (
		SELECT max(cool)
		FROM yelp_reviews
		)
