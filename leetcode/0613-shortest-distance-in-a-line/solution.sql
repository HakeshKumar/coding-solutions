
select min(a.difference) as shortest from (
SELECT
    p.x AS first,
    new_p.x AS second_val,
    abs(p.x - new_p.x) AS difference
FROM point p
LEFT JOIN point AS new_p
    ON p.x <> new_p.x ) a
