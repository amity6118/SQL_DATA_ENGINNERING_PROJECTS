select job_id,
       job_title_short,
       job_location
from job_postings_fact
where job_country in (
    select job_country
    from job_postings_fact
    group by job_country
    having count(job_id)>(
            select avg(job_count)as global_avg_count
            from (
                select count(job_country)as job_count,job_country
                from job_postings_fact
                group by job_country
            )
        )

    )      
order by job_country, job_id

 ;