-- Write your PostgreSQL query statement below
-- 2356-NumberOfUniqueSubjectsTaughtByEachTeacher.sql
SELECT teacher_id, COUNT(DISTINCT(subject_id)) as cnt
FROM teacher
GROUP BY teacher_id