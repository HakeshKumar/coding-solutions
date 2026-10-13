with simple as (

    select customer_id, max(amount) as amount from store group by customer_id
)

select sum(case when amount>500 THEN 1 ELSE 0  END) as rich_count from simple 
