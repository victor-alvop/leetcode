-- Write your PostgreSQL query statement below
SELECT DISTINCT num as consecutivenums
FROM (
    SELECT num,
    LAG(num, 1) OVER (ORDER BY id) as prev1,
    LAG(num, 2) OVER (ORDER BY id) as prev2
    FROM logs
) 
WHERE num = prev1 AND num = prev2