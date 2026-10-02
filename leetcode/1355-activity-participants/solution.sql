WITH activity AS (
    SELECT activity, COUNT(*) AS rn
    FROM Friends
    GROUP BY activity
)

SELECT activity
FROM activity
WHERE activity NOT IN (
    SELECT activity
    FROM activity
    WHERE rn = (SELECT MAX(rn) FROM activity)

    UNION ALL

    SELECT activity
    FROM activity
    WHERE rn = (SELECT MIN(rn) FROM activity)
);
