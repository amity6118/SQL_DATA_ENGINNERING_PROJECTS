use company_jobs;

describe staging.priority_skills;
describe main.job_skill_priorities;

Delete from main.job_skill_priorities as tgt
where not exists(
    select 1
    from staging.priority_skills as src 
    where src.skill_id = tgt.skill_id
)
;

select *
from main.job_skill_priorities
where skill_id =183
;