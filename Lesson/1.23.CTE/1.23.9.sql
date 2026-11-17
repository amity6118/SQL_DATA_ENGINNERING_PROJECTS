describe job_postings_fact;
describe skills_job_dim;

select sd.skills
from data_jobs.skills_dim as sd 
where not exists(
    select 1
    from skills_job_dim as sjd 
      join job_postings_fact as jpf 
      on sjd.job_id = jpf.job_id
    where jpf.job_title_short ='Senior Data Engineer' and
          sjd.skill_id =  sd.skill_id  
)
;

select *
from information_schema.schemata
;

describe information_schema.schemata;

select *
from information_schema.tables
where table_name = 'priority_roles'
;

describe information_schema.tables;

select *
from job_mart.staging.priority_roles;