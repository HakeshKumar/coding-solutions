SELECT  ROUND((SUM (item_count*order_occurrences)::NUMERIC /sum(order_occurrences)),1) as mean

FROM items_per_order
