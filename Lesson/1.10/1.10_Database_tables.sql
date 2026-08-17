select 
    job_id,
    job_title,
    salary_year_avg

from
    job_postings_fact

limit 
    10

;  

select *
from information_schema.tables
where table_catalog ='data_jobs'
;
