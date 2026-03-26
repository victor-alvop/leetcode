-- Write your PostgreSQL query statement below
-- 1204-LastPersonToFitInTheBus.sql

SELECT person_name
FROM (
    SELECT person_name, SUM(weight) OVER(ORDER BY turn) as total_weight
    FROM queue
)
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1