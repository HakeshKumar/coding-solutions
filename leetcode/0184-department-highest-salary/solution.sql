# Write your MySQL query statement below
with dept_max as ( select d.id,d.name as dep_name, max(e.salary) as max_salary from
employee e join department d on e.departmentId =d.id
group by d.id,d.name)

select d.dep_name as Department , e.name as Employee , e.salary
From Employee e JOIN dept_max d ON e.departmentid=d.id AND e.salary=d.max_salary

