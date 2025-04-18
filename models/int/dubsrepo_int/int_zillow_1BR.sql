with dubsrepo_int as (
    SELECT
        CONCAT(
            "CREATE TABLE dubsrepo_int.region_", region, " AS ",
            "SELECT indicator, date, value, ",
            "'", "region_", region, "' AS _data_source, ",
            "CURRENT_TIMESTAMP() AS load_time ",
            "FROM dubsrepo_stg.zillow_1BR WHERE region = '", region, "';"
        ) AS sql_statement
        FROM (SELECT DISTINCT region FROM ref('zillow_1BR'));
)

select * from dubsrepo_int