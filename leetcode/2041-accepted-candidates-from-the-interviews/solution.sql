# Write your MySQL query statement below
select c.candidate_id as candidate_id
from candidates c join  ( select interview_id 
from rounds
group by interview_id 
having sum(score)>15


)  new ON c.interview_id = new.interview_id

where c.years_of_exp >=2 
