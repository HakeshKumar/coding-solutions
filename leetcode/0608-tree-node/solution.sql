SELECT 
    id,
    CASE 
        WHEN id IN (SELECT id FROM tree WHERE p_id IS NULL)
        THEN 'Root'
        WHEN id  IN (SELECT p_id as id from tree)
        THEN 'Inner'
        ELSE
        'Leaf'
    END AS type
FROM tree;
