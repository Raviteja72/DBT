{{
    config(
        materialized = 'view',
        on_schema_change = 'fail'
    )
}}

with src_reviews as (
    select {{ generate_surrogate_key(['listing_id', 'review_date', 'REVIEW_COMMENTS', 'REVIEW_SENTIMENT']) }}
    AS review_id, listing_id, review_date, REVIEW_COMMENTS, REVIEW_SENTIMENT
     from {{ ref('src_reviews') }}
)

select * from src_reviews

{% if is_incremental() %}
    AND review_date > (select max(review_date) from {{ this }})
{% endif %}

