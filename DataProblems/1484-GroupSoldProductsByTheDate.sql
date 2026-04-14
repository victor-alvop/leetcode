-- Write your PostgreSQL query statement below
-- 1484-GroupSoldProductsByTheDate.sql
SELECT
    sell_date, 
    COUNT(DISTINCT product) as num_sold,
    STRING_AGG(DISTINCT product, ',') AS products
FROM activities
GROUP BY sell_date