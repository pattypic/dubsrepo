with 

source as (

    select * from {{ source('dubsrepo_int', 'zillow_2BR') }}

),

renamed as (

    select

    from source

)

select * from renamed
