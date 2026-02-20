SELECT customer_id, count(*) as count_no_trans
FROM visits t1
LEFT JOIN transactions t2
    ON t1.visit_id = t2.visit_id
WHERE t2.visit_id IS NULL
GROUP BY customer_id