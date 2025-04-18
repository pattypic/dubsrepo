with 

source as (

    select * from {{ source('dubsrepo_mrt', 'zillow_1BR') }}

),

renamed as (

    select

    from source

)

select * from renamed
