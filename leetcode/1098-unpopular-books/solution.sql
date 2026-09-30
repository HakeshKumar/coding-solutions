SELECT
    b.book_id,
    b.name
FROM Books b
LEFT JOIN Orders o
    ON b.book_id = o.book_id
WHERE b.available_from <= '2019-05-23'
GROUP BY b.book_id, b.name
HAVING SUM(
    CASE
        WHEN o.dispatch_date >= '2018-06-23'
        THEN o.quantity
        ELSE 0
    END
) < 10;
