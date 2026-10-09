# Write your MySQL query statement below
with max_avg as (

    select order_id,avg(quantity) as average, max(quantity) as maximum, max(avg(quantity)) over() as maximum_avg from
    OrdersDetails
    group by order_id
)
 select order_id from max_avg where maximum>maximum_avg
