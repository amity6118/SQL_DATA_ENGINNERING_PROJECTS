select
    cd.name as company_name,
    count(jpf.job_id)as job_count,
    case
        when jpf.salary_year_avg >= 100000 then '1: $100,000+'
        when jpf.salary_year_avg >= 75000 then  '2: $75,000 - $99,999'
        when jpf.salary_year_avg >= 50000 then  '3: $50,000 - $74,999'
        when jpf.salary_year_avg >= 25000 then  '4: $25,000 - $49,999'
        else '5: Less than $25,000'
    end as salary_range
from
    job_postings_fact as jpf
    inner join company_dim as cd
    on jpf.company_id =cd.company_id
where 
    jpf.job_title_short = 'Data Engineer' and
    (jpf.job_title  like '%Junior%' or jpf.job_title like '%Entry%') and
    jpf.salary_year_avg is not null
group by 
    cd.name, salary_range
order by 
    salary_range,job_count desc;    

-- SELECT
--     cd.name AS company_name,
--     CASE
--         WHEN jpf.salary_year_avg >= 100000 THEN '1: $100,000+'
--         WHEN jpf.salary_year_avg >= 75000 THEN '2: $75,000 - $99,999'
--         WHEN jpf.salary_year_avg >= 50000 THEN '3: $50,000 - $74,999'
--         WHEN jpf.salary_year_avg >= 25000 THEN '4: $25,000 - $49,999'
--         ELSE '5: Less than $25,000'
--     END AS salary_range,
--     COUNT(jpf.job_id) AS job_count
-- FROM 
--     job_postings_fact AS jpf
--     INNER JOIN company_dim AS cd
--         ON jpf.company_id = cd.company_id
-- WHERE 
--     jpf.salary_year_avg IS NOT NULL    
--     AND jpf.job_title_short = 'Data Engineer'
--     AND (jpf.job_title LIKE '%Junior%' OR jpf.job_title LIKE '%Entry%')
-- GROUP BY
--     cd.name,
--     salary_range
-- ORDER BY
--     salary_range ASC,
--     job_count DESC;