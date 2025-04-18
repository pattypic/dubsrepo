with dubsrepo_int as (
    SELECT
    region,
        region_type,
        city,
        state,
        metro_area,
        county,
        'dubsrepo_stg.stg_zillow_regions' AS _data_source,   -- Add your data source identifier here
        CURRENT_TIMESTAMP() AS _load_time         -- Captures the time of load
    FROM {{ref('zillow_regions')}}
)

select * from dubsrepo_int