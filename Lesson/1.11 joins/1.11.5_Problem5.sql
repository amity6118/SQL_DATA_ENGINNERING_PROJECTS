select
    jpf.job_title_short,
    sd.skills,
    count(jpf.job_id) as job_count
from 
    job_postings_fact as jpf 
    inner join skills_job_dim as sjd 
    on jpf.job_id = sjd.job_id
    inner join skills_dim as sd
    on sjd.skill_id =sd.skill_id
where
    jpf.salary_year_avg > 100_000
group by
    jpf.job_title_short,
    sd.skills
order by
    job_count desc;                