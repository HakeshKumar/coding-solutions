with count_votes  as (

    select candidateid, count(*) as vote_count from vote
    group by candidateid 


)

select c.name as name
 from Candidate c  Join count_votes v ON c.id=v.candidateid
 order by v.vote_count desc
 limit 1
