/*
User Email Labels

Find the number of emails received by each user under each built-in email label.
THe email labels are 'Promotion', 'Social', and 'Shopping'.

Ouput the user along with the number of promotion, social, and shopping mails
count.

Table: google_gmail_emails
id int 
from_user varchar
to_user varchar
day int

Table: google_gmail_labels
email_id int
label varchar

*emails.id = labels.email_id

1. Select only emails received(to_user) under the labels promotion, social, and
shopping

2.  group by emails table to_user column and labels table label column

*/


select e.id, to_user
from google_gmail_emails e
inner join google_gmail_labels l
on e.id = l.email_id and l.label in ('Promotion', 'Social', 'Shopping')
