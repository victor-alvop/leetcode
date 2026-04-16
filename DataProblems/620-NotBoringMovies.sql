-- Write your PostgreSQL query statement below
-- 620-NotBoringMovies.sql

SELECT *
FROM cinema
WHERE id % 2 = 1 AND description != 'boring'
ORDER BY rating DESC;