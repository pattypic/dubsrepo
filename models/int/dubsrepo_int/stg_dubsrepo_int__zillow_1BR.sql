with 

source as (

    select * from {{ source('dubsrepo_int', 'zillow_1BR') }}

),

renamed as (

    select

    from source

)

select * from renamed
