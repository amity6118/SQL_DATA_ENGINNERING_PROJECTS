use job_mart;

create or replace table staging.job_postings_flats as 
select jpf.*, cd.name as company_name
from data_jobs.job_postings_fact as jpf 
left join data_jobs.company_dim as cd
    on jpf.company_id = cd.company_id
;   

select count(*)
from staging.job_postings_flats;

--to check the table columns
select * 
from staging.priority_roles;

-- to create view
create or replace view staging.priority_jobs_flat_view as
select jpf.*
from staging.job_postings_flats as jpf
join staging.priority_roles as r 
    on jpf.job_title_short = r.role_name
where r.Priority_lvl =1
    ;

select job_title_short,
    count(*) as job_count
from staging.priority_jobs_flat_view
group by job_title_short
order by job_count desc
;          

-- create temporary table
create temporary table senior_jobs_flat_temp as
select *
from staging.priority_jobs_flat_view
where job_title_short = 'Senior Data Engineer'
;

select job_title_short,
    count(*) as job_count
from senior_jobs_flat_temp
group by job_title_short
order by job_count desc
; 

-- to check the  number of data in each of these tables
select count(*) from staging.job_postings_flats;
select count(*) from staging.priority_jobs_flat_view;
select count(*) from senior_jobs_flat_temp;

delete from staging.job_postings_flats
where job_posted_date < '2024-01-01';

select count(*) from staging.job_postings_flats;
select count(*) from staging.priority_jobs_flat_view;
select count(*) from senior_jobs_flat_temp;

truncate table  staging.job_postings_flats;

insert into staging.job_postings_flats
select jpf.*, cd.name as company_name
from data_jobs.job_postings_fact as jpf 
left join data_jobs.company_dim as cd
    on jpf.company_id = cd.company_id
where job_posted_date>='2024-01-01'
; 


select count(*) from staging.job_postings_flats;
select count(*) from staging.priority_jobs_flat_view;
select count(*) from senior_jobs_flat_temp;