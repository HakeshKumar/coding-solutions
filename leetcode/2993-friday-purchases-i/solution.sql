# Write your MySQL query statement below
SELECT WEEK(purchase_date) - WEEK(DATE_SUB(purchase_date, INTERVAL DAYOFMONTH(purchase_date) - 1 DAY)) + 1 AS week_of_month ,
 purchase_date, sum(amount_spend) as total_amount
from Purchases
WHERE DAYNAME(purchase_date) = 'Friday'
group by WEEK(purchase_date) - WEEK(DATE_SUB(purchase_date, INTERVAL DAYOFMONTH(purchase_date) - 1 DAY)) + 1
order by week_of_month
