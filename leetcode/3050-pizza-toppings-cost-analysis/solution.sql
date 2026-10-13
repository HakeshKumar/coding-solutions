# Write your MySQL query statement below
with simple as (

    select t1.topping_name as t1_topping_name,  t1.cost as t1_cost, t2.topping_name as t2_topping_name, t2.cost as t2_cost, t3.topping_name as t3_topping_name, t3.cost as t3_cost
    from toppings t1 
    join toppings t2 on t1.topping_name < t2.topping_name
    join toppings t3 on t2.topping_name<t3.topping_name
)

select CONCAT(t1_topping_name, ',' , t2_topping_name,',',t3_topping_name) as pizza ,

ROUND(t1_cost+t2_cost+t3_cost, 2) as total_cost

from simple 
order by total_cost desc, pizza asc
