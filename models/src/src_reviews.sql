with raw_reviews as (
    select * from {{ source('airbnb','reviews') }}
)

SELECT DATE AS REVIEW_DATE,
    listing_id,
    COMMENTS AS REVIEW_COMMENTS,
    SENTIMENT AS REVIEW_SENTIMENT,
FROM 
    raw_reviews
