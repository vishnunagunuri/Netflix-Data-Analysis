{{
    config(
        MATERIALIZED='incremental',
        on_schema_change='fail'
    )
}}

with src_ratings as(
    select * from {{ref('src_ratings')}}
)

SELECT
    user_id,
    movie_id,
    rating,
    rating_timestamp
from src_ratings
where rating is not NULL

{%if is_incremental() %}
WHERE rating_timestamp > (SELECT MAX(rating_timestamp) FROM {{ this }})
{% endif %}