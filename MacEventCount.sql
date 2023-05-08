/*
Count the number of user events performed by macbookpro users.

count the number of user events performed by macbookpro users.
output the result along with the event name.

sort the result based on the event count in the descending order.

table: playbook_events

user_id int 
occured_at datetime
event_type varchar
event_name varchar
location varchar
device varchar
*/

/*
device = 'MacBookPro'
generate number of events using count(events)

group by ?
*/

SELECT event_name
	,count(*) NoofEvents
FROM playbook_events
WHERE device = 'macbook pro'
GROUP BY event_name

/*
Mistake, group by user event name.

*/
