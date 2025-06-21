WITH raw_tags as (
    SELECT * FROM MOVIELENS.RAW.RAW_TAGS
)
SELECT 
    userId as user_id,
    movieId as movie_id,
    tag,
    TO_TIMESTAMP_LTZ(timestamp) as rating_timestamp 
FROM raw_tags