


create database job_mart;

show databases;

-- to create a new schema in job_mart database apart 
-- main schema
-- to change to "job_mart" database we will use "use"

use job_mart;

create schema staging;


-- to see all schema 
select *
from information_schema.schemata;

-- to create table inside "job_mart" schema "staging"
create table staging.preferred_roles(
    role_id integer primary key,
    role_name varchar
);

-- to check whether this table is created in "job_mart" database
select *
from information_schema.tables
where table_catalog ='job_mart';

select *
from staging.preferred_roles;

-- now it has "preferred_roles" table in both main and staging schemas
-- Drop table if exists main.preferred_roles;

Insert into staging.preferred_roles(role_id,role_name)
values
    (1, 'Data Engineer'),
    (2,'Senior Data Engineer'),
    (3, 'software engineer')
    ;

select *
from staging.preferred_roles;    

-- Alter table

alter table staging.preferred_roles
add column preferred_role boolean;

-- to drop "drop column preferred_roles" 
--to update 
update staging.preferred_roles
set preferred_role= true
where role_id =1 or role_id=2;

update staging.preferred_roles
set preferred_role= false
where role_id =3;
    
-- to change the name of the  table
alter table staging.preferred_roles
rename to priority_roles;

select *
from staging.priority_roles;

-- to change the column name to "Priority_lvl"
alter table staging.priority_roles
rename column preferred_role to Priority_lvl;

alter table staging.priority_roles
alter column Priority_lvl type integer;

-- to update "priority_roles" table
update staging.priority_roles
set Priority_lvl =3
where role_id =3;


select *
from staging.priority_roles;

create database sql_problems;
show databases;