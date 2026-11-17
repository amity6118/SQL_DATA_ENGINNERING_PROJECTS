select 
    abbrev,
    count(name)as record_count
from pg_timezone_names()
group by abbrev
order by record_count desc
;