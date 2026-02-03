WITH cte AS(

SELECT pc.* , p1.country_id AS call_country, p2.country_id AS rec_country
FROM phone_calls pc
LEFT JOIN phone_info p1
ON pc.caller_id = p1.caller_id
LEFT JOIN phone_info p2
ON pc.receiver_id = p2.caller_id)


SELECT ROUND(1.0*SUM(CASE WHEN call_country <> rec_country THEN 1 ELSE 0 END)
/COUNT(*)*100,1) 
AS international_call_pct
FROM cte
; 
