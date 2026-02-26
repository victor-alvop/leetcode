-- Write your PostgreSQL query statement below
SELECT DISTINCT s.product_id, p.product_name
FROM sales s
JOIN product p
    ON s.product_id = p.product_id
WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31' 
AND s.product_id NOT IN (
    SELECT product_id
    FROM sales
    where sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31' 
)