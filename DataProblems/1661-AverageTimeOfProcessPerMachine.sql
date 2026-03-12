-- Write your PostgreSQL query statement below
-- 1661-AverageTimeOfProcessPerMachine.sql
WITH start_sum_values AS (
    SELECT machine_id, SUM(timestamp) as start_sum
    FROM activity
    WHERE activity_type = 'start'
    GROUP BY machine_id
),
end_sum_values AS (
    SELECT machine_id, SUM(timestamp) as end_sum
    FROM activity
    WHERE activity_type = 'end'
    GROUP BY machine_id
),
count_values AS (
    SELECT machine_id, COUNT(DISTINCT process_id) as count_sum
    FROM activity
    GROUP BY machine_id
)
SELECT sv.machine_id, 
    ROUND(((ev.end_sum - sv.start_sum) / count_sum)::numeric, 3) AS processing_time
FROM start_sum_values sv
JOIN end_sum_values ev
    ON sv.machine_id = ev.machine_id
JOIN count_values cv
    ON sv.machine_id = cv.machine_id