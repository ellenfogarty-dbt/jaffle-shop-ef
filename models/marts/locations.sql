with

locations as (

    select * from {{ ref('stg_locations') }}
    where 1=1

)

select * from locations
