
--to create a source table with "key" as column name
select *
from range(3) as src(key);

--to create a target table with "key" as column name
select *
from range(2) as tgt(key);

select *
from range(3) as src(key)
where exists(
    select 1
    from range(2) as tgt(key)
    where tgt.key = src.key
)
;

select *
from range(3) as src(key)
where not exists(
    select 1  -- instead of "1" we could write anything it will work fine
    from range(2) as tgt(key)
    where tgt.key = src.key
)
;

/*
to identify job postings that have no associated skills before loading them 
into a data mart
*/
 
select *
from job_postings_fact
where not exists(
    select 1
    from skills_job_dim
    where job_postings_fact.job_id = skills_job_dim.job_id
)
order by job_id 
; 













