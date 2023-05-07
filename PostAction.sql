/*
Find all posts which were reacted to with a heart

find all posts which were reacted with a heart, for such posts output all columns 
from facebook_posts table.

tables: facebook_reactions

poster int
friend int 
reaction varchar
date_day int
post_id int

facebook_posts

post_id int 
poster int 
poster_text varchar
post_keywords varchar
post_date datetime

*/

SELECT DISTINCT p.*
FROM facebook_posts p
INNER JOIN facebook_reactions r ON p.post_id = r.post_id
	AND r.reaction = 'heart'
  
/*
mistake/error: multiple records for smae post.
solution: use inner join with distinct keyword
*/
