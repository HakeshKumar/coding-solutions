# Write your MySQL query statement below
select player_id,device_id from (select player_id,device_id, RANK() OVER (
        PARTITION BY player_id 
        ORDER BY event_date  
    ) AS rn
from activity ) a
where a.rn=1
