-- Write your PostgreSQL query statement below
-- 1164-ProductPriceAtAGivenDate.sql
WITH latest_records AS(
    SELECT
        product_id,
        new_price AS price,
        ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) as rn
    FROM products
    WHERE change_date <= '2019-08-16'
)
SELECT 
    p.product_id, 
    COALESCE (lr.price, 10) AS PRICE
FROM (
    SELECT DISTINCT product_id
    FROM products 
) p
LEFT JOIN latest_records lr
    ON p.product_id = lr.product_id AND lr.rn = 1
ORDER BY product_id DESC