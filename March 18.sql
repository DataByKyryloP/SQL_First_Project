

-- Top 100 Data Analyst job IDs by salary_year_avg with company names and country
SELECT
    job_postings_fact.job_id,
    job_postings_fact.salary_year_avg,
    company_dim.name AS company_name,
    job_postings_fact.job_country
FROM
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_postings_fact.salary_year_avg IS NOT NULL
    AND job_postings_fact.job_title_short = 'Data Analyst'
ORDER BY
    job_postings_fact.salary_year_avg DESC
LIMIT 100;
