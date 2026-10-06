# Write your MySQL query statement below
with passenger as (
    select passenger_id , count(*) as count_pass from Rides
    group by passenger_id 
)
select distinct r.driver_id,coalesce (p.count_pass,0) as cnt
 from Rides r left join passenger p on r.driver_id=p.passenger_id
