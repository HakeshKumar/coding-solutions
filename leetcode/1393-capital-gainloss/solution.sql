# Write your MySQL query statement below
with buy_orders as (

    select stock_name ,sum(price) as buy_price
    from stocks where operation='Buy'
    group by stock_name
),
sell_orders as (

        select stock_name ,sum(price) as sell_price
    from stocks where operation='Sell'
    group by stock_name
)
select b.stock_name, s.sell_price-b.buy_price   as capital_gain_loss
from buy_orders b join sell_orders s on
b.stock_name=s.stock_name
group by b.stock_name
