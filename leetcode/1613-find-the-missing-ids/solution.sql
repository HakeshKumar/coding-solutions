WITH RECURSIVE nums AS (
    SELECT 1 AS id

    UNION ALL

    SELECT id + 1
    FROM nums
    WHERE id < ( select max(customer_id) from customers)
)

select 
n.id as ids from nums n left join customers c on n.id=c.customer_id where c.customer_id IS NULL
