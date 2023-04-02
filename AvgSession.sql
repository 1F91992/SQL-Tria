/*
Users By Average Session Time

calculate each user's average session time. 
A session is defined as the time difference between page_load and page_exit.
For simiplicity, assume a user has only 1 session per day and if there are multiple 
of the same events on that day , consider only the latest page_load and
earliest page_exit. 

Output the user_id and their average session time.

table : facebook_web_log
user_di int
timestamp datetime
action varchar


1. for both page_load and page_exit event generate respective result-set for each day 
and each user focusing on multiple events in same day

2. Join both result set and generate session difference for each user

*/


/*solutin 1*/
with pageload as
(
select user_id, convert(date, timestamp) eventdate, max(timestamp) latestevent
from facebook_web_log
where action = 'page_load'
group by user_id, convert(date, timestamp)
)
, 
pageexit as
(
select user_id, convert(date, timestamp) eventdate, min(timestamp) earliestevent
from facebook_web_log
where action = 'page_exit'
group by user_id, convert(date, timestamp)
)

select 
  l.user_id, avg(datediff(second, e.earliestevent, l.latestevent)*1.0)
from pageload l
inner join pageexit e
on l.user_id = e.user_id and l.eventdate = e.eventdate and e.earliestevent > l.latestevent
group by l.user_id


/*solution 2*/

with session as
(
select  user_id, 
        datediff
                (
                second,
                max(case when action = 'page_load' then timestamp end),
                min(case when action = 'page_exit' then timestamp end)
                ) sessiontime
from facebook_web_log
group by user_id, convert(date, timestamp)
)

select 
        user_id,
        avg(sessiontime*1.0) AvgSession
from session 
where sessiontime is not null
group used_id
