
/*
Sms Confirmations from users.

Meta/Facebook sends sms texts when users attempt to 2FA into the platform
to log in. In order to successfully 2FA they must confirm they received 
the sms text message. Confirmation texts are only valid on the date they 
were sent.

Unfortunelty, there was ETL problem with the database where friend
requests and invalid confirmation records were inserted into the logs, 
which are stored in the fb_sms_sends table. These message type should 
not be in the table.

Fortunately, the fb_confirmers table contains valid confirmation records
so you can use this table to identify sms text messages that were 
confirmed by the user.

Calculate the percentage of confirmed sms texts for august 4, 2020.
Be awate that there are multiple messages types, the ones you're
interested in are messages with type equal to 'message'.

table: fb_sms_sends
ds datetime
country varchar
carries varchar
phone_number int
type varchar

fb_confirmers
date datetime
phone_number int

*/

SELECT cast(count(c.phone_number) AS FLOAT) / count(s.phone_number) * 100
FROM fb_sms_sends s
LEFT JOIN fb_confirmers c ON s.ds = c.DATE
	AND s.phone_number = c.phone_number
WHERE s.ds = '2020-08-04'
	AND s.type = 'message'
