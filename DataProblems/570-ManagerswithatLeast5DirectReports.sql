-- Write your PostgreSQL query statement below
SELECT e2.name
FROM employee e1
LEFT JOIN employee e2
    ON e1.managerid = e2.id
GROUP BY e1.managerid, e2.name
HAVING count(*) >= 5