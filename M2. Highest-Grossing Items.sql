WITH cte1 AS(
SELECT category, product, SUM(spend) AS total_spend
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product), 

cte2 AS(
SELECT *, 
ROW_NUMBER() OVER(PARTITION BY category ORDER BY total_spend DESC) AS ranking
FROM cte1)

SELECT category, product, total_spend
FROM cte2
WHERE ranking <=2
;
