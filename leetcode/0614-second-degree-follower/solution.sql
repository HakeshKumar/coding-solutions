# Write your MySQL query statement below

select followee as follower , count(*) as num
from follow 
 where followee IN ( 
select distinct followee as superusers from Follow 

where followee IN ( select followee from follow) AND followee IN (select follower from follow )

)group by followee order by follower
