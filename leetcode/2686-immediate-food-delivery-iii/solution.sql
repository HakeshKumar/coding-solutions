# Write your MySQL query statement below
with order_status as (

    select order_date, customer_pref_delivery_date, case when DATE(order_date)=DATE(customer_pref_delivery_date ) THEN 1 ELSE 0 END as order_stat from Delivery
)
select order_date, ROUND( AVG(order_stat)*100,2) as immediate_percentage

 from order_status 
 group by order_date order by order_date
