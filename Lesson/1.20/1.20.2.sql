select 
    job_title_short,
    job_no_degree_mention::INT as job_no_degree_mention,
    count(job_id) as job_postings
from 
    job_postings_fact
where 
    job_posted_date::DATE > '2024-12-01' and
    job_posted_date::DATE < '2024-12-31' 
group by
    job_title_short, job_no_degree_mention
order by
    job_title_short, job_no_degree_mention
;                   

