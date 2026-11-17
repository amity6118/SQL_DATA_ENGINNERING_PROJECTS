select job_id,
       coalesce(trim(job_location),'Remote') as location_clean 
from job_postings_fact
where trim(job_location) is null
;       

select job_id,
       nullif(salary_year_avg , 0) as salary_cleaned
from job_postings_fact
where salary_year_avg is null
;   

select jpf.job_id,
       upper(coalesce(cd.name,'Unknown')) as company_name_standardized 
from job_postings_fact as jpf
    left join company_dim as cd
    on jpf.company_id = cd.company_id  
where cd.name is null;  

select *
from job_postings_fact
where    NULLIF(TRIM(job_title), '') IS NOT NULL
    AND NULLIF(UPPER(TRIM(job_location)), 'N/A') IS NOT NULL;


--first solution--
with location_stage as(
    select job_id,
           lower(trim(job_location)) as loc_clean 
    from job_postings_fact        
)

select job_id,loc_clean,
       case 
        when loc_clean like '%remote%'then 'Remote'
        when loc_clean like '%anywhere%' then 'Remote'
        when nullif(loc_clean,'') is null then 'Global'
        else 'On-site/Hybrid'
       end as location_category 
from location_stage
;


/* second solution without using cte*/

select job_id,
       case 
        when trim(job_location) like '%remote%'then 'Remote'
        when trim(job_location) like '%anywhere%' then 'Remote'
        when nullif(trim(job_location),'') is null then 'Global'
        else 'On-site/Hybrid'
       end as location_category 
from job_postings_fact
;