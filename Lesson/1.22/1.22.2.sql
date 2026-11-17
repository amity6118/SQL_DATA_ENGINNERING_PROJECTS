use company_jobs;

-- create a table 
create table if not exists company_salary_stats as
select jpf.company_id,avg(jpf.salary_year_avg)as avg_yearly_salary,
       count(jpf.job_id)as job_count 
from data_jobs.job_postings_fact as jpf
where jpf.salary_year_avg is not null
group by jpf.company_id
;

SELECT *
FROM company_salary_stats;