/*
Activity Rank

Find the email activity rank for each user. 
email activity rank  is defined by the total number of
emails sent. The user with the highest number of 
emails sent will be rank of 1, and so on.

Output the user, total emails, and their activity rank. 
order records by the total emails in descending order.
Sort users with the same of emails in alphabetical order.

In your rankings, return a unique value even if multiple 
user have the same of emails.


Table : google_gmail_emails
id int 
from_user varchar
to_user varchar
day int
*/

select 
    from_user,
    count(*) total_emails,
    dense_rank() over (order by count(*) desc, from_user asc) activityrank
from google_gmail_emails
group by from_user

