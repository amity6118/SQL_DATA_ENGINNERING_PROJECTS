--Q1

select jpf.job_id,
       jpf.job_title_short,
       array_length(
        array_agg(
        sjd.skill_id
       )
       )as skill_total
from job_postings_fact as jpf 
     inner join skills_job_dim as sjd
     on jpf.job_id = sjd.job_id
group by all
having array_length(
        array_agg(
        sjd.skill_id
       )
       )>12
;

--Q2 
select cd.name as company_name,
       array_agg(
        DISTINCT jpf.job_location
       )as hiring_locations
from job_postings_fact as jpf
     left join company_dim as cd
     on jpf.company_id= cd.company_id
group by cd.name
;

--Q4

with job_skill_counts as(
    select jpf.job_id,
           jpf.job_title_short,
           array_length(
            array_agg(
                sjd.skill_id
            )
           )as skill_job_count
    from job_postings_fact as jpf
        inner join skills_job_dim as sjd
        on jpf.job_id = sjd.job_id
    where jpf.job_title_short in ('Data Engineer', 'Data Analyst')
    group by jpf.job_title_short, jpf.job_id
)

select job_title_short, avg(skill_job_count) as skill_counts
from job_skill_counts
group by job_title_short

 ;

 --Q5 
with unique_job_locations as(
    select cd.name,
    array_length(array_agg(
        DISTINCT jpf.job_location))as locations_diversity_count
    from job_postings_fact as jpf
        join company_dim as cd 
        on jpf.company_id = cd.company_id
    group by cd.name
)

select *
from unique_job_locations
where locations_diversity_count >5
order by locations_diversity_count desc

;  

--Q 6 

with skills_id_column as (
    select sjd.job_id,
           array_agg(sjd.skill_id) as skill_id_array
    from skills_job_dim as sjd
    group by sjd.job_id
), skills_id_column_2 as(
    select *,unnest(skill_id_array) as skill_id
    from skills_id_column
)
 
select sid2.job_id,
       sd.skills as skill_name
from skills_id_column_2 as sid2
    inner join skills_dim as sd
    on sid2.skill_id = sd.skill_id     
   
;          

--Q7 
with company_skills as(
    select jpf.company_id,
           array_length(
            array_agg(
                DISTINCT sjd.skill_id
            )
           ) as skill_count
    from job_postings_fact as jpf 
         inner join skills_job_dim as sjd
         on jpf.job_id = sjd.job_id
    group by jpf.company_id
), comapny_skills_rank as(
    select *,
        dense_rank()over(
            order by skill_count desc
        )as diversity_rank 
 
   from company_skills as cs 
   inner join company_dim as cd  
   on cs.company_id =cd.company_id
)

select *
from comapny_skills_rank
where diversity_rank <= 10
;

--Q8 
with company_salary as(
    select jpf.company_id,
           avg(salary_year_avg)as avg_yearly_salary, 
           array_agg(
            jpf.salary_year_avg
           )as specific_salary 
    from job_postings_fact as jpf 
    where jpf.salary_year_avg is not null
    group by jpf.company_id
), company_avg_salary as(
    select company_id, 
           avg_yearly_salary, 
           unnest(
            specific_salary
        )as avg_company_salary
    from company_salary
    -- group by *
)

select company_id,
       avg_yearly_salary,
       avg_company_salary as speci_salary
from company_avg_salary
where avg_company_salary >(avg_yearly_salary*1.5)
;       
 
--Q9
-- describe skills_job_dim;
-- describe job_postings_fact; 

with jobs_title_skills as(
    select jpf.job_id,
           jpf.company_id, 
           array_length(array_agg(DISTINCT sjd.skill_id)) as skill_count
    from job_postings_fact as jpf 
        inner join skills_job_dim as sjd
        on jpf.job_id = sjd.job_id
    group by jpf.company_id, jpf.job_id  
), avg_skills_per_job as(
    select jts.company_id,
           
          avg(jts.skill_count)as avg_skills_per_company
    from  jobs_title_skills as jts 
    group by jts.company_id
)  

select jts.job_id,
       jts.skill_count,
       aspj.avg_skills_per_company
from jobs_title_skills as jts 
    inner join avg_skills_per_job as aspj 
    on jts.company_id = aspj.company_id
where skill_count > avg_skills_per_company
order by skill_count desc
limit 100
;        






