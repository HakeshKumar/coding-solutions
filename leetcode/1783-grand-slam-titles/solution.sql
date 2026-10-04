# Write your MySQL query statement below
with grouped as (
    select p.player_id, p.player_name,
    SUM(case when c.wimbledon=p.player_id THEN 1 ELSE 0 END) as wimb_row,
    SUM(case when c.Fr_open=p.player_id THEN 1 ELSE 0 END) as fr_row,
    SUM(case when c.US_open=p.player_id THEN 1 ELSE 0 END) as us_row,
    SUM(case when c.Au_open=p.player_id THEN 1 ELSE 0 END) as au_row
    from players p join championships c 
    on p.player_id=c.Wimbledon or 
    p.player_id=c.Fr_open or
    p.player_id=c.US_open or
    p.player_id=c.Au_open 
group by p.player_id

)
select player_id,player_name,  wimb_row+fr_row +us_row + au_row as grand_slams_count from grouped
