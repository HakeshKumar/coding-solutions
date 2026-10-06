# Write your MySQL query statement below
with combined_traffic as (

    select departure_airport as airport_id , sum(flights_count) as traffic from Flights
    group by departure_airport   

UNION ALL

    select arrival_airport as airport_id , sum(flights_count) as traffic from Flights
    group by arrival_airport    
),
cte2 as 
(select airport_id, sum(traffic) as traffic  from combined_traffic
group by airport_id),
cte3 as 
(select airport_id, rank() over( order by traffic desc) as rn 
from cte2 )
select airport_id from cte3 where rn=1
