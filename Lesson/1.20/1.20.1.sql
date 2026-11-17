select 
    cast(job_posted_date as date) as dt ,
    count(job_id)as job_postings
from 
    job_postings_fact
where 
    cast(job_posted_date as date)='2024-12-31'
group by 
    dt
;                