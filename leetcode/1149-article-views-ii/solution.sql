# Write your MySQL query statement below
select distinct a.viewer_id as id from 

(select view_date,viewer_id , count(distinct article_id) as view_count
from 
views
group by view_date,viewer_id) a

where a.view_count>1
order by id asc
