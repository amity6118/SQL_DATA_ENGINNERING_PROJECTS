use company_jobs;

update main.job_skill_priorities
set status ='URGENT'
where status = 'ACTIVE'
;

select *
from job_skill_priorities;
