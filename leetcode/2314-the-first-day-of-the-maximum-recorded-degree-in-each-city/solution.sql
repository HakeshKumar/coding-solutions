with grouped as (

    select city_id, day,degree, rank() over(partition by city_id order by degree desc,  day asc) as rn
    from weather
)
select city_id, day, degree from grouped where rn=1
