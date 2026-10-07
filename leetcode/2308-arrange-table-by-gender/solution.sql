# Write your MySQL query statement below
with grouped as (

    select user_id, gender, case when gender='female' THEN 1 WHEN gender=
'other' THEN 2 ELSE 3 END as ordered from Genders
),
ranked as (

    select user_id, gender, ordered, row_number() over(partition by ordered order by user_id) as numbered from grouped
)
select user_id,gender from ranked
ORDER BY numbered, ordered
