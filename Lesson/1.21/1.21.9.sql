use company_jobs;

update dev.applications_fact
set date_applied ='2025-12-19'
where application_id =1;

update dev.applications_fact
set date_applied ='2025-12-20'
where application_id =2;

update dev.applications_fact
set date_applied ='2025-12-10'
where application_id =3;

update dev.applications_fact
set date_applied ='2025-12-08'
where application_id =4;

select *
from dev.applications_fact;