with indicators as (           -- INT-layer model
    select * from {{ ref('int_zillow_indicators') }}
),

regions as (                  -- INT-layer model
    select * from {{ ref('int_zillow_regions') }}
),

stg_1br as (                  -- STG-layer model
    select * from {{ ref('stg_zillow_data__zillow_1BR') }}
),

details_extracted as (

    select
        stg.region,
        ind.indicator_id,
        reg.region_type,
        stg.date,
        stg.value,
        ind.indicator,
        ind.category,

        /* Pull the JSON-style “details” array apart ---------------------- */
        case
            when regexp_contains(detail, r'^city:')
            then regexp_extract(detail, r'^city:\s*(.+)$')
        end  as city,

        case
            when regexp_contains(detail, r'^state:')
            then regexp_extract(detail, r'^state:\s*(.+)$')
        end  as state,

        case
            when regexp_contains(detail, r'^metro_area:')
            then regexp_extract(detail, r'^metro_area:\s*(.+)$')
        end  as metro_area
        /* ---------------------------------------------------------------- */

    from indicators      ind
    join stg_1br         stg on ind.indicator_id = stg.indicator
    join regions         reg on reg.region       = stg.region
    cross join unnest(reg.details) as detail     -- explode the array
    where reg.region_type = 'city'
)

select
    region,
    indicator_id,
    region_type,
    date,
    value,
    indicator,
    category,
    max(city)       as city,
    max(state)      as state,
    max(metro_area) as metro_area
from details_extracted
group by
    region,
    indicator_id,
    region_type,
    date,
    value,
    indicator,
    category
