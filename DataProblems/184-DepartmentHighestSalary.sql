-- Write your PostgreSQL query statement below
SELECT
    d.name as department,
    e.name as employee,
    e.salary as salary
FROM (
    SELECT *, DENSE_RANK() OVER(
        PARTITION BY departmentid
        ORDER BY salary DESC
    ) as rank
    FROM employee
) e
JOIN department d
    ON d.id = e.departmentid
WHERE e.rank = 1