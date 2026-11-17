use company_jobs;

Delete from staging.priority_skills
where skill_id = 183
;

merge into main.job_skill_priorities as tgt
using staging.priority_skills as src
on tgt.skill_id = src.skill_id

when not matched by source then
update set status = 'INACTIVE'
;

select * 
from staging.priority_skills;

select * 
from main.job_skill_priorities
order by job_id
;
 
 update main.job_skill_priorities
 set status = 'URGENT'
 where priority_lvl = 1
 ;
