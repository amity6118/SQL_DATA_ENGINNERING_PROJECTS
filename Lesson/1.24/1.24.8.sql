use company_jobs;

insert into staging.priority_skills(skill_id,skill_name, priority_lvl) 
values(
    77, 'aws', 3
)
;   

-- select *
-- from staging.priority_skills
-- ;

merge into main.job_skill_priorities as tgt
using(
    SELECT
        sjd.job_id,
        sjd.skill_id,
        ps.skill_name,
        ps.priority_lvl
    FROM data_jobs.skills_job_dim sjd
    JOIN staging.priority_skills ps
        ON sjd.skill_id = ps.skill_id
)as src
on tgt.job_id =src.job_id
and tgt.skill_id = src.skill_id 

when matched then
update set
    priority_lvl =src.priority_lvl,
    skill_name = src.skill_name


when not matched then
insert(
    job_id,
    skill_id,
    skill_name,
    priority_lvl,
    status
)

values(
    src.job_id,
    src.skill_id,
    src.skill_name,
    src.priority_lvl,
    'NEW_SKILL'
)
;

SELECT *
FROM job_skill_priorities
ORDER BY job_id;

