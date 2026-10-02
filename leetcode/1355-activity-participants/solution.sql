# Write your MySQL query statement below
with maximum_activities as 
(
    select activity , row_number() over(partition by activity) as rn
    from Friends
    order by rn desc
),
 minimum_activity as 

(
    select activity , count(*) as rn
    from Friends
    group by activity
    order by  count(*) asc
),
joined as (

    select activity from maximum_activities where rn = ( select max(rn) from maximum_activities)
    UNION ALL 
    select activity from minimum_activity where rn = ( select min(rn) from minimum_activity)
)
select distinct f.activity 

from Friends f join activities a on f.activity =a.name 
where a.name NOT IN ( select distinct activity from joined)
