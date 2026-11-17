create schema if not exists work_mode_mart;

create table if not exists work_mode_mart.not_remote_jobs as
select 
    j.job_title,
    j.company_id,
    j.job_location
from
    data_jobs.job_postings_fact as j 
where 
    j.job_work_from_home != TRUE or
    j.job_work_from_home is null
;

select count(*)as record_count
from work_mode_mart.not_remote_jobs;