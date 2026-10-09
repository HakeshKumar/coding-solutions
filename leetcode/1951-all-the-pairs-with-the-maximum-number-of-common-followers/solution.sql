# Write your MySQL query statement below
with grouped as 
(
    select r1.user_id as r1_user,  r2.user_id as r2_user, r2.follower_id as r2_follower 
    from relations r1 join relations r2 on r1.user_id<r2.user_id AND r1.follower_id=r2.follower_id 
),
ranked as (
    select distinct r1_user,r2_user, count(r2_follower ) over(partition by r1_user,r2_user) as follower_count from grouped
),
ranked2 as (
    select *, rank() over(order by follower_count desc) as rn from ranked
)
select r1_user  as user1_id , r2_user  as user2_id  from ranked2 where rn=1
