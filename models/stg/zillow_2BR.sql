with dubsrepo_stg as (
    SELECT
        CASE
            WHEN indicator_id IS NULL OR indicator_id = 'null' THEN NULL
            ELSE indicator_id
        END AS indicator,
        CASE
            WHEN region_id IS NULL OR region_id = 'null' THEN NULL
            ELSE region_id
        END AS region,
        date,
        CASE
            WHEN value IS NULL THEN NULL
            ELSE value
        END AS value,
        'zillow_2BR' AS _data_source,  -- Adds table name as data source
        CURRENT_TIMESTAMP() AS load_time  -- Adds load timestamp
    from {{ source("zillow_data", "zillow_2BR")}}
)

SELECT *
FROM dubsrepo_stg