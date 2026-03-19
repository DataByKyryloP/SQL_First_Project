/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill in Spain)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles in Spain
- Concentrates on positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis in Spain
*/



-- Identifies skills in high demand for Data Analyst roles in Spain

-- Use Query #3

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_country = 'Spain'   
    GROUP BY
        skills_dim.skill_id
), 
-- Skills with high average salaries for Data Analyst roles in Spain
-- Use Query #4
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_country = 'Spain' 
    GROUP BY
        skills_job_dim.skill_id
)
-- Return high demand and high salaries skills that are in demand by at least 2 job postings
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE  
    demand_count > 1
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 20;



-- rewriting this same query more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 1
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 20;


/*
/*
Here's the breakdown of the most optimal skills for Data Analysts in Spain in 2023:
High Salary Niche Skills: Numpy ($111,175), Pandas ($106,463), Jupyter ($104,892), and Databricks ($104,838) top the list, showing that advanced analytical and data engineering skills are highly rewarded.
Core Programming & SQL: Python ($95,615) and SQL ($88,916) are both widely demanded, indicating that strong programming and database querying skills are essential for job security even if the salary premium is moderate.
BI & Cloud Tools: Tableau ($90,250), Snowflake ($92,233), Azure ($91,925), Looker ($97,556), and Qlik ($100,190) highlight that skills in visualization, business intelligence, and cloud data platforms offer a combination of demand and competitive salaries in Spain.



==== RESULTS =====


[
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "2",
    "avg_salary": "111175"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "4",
    "avg_salary": "106463"
  },
  {
    "skill_id": 102,
    "skills": "jupyter",
    "demand_count": "3",
    "avg_salary": "104892"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "2",
    "avg_salary": "104838"
  },
  {
    "skill_id": 190,
    "skills": "spreadsheet",
    "demand_count": "2",
    "avg_salary": "101750"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "2",
    "avg_salary": "100190"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "2",
    "avg_salary": "100138"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "4",
    "avg_salary": "97556"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "3",
    "avg_salary": "96842"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "3",
    "avg_salary": "96842"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "2",
    "avg_salary": "95770"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "15",
    "avg_salary": "95615"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "3",
    "avg_salary": "92233"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "2",
    "avg_salary": "91925"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "9",
    "avg_salary": "90250"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "demand_count": "2",
    "avg_salary": "89100"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "17",
    "avg_salary": "88916"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "3",
    "avg_salary": "80525"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "5",
    "avg_salary": "79515"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "4",
    "avg_salary": "78845"
  }
]