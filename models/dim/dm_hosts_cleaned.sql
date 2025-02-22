{{
    config (
        materialized = 'view'
    )
}}

with src_hosts as (
    select * from {{ref("src_hosts")}}
)

select
    HOST_ID,
    is_superhost,
    nvl(host_name, 'Anonymous') as Host_Name
from
    src_hosts