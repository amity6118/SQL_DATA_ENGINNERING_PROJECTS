select 
    count(distinct case when jpf.job_work_from_home = TRUE then company_id end)as wfh_comapanies,
    count(distinct case when jpf.job_work_from_home = FALSE then company_id end)as non_wfh_companies
from
    job_postings_fact as jpf
;

    
