/*
Question: What are the most in-demand skills for data analysts in Spain?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst(in Spain).
- Focus on all job postings(in Spain).
- Why? Retrieves the top 5 skills with the highest demand in the Spanish job market, 
    providing insights into the most valuable skills for job seekers.
*/



SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND
    job_country = 'Spain'
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 5;  


/*


Here's the breakdown of the most in-demand skills for data analysts in Spain in 2023:
Clear Leader: SQL dominates with a significantly higher demand (2,595), making it the core skill for data analysts in Spain.
Strong Programming Demand: Python ranks second with 1,801 postings, highlighting the growing need for analytical and automation capabilities.
Business Fundamentals Still Matter: Excel remains highly востребован with 1,393 mentions, showing its continued importance in day-to-day analysis.
High Demand for BI Tools: Power BI (1,379) and Tableau (1,126) are both heavily requested, emphasizing the importance of data visualization and reporting skills.
Balanced Skill Set Required: The mix of database querying, programming, spreadsheet tools, and BI platforms indicates that top candidates are expected to combine technical and business-oriented skills.



===== RESULTS =====


[
  {
    "skills": "sql",
    "demand_count": "2595"
  },
  {
    "skills": "python",
    "demand_count": "1801"
  },
  {
    "skills": "excel",
    "demand_count": "1393"
  },
  {
    "skills": "power bi",
    "demand_count": "1379"
  },
  {
    "skills": "tableau",
    "demand_count": "1126"
  }

  */