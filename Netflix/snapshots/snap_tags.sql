{% snapshot snap_tags %}

{{
    config(
       target_schema='snapshots',
       unique_key=['user_id','movie_id','tag'],
       strategy='timestamp',
       updated_at='rating_timestamp',
       invalidate_hard_deletes=True 
    )
}}

SELECT
    {{ dbt_utils.generate_surrogate_key(['user_id','movie_id','tag'])}}
    user_id,
    movie_id,
    tag,
    CAST(rating_timestamp as TIMESTAMP_NTZ) as rating_timestamp
FROM {{ ref('src_tags')}}
LIMIT 100

{% endsnapshot %}