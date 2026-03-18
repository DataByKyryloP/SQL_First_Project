

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

SELECT *
FROM job_applied;

ALTER TABLE job_applied
DROP COLUMN contact_name, 
DROP COLUMN id;