# Write your MySQL query statement below
with grouped as (

    select o.customer_id, o.product_id,p.product_name , count(order_id ) as order_count
    from orders o join products p on o.product_id=p.product_id 
    group by o.customer_id, o.product_id, p.product_name 
    order by order_count desc
),
ranked as (

    select *, dense_rank() over(partition by customer_id order by order_count desc) as rn from grouped
)
select customer_id,product_id,product_name from ranked where rn=1
