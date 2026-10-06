# Write your MySQL query statement below
with grouped as 
(

    select b.box_id,b.chest_id as box_chest_id, c.chest_id as chest_id, b.apple_count as b_apple,b.orange_count as b_orange,c.apple_count,c.orange_count
    from boxes b left  join chests c on b.chest_id=c.chest_id
)

select 

SUM(case when chest_id IS NULL THEN b_apple  ELSE b_apple+apple_count END) as apple_count,
SUM(case when chest_id IS NULL THEN b_orange  ELSE b_orange+orange_count END) as orange_count


 from grouped
