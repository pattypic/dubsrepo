with 

source as (

    select * from {{ source('dubsrepo_mrt', 'zillow_2BR') }}

),

renamed as (

    select

    from source

)

select * from renamed
