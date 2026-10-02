# Write your MySQL query statement below
with cte as (select gender,day,sum(score_points) as total_current
from scores
group by gender, day
order by gender, day)

select gender, day, SUM(total_current) OVER (
 PARTITION BY gender 
 ORDER BY gender, day
 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) as total  from cte
