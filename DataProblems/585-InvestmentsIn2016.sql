-- Write your PostgreSQL query statement below
-- 585-InvestmentsIn2016.sql

WITH tiv_2015_values AS(
    select tiv_2015, count(*) as cuenta
    from insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
),
unique_location AS(
    select lat, lon, count(*) as cuenta
    from insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1

)
SELECT ROUND(SUM(tiv_2016)::NUMERIC, 2) as tiv_2016
FROM tiv_2015_values tv
LEFT JOIN insurance i1
    ON tv.tiv_2015 = i1.tiv_2015
INNER JOIN unique_location ul
    ON i1.lat = ul.lat AND i1.lon = ul.lon