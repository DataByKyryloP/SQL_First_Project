
# Introduction

📊 Dive into the **Spanish data job market in 2023**! Focusing on data analyst roles in Spain, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics across Spain.

🔍 SQL queries? Check them out here: **👉 [`analysis_queries`](./sql/analysis_queries/)*

---

# Background

Driven by a quest to navigate the **Spanish data analyst job market** more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills in Spain, streamlining others' work to find optimal jobs.

Data hails from Luke Barousse's Course: **[SQL Course](https://www.lukebarousse.com/sql)**.
It's packed with insights on job titles, salaries, locations, and essential skills relevant to the Spanish market and the data jobs market as a whole.

---

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs in Spain in 2023?
2. What skills are required for these top-paying jobs in Spain?
3. What skills are most in demand for data analysts in Spain?
4. Which skills are associated with higher salaries in Spain?
5. What are the most optimal skills to learn in the Spanish data job market?

---

# Tools I Used

For my deep dive into the Spanish data analyst job market, I harnessed the power of several key tools:

* **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
* **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
* **Visual Studio Code:** My go-to for database management and executing SQL queries.
* **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis.

---

## Project Structure

```
sql/
│
├── database_setup/        # Database creation & schema setup
├── analysis_queries/      # Main analytical SQL queries
├── practice_queries/      # Learning & practice queries
│
visuals/                    # Visualizations and charts
```

---

# The Analysis

Each query for this project aimed at investigating specific aspects of the **Spanish data analyst job market in 2023**.

---

### 1. Top Paying Data Analyst Jobs in Spain

```sql
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst'
    AND job_country = 'Spain'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

Here's the breakdown of the top data analyst jobs in Spain in 2023:

* **Salary Range:** Salaries vary depending on company, city, and experience level within Spain.
* **Key Locations:** High-paying roles are often concentrated in major cities like Madrid and Barcelona.
* **Role Diversity:** Positions range from Data Analyst to more senior analytical roles.

 **TOP PAYING DATA ANALYST JOBS IN SPAIN:**
| Job Title                           | Company         | Location  | Salary ($) |
| ----------------------------------- | --------------- | --------- | ---------: |
| Fleet Monitoring Analytics Engineer | Capgemini       | Spain     |    155,000 |
| Senior Global People Data Analyst   | Allianz         | Spain     |    118,640 |
| Data Analyst (Procurement)          | Octopus Energy  | Valencia  |    111,175 |
| Data Analyst Coches.net             | Adevinta        | Barcelona |    111,175 |
| Product Data Analyst                | PayFit          | Barcelona |    111,175 |
| Data Analyst                        | Publicis Groupe | Madrid    |    111,175 |
| Data Analyst                        | Netcentric      | Barcelona |    111,175 |
| Data Analyst (Reporting & Insights) | Netcentric      | Barcelona |    111,175 |
| Data Analyst                        | Publicis Groupe | Madrid    |    111,175 |
| Data Analyst                        | Octopus Energy  | Spain     |    105,000 |

---


![Top 10 highest-paying data analyst jobs in Spain, ranked by salary from highest to lowest. Capgemini leads at $155,000, followed by Allianz at $118,640. Octopus Energy, Adevinta, PayFit, Publicis Groupe, and Netcentric cluster around $111,175. The bar chart displays companies on the y-axis and salary in dollars on the x-axis, ranging from 0 to $160,000. The visualization emphasizes Capgemini and Allianz as top employers with significantly higher compensation for data analyst roles in Spain.](visuals/top-10-paying-data-jobs-spain.png)

***Bar chart visualizing the salary distribution of the top 10 highest-paying data analyst roles in Spain.***


### 2. Skills for Top Paying Jobs in Spain

```sql
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
```

Here's the breakdown of the most demanded skills for the top-paying data analyst jobs in Spain:

* SQL, Python, and data visualization tools are commonly required.
* Employers value both analytical and technical skills.


![Bar chart displaying the frequency of skills required across the top 10 highest-paying data analyst jobs in Spain. SQL appears most frequently, followed by Python, Tableau, Power BI, and Excel. The horizontal bars are color-coded, with skill names on the y-axis and frequency count on the x-axis ranging from 0 to 10. The chart emphasizes that SQL and Python are essential technical competencies for premium-paying analyst positions in the Spanish job market.](visuals/top-skills-high-paying-jobs-spain.png)



***Bar chart showing the frequency of skills required across the top 10 highest-paying data analyst jobs in Spain.***


### 3. In-Demand Skills for Data Analysts in Spain

```sql
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
```

Here's the breakdown of the most demanded skills for data analysts in Spain in 2023:

* Core tools like SQL and Excel remain essential.
* Visualization tools and programming languages are increasingly important.

![Bar chart displaying the top 5 most in-demand skills for data analysts in Spain. SQL leads with the highest demand count, followed by Python, Excel, Power BI, and Tableau. The horizontal bars are color-coded, with skill names on the y-axis and demand frequency count on the x-axis. The chart emphasizes that SQL and Python are foundational technical competencies essential for data analyst positions in the Spanish job market, while visualization and spreadsheet tools remain critical for day-to-day work.](visuals/top-5-in-demand-skills-spain.png)


***Bar chart highlighting the top 5 most in-demand skills for data analysts in Spain.***


### 4. Skills Based on Salary in Spain

```sql
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
```

Here's a breakdown of the results for top paying skills in Spain:

* Advanced and specialized tools tend to command higher salaries.
* Technical depth increases earning potential.


![Top Paying Skills in Spain bar chart showing average salary by skill. Smartsheet leads at approximately $160,000, followed by SAP at $120,000. Scikit, React, Angular, Node, NumPy, Matplotlib, and Pandas cluster between $105,000-$110,000. Jupyter ranks lowest at approximately $100,000. The horizontal axis displays average salary in dollars from 0 to $160,000. The chart uses blue bars to represent each skill's compensation level, emphasizing that Smartsheet and SAP command significantly higher salaries compared to other programming and data analysis tools in the Spanish job market](visuals/top-paying-skills-spain.png)



***Bar chart visualizing the highest-paying skills for data analysts in Spain.***


### 5. Most Optimal Skills to Learn in Spain

```sql
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
```

Here's a breakdown of the most optimal skills for data analysts in Spain:

* A combination of high demand and strong salaries defines the best skills to learn.


![Scatter plot titled Optimal Skills (Demand vs Salary) - Spain with Demand Count on the x-axis ranging from 2 to 17 and Average Salary in dollars on the y-axis ranging from 89000 to 111000. Nine skills are plotted as blue dots: NumPy at approximately (2, 112000), Pandas at (4, 107000), Data Wrangler at (2, 105000), Looker at (4, 98000), Python at (15, 96000), Tableau at (9, 91000), and SQL at (17, 89000). The scatter plot reveals that skills in the upper left quadrant, such as NumPy and Pandas, offer optimal balance with high salaries despite lower demand, while skills like SQL show high demand but lower average salary. This visualization helps identify which skills to prioritize learning for maximum career benefit in the Spanish data analyst job market.](visuals/optimal-data-skills-spain.png)


***Scatter plot visualizing the relationship between skill demand and average salary in Spain. Each point represents a skill, helping identify the most optimal skills to learn***

---

# What I Learned

Throughout this project, I strengthened my SQL and analytical skills while gaining insights into the **Spanish data job market in 2023**.

---

# Conclusions

### Key Insights

- High-paying roles are concentrated in major cities like Madrid and Barcelona

- SQL remains the most essential skill

- Python and BI tools are critical for career growth

- Specialized tools lead to higher salaries

- The best skills balance demand and compensation
---

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the **Spanish data analyst job market in 2023**. The findings can help guide skill development and job search strategies within Spain.
