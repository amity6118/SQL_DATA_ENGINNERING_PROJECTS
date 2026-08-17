select
    jpf.job_id,
    jpf.job_title,
    sd.skills,
    jpf.job_country
from 
    job_postings_fact as jpf
left join 
    skills_job_dim as sjd 
on
    jpf.job_id = sjd.job_id
left join 
    skills_dim as sd
on
    sjd.skill_id =sd.skill_id
where
    jpf.job_title_short ='Data Engineer' and
    jpf.job_country = 'United States'    and
    jpf.job_health_insurance = 'Yes'
order by
    jpf.job_id desc;    

                        