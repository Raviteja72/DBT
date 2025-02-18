with raw_listings_model as (
    select * from AIRBNB.raw.raw_listings
)

select 
    id as listing_id, 
    name as listing_name,
    price as listing_price
from 
    raw_listings_model