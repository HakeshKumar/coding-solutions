# Write your MySQL query statement below
with simplified as (

    select  o.order_id,c.name, c.customer_id,o.order_date, rank() over(partition by c.customer_id order by o.order_date desc) as rn
    from customers c join orders o on c.customer_id=o.customer_id
)

select  name as customer_name, customer_id, order_id, order_date from simplified where rn<=3 order by customer_name asc , customer_id asc, order_date desc
