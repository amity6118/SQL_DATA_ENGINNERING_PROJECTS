select
    date_trunc('quarter', job_posted_date)::DATE as job_quarter,
    count(job_id) as job_count
from 
    job_postings_fact
where 
    date_trunc('year', job_posted_date)::DATE between '2023-01-01' AND '2024-12-31'
group by 
    date_trunc('quarter', job_posted_date)
order by 
    job_quarter ;