WITH RECURSIVE hierarchy AS (

    -- Start from the head of the company
    SELECT
        employee_id,
        manager_id
    FROM Employees
    WHERE employee_id = 1

    UNION ALL

    -- Find employees reporting to the previous level
    SELECT
        e.employee_id,
        e.manager_id
    FROM Employees e
    JOIN hierarchy h
        ON e.manager_id = h.employee_id
    WHERE e.employee_id <> 1
)

SELECT employee_id
FROM hierarchy
WHERE employee_id <> 1;
