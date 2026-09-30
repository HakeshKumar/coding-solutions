# Write your MySQL query statement below
with avg_activity as (

    select event_type, avg(occurrences ) as average_occurances
    from events 
    group by event_type
),
joined as (

    select e.business_id,e.event_type,e.occurrences, a.average_occurances
    from events e join avg_activity a on e.event_type=a.event_type
),
mark_greater as (

    select business_id, case when occurrences>average_occurances THEN 1 ELSE 0 END as flag from joined
)
select business_id from mark_greater
group by business_id 
having sum(flag)>1
