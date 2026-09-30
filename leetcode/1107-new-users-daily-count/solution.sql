# Write your MySQL query statement below
with simplified as ( select user_id,activity, activity_date, rank() over (partition by user_id order by activity_date asc) as rn
from traffic
where activity='login' )

select activity_date as login_date , count(distinct user_id) as user_count
from simplified where rn=1    AND activity_date >= '2019-04-01'
  AND activity_date <= '2019-06-30'
group by activity_date 
