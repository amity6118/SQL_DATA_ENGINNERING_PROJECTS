select
    job_id,
    job_title, 
    salary_year_avg,
    case
        when job_title like '%Manager%' or job_title like '%Lead%' then 'Lead/Manager'
        when job_title like '%Senior%' then 'Senior'
        when job_title like '%Junior%'  or job_title like '%Entry%' then 'Junior/Entry'
        else 'Not Specified' 
    end as experience_level,
    case    
        when job_work_from_home = TRUE then 'Yes'
        when job_work_from_home = FALSE then 'No'
    end as remote_option       

from 
    job_postings_fact
where 
    salary_year_avg is not null
order by 
    job_id
;
