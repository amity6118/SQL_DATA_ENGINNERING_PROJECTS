select
    sjd.skill_id,
    sd.skills,
    count(jpf.job_id) as job_count
from 
    job_postings_fact as jpf 
    right join skills_job_dim as sjd 
    on jpf.job_id = sjd.job_id
    right join skills_dim as sd
    on sd.skill_id =sjd.skill_id
where
    jpf.job_title_short like '%Data%'
group by
    sd.skills,
    sjd.skill_id
order by
    job_count desc;  