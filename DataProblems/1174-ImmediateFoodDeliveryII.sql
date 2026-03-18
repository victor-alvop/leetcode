-- Write your PostgreSQL query statement below
-- 1174-ImmediateFoodDeliveryII.sql
WITH first_orders AS(
    SELECT customer_id, 
        MIN(order_date) as first_date, 
        MIN(customer_pref_delivery_date) as pref_date
    FROM delivery
    GROUP BY customer_id
)
SELECT ROUND(
    COUNT(CASE WHEN first_date = pref_date THEN 1 END) * 100.00 /
    COUNT(*), 2
) AS immediate_percentage
FROM first_orders