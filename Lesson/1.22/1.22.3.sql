use company_jobs;

create or replace view remote_job_view as
select jpf.job_id, jpf.job_title_short, cd.name as company_name
from data_jobs.job_postings_fact as jpf 
   join data_jobs.company_dim as cd 
    on jpf.company_id =cd.company_id
where jpf.job_work_from_home = 'TRUE'
  
 ;

 select count(job_id)as job_count, company_name
 from remote_job_view
 group by company_name
 order by job_count desc;