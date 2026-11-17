select
    count(job_id)as job_posts,
    extract(year from job_posted_date)as job_posted_year,
    extract(quarter from job_posted_date)as job_posted_quarter,
    concat(extract(year from job_posted_date),'-',
            extract(quarter from job_posted_date)) as job_posted_year_quarter
from
    job_postings_fact
where   
    extract(year from job_posted_date) between 2023 and 2024
group by    
    extract(year from job_posted_date),
    extract(quarter from job_posted_date),
    concat(extract(year from job_posted_date),'-',
            extract(quarter from job_posted_date))
order by 
    job_posted_quarter;