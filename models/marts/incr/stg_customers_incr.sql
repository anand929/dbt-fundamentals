{{
    config(
        unique_key='id'
    )

}}

with src_customers as (
    select * from {{ source("jaffle_shop",'customers') }}
    {% if is_incremental() %}
    where id > (select coalesce(99,max(id)) from {{ this }})
    {% endif %}
)
select *, now() as upsertdate from src_customers