WITH cte1 AS(

SELECT * , RANK() OVER(ORDER BY order_occurrences DESC) as ranking
FROM items_per_order)

SELECT item_count AS mode
FROM cte1
WHERE ranking = 1
ORDER BY mode
;
