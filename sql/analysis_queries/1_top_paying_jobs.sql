/*
Question: What are the top-paying data analyst jobs in Spain?
- Identify the top 10 highest-paying Data Analyst roles that are available in Spain, since I plan to someday reloacate there :)
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into my possible future employment options.
*/



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


/*
Here's the breakdown of the top-paying data analyst jobs in Spain in 2023:
Wide Salary Range: Top 10 paying data analyst roles range from $105,000 to $155,000, indicating strong earning potential in the Spanish market.
Concentration Around Mid-High Tier: Most roles cluster around $111,175, suggesting a common salary benchmark for high-paying analyst positions.
Diverse Employers: Companies like Capgemini, Allianz, Octopus Energy, and Adevinta are among the top payers, showing demand across consulting, finance, energy, and tech sectors.
Job Title Variety: Roles range from Data Analyst to Senior and specialized positions like Analytics Engineer and Product Data Analyst, highlighting different career paths within data analytics.
Location Hubs: Major cities like Barcelona and Madrid dominate the listings, confirming them as key data job hubs in Spain.





===== RESULTS =====

[
  {
    "job_id": 495042,
    "job_title": "Fleet Monitoring Analytics Engineer",
    "job_location": "Spain",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000.0",
    "job_posted_date": "2023-12-27 22:12:13",
    "company_name": "Capgemini"
  },
  {
    "job_id": 1786626,
    "job_title": "Senior Global People Data Analyst",
    "job_location": "Spain",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118640.0",
    "job_posted_date": "2023-12-15 11:39:15",
    "company_name": "Allianz"
  },
  {
    "job_id": 1010017,
    "job_title": "Data Analyst (Procurement)",
    "job_location": "Valencia, Spain",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-06-10 04:14:08",
    "company_name": "Octopus Energy"
  },
  {
    "job_id": 1637806,
    "job_title": "Data Analyst Coches.net",
    "job_location": "Barcelona, Spain",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-04-18 13:38:59",
    "company_name": "Adevinta"
  },
  {
    "job_id": 1284234,
    "job_title": "Confirmed Product Data Analyst",
    "job_location": "Barcelona, Spain",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-07-26 18:45:51",
    "company_name": "PayFit"
  },
  {
    "job_id": 531828,
    "job_title": "Data Analyst",
    "job_location": "Madrid, Spain",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-26 14:10:31",
    "company_name": "Publicis Groupe"
  },
  {
    "job_id": 848502,
    "job_title": "Data Analyst",
    "job_location": "Barcelona, Spain",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-03 12:44:52",
    "company_name": "Netcentric"
  },
  {
    "job_id": 1629093,
    "job_title": "Data Analyst (Reporting and Insights)",
    "job_location": "Barcelona, Spain",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-14 00:38:10",
    "company_name": "Netcentric"
  },
  {
    "job_id": 1019193,
    "job_title": "Data Analyst",
    "job_location": "Madrid, Spain",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-04-28 09:17:04",
    "company_name": "Publicis Groupe"
  },
  {
    "job_id": 52721,
    "job_title": "Data Analyst",
    "job_location": "Spain",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-07-07 21:25:47",
    "company_name": "Octopus Energy"
  }
]

*/
