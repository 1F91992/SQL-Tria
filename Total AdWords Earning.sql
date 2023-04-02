/*
Total AdWords Earnings

find the total adwords earnings for 
each business type. 

output the business types along with 
the total earnings

table: google_adwords_earnings

business_type varchar
n_employees int
year int
adwords_earnings
*/

select business_type, sum(adwords_earnings) TotalEarnings
from google_adwords_earnings
group by business_type
order by TotalEarnings desc
