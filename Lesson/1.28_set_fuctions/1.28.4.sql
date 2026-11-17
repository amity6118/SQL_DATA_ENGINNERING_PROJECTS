use company_jobs;

select *
from work_mode_mart.remote_jobs as rj 
union all 
select * 
from work_mode_mart.not_remote_jobs as nrj 
order by job_location, company_id, job_title
;