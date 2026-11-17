select job_id,
       job_posted_date,
       row_number()over(
        order by job_posted_date
       )as global_row_id
from job_postings_fact
order by job_posted_date    
;   

--1.30.2
select job_id,
       salary_year_avg,
       job_location,
       avg(salary_year_avg)over(
        partition by job_location
       ) as location_job_slary
from job_postings_fact
where salary_year_avg is not null
;       

-- Q 4
select company_id,
       job_id,
       job_posted_date,
       salary_year_avg,
       sum(salary_year_avg)over(
        partition by company_id
        order by job_posted_date
        )as running_salary_total
from job_postings_fact
where salary_year_avg is not null 
order by job_posted_date
;


--  Q5 
with ranked_postings  as(
    select company_id,
           job_id,
           job_posted_date,
           row_number()over(
            partition by company_id
            order by job_posted_date desc
           )as job_rank
    from job_postings_fact
    
)

select *
from ranked_postings
where job_rank = 1
;

--Q6

with top_ranked_job as(
        select job_id,
               job_title_short,
               salary_year_avg,
               rank()over(
                partition by job_title_short 
                order by salary_year_avg desc
               )as job_rank
        from job_postings_fact
        where salary_year_avg is not  null
)  

select *
from top_ranked_job
where job_rank <4
;

--Q 7
select job_id,
       job_location,
       salary_year_avg,
       dense_rank()over(
                partition by job_location
                order by salary_year_avg desc
)as salary_level
from job_postings_fact
where salary_year_avg is not  null
order by job_location, salary_year_avg
;

--Q8

select job_id,
       job_title_short,
       salary_year_avg,
       avg(salary_year_avg)over(
        partition by job_title_short
       )as avg_salary,
       (salary_year_avg -avg(salary_year_avg)over(
        partition by job_title_short
       ))as deviation
from job_postings_fact
where salary_year_avg is not null
;

--Q9
with job_lapsed_days as(
        select company_id,
        job_posted_date,
        lag(job_posted_date)over(
                partition by company_id
                order by job_posted_date
        )::DATE as prev_date
        from job_postings_fact
)

select company_id,
       job_posted_date,
       prev_date,
       (job_posted_date-prev_date)as  days_between_postings
from job_lapsed_days
where prev_date is not null
;     

--Q 10

with updated_job_postings as(
        select job_title_short,
               salary_year_avg,
               job_posted_date,
               lead(salary_year_avg)over(
                partition by job_title_short
                order by job_posted_date
               )as next_salary
        from job_postings_fact
        where salary_year_avg is not null
)

select job_title_short,
       salary_year_avg,
       job_posted_date,
       case
        when  (next_salary -salary_year_avg)>0 then 'Increasing'
        when (next_salary -salary_year_avg)<0 then 'Decreasing'
        else 'Stable'
       end as  trend_direction
from updated_job_postings
;

-- Q12
with normalized_salary_score as(
        select job_id,
        job_title_short,
        salary_year_avg,
        min(salary_year_avg)over(
                partition by job_title_short
        )as min_salary,
        max(salary_year_avg)over(
                partition by job_title_short
        )as max_salary
        from job_postings_fact
        where salary_year_avg is not null
)

select *,
       (salary_year_avg-min_salary)/nullif(max_salary -min_salary,0) as normalized_score  
from normalized_salary_score
-- where min_salary != max_salary
;



