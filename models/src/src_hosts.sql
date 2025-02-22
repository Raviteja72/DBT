with raw_hosts as (
select * from {{ source('airbnb', 'hosts') }}
)

select name as host_name, id as host_id, is_superhost
from raw_hosts