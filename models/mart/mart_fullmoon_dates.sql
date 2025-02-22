{{
    config(
        materialized = 'table'
    )
}}


with fct_reviews as (
    select * from {{ ref('fct_reviews_2') }}
),
full_moon_dates as (
    select * from {{ ref('seed_full_moon_dates') }}
)

select r.*,
    case 
        when fm.full_moon_date is null then 'Not a full moon day'
        ELSE 'full moon day'
    END AS full_moon_day
FROM 
    fct_reviews r 
    left join full_moon_dates fm 
    on r.review_date = DATEADD(DAY, 1, fm.full_moon_date)