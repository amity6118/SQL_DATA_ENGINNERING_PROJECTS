select 
    job_posted_date at time zone 'UTC' at time zone 'IST'
from 
    job_postings_fact
limit 10;    