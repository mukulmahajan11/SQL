WITH cte AS(
SELECT c.*, p.product_category
FROM customer_contracts c 
LEFT JOIN products p 
ON c.product_id = p.product_id)

SELECT customer_id
FROM cte 
GROUP BY customer_id
HAVING COUNT(DISTINCT product_category) = 
          (SELECT COUNT(DISTINCT product_category) FROM products)
;
