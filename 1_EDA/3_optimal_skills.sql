/*
## 🧑‍💻 **Scenario:**

Question: What are the most optimal skills for data engineers—balancing both demand and salary?

- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
    - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately, 
    rather than letting rare, outlier skills distort the results.
    - The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical 
    and valuable to learn for data engineering careers.
*/

select
    sd.skills,
    round(median(jpf.salary_year_avg),0) as median_salary,
    count(jpf.*) as demand_count,
    round(ln(count(jpf.*)),1) as ln_demand_count,
    round(median(jpf.salary_year_avg)*ln(count(jpf.*))/1000000,2) as optimal_rank
from 
    job_postings_fact as jpf 
    inner join skills_job_dim as sjd 
    on jpf.job_id = sjd.job_id
    inner join skills_dim as sd 
    on sjd.skill_id = sd.skill_id
where   
    jpf.job_title_short = 'Data Engineer' and
    jpf.job_work_from_home = 'Yes' and 
    jpf.salary_year_avg is not null
group by
    sd.skills
having
    count(jpf.*)>100    
order by 
    optimal_rank desc    
limit 
    10
;

/*
┌───────────┬───────────────┬──────────────┬─────────────────┬──────────────┐
│  skills   │ median_salary │ demand_count │ ln_demand_count │ optimal_rank │
│  varchar  │    double     │    int64     │     double      │    double    │
├───────────┼───────────────┼──────────────┼─────────────────┼──────────────┤
│ terraform │      184000.0 │          193 │             5.3 │         0.97 │
│ python    │      135000.0 │         1133 │             7.0 │         0.95 │
│ sql       │      130000.0 │         1128 │             7.0 │         0.91 │
│ aws       │      137320.0 │          783 │             6.7 │         0.91 │
│ airflow   │      150000.0 │          386 │             6.0 │         0.89 │
│ spark     │      140000.0 │          503 │             6.2 │         0.87 │
│ snowflake │      135500.0 │          438 │             6.1 │         0.82 │
│ kafka     │      145000.0 │          292 │             5.7 │         0.82 │
│ azure     │      128000.0 │          475 │             6.2 │         0.79 │
│ java      │      135000.0 │          303 │             5.7 │         0.77 │
└───────────┴───────────────┴──────────────┴─────────────────┴──────────────┘
-Python and SQL provide the best balance of salary and demand.
 Both skills have the highest market demand (over 1,100 job postings) while still offering competitive 
 median salaries of $130K–$135K, making them foundational skills for data professionals.
-Terraform commands the highest salary despite relatively low demand.
 With a median salary of $184K and only 193 job postings, Terraform represents a high-value niche skill with strong earning potential.
-Cloud and big data technologies occupy the sweet spot.
 Skills such as AWS, Airflow, Spark, and Snowflake combine above-average salaries ($135K–$150K) with moderate demand, indicating strong 
 opportunities for specialization.

*/
       