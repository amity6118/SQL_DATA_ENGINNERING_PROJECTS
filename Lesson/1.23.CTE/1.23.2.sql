with invalid_salaries as(
    select job_id,
           job_title_short,
           job_location
    from job_postings_fact
    where salary_year_avg is null and 
          salary_hour_avg is null          
)

select *
from invalid_salaries
;