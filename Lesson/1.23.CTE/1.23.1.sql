select *
from (
    select job_id,
       job_title_short,
       salary_year_avg
    from job_postings_fact
    where job_work_from_home = 'TRUE') as new_job_postings
    
;      