with 

source as (

    select * from {{ source('dubsrepo_mrt', 'zillow_4BR') }}

),

renamed as (

    select

    from source

)

select * from renamed
