with 

source as (

    select * from {{ source('dubsrepo_int', 'zillow_indicators') }}

),

renamed as (

    select

    from source

)

select * from renamed
