    select job_posted_date,
                company_id,
                job_title_short,
                job_posted_date::DATE as dt,
                concat(company_id::STRING,'_', dt::STRING) as compound_key
            from
                job_postings_fact
            limit
                10;

