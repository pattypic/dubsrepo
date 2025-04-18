with 

source as (

    select * from {{ source('zillow_data', 'zillow_indicators') }}

),

renamed as (

    select
        indicator_id,
        indicator,
        category

    from source

)

select * from renamed
