with raw_hosts as (
select * from AIRBNB.RAW.RAW_HOSTS
)

select name as host_name, id as host_id, is_superhost
from raw_hosts