-- Write your PostgreSQL query statement below
-- 1321-RestaurantGrowth.sql
WITH daily AS (
    SELECT 
        visited_on,
        SUM(amount) AS total_amount
    FROM Customer
    GROUP BY visited_on
),
windowed AS (
    SELECT
        visited_on,
        SUM(total_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        AVG(total_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS avg_amount,
        COUNT(*) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS cnt
    FROM daily
)
SELECT
    visited_on,
    amount,
    ROUND(avg_amount, 2) AS average_amount
FROM windowed
WHERE cnt = 7;