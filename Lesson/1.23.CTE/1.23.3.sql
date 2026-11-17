 select *
 from (
    select jpf.job_id,
           jpf.job_title_short,
           jpf.job_location,
           cd.company_id
    from job_postings_fact as jpf 
        inner join company_dim as cd 
        on jpf.company_id = cd.company_id
    where cd.name ='Google' and 
          jpf.salary_year_avg >100000      ) as jobs_table
;        

-- or 
select job_id,
       job_title_short,
       job_location
from job_postings_fact
where company_id =(
    select company_id
    from company_dim
    where name ='Google'
)  
and
salary_year_avg >100000
;      