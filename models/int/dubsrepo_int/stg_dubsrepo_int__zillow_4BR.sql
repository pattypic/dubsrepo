with 

source as (

    select * from {{ source('dubsrepo_int', 'zillow_4BR') }}

),

renamed as (

    select

    from source

)

select * from renamed
