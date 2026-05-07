/*
Answer: What are the top skills based on salary in Spain?
- Look at the average salary associated with each skill for Data Analyst positions in Spain
- Focuses on roles with specified salaries, regardless of short job title
- Why? It reveals how different skills impact salary levels for Data Analysts in Spain and 
    helps identify the most financially rewarding skills to acquire or improve if you want to become a data analyst in Spain. 
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    job_country = 'Spain'
    AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;



/*

Here's the breakdown of the top-paying skills for data analysts in Spain in 2023:
Niche Tools Lead Salaries: Smartsheet ($155,000) and SAP ($118,640) top the list, suggesting that specialized or enterprise tools can command premium salaries.
Engineering & Hybrid Skills Pay More: Skills like React, Angular, Node.js, and npm appear among high-paying roles, indicating that analysts with engineering or full-stack exposure earn more.
Python Ecosystem Still Valuable: Libraries such as NumPy, Matplotlib, and Scikit-learn are tied to higher salaries, reinforcing the value of advanced analytical capabilities.
Core Tools vs Salary Gap: Widely used tools like Python ($95,615) and Tableau ($90,250) rank lower in salary, likely due to higher supply of candidates with these skills.
Cloud & Data Platforms Matter: Tools like Databricks, Snowflake, and Azure show solid salary levels, highlighting the growing importance of working with modern data infrastructure.


==== RESULTS =====


[
  {
    "skills": "smartsheet",
    "avg_salary": "155000"
  },
  {
    "skills": "sap",
    "avg_salary": "118640"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "111175"
  },
  {
    "skills": "npm",
    "avg_salary": "111175"
  },
  {
    "skills": "angular",
    "avg_salary": "111175"
  },
  {
    "skills": "react",
    "avg_salary": "111175"
  },
  {
    "skills": "matplotlib",
    "avg_salary": "111175"
  },
  {
    "skills": "numpy",
    "avg_salary": "111175"
  },
  {
    "skills": "node.js",
    "avg_salary": "111175"
  },
  {
    "skills": "pandas",
    "avg_salary": "106463"
  },
  {
    "skills": "jupyter",
    "avg_salary": "104892"
  },
  {
    "skills": "databricks",
    "avg_salary": "104838"
  },
  {
    "skills": "spreadsheet",
    "avg_salary": "101750"
  },
  {
    "skills": "mysql",
    "avg_salary": "100500"
  },
  {
    "skills": "qlik",
    "avg_salary": "100190"
  },
  {
    "skills": "go",
    "avg_salary": "100138"
  },
  {
    "skills": "looker",
    "avg_salary": "97556"
  },
  {
    "skills": "airflow",
    "avg_salary": "96842"
  },
  {
    "skills": "r",
    "avg_salary": "96842"
  },
  {
    "skills": "flow",
    "avg_salary": "95770"
  },
  {
    "skills": "python",
    "avg_salary": "95615"
  },
  {
    "skills": "snowflake",
    "avg_salary": "92233"
  },
  {
    "skills": "azure",
    "avg_salary": "91925"
  },
  {
    "skills": "tableau",
    "avg_salary": "90250"
  },
  {
    "skills": "git",
    "avg_salary": "89100"
  }
]


*/


