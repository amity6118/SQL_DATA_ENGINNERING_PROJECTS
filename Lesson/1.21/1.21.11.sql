use company_jobs;

alter table dev.applications_fact
rename to internal_applications_fact;

select *
from information_schema.tables
where table_catalog = 'company_jobs' and
      table_schema = 'dev'  ;