with 

source as (

    select * from {{ source('dubsrepo_mrt', 'extracted_cities_with_density') }}

),

renamed as (

    select

    from source

)

select * from renamed
