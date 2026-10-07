# Write your MySQL query statement below
with simplified as (

    select season_id, team_id, team_name, wins * 3 + draws * 1 as points, goals_for-goals_against as goal_difference,

    row_number() over(partition by season_id order by wins * 3 + draws * 1 desc, goals_for-goals_against desc, team_name  asc) as position


    from SeasonStats
)

select * from simplified
