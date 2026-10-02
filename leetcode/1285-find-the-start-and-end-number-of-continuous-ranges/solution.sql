with cte as (SELECT log_id,
       LAG(log_id) OVER (ORDER BY log_id) AS prev_id
FROM Logs),
cte2 as 

(select log_id, CASE WHEN log_id = prev_id + 1 THEN 0 ELSE 1 END as grp from cte
),
cte3 as(

    select log_id, grp, sum(grp) over(order by log_id) as running_total  from cte2
)
select min(log_id) as start_id, max(log_id) as end_id
 from cte3
 group by running_total
