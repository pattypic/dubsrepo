with dubsrepo_stg as (
    SELECT
        CASE
            WHEN region_id IS NULL OR region_id = 'null' THEN NULL
            ELSE region_id
        END AS region,
        CASE
            WHEN region_type IS NULL OR region_type = 'null' THEN NULL
            ELSE region_type
        END AS region_type,

        -- Extracting City (first part before the first semicolon)
        SPLIT(region, ';')[SAFE_OFFSET(0)] AS city,

        -- Extracting State (second part before the second semicolon)
        SPLIT(region, ';')[SAFE_OFFSET(1)] AS state,

        -- Extracting Metro Area (third part before the third semicolon, might be 'nan')
        NULLIF(SPLIT(region, ';')[SAFE_OFFSET(2)], 'nan') AS metro_area,

        -- Extracting County (fourth part before the fourth semicolon)
        SPLIT(region, ';')[SAFE_OFFSET(3)] AS county
    from {{source("zillow_data", "zillow_regions")}}
)

SELECT * FROM dubsrepo_stg