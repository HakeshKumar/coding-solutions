SELECT book_id, name
FROM (
    SELECT
        b.book_id,
        b.name,
        SUM(
            CASE
                WHEN o.dispatch_date > '2018-06-23'
                THEN o.quantity
                ELSE 0
            END
        ) AS quantity
    FROM books b
    LEFT JOIN orders o
        ON b.book_id = o.book_id
    WHERE b.available_from <= '2019-05-23'
    GROUP BY b.book_id, b.name
) a
WHERE a.quantity < 10;
