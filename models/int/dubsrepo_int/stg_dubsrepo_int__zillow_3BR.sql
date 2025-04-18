with 

source as (

    select * from {{ source('dubsrepo_int', 'zillow_3BR') }}

),

renamed as (

    select

    from source

)

select * from renamed
