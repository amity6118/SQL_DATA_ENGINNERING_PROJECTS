/*
🧑‍💻 **Scenario:** 

**Question: What are the highest-paying skills for data engineers?** 

- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why?
    - Helps identify which skills command the highest compensation while also showing how common those skills are, providing a more complete picture for skill development priorities.
    - The median is used instead of the average to reduce the impact of outlier salaries.
 */


select 
    sd.skills,
    round(median(jpf.salary_year_avg),0) as median_salary,
    count(jpf.*) as demand_count
from 
    job_postings_fact as jpf 
    inner join skills_job_dim as sjd 
    on jpf.job_id = sjd.job_id
    inner join skills_dim as sd 
    on sjd.skill_id = sd.skill_id
where   
    jpf.job_title_short = 'Data Engineer' and
    jpf.job_work_from_home = 'Yes'
group by
    sd.skills
having 
    count(jpf.*)>100    
order by 
    median_salary desc    
limit 10
;    



/*
This horizontal bar chart ranks the **top 10 highest-paying skills by median salary**. It clearly shows that:

* **Rust** is the highest-paying skill with a median salary of **$210,000**.
* **Terraform** and **Golang** are tied at **$184,000**.
* **FastAPI** rounds out the top 10 with a median salary of **$157,500**.



Top 10 Highest-Paying Skills

Median salary and demand count from job postings.

│  skills   │ median_salary │ demand_count │
│  varchar  │    double     │    int64     │
├───────────┼───────────────┼──────────────┤
│ rust      │      210000.0 │          232 │
│ terraform │      184000.0 │         3248 │
│ golang    │      184000.0 │          912 │
│ spring    │      175500.0 │          364 │
│ neo4j     │      170000.0 │          277 │
│ gdpr      │      169616.0 │          582 │
│ zoom      │      168438.0 │          127 │
│ graphql   │      167500.0 │          445 │
│ mongo     │      162250.0 │          265 │
│ fastapi   │      157500.0 │          204 │
└───────────┴───────────────┴──────────────┘
*/
