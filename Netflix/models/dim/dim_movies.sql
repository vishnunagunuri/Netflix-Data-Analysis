WITH dim_movies as(
    SELECT * FROM {{ref('src_movies')}}
)

SELECT
    movie_id,
    INITCAP(TRIM(title)) as movie_title,
    SPLIT(genre,'|') as genre_array,
    genre
FROM dim_movies