with 

source as (

    select * from {{ source('dubsrepo_mrt', 'zillow_indicators') }}

),

renamed as (

    select

    from source

)

select * from renamed
