# Write your MySQL query statement below
with type0 as 

(

    select order_id,customer_id,order_type from orders where order_type=0
),
type1 as (
    select order_id,customer_id,order_type from orders where order_type =1 and customer_id IN ( select customer_id from type0)
)

SELECT a.*
FROM Orders a
LEFT JOIN type1 b
    ON a.order_id = b.order_id
WHERE b.order_id IS NULL;
