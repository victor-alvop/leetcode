-- Write your PostgreSQL query statement below
-- 183-CustomersWhoNeverOrder.sql
SELECT c.name as Customers
FROM customers c
LEFT JOIN orders o
ON c.id = o.customerId
WHERE o.id IS NULL