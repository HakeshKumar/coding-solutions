# Write your MySQL query statement below
select d.dept_name as dept_name, SUM(case when s.student_id THEN 1 ELSE 0 END) as student_number
from student s right join department d on s.dept_id=d.dept_id
group by d.dept_name
order by student_number desc
