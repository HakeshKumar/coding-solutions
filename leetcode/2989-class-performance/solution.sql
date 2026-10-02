# Write your MySQL query statement below
with totals as (select *,
assignment1+assignment2+assignment3 as total 
from Scores) 
select max(total)-min(total) as difference_in_score from totals  
