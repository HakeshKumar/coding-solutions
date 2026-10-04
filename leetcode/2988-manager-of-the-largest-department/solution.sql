# Write your MySQL query statement below
with grouped as (
    select dep_id, count(emp_id) as emp_count
    from Employees
    group by dep_id
    order by emp_count desc
),
ranked as (
    select dep_id,emp_count, dense_rank() over(order by emp_count desc) as rn from grouped
)
select e.emp_name as manager_name, e.dep_id from Employees e join ranked r on e.dep_id=r.dep_id

where e.position='Manager' and r.rn=1 
order by e.dep_id
