/*
CREATE TABLE Jan_job_applied AS
    SELECT *
    FROM
        job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE Feb_job_applied AS
    SELECT *
    FROM
        job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE Mar_job_applied AS
    SELECT *
    FROM
        job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT
    job_posted_date
FROM
    mar_job_applied;

ALTER TABLE Jan_job_applied
RENAME TO january_jobs


ALTER TABLE Mar_job_applied
RENAME TO march_jobs;

ALTER TABLE Feb_job_applied
RENAME TO february_jobs;

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'New York, NY' THEN 'Local'
        WHEN job_location = 'Anywhere' THEN 'Remote'
        ELSE 'On-Site'
    END AS location_category
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY   
    location_category;


SELECT
        COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN salary_year_avg >= 69000 THEN '$Goood Salary$'
        WHEN salary_year_avg BETWEEN 49999 AND 68999 THEN 'Okay money'
        WHEN salary_year_avg < 49999 THEN 'Slavery'
        ELSE 'WTH'
    END AS Salary_Buckets
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
    AND 
    salary_year_avg IS NOT NULL
GROUP BY 
    Salary_Buckets
ORDER BY 
    Salary_Buckets DESC 



SELECT
    COUNT(job_id)
FROM    
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    AND 
    salary_year_avg IS NOT NULL 



SELECT
    *
FROM 
    (SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    ) AS january_jobs;


*/



WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)
    SELECT *
    FROM january_jobs;



SELECT
    company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT
    company_id
FROM
    job_postings_fact
WHERE
    job_no_degree_mention = true
);




SELECT
    company_id,
    job_no_degree_mention
FROM
    job_postings_fact
WHERE
    job_no_degree_mention = true;




WITH company_job_count AS (

SELECT
    company_id,
    COUNT(*) AS total_jobs
FROM
job_postings_fact
GROUP BY
company_id

)



SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM 
    company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id 
ORDER BY 
total_jobs DESC




SELECT  
    (SELECT
        COUNT(*) 
    FROM
        skills_job_dim
    ) AS jobs_with_skill_count,
    skills_dim.skills
    FROM
    skills_job_dim
    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY
    skills_job_dim.skill_id
ORDER BY
    jobs_with_skill_count DESC
LIMIT 5

-- CHAT GPT VERSION/../....



SELECT
    skills_dim.skills,
    COUNT(*) AS jobs_with_skill_count
FROM skills_job_dim
LEFT JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY
    skills_dim.skills
ORDER BY
    jobs_with_skill_count DESC
LIMIT 5;






SELECT
    skills_dim.skills,
    COUNT(*) AS jobs_with_skill_count
FROM skills_job_dim
LEFT JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY
    skills_dim.skill_id,
    skills_dim.skills
ORDER BY
    jobs_with_skill_count DESC
LIMIT 5;





SELECT
    skills_dim.skills,
    skill_counts.jobs_with_skill_count
FROM
    (
        SELECT
            skill_id,
            COUNT(*) AS jobs_with_skill_count
        FROM skills_job_dim
        GROUP BY skill_id
    ) AS skill_counts
LEFT JOIN skills_dim
    ON skill_counts.skill_id = skills_dim.skill_id
ORDER BY
    jobs_with_skill_count DESC
LIMIT 5;
