CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
    RETURN QUERY (
        -- Write your PostgreSQL query statement below.
        SELECT e2.salary as getNthHighestSalary
        FROM (
            SELECT *, DENSE_RANK() OVER(ORDER BY e.salary DESC) AS rankid
            FROM employee e
        ) e2
        WHERE rankid = n
        LIMIT 1
    );
END;
$$ LANGUAGE plpgsql;