select name 
from company_dim
where exists (
    select 1
    from company_dim as cd 
        inner join job_postings_fact as jpf 
        on cd.company_id =jpf.company_id

)
;

select job_id,
       job_title_short
from job_postings_fact as jpf
where exists(
    select 1
    from skills_job_dim as sjd 
        inner join skills_dim as sd 
        on sjd.skill_id = sd.skill_id 
    where sd.skills = 'python'  and
          sjd.job_id =jpf.job_id    

)   and job_title_short ='Data Engineer'
;     