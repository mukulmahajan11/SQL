WITH cte AS(
SELECT B.age_bucket, 

SUM(CASE WHEN A.activity_type = 'open' THEN A.time_spent ELSE 0 END) AS t_o,
SUM(CASE WHEN A.activity_type = 'send' THEN A.time_spent ELSE 0 END) AS t_s


FROM activities A
LEFT JOIN age_breakdown B
ON A.user_id = B.user_id

GROUP BY B.age_bucket)

SELECT age_bucket,
ROUND(t_s/(t_s+t_o)*100.0,2) AS send_perc,
ROUND(t_o/(t_s+t_o)*100.0,2) AS open_perc
FROM cte

; 
