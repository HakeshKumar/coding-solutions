select distinct a.num as ConsecutiveNums  from (

select num,
case when  num = lead(num,1) over(order by id) and num = lead(num,2) over(order by id) THEN 'True' END AS status
from logs ) a where a.status='True'