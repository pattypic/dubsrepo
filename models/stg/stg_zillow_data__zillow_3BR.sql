with 

source as (

    select * from {{ source('zillow_data', 'zillow_3BR') }}

),

renamed as (

    select
        indicator_id,
        region_id,
        date,
        value

    from source

)

select * from renamed
