use company_jobs;

create table job_postings_fact_year_salary as 
select jpf.job_id,
       jpf.job_title_short,
       jpf.job_posted_date,
       jpf.job_location,
       jpf.salary_year_avg 
from data_jobs.job_postings_fact as jpf
where jpf.salary_year_avg is not null
;

select * 
from job_postings_fact_year_salary;

delete from job_postings_fact_year_salary
where job_location is null
;

select * 
from job_postings_fact_year_salary;
