select *
from work_mode_mart.remote_jobs as rj 
union 
select *
from work_mode_mart.not_remote_jobs as nrj 
ORDER BY job_location, company_id, job_title    
;
