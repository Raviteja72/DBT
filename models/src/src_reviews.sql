with raw_reviews as (
    select * from AIRBNB.RAW.raw_reviews
)

SELECT DATE AS REVIEW_DATE,
    COMMENTS AS REVIEW_COMMENTS,
    SENTIMENT AS REVIEW_SENTIMENT
FROM 
    raw_reviews
