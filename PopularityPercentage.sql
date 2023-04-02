/*
Popularity Percentage

Find the popularity percentage for each user on Meta?facebook.
The popularity percentage is defined as the total number of friends the user
has divided by the total number of users on the platform, then converted 
into a percentage by multiplying by 100

Output each user along with their popularity percentage.
Order records in ascending order by user id

The user1 and user2 column are pairs of friends

table: facebook_friends
user1 int 
user2 int

self join doesn't work?

1. find connections of user1 with user2 
2. find connections of user2 with user1
3. combine both result-set into one 
4. generate the popularity percent

*/

with cte as (
select user1, count(user2) connections
from facebook_friends
group by user1
union
select user2, count(user1) connections
from facebook_friends
group by user2
)
select user1,
    (sum(connections*1.0)/(select count(*) from facebook_friends))*100 popularity
from cte
group by user1
order by popularity desc



