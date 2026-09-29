# Write your MySQL query statement below
with ranked as ( select project_id , e.employee_id , sum(e.experience_years) as experience, rank() over(partition by p.project_id order by sum(e.experience_years) desc) as rnk

from project p left join employee e on p.employee_id=e.employee_id

group by p.project_id, e.employee_id
order by experience desc ) 

select project_id, employee_id from ranked where rnk=1
