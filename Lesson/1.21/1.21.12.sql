use company_jobs;

select * 
from dev.internal_applications_fact;

alter table dev.internal_applications_fact
drop  column  internal_candidate;

DESCRIBE dev.internal_applications_fact;