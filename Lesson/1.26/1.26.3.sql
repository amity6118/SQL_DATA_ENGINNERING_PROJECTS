select
    cd.name as company_name,
    count(jpf.job_id)as job_count,
    case
        when count(jpf.job_id)> 100 then '100+ WFH DE Jobs'
        when count(jpf.job_id)>= 50 and count(jpf.job_id)<= 100 then '50-100 WFH DE Jobs'
        when count(jpf.job_id)>= 25 and count(jpf.job_id)<= 49 then '25-49 WFH DE Jobs'
        when count(jpf.job_id) <25 then 'Less than 25 WFH DE Jobs'
    end as  WFH_DE_Job_Category
from
    job_postings_fact as jpf
    inner join company_dim as cd 
    on jpf.company_id = cd.company_id
Where 
    jpf.job_work_from_home =TRUE and
    jpf.job_title_short = 'Data Engineer'
group by 
    cd.name 
order by 
    job_count desc
;                
