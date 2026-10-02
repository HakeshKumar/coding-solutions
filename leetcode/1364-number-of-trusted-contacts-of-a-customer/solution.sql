WITH contact_stats AS (
    SELECT
        user_id,
        COUNT(*) AS contacts_cnt,
        SUM(
            CASE 
                WHEN contact_email IN (SELECT email FROM Customers)
                THEN 1 
                ELSE 0
            END
        ) AS trusted_contacts_cnt
    FROM Contacts
    GROUP BY user_id
)

SELECT
    i.invoice_id,
    c.customer_name,
    i.price,
    COALESCE(cs.contacts_cnt, 0) AS contacts_cnt,
    COALESCE(cs.trusted_contacts_cnt, 0) AS trusted_contacts_cnt
FROM Invoices i
JOIN Customers c
    ON i.user_id = c.customer_id
LEFT JOIN contact_stats cs
    ON i.user_id = cs.user_id
ORDER BY i.invoice_id;
