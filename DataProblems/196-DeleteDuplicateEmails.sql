-- Write your PostgreSQL query statement below
-- 196-DeleteDuplicateEmails.sql
WITH duplicates AS (
    SELECT 
        id,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
    FROM person
)
DELETE FROM person
WHERE id IN (
    SELECT id
    FROM duplicates
    WHERE rn > 1