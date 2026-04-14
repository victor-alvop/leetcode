-- Write your PostgreSQL query statement below
-- 1741-FindTotalTimeSpentByEachEmployee.sql
SELECT
    event_day AS day,
    emp_id,
    SUM(out_time) - SUM(in_time) AS total_time
FROM employees
GROUP BY event_day, emp_id