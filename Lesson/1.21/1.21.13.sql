use company_jobs;

select *
from dev.internal_applications_fact;

drop table if exists dev.internal_applications_fact;

select *
from information_schema.tables
where table_catalog ='company_jobs' 
;