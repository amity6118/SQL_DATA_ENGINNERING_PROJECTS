use company_jobs;

select *
from dev.applications_fact;

alter table dev.applications_fact
add column follow_up_timestamp TIMESTAMPTZ;

DESCRIBE dev.applications_fact;