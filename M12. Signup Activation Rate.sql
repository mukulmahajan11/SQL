SELECT 

ROUND(1.0*SUM(CASE WHEN t.signup_action = 'Confirmed' THEN 1 ELSE 0 END)/
COUNT(DISTINCT e.user_id),2)

AS confirm_rate

FROM emails e 
LEFT JOIN texts t 
ON e.email_id = t.email_id
;
