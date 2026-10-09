# Write your MySQL query statement below
with total as (

    select  v.member_id, count(v.visit_id) as visit_count, count(case when coalesce(p.charged_amount,0)>0 THEN 1 END ) as total_purchases
    from visits v left join purchases p on v.visit_id=p.visit_id
    group by v.member_id
)
select m.member_id, m.name, 
case when (100 * t.total_purchases/t.visit_count) >= 80 THEN 'Diamond' 
    when (100 * t.total_purchases/t.visit_count) >= 50 AND (100 * t.total_purchases/t.visit_count) <80  THEN 'Gold'
    when (100 * t.total_purchases/t.visit_count)<50 THEN 'Silver' 
    ELSE 'Bronze' END as category

 from total t right join members m on t.member_id=m.member_id order by m.member_id
