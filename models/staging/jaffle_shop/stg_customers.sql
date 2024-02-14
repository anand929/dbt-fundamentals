with customers as (

    select
        id as customer_id,
        first_name,
        last_name

    from {{ source('jaffle_shop', 'customers') }}

)
--added a comment for slim ci demo purpose
select * from customers