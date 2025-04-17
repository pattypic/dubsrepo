with 

source as (

    select * from {{ source('zillow_data', 'extracted_cities_with_density') }}

),

renamed as (

    select
        state,
        city,
        population_density,
        file,
        _data_source,
        _load_time

    from source

)

select * from renamed
