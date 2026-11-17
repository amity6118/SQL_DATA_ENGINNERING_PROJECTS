use company_jobs;

create or replace temporary table ds_skills_count_temp as
select sd.skills, count(jpf.job_id)as ds_skill_count 
from data_jobs.skills_dim  as sd 
    inner join data_jobs.skills_job_dim as sjd 
    on sd.skill_id = sjd.skill_id
    inner join data_jobs.job_postings_fact as jpf 
    on sjd.job_id = jpf.job_id
where jpf.job_title_short = 'Data Scientist'
group by sd.skills
;    

select * 
from ds_skills_count_temp;