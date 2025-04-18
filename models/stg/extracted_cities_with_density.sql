with dubsrepo_stg as (
    SELECT
        state,
        NULLIF(city, '') AS city,
        SAFE_CAST(NULLIF(population_density, '') AS STRING) AS population_density,
        _data_source,
        _load_time
    FROM {{source("zillow_data", "extracted_cities_with_density")}}
)

select * from dubsrepo_stg             
