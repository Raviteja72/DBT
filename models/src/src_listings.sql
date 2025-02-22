with raw_listings_model as (
    select * from {{ source('airbnb', 'listings') }}
)

select 
    id as listing_id, 
    name as listing_name,
    price as listing_price,
    room_type,
    created_at,
    updated_at,
    minimum_nights,
    host_id
from 
    raw_listings_model