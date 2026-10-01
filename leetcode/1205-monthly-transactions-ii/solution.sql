WITH cte AS (
    SELECT
        t.id,
        t.country,
        t.state,
        t.amount,
        t.trans_date AS transaction_date,
        c.trans_date AS chargeback_date
    FROM Transactions t
    LEFT JOIN Chargebacks c
        ON t.id = c.trans_id
),

cte2 AS (
    SELECT
        DATE_FORMAT(transaction_date, '%Y-%m') AS month,
        country,
        SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
        SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_amount
    FROM cte
    GROUP BY DATE_FORMAT(transaction_date, '%Y-%m'), country
),

cte3 AS (
    SELECT
        DATE_FORMAT(chargeback_date, '%Y-%m') AS month,
        country,
        COUNT(*) AS chargeback_count,
        SUM(amount) AS chargeback_amount
    FROM cte
    WHERE chargeback_date IS NOT NULL
    GROUP BY DATE_FORMAT(chargeback_date, '%Y-%m'), country
),

all_months AS (
    SELECT month, country FROM cte2
    UNION
    SELECT month, country FROM cte3
)

SELECT
    a.month,
    a.country,
    COALESCE(t.approved_count, 0) AS approved_count,
    COALESCE(t.approved_amount, 0) AS approved_amount,
    COALESCE(c.chargeback_count, 0) AS chargeback_count,
    COALESCE(c.chargeback_amount, 0) AS chargeback_amount
FROM all_months a
LEFT JOIN cte2 t
    ON a.month = t.month
    AND a.country = t.country
LEFT JOIN cte3 c
    ON a.month = c.month
    AND a.country = c.country
WHERE
    COALESCE(t.approved_count, 0) > 0
    OR COALESCE(t.approved_amount, 0) > 0
    OR COALESCE(c.chargeback_count, 0) > 0
    OR COALESCE(c.chargeback_amount, 0) > 0;
