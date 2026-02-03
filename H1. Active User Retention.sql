
-------------------More efficient & generalized Solution----------------
SELECT 
  EXTRACT(MONTH FROM curr_month.event_date) AS month, 
  COUNT(DISTINCT curr_month.user_id) AS monthly_active_users 
FROM user_actions AS curr_month

WHERE EXISTS 

(
  SELECT last_month.user_id 
  FROM user_actions AS last_month
  WHERE last_month.user_id = curr_month.user_id
    AND EXTRACT(MONTH FROM last_month.event_date) =
    EXTRACT(MONTH FROM curr_month.event_date - interval '1 month')
)

  AND EXTRACT(MONTH FROM curr_month.event_date) = 7
  AND EXTRACT(YEAR FROM curr_month.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM curr_month.event_date);


-----------Alternative Solution (But NOT as Efficient as previous Solution)-------------------
WITH cte AS (
    SELECT DISTINCT user_id
    FROM user_actions
    WHERE EXTRACT(MONTH FROM event_date) = 7
      AND EXTRACT(YEAR FROM event_date) = 2022

    INTERSECT

    SELECT DISTINCT user_id
    FROM user_actions
    WHERE EXTRACT(MONTH FROM event_date) = 6
      AND EXTRACT(YEAR FROM event_date) = 2022
)

SELECT '7' AS month,
       COUNT(user_id) AS monthly_active_user
FROM cte;
