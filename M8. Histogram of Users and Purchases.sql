WITH cte AS(

SELECT *, 
RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC)
AS ranking
FROM user_transactions)

SELECT transaction_date, user_id, 
COUNT(product_id) AS purchase_count
FROM cte 
WHERE ranking = 1 
GROUP BY transaction_date, user_id
ORDER BY transaction_date
;
