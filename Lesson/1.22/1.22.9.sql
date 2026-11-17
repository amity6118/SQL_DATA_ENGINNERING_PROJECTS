use company_jobs;

create table  jan_2023_cleanup_copy  as
select *
from data_jobs.job_postings_fact;

select count(*) 
from jan_2023_cleanup_copy;

delete from jan_2023_cleanup_copy
where job_posted_date <'2023-01-01'
;

select count(*) 
from jan_2023_cleanup_copy;



