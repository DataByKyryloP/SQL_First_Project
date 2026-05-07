SELECT  
    skills_dim.skill_id,
    skills,
    COUNT(job_postings_fact.job_id) AS job_count
FROM    
    skills_dim
INNER JOIN 
    skills_job_dim 
    ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN
    job_postings_fact 
    ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE
    job_postings_fact.job_location = 'Anywhere'
    AND 
    job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skill_id
    ORDER BY
    job_count DESC
LIMIT 5; 


-- CTE Method

WITH    
    job_new_count AS (
        SELECT
            job_id
        FROM
            job_postings_fact
        WHERE
            job_country = 'Ukraine'
        AND
            job_title_short = 'Data Analyst'
    )

SELECT
    skills_dim.skill_id,
    skills,
    COUNT(skills_job_dim.job_id) AS skill_count
FROM    
    skills_dim
INNER JOIN 
    skills_job_dim 
    ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN
    job_new_count 
    ON skills_job_dim.job_id = job_new_count.job_id
GROUP BY
    skills_dim.skill_id
    ORDER BY
    skill_count DESC
LIMIT 5; 





SELECT 
    job_title_short,
    job_location,
    company_dim.name,
    salary_hour_avg
FROM
    job_postings_fact
LEFT JOIN
    company_dim 
ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_country = 'Ukraine'
    AND
    salary_hour_avg IS NOT NULL
AND 
    job_no_degree_mention = TRUE
ORDER BY
    salary_hour_avg 
LIMIT 100;




SELECT
    job_title_short,
    company_id,
    job_location
FROM    
    january_jobs

    UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

    UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs




SELECT
    january_jobs.job_id,
    skills_dim.skills,
    skills_dim.type
FROM    
    january_jobs
LEFT JOIN 
    skills_job_dim ON january_jobs.job_id = skills_job_dim.job_id
LEFT JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    salary_year_avg > 70000

    UNION ALL


SELECT
    february_jobs.job_id,
    skills_dim.skills,
    skills_dim.type
FROM    
    february_jobs
LEFT JOIN 
    skills_job_dim ON february_jobs.job_id = skills_job_dim.job_id
LEFT JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    salary_year_avg > 70000

    UNION ALL


SELECT
    march_jobs.job_id,
    skills_dim.skills,
    skills_dim.type
FROM    
    march_jobs
LEFT JOIN 
    skills_job_dim ON march_jobs.job_id = skills_job_dim.job_id
LEFT JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    salary_year_avg > 70000


-- chat VERSION

WITH all_jobs AS (
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM february_jobs
    UNION ALL
    SELECT * FROM march_jobs
)

SELECT
    all_jobs.job_id,
    skills_dim.skills,
    skills_dim.type
FROM all_jobs
LEFT JOIN skills_job_dim 
    ON all_jobs.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE all_jobs.salary_year_avg > 70000;



SELECT  
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings
WHERE quarter1_job_postings.salary_year_avg > 70000
AND quarter1_job_postings.job_title_short = 'Data Analyst'
ORDER BY
    quarter1_job_postings.salary_year_avg DESC





