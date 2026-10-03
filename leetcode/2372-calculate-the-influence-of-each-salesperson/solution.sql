# Write your MySQL query statement below
with simple as 
(
    select s.salesperson_id,s.name,c.customer_id,sa.price
    from salesperson s 
    left join customer c on s.salesperson_id=c.salesperson_id
    join sales sa on c.customer_id=sa.customer_id
),
grouped as (

    select salesperson_id, name , sum(price) as total
    from simple
    group by salesperson_id, salesperson_id
)

select s.salesperson_id,s.name, coalesce(g.total,0) as total
from salesperson s left join grouped g on s.salesperson_id=g.salesperson_id
