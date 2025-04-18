with 

source as (

    select * from {{ source('dubsrepo_int', 'zillow_regions') }}

),

renamed as (

    select

    from source

)

select * from renamed
