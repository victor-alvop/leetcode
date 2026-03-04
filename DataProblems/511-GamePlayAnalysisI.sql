SELECT a.player_id, a.event_date as first_login
FROM (
    SELECT *, DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date ASC) as rank
    FROM activity
) a
WHERE a.rank = 1