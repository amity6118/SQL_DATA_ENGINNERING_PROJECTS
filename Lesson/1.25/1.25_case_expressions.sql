describe job_postings_fact;

select 
    job_title_short,
    salary_hour_avg,
    case
     when salary_hour_avg <25 then 'Low' 
     when salary_hour_avg >= 25 and salary_hour_avg <=50 then 'Medium'
     when salary_hour_avg > 50 then 'High'
    end as salary_category
from 
    job_postings_fact
where
    salary_hour_avg is not null
limit
    10
;                

-- Handling Missing Data(NULLS)
-- Filter NULL salary values
select 
    job_title_short,
    salary_hour_avg,
    case
     when salary_hour_avg is NULL then 'Missing'   
     when salary_hour_avg <25 then 'Low' 
     when salary_hour_avg >= 25 and salary_hour_avg <=50 then 'Medium'
     when salary_hour_avg > 50 then 'High'
    end as salary_category
from 
    job_postings_fact
;   


/*
final example: Conditional calculations
compute a standardized_salary using yearly salary and
adjusted hourly salary(e.g. 2080 hours/year)
categorize salaries into tiers of:
   <75K 'Low'
   75k-150k 'Medium'
   >=150k 'High'
*/

with salaries as(
    select 
        job_title_short,
        salary_hour_avg,
        salary_year_avg,
        case
            when salary_year_avg is not null then salary_year_avg
            when salary_hour_avg is not null then salary_hour_avg*2080
        end as standardized_salary,
    from 
        job_postings_fact
    )

select 
    job_title_short,
    standardized_salary,
    case
        when standardized_salary is null then 'Missing'
        when standardized_salary < 75_000 then 'Low'
        when standardized_salary >= 150_000 then 'High'
        else 'Medium'
    end as salary_tiers
from 
    salaries        
order by
    standardized_salary 
limit 10          
    ;                   


