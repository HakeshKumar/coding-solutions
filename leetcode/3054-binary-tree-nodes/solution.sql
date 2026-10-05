# Write your MySQL query statement below
SELECT 
    N ,
    CASE 
        WHEN N  IN (SELECT N  FROM tree WHERE P     IS NULL)
        THEN 'Root'
        WHEN N  IN (SELECT P as id from tree)
        THEN 'Inner'
        ELSE
        'Leaf'
    END AS type
FROM tree
order by N
