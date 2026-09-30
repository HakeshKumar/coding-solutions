 select project_id from 
 
 (select p.project_id, count(distinct p.employee_id) as emp_count, rank() over(order by count(distinct p.employee_id) desc) as rn
from project p join employee e on p.employee_id=e.employee_id
group by p.project_id
order by emp_count desc ) a where rn=1
