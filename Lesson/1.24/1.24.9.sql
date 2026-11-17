use company_jobs;

Delete from staging.priority_skills
where skill_id =1
;

describe data_jobs.skills_job_dim ;
describe staging.priority_skills;
describe main.job_skill_priorities;


merge into main.job_skill_priorities as tgt
using(
    select sjd.skill_id,
           sjd.job_id,
           ps.skill_name,
           ps.priority_lvl
    from data_jobs.skills_job_dim as sjd 
        join staging.priority_skills as ps 
        on sjd.skill_id = ps.skill_id
) as src
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

values
    (src.job_id, 
     src.skill_id,
     src.skill_name,
     src.priority_lvl,
     'NEW_SKILL'
)

when not matched by source then Delete;

SELECT * FROM job_skill_priorities WHERE skill_id = 1;