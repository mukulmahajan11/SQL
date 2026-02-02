SELECT 

SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 

FROM viewership;




------------------SOLUTION WITH CTE


WITH cte AS (SELECT 
CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END AS laptop_views, 
CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END AS mobile_views 
FROM viewership)

SELECT SUM(laptop_views), SUM(mobile_views) FROM cte

;
