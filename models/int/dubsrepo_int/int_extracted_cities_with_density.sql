with dubsrepo_int as (
    SELECT
    state,
        city,
        population_density,
        'dubsrepo_stg.stg_extracted_cities_with_density' AS _data_source,   -- Add your data source identifier here
        CURRENT_TIMESTAMP() AS _load_time         -- Captures the time of load
    FROM {{ref('extracted_cities_with_density')}}
)

select * from dubsrepo_int