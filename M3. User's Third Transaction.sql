WITH cte1 AS(

SELECT user_id, spend, transaction_date,

ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS ranking

FROM transactions)

SELECT user_id, spend, transaction_date
FROM cte1
WHERE ranking = 3
;
