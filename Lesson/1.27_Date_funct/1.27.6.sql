select 
    date_trunc('quarter', job_posted_date)::DATE as job_quarter,
    case 
        when date_trunc('quarter', job_posted_date)::VARCHAR like '%-01-%' then '1'
        when date_trunc('quarter', job_posted_date)::VARCHAR like '%-04-%' then '2'
        when date_trunc('quarter', job_posted_date)::VARCHAR like '%-07-%' then '3'
        else '4'
    end as formatted_quarter,
    count(job_id) as job_count
from
    job_postings_fact
where
    date_trunc('quarter', job_posted_date)  BETWEEN '2023-01-01' AND '2024-12-31' 
group by 
    date_trunc('quarter', job_posted_date) 
order by
    job_quarter ;           
