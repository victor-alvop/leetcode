-- Write your PostgreSQL query statement below
-- 586-CustomerPlacingTheLargestNumberOfOrders.sql

SELECT customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
FETCH FIRST 1 ROW WITH TIES;