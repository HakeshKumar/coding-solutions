# Write your MySQL query statement below
select s.id,s.name
from 
students s left join departments d on s.department_id =d.id  
WHERE d.id IS NULL
