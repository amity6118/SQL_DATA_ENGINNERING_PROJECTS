use company_jobs;

create schema staging;

select *
from information_schema.schemata;

drop schema staging;

create schema if not exists dev;

select *
from information_schema.schemata
where catalog_name ='company_jobs';



