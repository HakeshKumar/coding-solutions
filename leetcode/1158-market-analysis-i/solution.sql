WITH simplified AS ( 
    SELECT DISTINCT
        u.user_id AS buyer_id,
        u.join_date
    FROM users u
),

orders_in2019 AS ( 
    SELECT
        buyer_id,
        COUNT(*) AS order_count
    FROM orders
    WHERE YEAR(order_date) = 2019
    GROUP BY buyer_id
),

final_table AS ( 
    SELECT
        s.buyer_id,
        s.join_date,
        CASE
            WHEN oo.order_count IS NULL THEN 0
            ELSE oo.order_count
        END AS orders_in_2019
    FROM simplified s
    LEFT JOIN orders_in2019 oo
        ON s.buyer_id = oo.buyer_id
)

SELECT *
FROM final_table;
