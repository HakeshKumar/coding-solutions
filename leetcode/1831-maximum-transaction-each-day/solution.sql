# Write your MySQL query statement below
with ranked as (

    select transaction_id,day, amount, rank() over(partition by DATE(day) order by amount desc) as rn from Transactions
)

select transaction_id from ranked where rn=1 order by transaction_id
