# Write your MySQL query statement below
with activity as 
(
    select activity , count(*) as rn
    from Friends
    group by activity
),
joined as (

    select activity from activity where rn = ( select max(rn) from activity)
    UNION ALL 
    select activity from activity where rn = ( select min(rn) from activity)
)
select distinct f.activity 

from Friends f join activities a on f.activity =a.name 
where a.name NOT IN ( select distinct activity from joined)
