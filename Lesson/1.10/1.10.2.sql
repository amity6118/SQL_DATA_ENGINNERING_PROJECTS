select 
    job_id,
    company_id,
    cast(job_work_from_home as int) as job_work_from_home,
    cast(job_posted_date as date) as job_posted_date,
    cast(salary_year_avg as decimal(10,0)) as salary_year_avg
from 
    job_postings_fact
limit 5;        