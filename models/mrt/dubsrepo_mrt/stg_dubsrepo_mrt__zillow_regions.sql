with 

source as (

    select * from {{ source('dubsrepo_mrt', 'zillow_regions') }}

),

renamed as (

    select

    from source

)

select * from renamed
