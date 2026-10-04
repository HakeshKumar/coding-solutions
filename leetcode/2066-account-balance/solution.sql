with grouped as (

    select account_id,day, SUM( CASE
        WHEN type = 'Deposit' THEN amount
        ELSE -amount END) over(partition by account_id order by day ) as balance
    from Transactions

)
select * from grouped
