select *
from work_mode_mart.remote_jobs as rj 
intersect
select * 
from work_mode_mart.not_remote_jobs as nrj 
order by job_location, company_id, job_title
;

select *
from work_mode_mart.remote_jobs as rj 
intersect all
select * 
from work_mode_mart.not_remote_jobs as nrj 
order by job_location, company_id, job_title
;

select *
from work_mode_mart.remote_jobs as rj 
except all
select * 
from work_mode_mart.not_remote_jobs as nrj 
order by job_location, company_id, job_title
;