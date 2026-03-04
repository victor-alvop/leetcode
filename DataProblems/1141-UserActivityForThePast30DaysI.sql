SELECT 
    activity_date as day,
    COUNT(DISTINCT(user_id)) as active_users
FROM activity
WHERE activity_date BETWEEN  DATE '2019-07-28' - INTERVAL '30 days' AND DATE '2019-07-27'
GROUP BY activity_date