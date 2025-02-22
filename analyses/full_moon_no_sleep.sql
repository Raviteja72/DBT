with mart_fullmoon_reviews as (
    select * from {{ ref('mart_fullmoon_dates') }}
)

select full_moon_day, 
        review_sentiment,
        count(*) as reviews 
from mart_fullmoon_reviews
Group BY full_moon_day, review_sentiment
order by full_moon_day, review_sentiment

