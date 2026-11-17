use company_jobs;

create or replace temporary table top_hiring_companies_temp  as
select  cd.company_id,
        cd.name as company_name,
        count(jpf.job_id)as postiong_count
from data_jobs.job_postings_fact as jpf 
    inner join data_jobs.company_dim as cd
    on jpf.company_id = cd.company_id
group by cd.company_id, cd.name
having count(jpf.job_id)>10
;

select *
from top_hiring_companies_temp;

