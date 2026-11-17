use company_jobs;

create schema if not exists staging;

select * 
from information_schema.schemata
where catalog_name = 'company_jobs'
;

create table if not exists  staging.priority_skills(
    skill_id integer primary key,
    skill_name varchar(50),
    priority_lvl integer
)
;

insert into staging.priority_skills(
    skill_id,
    skill_name,
    priority_lvl
)
 
values
    (1,'python',1),
    (0,'sql',1),
    (183,'tableau',2),
 
;

select * 
from staging.priority_skills;