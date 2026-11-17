DROP TABLE job_skill_priorities;

CREATE TABLE job_skill_priorities (
    skill_id INT,
    job_id INT,
    skill_name VARCHAR,
    priority_lvl INT,
    status VARCHAR
);
 



-- to insert values into the table
insert into job_skill_priorities(skill_id,job_id,status)
select 
    sjd.skill_id,
    sjd.job_id,
    'ACTIVE' as status 
from 
    data_jobs.skills_job_dim as sjd
    inner join staging.priority_skills as ps 
    on sjd.skill_id = ps.skill_id
;



select *
from job_skill_priorities;


