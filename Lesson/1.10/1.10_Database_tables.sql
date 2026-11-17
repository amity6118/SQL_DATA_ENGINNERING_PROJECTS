select 
    job_id,
    job_title_short,
    salary_hour_avg

from
    job_postings_fact

limit 
    10

;  

select *
from information_schema.tables
where table_catalog ='data_jobs'
;
