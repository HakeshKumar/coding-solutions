with simple as (

    select user_id, visit_date , coalesce(lead(visit_date) over(partition by user_id order by visit_date ),'2021-01-01') as rn
    from uservisits
)

select user_id, max(difference) as biggest_window   from (
select user_id, DATEDIFF(rn ,visit_date) as difference from simple ) a 

group by user_id
