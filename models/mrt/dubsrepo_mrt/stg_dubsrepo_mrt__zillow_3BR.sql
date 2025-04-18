with 

source as (

    select * from {{ source('dubsrepo_mrt', 'zillow_3BR') }}

),

renamed as (

    select

    from source

)

select * from renamed
