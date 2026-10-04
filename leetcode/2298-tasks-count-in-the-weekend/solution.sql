# Write your MySQL query statement below
select 
SUM(case when DAYNAME(submit_date) IN ('Saturday' ,'Sunday') THEN  1 ELSE 0 END) as weekend_cnt,
SUM(case when DAYNAME(submit_date) NOT IN ('Saturday' ,'Sunday') THEN  1 ELSE 0 END) as working_cnt 

from Tasks
