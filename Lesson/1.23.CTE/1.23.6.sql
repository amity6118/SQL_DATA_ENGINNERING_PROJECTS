with core_skills as(
    select skill_id,
           type as skill_type
    from skills_dim
    where type in('programming','databases')       
)

select cs.skill_type, count(distinct sjd.job_id)as job_count
from skills_job_dim  as sjd
    inner join core_skills as cs 
    on sjd.skill_id =cs.skill_id
group by cs.skill_type
order by job_count desc
;    