select
    job_title_short,
    job_work_from_home,
    avg(salary_year_avg)::INT as annual_salary_avg,
    (avg(job_work_from_home::INT*(salary_year_avg)/2080)*260)::INT as annual_commute_cost_savings,
    (avg(salary_year_avg)+
    (avg(job_work_from_home::INT*salary_year_avg)/2080)*260)::INT as adjusted_annual_salary_avg
from 
    job_postings_fact
where 
    job_country ='United States' and
    job_title_short like '%Data%'
group by
    job_title_short, job_work_from_home
order by 
    job_title_short desc, job_work_from_home ;             