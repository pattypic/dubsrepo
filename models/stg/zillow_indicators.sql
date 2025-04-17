with dubsrepo_stg as ( 
    SELECT
        CASE
            WHEN indicator_id IS NULL OR indicator_id = 'null' THEN NULL
            ELSE indicator_id
        END AS indicator_id,
        CASE
            WHEN indicator IS NULL OR indicator = 'null' THEN NULL
            ELSE indicator
        END AS indicator,
        CASE
            WHEN category IS NULL THEN NULL
            ELSE category
        END AS category,
        'zillow_indicators' AS _data_source,  -- Adds table name as data source
        CURRENT_TIMESTAMP() AS load_time  -- Adds load timestamp
    FROM {{source("zillow_data", "zillow_indicators")}}
)

select * from dubsrepo_stg