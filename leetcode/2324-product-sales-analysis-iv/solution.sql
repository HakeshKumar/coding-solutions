with each_product as (

    select s.user_id,s.product_id, SUM(s.quantity*p.price) as total_spent
    from sales s join product p on s.product_id=p.product_id
    group by s.user_id,s.product_id
),
ranked AS (
    SELECT
        *,
        DENSE_RANK() OVER (
            PARTITION BY user_id
            ORDER BY total_spent DESC
        ) AS rn
    FROM each_product)
select user_id,product_id from ranked where rn=1
