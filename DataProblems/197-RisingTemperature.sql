-- Write your PostgreSQL query statement below
SELECT w1.id
FROM weather w1
JOIN weather w2
    ON w1.recorddate = w2.recorddate + INTERVAL '1 DAY'
WHERE w1.temperature > w2.temperature;