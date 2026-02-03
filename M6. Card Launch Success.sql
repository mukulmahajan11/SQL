WITH cte AS(

SELECT *,
RANK() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) AS ranking
FROM monthly_cards_issued)


SELECT card_name, issued_amount
FROM cte
WHERE ranking = 1
ORDER BY issued_amount DESC
;
