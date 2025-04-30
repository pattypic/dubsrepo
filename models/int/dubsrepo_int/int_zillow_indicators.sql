with dubsrepo_int as (
    SELECT
    indicator_id,
        indicator,
        category,
        'dubsrepo_stg.stg_zillow_indicators' AS _data_source,   -- Add your data source identifier here
        CURRENT_TIMESTAMP() AS _load_time         -- Captures the time of load
    FROM {{ref('zillow_indicators')}}
)

select * from dubsrepo_int