use company_jobs;

-- describe company_jobs;

create schema if not exists work_mode_mart;

create table if not exists work_mode_mart.remote_jobs as

select 
    j.job_title,
    j.company_id,
    j.job_location
from
    data_jobs.job_postings_fact as j 
where   
    j.job_work_from_home =TRUE and
    j.job_location = 'Anywhere'

;

SELECT COUNT(*) AS remote_rows
FROM work_mode_mart.remote_jobs;