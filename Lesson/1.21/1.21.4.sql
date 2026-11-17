use company_jobs;

create table if not exists dev.applications_fact
(
    application_id integer primary key,
    candidate_id integer,
    job_id integer,
    date_applied date,
    application_status text,
    internal_candidate boolean
);

select *
from dev.applications_fact;

show dev.applications_fact;
describe dev.applications_fact;
