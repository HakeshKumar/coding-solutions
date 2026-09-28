with ordered_table as (

    select * from point order by x asc
),

dist as (

    select o.x as first_item, lead(o.x) OVER() as  next_item from ordered_table o
),

differ as (

    select abs(first_item-next_item) as difference from dist
)

select min(difference)  as shortest  from differ 
