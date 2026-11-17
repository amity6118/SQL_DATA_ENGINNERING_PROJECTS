use job_mart;

 create or replace table main.priority_jobs_snapshot (
    job_id                  integer primary key,
    job_title_short         varchar,
    company_name            varchar,
    job_posted_date         timestamp,
    salary_year_avg         double,
    priority_lvl            integer,
    updated_at              timestamp
);

insert into main.priority_jobs_snapshot(
    job_id,                
    job_title_short,
    company_name,
    job_posted_date,
    salary_year_avg,
    priority_lvl,
    updated_at
)

select
    jpf.job_id,
    jpf.job_title_short,
    cd.name as company_name,
    jpf.job_posted_date,
    jpf.salary_year_avg,
    r.priority_lvl,
    current_timestamp as updated_at
from 
    data_jobs.job_postings_fact as jpf -- did not use .main after data_jobs bcz it's main 
    left join data_jobs.company_dim as cd 
    on jpf.company_id = cd.company_id
    inner join staging.priority_roles as r 
    on jpf.job_title_short = r.role_name 
;

select  
    job_title_short,
    count(*)as job_count,
    min(Priority_lvl)as priority_lvl,
    min(updated_at)as updated_at
from 
    priority_jobs_snapshot
group by 
    job_title_short
order by 
    job_count desc        
;        

update staging.priority_roles 
set role_name = 'Software Engineer',
    priority_lvl = 3
where role_name='software engineer' and
      priority_lvl = 1
;

select *
from staging.priority_roles;

--to update new entries into the staging.priority_roles

insert into staging.priority_roles(
    role_id,
    role_name,
    Priority_lvl
)
values
    (4, 'Data Scientist', 2)
;

Delete from staging.priority_roles
where role_name = 'Data Scientist';

select *
from staging.priority_roles;

select  
    job_title_short,
    count(*)as job_count,
    min(Priority_lvl)as priority_lvl,
    min(updated_at)as updated_at
from 
    priority_jobs_snapshot
group by 
    job_title_short
order by 
    job_count desc        
; 