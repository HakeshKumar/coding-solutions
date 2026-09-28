with question_count as ( select question_id, 
SUM(CASE WHEN action = 'answer' THEN 1 ELSE 0 END)
/
SUM(CASE WHEN action = 'show' THEN 1 ELSE 0 END)  as value
from surveylog
group by question_id )

select question_id as survey_log from question_count
order by 
 value desc , question_id asc

limit 1
