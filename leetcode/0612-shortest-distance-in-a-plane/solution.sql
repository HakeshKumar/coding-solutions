SELECT ROUND(
    MIN(
        SQRT(
            POWER(a.x - b.x, 2) +
            POWER(a.y - b.y, 2)
        )
    ),
    2
) AS shortest
FROM Point2D a
CROSS JOIN Point2D b
WHERE a.x <> b.x
   OR a.y <> b.y;
