-- Write your PostgreSQL query statement below
-- ReplaceEmployeeIDWithTheUniqueIdentifier.sql
SELECT eu.unique_id, e.name
FROM employees e
LEFT JOIN employeeuni eu
    ON eu.id = e.id