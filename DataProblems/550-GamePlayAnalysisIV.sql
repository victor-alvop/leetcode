-- Write your PostgreSQL query statement below
-- 550-GamePlayAnalysisIV.sql
SELECT 
    ROUND(COUNT(DISTINCT a1.player_id)::decimal/(SELECT COUNT(DISTINCT player_id)::decimal FROM activity), 2) AS fraction
FROM(
    SELECT player_id, MIN(event_date) AS event_date
    FROM activity
    GROUP BY player_id
) a1
INNER JOIN activity a2
    ON a1.event_date + INTERVAL '1 DAY' = a2.event_date
    AND a1.player_id = a2.player_id