select jpf.job_id,
       jpf.job_title,
       cd.name as company_name,
       jpf.job_location,
       jpf.job_posted_date
from job_postings_fact as jpf
inner join company_dim as cd 
on jpf.company_id = cd.company_id
where jpf.job_title_short ='Data Engineer'
order by jpf.job_posted_date DESC
;

select * from information_schema.tables where table_name like '%dim%';

select table_name, constraint_name, count(constraint_name) as constraint_name_count
from information_schema.key_column_usage
where table_catalog = 'data_jobs'
group by table_name, constraint_name
having count(constraint_name) >1
;