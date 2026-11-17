use company_jobs;

insert into dev.applications_fact(
    application_id, 
    job_id, 
    candidate_id, 
    date_applied, 
    application_status,
    internal_candidate
)
values
    (1,101,1,'2025-11-10','Applied',FALSE),
    (2,102,2,'2025-11-12','Interview', TRUE),
    (3,103,3,'2025-11-08', 'Offer',FALSE),
    (4,104,4,'2025-11-14','Rejected', TRUE)
;

show dev.applications_fact;
describe dev.applications_fact;

select * 
from dev.applications_fact;
