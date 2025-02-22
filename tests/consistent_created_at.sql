with fct_reviews_2 as (
    select * from {{ ref('fct_reviews_2') }}
),
dm_listings_cleaned as (
    select * from {{ ref('dm_listings_cleaned') }}
)

select * from fct_reviews_2 as fr 
left join dm_listings_cleaned as dm 
on fr.listing_id = dm.listing_id
where fr.review_date < dm.created_at