use company_jobs;


--to check all the tables in the data_jobs database
select *
from information_schema.tables
where table_catalog = 'data_jobs'
;

--to check all the columns in skills_dim table
select * 
from data_jobs.skills_dim;

--to create new table in "company_jobs" database from "data_jobs" database
create view cloud_engineering_roles_view as
select 
       jpf.job_title, 
       cd.name as company_name,  
       sd.skills as skill_name
from data_jobs.job_postings_fact as jpf 
    inner join data_jobs.company_dim as cd 
    on jpf.company_id = cd.company_id
    inner join data_jobs.skills_job_dim as sjd 
    on jpf.job_id =sjd.job_id
    inner join data_jobs.skills_dim as sd
    on sjd.skill_id =sd.skill_id
where sd.skills in ('aws', 'gcp') and jpf.job_title_short ='Data Engineer'
;           


select *
from cloud_engineering_roles_view;