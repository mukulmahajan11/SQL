WITH CTE_job AS (
SELECT company_id, title, description, COUNT(job_id) AS job_count 
FROM job_listings
GROUP BY company_id, title, description
)

SELECT COUNT(DISTINCT company_id) AS duplicate_companies 

FROM CTE_job

WHERE job_count>1;
