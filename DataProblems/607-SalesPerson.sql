-- Write your PostgreSQL query statement below
-- 607-SalesPerson.sql
SELECT sp.name
FROM salesperson sp
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    JOIN company c 
        ON o.com_id = c.com_id
    WHERE o.sales_id = sp.sales_id AND c.name = 'RED'
);