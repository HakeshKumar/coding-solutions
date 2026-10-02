WITH distinct_logins AS (
    SELECT DISTINCT id, login_date
    FROM Logins
),

numbered AS (
    SELECT
        id,
        login_date,
        ROW_NUMBER() OVER (
            PARTITION BY id
            ORDER BY login_date
        ) AS rn
    FROM distinct_logins
),

grouped AS (
    SELECT
        id,
        DATE_SUB(login_date, INTERVAL rn DAY) AS grp
    FROM numbered
),

active_users AS (
    SELECT id
    FROM grouped
    GROUP BY id, grp
    HAVING COUNT(*) >= 5
)

SELECT DISTINCT
    a.id,
    a.name
FROM Accounts a
JOIN active_users u
    ON a.id = u.id
ORDER BY a.id;
