use company_jobs;

update staging.priority_skills
set priority_lvl = 1
where skill_id = 0
;

update staging.priority_skills
set priority_lvl = 2
where skill_id = 1
;

select *
from staging.priority_skills
;

merge into main.job_skill_priorities as tgt
using staging.priority_skills as src
on tgt.skill_id = src.skill_id

when matched and( tgt.priority_lvl! = src.priority_lvl or tgt.priority_lvl is null)  then
    update set
        priority_lvl = src.priority_lvl,
        status = 'PRIORITY_CHANGE'
;

select *
from main.job_skill_priorities
;

