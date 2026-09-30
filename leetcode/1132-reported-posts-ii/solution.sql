WITH spam AS (
    SELECT DISTINCT
        action_date,
        post_id
    FROM Actions
    WHERE action = 'report'
      AND extra = 'spam'
),

marked AS (
    SELECT
        s.action_date,
        s.post_id,
        CASE
            WHEN r.post_id IS NOT NULL THEN 1
            ELSE 0
        END AS removed_flag
    FROM spam s
    LEFT JOIN Removals r
        ON s.post_id = r.post_id
),

daily_percentage AS (
    SELECT
        action_date,
        AVG(removed_flag) * 100 AS daily_percent
    FROM marked
    GROUP BY action_date
)

SELECT
    ROUND(AVG(daily_percent), 2) AS average_daily_percent
FROM daily_percentage;
