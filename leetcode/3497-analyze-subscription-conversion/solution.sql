# Write your MySQL query statement below
with free_trail as 
(
    select user_id, ROUND(AVG( case when activity_type='free_trial' THEN activity_duration END),2) as trial_avg_duration from useractivity
    group by user_id
),
paid as 
(
        select user_id, ROUND(AVG( case when activity_type='paid' THEN activity_duration END),2) as paid_avg_duration  from useractivity
    group by user_id
)

select ft.user_id, ft.trial_avg_duration, p.paid_avg_duration 
from free_trail ft 
join paid p on
ft.user_id=p.user_id 
where p.paid_avg_duration IS NOT NULL AND ft.trial_avg_duration IS NOT NULL
