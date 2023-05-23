/*

Most Active users on Messenger

Meta/Facebook messenger stores the number of messages between users in 
a table. In this table user1 is the sender, user2 is the receiver, and
msg_count is the number of messages exchanges between them.

Find the top 10 most active users on Meta/Facebook messenger by counting
their total number of messages send and received. Your solution should 
output usernames and the count of the total messages they sent or received.

fb_messages 
id int
date datetime 
user1 varchar
user2 varchar 
msg_count int

1. find all the messenger users
2. calculate the Total number of messages sent or received.

*/

WITH users
AS (
	SELECT user1 AS username
	FROM fb_messages
	
	UNION
	
	SELECT user2 AS username
	FROM fb_messages
	)
SELECT TOP 10 u.username
	,sum(msg_count) Totalmsg
FROM users u
INNER JOIN fb_messages m ON u.username = m.user1
	OR u.username = m.user2
GROUP BY u.username
ORDER BY Totalmsg DESC
