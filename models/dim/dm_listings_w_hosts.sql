with l as (
    select * from {{ ref('dm_listings_cleaned') }}
),
h as (
    select * from {{ ref('dm_hosts_cleaned') }}
)

select
    l.listing_id,
    l.listing_name,
    l.room_type,
    h.is_superhost as host_rank,
    price,
    l.created_at,
    {# GREATEST(l.updated_at, h.updated_at) as recent_updated_at #}
    l.updated_at
from l 
left join h on (l.host_id = h.host_id)