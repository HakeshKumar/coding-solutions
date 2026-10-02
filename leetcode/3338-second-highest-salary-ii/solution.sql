# Write your MySQL query statement below
with ranked as (

    select emp_id, dept, salary, dense_rank() over(partition by dept order by salary desc) as rn from employees
)

select emp_id,dept from ranked where rn=2 order by emp_id
