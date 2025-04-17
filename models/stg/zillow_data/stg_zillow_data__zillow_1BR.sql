with 

source as (

    select * from {{ source('zillow_data', 'zillow_1BR') }}

),

renamed as (

    select
        indicator_id,
        region_id,
        date,
        value,
        _data_source,
        _load_time

    from source

)

select * from renamed
