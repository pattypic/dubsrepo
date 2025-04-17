with 

source as (

    select * from {{ source('zillow_data', 'zillow_regions') }}

),

renamed as (

    select
        region_id,
        region_type,
        region

    from source

)

select * from renamed
