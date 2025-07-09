<<<<<<< HEAD
-- here is a change for you
=======
--here is a change
>>>>>>> 3cb48b8a200c428ff288af39131074034f05e4d7

-- and here is another change

with

source as (

    select * from {{ source('ecom', 'raw_customers') }}

),

renamed as (

    select

        ----------  ids
        id as customer_id,

        ---------- text
        name as customer_name

    from source

)

select * from renamed
