-- Write your PostgreSQL query statement below
-- Write your PostgreSQL query statement below
SELECT e2.name
FROM (
    SELECT managerid
    FROM employee
    GROUP BY managerid
    HAVING count(managerid) >= 5
) e1
JOIN employee e2
    ON e1.managerid = e2.id