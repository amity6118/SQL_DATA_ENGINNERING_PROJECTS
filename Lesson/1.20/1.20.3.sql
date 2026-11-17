select
    job_title_short,
    avg(salary_hour_avg*40*52)::decimal(10,2) as salary_hour_annual,
    avg(salary_hour_avg*40*52)::decimal(10,0) as salary_hour_annual_zero_decimals
from 
    job_postings_fact
where 
    job_country = 'United States' and 
    salary_hour_avg is not null
group by
    job_title_short    
order by 
    salary_hour_annual desc;   



