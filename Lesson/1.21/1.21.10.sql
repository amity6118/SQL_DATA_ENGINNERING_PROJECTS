use company_jobs;



update dev.applications_fact
set internal_candidate ='true'
where application_id =1;

update dev.applications_fact
set internal_candidate ='true'
where application_id = 3;

select *
from dev.applications_fact;