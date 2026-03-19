/*
Question: What skills are required for the top-paying data analyst jobs in Spain?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand(such as me) which skills to develop that align with top salaries in my preferred country(Spain)
*/



WITH top_paying_jobs AS (

SELECT 
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst'
    AND job_country = 'Spain'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
)

SELECT 
    top_paying_jobs.*, 
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;




/*
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7.
Tableau is also highly sought after, with a bold count of 6.
Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.



[
  {
    "job_id": 495042,
    "job_title": "Fleet Monitoring Analytics Engineer",
    "salary_year_avg": "155000.0",
    "company_name": "Capgemini",
    "skills": "python"
  },
  {
    "job_id": 495042,
    "job_title": "Fleet Monitoring Analytics Engineer",
    "salary_year_avg": "155000.0",
    "company_name": "Capgemini",
    "skills": "smartsheet"
  },
  {
    "job_id": 1786626,
    "job_title": "Senior Global People Data Analyst",
    "salary_year_avg": "118640.0",
    "company_name": "Allianz",
    "skills": "sap"
  },
  {
    "job_id": 1786626,
    "job_title": "Senior Global People Data Analyst",
    "salary_year_avg": "118640.0",
    "company_name": "Allianz",
    "skills": "flow"
  },
  {
    "job_id": 1284234,
    "job_title": "Confirmed Product Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "PayFit",
    "skills": "sql"
  },
  {
    "job_id": 1284234,
    "job_title": "Confirmed Product Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "PayFit",
    "skills": "python"
  },
  {
    "job_id": 1284234,
    "job_title": "Confirmed Product Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "PayFit",
    "skills": "go"
  },
  {
    "job_id": 1284234,
    "job_title": "Confirmed Product Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "PayFit",
    "skills": "looker"
  },
  {
    "job_id": 1019193,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Publicis Groupe",
    "skills": "sql"
  },
  {
    "job_id": 1019193,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Publicis Groupe",
    "skills": "excel"
  },
  {
    "job_id": 1019193,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Publicis Groupe",
    "skills": "tableau"
  },
  {
    "job_id": 848502,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Netcentric",
    "skills": "sql"
  },
  {
    "job_id": 848502,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Netcentric",
    "skills": "react"
  },
  {
    "job_id": 848502,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Netcentric",
    "skills": "angular"
  },
  {
    "job_id": 848502,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Netcentric",
    "skills": "node.js"
  },
  {
    "job_id": 848502,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Netcentric",
    "skills": "looker"
  },
  {
    "job_id": 848502,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Netcentric",
    "skills": "qlik"
  },
  {
    "job_id": 848502,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Netcentric",
    "skills": "npm"
  },
  {
    "job_id": 1629093,
    "job_title": "Data Analyst (Reporting and Insights)",
    "salary_year_avg": "111175.0",
    "company_name": "Netcentric",
    "skills": "power bi"
  },
  {
    "job_id": 1629093,
    "job_title": "Data Analyst (Reporting and Insights)",
    "salary_year_avg": "111175.0",
    "company_name": "Netcentric",
    "skills": "looker"
  },
  {
    "job_id": 1637806,
    "job_title": "Data Analyst Coches.net",
    "salary_year_avg": "111175.0",
    "company_name": "Adevinta",
    "skills": "sql"
  },
  {
    "job_id": 1637806,
    "job_title": "Data Analyst Coches.net",
    "salary_year_avg": "111175.0",
    "company_name": "Adevinta",
    "skills": "python"
  },
  {
    "job_id": 1637806,
    "job_title": "Data Analyst Coches.net",
    "salary_year_avg": "111175.0",
    "company_name": "Adevinta",
    "skills": "r"
  },
  {
    "job_id": 1637806,
    "job_title": "Data Analyst Coches.net",
    "salary_year_avg": "111175.0",
    "company_name": "Adevinta",
    "skills": "databricks"
  },
  {
    "job_id": 1637806,
    "job_title": "Data Analyst Coches.net",
    "salary_year_avg": "111175.0",
    "company_name": "Adevinta",
    "skills": "pandas"
  },
  {
    "job_id": 1637806,
    "job_title": "Data Analyst Coches.net",
    "salary_year_avg": "111175.0",
    "company_name": "Adevinta",
    "skills": "numpy"
  },
  {
    "job_id": 1637806,
    "job_title": "Data Analyst Coches.net",
    "salary_year_avg": "111175.0",
    "company_name": "Adevinta",
    "skills": "airflow"
  },
  {
    "job_id": 1637806,
    "job_title": "Data Analyst Coches.net",
    "salary_year_avg": "111175.0",
    "company_name": "Adevinta",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1637806,
    "job_title": "Data Analyst Coches.net",
    "salary_year_avg": "111175.0",
    "company_name": "Adevinta",
    "skills": "matplotlib"
  },
  {
    "job_id": 1637806,
    "job_title": "Data Analyst Coches.net",
    "salary_year_avg": "111175.0",
    "company_name": "Adevinta",
    "skills": "tableau"
  },
  {
    "job_id": 1637806,
    "job_title": "Data Analyst Coches.net",
    "salary_year_avg": "111175.0",
    "company_name": "Adevinta",
    "skills": "word"
  },
  {
    "job_id": 1010017,
    "job_title": "Data Analyst (Procurement)",
    "salary_year_avg": "111175.0",
    "company_name": "Octopus Energy",
    "skills": "sql"
  },
  {
    "job_id": 1010017,
    "job_title": "Data Analyst (Procurement)",
    "salary_year_avg": "111175.0",
    "company_name": "Octopus Energy",
    "skills": "python"
  },
  {
    "job_id": 1010017,
    "job_title": "Data Analyst (Procurement)",
    "salary_year_avg": "111175.0",
    "company_name": "Octopus Energy",
    "skills": "pandas"
  },
  {
    "job_id": 1010017,
    "job_title": "Data Analyst (Procurement)",
    "salary_year_avg": "111175.0",
    "company_name": "Octopus Energy",
    "skills": "numpy"
  },
  {
    "job_id": 1010017,
    "job_title": "Data Analyst (Procurement)",
    "salary_year_avg": "111175.0",
    "company_name": "Octopus Energy",
    "skills": "jupyter"
  },
  {
    "job_id": 52721,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "Octopus Energy",
    "skills": "python"
  },
  {
    "job_id": 52721,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "Octopus Energy",
    "skills": "pandas"
  },
  {
    "job_id": 52721,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "Octopus Energy",
    "skills": "jupyter"
  },
  {
    "job_id": 52721,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "Octopus Energy",
    "skills": "spreadsheet"
  }
]

*/

