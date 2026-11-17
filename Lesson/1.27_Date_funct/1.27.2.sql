select
    job_id,
    job_title_short,
    job_location,
    job_posted_date at time zone 'UTC' at time zone 'IST' as job_posted_date_utc
from 
    job_postings_fact
where
    job_country = 'United States'
;        
