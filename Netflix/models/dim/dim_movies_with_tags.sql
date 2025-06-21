{{
    config(
        materialized='ephemeral'
    )
}}

with movies as (
    select * from {{ ref('dim_movies')}}
),
tags as (
    select * from {{ ref('dim_genome_tags')}}
),
scores as (
    select * from {{ ref('fct_genome_scores')}}
)
SELECT 
    m.movie_id,
    m.movie_title,
    m.genre,
    t.tag_name,
    s.relevance_score
FROM movies m
LEFT JOIN scores s on m.movie_id=s.movie_id
LEFT JOIN tags t on t.tag_id=s.tag_id
