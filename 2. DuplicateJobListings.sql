WITH CTE_job AS (
SELECT company_id, title, description, COUNT(DISTINCT job_id) AS job_count 
FROM job_listings
GROUP BY company_id, title, description
HAVING COUNT(DISTINCT job_id) > 1
)

SELECT COUNT(DISTINCT company_id) AS duplicate_companies 

FROM CTE_job;
