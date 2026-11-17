use company_jobs;

alter table dev.applications_fact
alter column follow_up_timestamp TYPE DATE;

select *
from dev.applications_fact;

describe dev.applications_fact;
