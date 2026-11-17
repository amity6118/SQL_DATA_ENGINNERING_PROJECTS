select
    job_id,
    job_title_short,
    job_location,
    job_posted_date,
    extract(year from job_posted_date)as job_posted_year,
    extract(month from job_posted_date)as job_posted_month,
    extract(day from job_posted_date)as job_posted_day,
    extract(quarter from job_posted_date)as job_posted_quarter
from 
    job_postings_fact
where 
    job_posted_date::DATE between '2023-01-01' and '2024-12-31'
;     
