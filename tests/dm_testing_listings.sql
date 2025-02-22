select *
from {{ ref('dm_hosts_cleaned') }}
where host_id is null and 
is_superhost not in ('f','t')