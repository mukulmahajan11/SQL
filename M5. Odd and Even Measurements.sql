WITH cte AS

(SELECT *, RANK() OVER(PARTITION BY CAST(measurement_time AS DATE) 
ORDER BY measurement_time) AS num
FROM measurements)


SELECT CAST(measurement_time AS DATE) AS measurement_day, 

SUM(CASE WHEN num % 2 <> 0 THEN measurement_value ELSE 0 END) AS odd_sum,
SUM(CASE WHEN num % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum

FROM cte
GROUP BY measurement_day
ORDER BY measurement_day
;
