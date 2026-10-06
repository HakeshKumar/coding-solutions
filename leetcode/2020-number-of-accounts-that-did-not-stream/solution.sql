# Write your MySQL query statement below
with subscribers as (

    select account_id
    from subscriptions 
    where YEAR(start_date)=2021 OR YEAR(end_date)=2021 

),
stream as ( 
    select count(account_id) as accounts_count
     from streams  
     WHERE account_id NOT IN ( select account_id from Streams where YEAR(stream_date)=2021)
     AND account_id in ( select account_id from subscribers)
)
select * from stream
