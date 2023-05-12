/*
Ranking Most Active Guests

Rank guests based on the number of messages they've exchanged with the hosts.
Guests with thesame number of messages as other guests should have the same
rank. do not skip rankings if the preceding rankings are identical.

output the rank, guest id, and number of total messages they've sent.
order by the highest number of total messages first.

Table: airbnb_contacts

id_guests varchar
id_host varchar
id_listing varchar
ts_contact_at datetime
ts_reply_at datetime
ts_accepted_at datetime
ts_booking_at datetime 
ds_checkin datetime
ds_checkout datetime 
n_guests int
n_messages int

*/

/*
Output result set, Rank, Guest_id, Number of total messages.

*/

SELECT Dense_Rank() OVER (
		ORDER BY sum(n_messages) DESC
		) as Rnk
	,id_guest
	,sum(n_messages) AS TotalMessages
FROM airbnb_contacts
GROUP BY id_guest
