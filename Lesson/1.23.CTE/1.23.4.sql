use company_jobs;


with company_averages as(
    select jpf.company_id,
       avg(jpf.salary_year_avg) as avg_company_salary 
    from data_jobs.job_postings_fact as jpf 
    group by jpf.company_id)

select j.job_id,
       j.job_title_short,
       c.company_id,
       j.salary_year_avg,
       c.avg_company_salary
from company_averages as c 
    inner join data_jobs.job_postings_fact as j 
    on c.company_id = j.company_id
where  j.salary_year_avg > c.avg_company_salary

;
