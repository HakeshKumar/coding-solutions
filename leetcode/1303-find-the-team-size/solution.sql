# Write your MySQL query statement below
with team_size as (
    select team_id, count(employee_id) as team_count from Employee 
    group by team_id

)

select e.employee_id, t.team_count as team_size  
from Employee e right join team_size t  on e.team_id=t.team_id
order by e.employee_id
