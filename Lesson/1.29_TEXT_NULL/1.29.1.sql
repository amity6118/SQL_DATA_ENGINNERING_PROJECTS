
select * 
from information_schema.tables
where table_catalog = 'data_jobs';

describe company_dim;

select upper(name) as standardized_company_name
from company_dim
order by  standardized_company_name
;