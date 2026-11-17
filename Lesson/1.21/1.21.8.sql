use company_jobs;

alter table dev.applications_fact
rename column follow_up_timestamp  to follow_up_date;

select *
from dev.applications_fact;