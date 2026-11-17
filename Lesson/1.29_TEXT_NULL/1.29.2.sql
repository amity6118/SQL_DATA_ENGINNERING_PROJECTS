select job_id,
       trim( job_location ) as job_location_clean
from job_postings_fact
;
