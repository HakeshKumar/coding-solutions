SELECT e.name AS Employee
FROM employee e
LEFT JOIN employee m
    ON e.managerId = m.id
WHERE e.salary > m.salary;
