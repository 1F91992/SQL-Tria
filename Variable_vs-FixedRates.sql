/*
variable vs fixed rates

write a query that returns binary description of rate type per load_id.

The results should have one row per loan_id and two columns, for fixed 
and variable type.

table: submission

id int
balance float
interest_rate float
rate_type varchar
loan_id int

*/

/*
solution 1 using common table expressions
*/
with var as

(select loan_id,
        case
            when rate_type = 'variable' then 1
            else 
                0
        end as variable_type
from submissions
),

fix as
(
select loan_id,
        case 
        when rate_type='fixed'  then 1
        ELSE
            0
        end as fixed_type
from submissions
)

select v.loan_id, f.fixed_type, v.variable_type
from var v
inner join fix f
on v.loan_id = f.loan_id

/*
solution self join
*/

SELECT f.loan_id
	,CASE 
		WHEN f.rate_type = 'fixed'
			THEN 'TRUE'
		ELSE 'FALSE'
		END fixed_rate
	,CASE 
		WHEN v.rate_type = 'variable'
			THEN 'TRUE'
		ELSE 'FALSE'
		END variable_type
FROM submissions f
JOIN submissions v ON f.loan_id = v.loan_id
