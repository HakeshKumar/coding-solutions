with friends as ( select user2_id as friends  from friendship where user1_id=1

union all 

select user1_id as friends from friendship where user2_id=1 ) 

select distinct l.page_id as recommended_page 
from likes l join friends f on l.user_id=f.friends
where l.page_id NOT IN ( select page_id from likes where user_id=1)
