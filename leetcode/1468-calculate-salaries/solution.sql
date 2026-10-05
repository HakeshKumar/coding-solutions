# Write your MySQL query statement below
with tax_calc as (

    select company_id, case when max(salary)<1000 THEN 1 WHEN max(salary)>1000 AND max(salary)<10000 THEN 0.76 ELSE 0.51 END as tax
    from salaries
    group by company_id
)
select s.company_id, s.employee_id, s.employee_name, ROUND(s.salary * t.tax) as salary
 from salaries s join tax_calc t on s.company_id=t.company_id 
