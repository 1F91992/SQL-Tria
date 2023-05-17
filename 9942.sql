/*
Largest Olympics

Find the olympics with the highest number of athletes. The Olympics 
game is a combinattion of the year and the season, and is found 
in the games column. Output the olympics along with the corresponding
number of athletes.

table: olympics_athletes_events
id int
name varchar
sex varchar
age float
height float
weight datetime
team varchar
noc varchar
games varchar
year int
season varchar
city varchar
sport varchar
event varchar
medal varchar
*/

/* solution 1
using top keyword
*/
SELECT TOP 1 games
	,count(DISTINCT name) AS Athletes
FROM olympics_athletes_events
GROUP BY games
ORDER BY Athletes DESC

/*
solution 2
using cte
*/
with cte as 
(select games, count(distinct id) as Athletes
from olympics_athletes_events
group by games
)

select games, Athletes
from cte 
where Athletes = (select max(Athletes) from cte)
