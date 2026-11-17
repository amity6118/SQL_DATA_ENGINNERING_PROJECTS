use company_jobs;

-- to find the schemas in "company_jobs" database
select * 
from information_schema.schemata
where catalog_name ='company_jobs'
;

-- to create the new table and get data from different table from different database
create or replace table uk_jobs_archive as
select jpf.*
from data_jobs.job_postings_fact as jpf
where jpf.job_country = 'United Kingdom'
;

select *
from uk_jobs_archive;

