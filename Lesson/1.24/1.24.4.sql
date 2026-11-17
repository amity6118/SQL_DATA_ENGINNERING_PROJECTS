use company_jobs;

-- to merge data from priority_skills table into job_skill_priorities

describe staging.priority_skills;
describe main.job_skill_priorities
;
merge into main.job_skill_priorities as jsp 
using staging.priority_skills as ps 
on jsp.skill_id =ps.skill_id

when matched and jsp.priority_lvl is distinct from ps.priority_lvl then
    update set
        skill_name = ps.skill_name,
        priority_lvl = ps.priority_lvl


when not matched then
    insert(
        skill_name,
        priority_lvl
    )

    values(
        ps.skill_name,
        ps.priority_lvl
    )


when not matched by source then Delete;    


select *
from main.job_skill_priorities
;