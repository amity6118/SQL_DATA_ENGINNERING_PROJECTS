select 
    jpf.job_id,
    jpf.job_title,
    cd.name as company_name,
    jpf.salary_year_avg,
    case
        when jpf.salary_year_avg >= 100000 then 'High salary'
        when jpf.salary_year_avg <60000 then 'Low salary'
        else 'Standard Salary'
    end as salary_category
from 
    job_postings_fact as jpf 
    inner join company_dim as cd
    on jpf.company_id = cd.company_id
where 
    jpf.job_title_short ='Data Engineer' and jpf.salary_year_avg is not null
order by 
    jpf.salary_year_avg desc
;            