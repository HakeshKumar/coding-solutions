WITH dist AS (
    SELECT
        x,
        LEAD(x) OVER (ORDER BY x) AS next_x
    FROM Point
)
SELECT MIN(next_x - x) AS shortest
FROM dist;
