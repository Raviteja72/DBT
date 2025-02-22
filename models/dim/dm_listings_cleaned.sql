{{
  config(
    materialized = 'view',
    )
}}

with src_listings as (
    select * from {{ref("src_listings")}}
)

select 
    listing_id,
    listing_name,
    ROOM_TYPE,
    CASE
        WHEN minimum_nights = 0 then 1
        ELSE minimum_nights
    END AS minimum_nights,
    host_id,
    REPLACE(listing_price,'$')::NUMBER(10,2) as price,
    created_at, 
    updated_at
FROM
    src_listings