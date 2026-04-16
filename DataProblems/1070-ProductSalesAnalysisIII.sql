-- Write your PostgreSQL query statement below
-- 1070-ProductSalesAnalysisIII.sql
WITH min_year AS(
    SELECT
        product_id,
        RANK() OVER(PARTITION BY product_id ORDER BY year) AS rank,
        year as first_year,
        quantity,
        price
    FROM sales
)
SELECT product_id, first_year, quantity, price
FROM min_year
WHERE rank = 1 
